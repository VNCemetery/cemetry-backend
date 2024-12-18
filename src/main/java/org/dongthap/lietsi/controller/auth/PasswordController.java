package org.dongthap.lietsi.controller.auth;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.dto.auth.ForgotPasswordRequest;
import org.dongthap.lietsi.service.PasswordService;
import org.dongthap.lietsi.util.ResponseUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/password")
@RequiredArgsConstructor
public class PasswordController {
    private PasswordService passwordService;

    @PostMapping("/forgot")
    public ResponseEntity<?> forgotPassword(@RequestBody @Valid ForgotPasswordRequest request) {
        passwordService.forgotPassword(request);
        return ResponseEntity.ok(ResponseUtils.OK);
    }
}
