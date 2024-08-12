package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.constant.DbConstants;
import org.dongthap.lietsi.entity.common.BaseEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.math.BigDecimal;

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

    @Column(name = "area_name")
    private String areaName;

    @Column(name = "row_name")
    private String rowName;


    @Column(name = "left_latitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal leftLatitude;
    @Column(name = "left_longitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal leftLongitude;

    @Column(name = "right_latitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal rightLatitude;
    @Column(name = "right_longitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal rightLongitude;

}
