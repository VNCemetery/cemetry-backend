package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.entity.GraveRow;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GraveRowRepository extends JpaRepository<GraveRow, Long> {
    GraveRow findByAreaNameAndRowName(String areaName, String rowName);
}
