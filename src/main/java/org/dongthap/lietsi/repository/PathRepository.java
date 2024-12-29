package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.Path;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface PathRepository extends JpaRepository<Path, UUID> {
}
