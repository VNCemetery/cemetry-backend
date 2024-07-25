package org.dongthap.lietsi.controller.auth;

import com.fasterxml.jackson.annotation.JsonAlias;

public record RefreshTokenRequest(
        @JsonAlias("refresh_token")
        String refreshToken
) {
}
