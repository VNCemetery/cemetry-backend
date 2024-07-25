package org.dongthap.lietsi.controller.auth;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record LoginRequest(@NotBlank(message = "Username is required") String username,
                           @NotBlank(message = "Password is required") @Size(min = 6, max = 40, message = "Password must be between 6 and 40 characters") String password) {
}
