package org.dongthap.lietsi.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.constant.DbConstants;

@Data
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "edges")
public class Edge {
    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "vertex1_id")
    private Vertex vertex1;

    @ManyToOne
    @JoinColumn(name = "vertex2_id")
    private Vertex vertex2;

    @Column(name = "distance", columnDefinition = DbConstants.DECIMAL_COORDINATE_DEFAULT_0)
    private Double distance;

    private boolean oneWay;
}
