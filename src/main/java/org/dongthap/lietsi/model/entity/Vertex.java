package org.dongthap.lietsi.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.util.GeometryUtils;
import org.locationtech.jts.geom.Point;

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
