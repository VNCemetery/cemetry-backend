package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.Log;
import org.dongthap.lietsi.model.entity.VerifyCode;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface VerifyCodeRepository extends JpaRepository<VerifyCode, Long> {
    Optional<VerifyCode> findByCode(String code);
}
