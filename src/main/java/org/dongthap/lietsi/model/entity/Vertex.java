package org.dongthap.lietsi.model.entity;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import org.locationtech.jts.geom.Point;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import org.dongthap.lietsi.util.GeometryUtils;

@Data
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "vertices")
public class Vertex {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "vertices_id_seq")
    @SequenceGenerator(name = "vertices_id_seq", sequenceName = "vertices_id_seq", allocationSize = 1)
    private Long id;

    private double latitude;
    private double longitude;

    @Column(columnDefinition = "geometry(Point, 4326)")
    @JsonIgnore
    private Point geom;

    @PrePersist
    @PreUpdate
    public void updateGeom() {
        if (latitude != 0 && longitude != 0) {
            geom = GeometryUtils.createPoint(longitude, latitude);
        }
    }
}
