package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.constant.DbConstants;

import java.math.BigDecimal;

@Data
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "junctions")
public class Junction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "latitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal latitude;
    @Column(name = "longitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal longitude;
}
