package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.entity.common.BaseEntity;
import org.hibernate.annotations.SoftDelete;

@EqualsAndHashCode(callSuper = true)
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "martyr_graves")
@SoftDelete
public class MartyrGrave extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "name")
    private String name;

    @Column(name = "code_name")
    private String codeName;

    @Column(name = "year_of_birth")
    private Integer yearOfBirth;

    @Column(name = "year_of_enlistment")
    private Integer yearOfEnlistment;

    @Column(name = "date_of_death")
    private String dateOfDeath;

    @Column(name = "rank_position_unit")
    private String rankPositionUnit;

    @Column(name = "home_town")
    private String homeTown;

    @Column(name = "place_of_exhumation")
    private String placeOfExhumation;

    @Column(name = "commune")
    private String commune;

    @Column(name = "district")
    private String district;

    @Column(name = "rhyme")
    private String rhyme;

    @ManyToOne
    @JoinColumn(name = "grave_row_id")
    private GraveRow graveRow;
}
