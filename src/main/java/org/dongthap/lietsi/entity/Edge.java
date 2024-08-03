package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "vertex1_id")
    private Vertex vertex1;

    @OneToOne
    @JoinColumn(name = "vertex2_id")
    private Vertex vertex2;
}
