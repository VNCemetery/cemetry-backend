package org.dongthap.lietsi.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Fetch;

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

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "cell_vertices",
            joinColumns = @JoinColumn(name = "cell_id"),
            inverseJoinColumns = @JoinColumn(name = "vertex_id")
    )
    @Fetch(org.hibernate.annotations.FetchMode.JOIN)
    private Set<Vertex> vertices;
}
