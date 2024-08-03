package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

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

    @OneToOne
    @JoinColumn(name = "coordinate_id")
    private Coordinate coordinate;

    @ManyToMany(mappedBy = "vertices", fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private Set<Cell> cells;
}
