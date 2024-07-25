package org.dongthap.lietsi.service.auth;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.controller.auth.LoginRequest;
import org.dongthap.lietsi.controller.auth.LoginResponse;
import org.dongthap.lietsi.exception.BadRequestException;
import org.dongthap.lietsi.exception.UnauthorizedException;
import org.dongthap.lietsi.repository.UserRepository;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;
    private final JwtService jwtService;

    public LoginResponse login(LoginRequest loginRequest) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.username(),
                        loginRequest.password()));
        UserDetails userDetails = userDetailsService.loadUserByUsername(loginRequest.username());
        if (userDetails == null) {
            throw UnauthorizedException.message("Can not find user: " + loginRequest.username());
        }
        return new LoginResponse(jwtService.generateAccessToken(userDetails),
                jwtService.generateRefreshToken(userDetails));
    }

    public LoginResponse refreshToken(String refreshToken) {
        final String username = jwtService.extractUsername(refreshToken);
        UserDetails user = userDetailsService.loadUserByUsername(username);
        if (user == null) {
            throw BadRequestException.message("Can not find user: " + username);
        }
        if (!jwtService.isValidToken(refreshToken, user)) {
            throw BadRequestException.message("Refresh token is invalid");
        }

        var accessToken = jwtService.generateAccessToken(user);
        return new LoginResponse(accessToken, refreshToken);

    }
}
