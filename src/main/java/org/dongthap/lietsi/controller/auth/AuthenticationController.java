package org.dongthap.lietsi.controller.auth;

import org.dongthap.lietsi.model.dto.auth.ForgotPasswordRequest;
import org.dongthap.lietsi.model.dto.auth.LoginRequest;
import org.dongthap.lietsi.model.dto.auth.LoginResponse;
import org.dongthap.lietsi.model.dto.auth.RefreshTokenRequest;
import org.dongthap.lietsi.model.dto.auth.ResetPasswordRequest;
import org.dongthap.lietsi.service.auth.AuthenticationService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Tag(name = "Authentication", description = "Authentication API")
@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {
    private final AuthenticationService authenticationService;

    @Operation(
            summary = "Login",
            description = "Login to the system"
    )
    @ApiResponse(responseCode = "200", description = "Login successful")
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody @Valid LoginRequest loginRequest) {
        return ResponseEntity.ok(authenticationService.login(loginRequest));
    }

    @Operation(
            summary = "Refresh Token",
            description = "Refresh to gain new access token")
    @ApiResponse(responseCode = "200", description = "Refresh token successful")
    @PostMapping("/refresh-token")
    public ResponseEntity<LoginResponse> refreshToken(@RequestBody @Valid RefreshTokenRequest refreshTokenRequest) {
        return ResponseEntity.ok(authenticationService.refreshToken(refreshTokenRequest.refreshToken()));
    }

    @Operation(summary = "Logout", description = "Logout from the system")
    @ApiResponse(responseCode = "200", description = "Logout successful")
    @PostMapping("/logout")
    public ResponseEntity<Void> logout(@RequestBody @Valid RefreshTokenRequest refreshTokenRequest) {
        authenticationService.logout(refreshTokenRequest.refreshToken());
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "Logout All", description = "Logout from all devices")
    @ApiResponse(responseCode = "200", description = "Logout all successful")
    @PostMapping("/logout-all")
    public ResponseEntity<Void> logoutAll() {
        authenticationService.logoutAll();
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "Forgot Password", description = "Request password reset code")
    @ApiResponse(responseCode = "200", description = "Reset code sent successfully")
    @PostMapping("/forgot-password")
    public ResponseEntity<Void> forgotPassword(@RequestBody @Valid ForgotPasswordRequest request) {
        authenticationService.requestPasswordReset(request.getEmail());
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "Reset Password", description = "Reset password with verification code")
    @ApiResponse(responseCode = "200", description = "Password reset successful")
    @PostMapping("/reset-password")
    public ResponseEntity<Void> resetPassword(@RequestBody @Valid ResetPasswordRequest request) {
        authenticationService.resetPassword(request.getCode(), request.getNewPassword());
        return ResponseEntity.ok().build();
    }
}
