package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.Log;
import org.dongthap.lietsi.model.entity.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface LogRepository extends JpaRepository<Log, UUID> {
}
