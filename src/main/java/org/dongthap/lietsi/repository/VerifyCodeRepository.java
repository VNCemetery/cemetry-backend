package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.VerifyCode;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface VerifyCodeRepository extends JpaRepository<VerifyCode, UUID> {
    Optional<VerifyCode> findByCode(String code);
}
