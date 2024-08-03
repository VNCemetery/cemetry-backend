package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.Set;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "cells")
public class Cell {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    private Long id;

    @ManyToMany
    @JoinTable(
            name = "cell_vertex",
            joinColumns = @JoinColumn(name = "cell_id"),
            inverseJoinColumns = @JoinColumn(name = "vertex_id")
    )
    @Fetch(FetchMode.SUBSELECT)
    private Set<Vertex> vertices;
}
