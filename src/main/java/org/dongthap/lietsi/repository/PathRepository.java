package org.dongthap.lietsi.repository;

import java.util.UUID;

import org.dongthap.lietsi.model.entity.Path;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PathRepository extends JpaRepository<Path, UUID> {
}
