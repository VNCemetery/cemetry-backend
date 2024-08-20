package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

import static org.dongthap.lietsi.constant.AppConstants.CODE_EXPIRED;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "verify_codes")
public class VerifyCode {
    @PrePersist
    void prePersists() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
        expiredAt = createdAt.plusMinutes(CODE_EXPIRED);
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "code")
    private String code;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "expired_at")
    private LocalDateTime expiredAt;

}
