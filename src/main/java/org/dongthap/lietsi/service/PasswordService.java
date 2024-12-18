package org.dongthap.lietsi.service;

import org.dongthap.lietsi.dto.auth.ForgotPasswordRequest;

public interface PasswordService {
    void forgotPassword(ForgotPasswordRequest request);
}
