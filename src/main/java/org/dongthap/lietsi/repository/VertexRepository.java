package org.dongthap.lietsi.repository;

import org.dongthap.lietsi.model.entity.Vertex;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface VertexRepository extends JpaRepository<Vertex, Long> {
    @Query("SELECT v FROM Vertex v WHERE ABS(v.latitude - :latitude) < 0.0000001 AND ABS(v.longitude - :longitude) < 0.0000001")
    Optional<Vertex> findByLatitudeAndLongitude(@Param("latitude") double latitude, @Param("longitude") double longitude);
}
