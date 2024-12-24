package org.dongthap.lietsi.repository;

import java.util.Optional;
import java.util.UUID;

import org.dongthap.lietsi.model.entity.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, UUID> {
    Optional<RefreshToken> findByToken(String token);
    void deleteByToken(String token);

    void deleteByUserId(UUID userId);
}
