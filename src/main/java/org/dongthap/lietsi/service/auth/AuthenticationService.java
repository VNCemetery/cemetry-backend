package org.dongthap.lietsi.service.auth;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.exception.BadRequestException;
import org.dongthap.lietsi.exception.UnauthorizedException;
import org.dongthap.lietsi.model.dto.auth.LoginRequest;
import org.dongthap.lietsi.model.dto.auth.LoginResponse;
import org.dongthap.lietsi.model.entity.User;
import org.dongthap.lietsi.model.entity.VerifyCode;
import org.dongthap.lietsi.model.enums.LogAction;
import org.dongthap.lietsi.repository.RefreshTokenRepository;
import org.dongthap.lietsi.repository.UserRepository;
import org.dongthap.lietsi.repository.VerifyCodeRepository;
import org.dongthap.lietsi.service.EmailService;
import org.dongthap.lietsi.service.LogService;
import org.dongthap.lietsi.service.UserService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;
    private final JwtService jwtService;
    private final RefreshTokenRepository refreshTokenRepository;
    private final UserService userService;
    private final LogService logService;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;
    private final VerifyCodeRepository verifyCodeRepository;
    private final UserRepository userRepository;

    public LoginResponse login(LoginRequest loginRequest) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.username(),
                        loginRequest.password()));
        UserDetails userDetails = userDetailsService.loadUserByUsername(loginRequest.username());
        if (userDetails == null) {
            throw UnauthorizedException.message("Can not find user: " + loginRequest.username());
        }
        logService.logAnonymous(LogAction.LOGIN, "User: " + loginRequest.username());
        String accessToken = jwtService.generateAccessToken(userDetails);
        String refreshToken = jwtService.generateRefreshToken(userDetails);
        return new LoginResponse(accessToken, refreshToken, jwtService.getAccessTokenExpirationSeconds());
    }

    public LoginResponse refreshToken(String refreshToken) {
        final String username = jwtService.extractUsername(refreshToken);
        UserDetails user = userDetailsService.loadUserByUsername(username);
        if (user == null) {
            throw BadRequestException.message("Can not find user: " + username);
        }

        var storedToken = refreshTokenRepository.findByToken(refreshToken)
                .orElseThrow(() -> BadRequestException.message("Refresh token not found"));

        if (storedToken.getExpiresAt().isBefore(LocalDateTime.now())) {
            refreshTokenRepository.delete(storedToken);
            throw BadRequestException.message("Refresh token has expired");
        }

        var newAccessToken = jwtService.generateAccessToken(user);
        logService.log(LogAction.REFRESH_TOKEN, "User: " + username);
        return new LoginResponse(newAccessToken, refreshToken, jwtService.getAccessTokenExpirationSeconds());
    }

    public void logout(String refreshToken) {
        refreshTokenRepository.findByToken(refreshToken)
                .ifPresent(token -> {
                    refreshTokenRepository.deleteByToken(refreshToken);
                    logService.log(LogAction.LOGOUT, null);
                });
    }

    public void logoutAll() {
        User currentUser = userService.getCurrentUser();
        refreshTokenRepository.deleteByUserId(currentUser.getId());
        logService.log(LogAction.LOGOUT_ALL, null);
    }

    public void requestPasswordReset(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> BadRequestException.message("Email không tồn tại trong hệ thống"));

        String code = generateVerificationCode();
        VerifyCode verifyCode = new VerifyCode();
        verifyCode.setCode(code);
        verifyCode.setUser(user);
        verifyCodeRepository.save(verifyCode);

        emailService.sendPasswordResetCode(email, code);
        logService.logAnonymous(LogAction.REQUEST_RESET_PASSWORD, "Email: " + email);
    }

    public void resetPassword(String code, String newPassword) {
        VerifyCode verifyCode = verifyCodeRepository.findByCode(code)
                .orElseThrow(() -> BadRequestException.message("Mã xác thực không hợp lệ"));

        if (verifyCode.getExpiredAt().isBefore(LocalDateTime.now())) {
            throw BadRequestException.message("Mã xác thực đã hết hạn");
        }

        User user = verifyCode.getUser();
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);

        verifyCodeRepository.delete(verifyCode);
        logService.logAnonymous(LogAction.RESET_PASSWORD, "Email: " + user.getEmail());
    }

    private String generateVerificationCode() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(1000000));
    }
}
