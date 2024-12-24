package org.dongthap.lietsi.model.entity;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.locationtech.jts.geom.Point;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
//    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private double latitude;
    private double longitude;

    @Column(columnDefinition = "geometry(Point, 4326)")
    @JsonIgnore
    private Point geom;
}
