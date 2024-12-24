package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.MartyrGrave;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.UUID;

public interface MartyrRepository extends JpaRepository<MartyrGrave, UUID>,
        JpaSpecificationExecutor<MartyrGrave> {
}
