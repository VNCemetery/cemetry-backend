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
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Tag(name = "Authentication", description = "APIs for authentication including login, logout, and password management")
@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {
    private final AuthenticationService authenticationService;

    @Operation(
        summary = "Login to the system",
        description = "Authenticate user credentials and return access and refresh tokens"
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200",
            description = "Login successful",
            content = @Content(
                mediaType = "application/json",
                schema = @Schema(implementation = LoginResponse.class),
                examples = @ExampleObject(value = """
                    {
                        "access_token": "eyJhbGciOiJ...",
                        "refresh_token": "eyJhbGciOiJ...",
                        "expires_in": 3600
                    }
                    """)
            )
        ),
        @ApiResponse(responseCode = "401", description = "Invalid credentials"),
        @ApiResponse(responseCode = "400", description = "Invalid request body")
    })
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody @Valid LoginRequest loginRequest) {
        return ResponseEntity.ok(authenticationService.login(loginRequest));
    }

    @Operation(
        summary = "Refresh access token",
        description = "Get a new access token using a valid refresh token"
    )
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Token refresh successful"),
        @ApiResponse(responseCode = "400", description = "Invalid or expired refresh token")
    })
    @PostMapping("/refresh-token")
    public ResponseEntity<LoginResponse> refreshToken(@RequestBody @Valid RefreshTokenRequest refreshTokenRequest) {
        return ResponseEntity.ok(authenticationService.refreshToken(refreshTokenRequest.refreshToken()));
    }

    @Operation(
        summary = "Logout from current device",
        description = "Invalidate the current refresh token"
    )
    @SecurityRequirement(name = "bearerAuth")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Logout successful"),
        @ApiResponse(responseCode = "401", description = "Unauthorized"),
        @ApiResponse(responseCode = "400", description = "Invalid refresh token")
    })
    @PostMapping("/logout")
    public ResponseEntity<Void> logout(@RequestBody @Valid RefreshTokenRequest refreshTokenRequest) {
        authenticationService.logout(refreshTokenRequest.refreshToken());
        return ResponseEntity.ok().build();
    }

    @Operation(
        summary = "Logout from all devices",
        description = "Invalidate all refresh tokens for the current user"
    )
    @SecurityRequirement(name = "bearerAuth")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Logout successful"),
        @ApiResponse(responseCode = "401", description = "Unauthorized")
    })
    @PostMapping("/logout-all")
    public ResponseEntity<Void> logoutAll() {
        authenticationService.logoutAll();
        return ResponseEntity.ok().build();
    }

    @Operation(
        summary = "Request password reset",
        description = "Send a password reset code to the user's email"
    )
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Reset code sent successfully"),
        @ApiResponse(responseCode = "400", description = "Email not found"),
        @ApiResponse(responseCode = "429", description = "Too many requests")
    })
    @PostMapping("/forgot-password")
    public ResponseEntity<Void> forgotPassword(@RequestBody @Valid ForgotPasswordRequest request) {
        authenticationService.requestPasswordReset(request.getEmail());
        return ResponseEntity.ok().build();
    }

    @Operation(
        summary = "Reset password",
        description = "Reset password using the verification code sent to email"
    )
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Password reset successful"),
        @ApiResponse(responseCode = "400", description = "Invalid or expired verification code"),
        @ApiResponse(responseCode = "429", description = "Too many attempts")
    })
    @PostMapping("/reset-password")
    public ResponseEntity<Void> resetPassword(@RequestBody @Valid ResetPasswordRequest request) {
        authenticationService.resetPassword(request.getCode(), request.getNewPassword());
        return ResponseEntity.ok().build();
    }
}
