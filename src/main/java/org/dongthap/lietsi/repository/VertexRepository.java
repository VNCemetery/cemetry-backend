package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.Cell;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface CellRepository extends JpaRepository<Cell, UUID> {
}
