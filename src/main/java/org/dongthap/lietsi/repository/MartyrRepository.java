package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.entity.MartyrGrave;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MartyrRepository extends JpaRepository<MartyrGrave, Long>,
        JpaSpecificationExecutor<MartyrGrave> {
}
