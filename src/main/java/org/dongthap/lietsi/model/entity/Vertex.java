package org.dongthap.lietsi.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
    private Long id;

    @Column(name = "latitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private Double latitude;
    @Column(name = "longitude", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private Double longitude;
}
