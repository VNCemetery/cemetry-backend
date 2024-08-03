package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.entity.common.BaseEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "grave_rows", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"row_name", "area_name"})
})
public class GraveRow extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "row_name")
    private String rowName;

    @Column(name = "area_name")
    private String areaName;

    @OneToOne
    @JoinColumn(name = "left_coordinate_id")
    private Coordinate leftCoordinate;

    @OneToOne
    @JoinColumn(name = "right_coordinate_id")
    private Coordinate rightCoordinate;
}
