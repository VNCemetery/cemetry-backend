package org.dongthap.lietsi.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.model.entity.common.BaseEntity;

import java.util.UUID;

@EqualsAndHashCode(callSuper = true)
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "contributions")
public class Contribution extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "martyr_id", nullable = false)
    private MartyrGrave martyr;

    private String content;
    private boolean deleted;
    private boolean processed;
}
