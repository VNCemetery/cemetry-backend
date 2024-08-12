package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.constant.DbConstants;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.math.BigDecimal;
import java.util.Set;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "latitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal latitude;
    @Column(name = "longitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private BigDecimal longitude;
}
