package org.dongthap.lietsi.model.dto.auth;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResetPasswordRequest {
    @NotBlank(message = "Code không được để trống")
    private String code;
    
    @NotBlank(message = "Mật khẩu mới không được để trống")
    private String newPassword;
}
