package org.dongthap.lietsi.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.model.entity.common.BaseEntity;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "grave_rows", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"row_name", "area_name"})
})
public class GraveRow extends BaseEntity {
    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @Column(name = "area_name")
    private String areaName;

    @Column(name = "row_name")
    private String rowName;

    @ManyToOne
    @JoinColumn(name = "vertex1_id")
    @JsonIgnore
    private Vertex vertex1;

    @ManyToOne
    @JoinColumn(name = "vertex2_id")
    @JsonIgnore
    private Vertex vertex2;

}
