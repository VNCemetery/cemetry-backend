package org.dongthap.lietsi.model.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.model.entity.common.BaseEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

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
    private Long id;

    @Column(name = "area_name")
    private String areaName;

    @Column(name = "row_name")
    private String rowName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vertex1_id")
    @Fetch(FetchMode.JOIN)
    @JsonIgnore
    private Vertex vertex1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vertex2_id")
    @Fetch(FetchMode.JOIN)
    @JsonIgnore
    private Vertex vertex2;

}
