package org.dongthap.lietsi.dto.auth;

import com.fasterxml.jackson.annotation.JsonAlias;

public record RefreshTokenRequest(
        @JsonAlias("refresh_token")
        String refreshToken
) {
}
