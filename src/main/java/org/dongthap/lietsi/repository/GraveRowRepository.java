package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.GraveRow;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface GraveRowRepository extends JpaRepository<GraveRow, Long> {
    GraveRow findByAreaNameAndRowName(String areaName, String rowName);
}
