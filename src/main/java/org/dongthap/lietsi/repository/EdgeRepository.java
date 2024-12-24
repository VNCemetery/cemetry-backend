package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.Edge;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface EdgeRepository extends JpaRepository<Edge, Long> {
}
