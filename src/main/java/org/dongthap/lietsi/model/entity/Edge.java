package org.dongthap.lietsi.model.entity;

import java.util.UUID;

import org.dongthap.lietsi.constant.DbConstants;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
