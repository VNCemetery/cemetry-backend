package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Set;

@Data
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "cells")
public class Cell {
    @Id
    private Long id;

    @ManyToMany
    @JoinTable(
            name = "cell_vertices",
            joinColumns = @JoinColumn(name = "cell_id"),
            inverseJoinColumns = @JoinColumn(name = "vertex_id")
    )
    private Set<Vertex> vertices;
}
