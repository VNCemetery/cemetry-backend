package org.dongthap.lietsi.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.entity.common.BaseEntity;
import org.hibernate.annotations.Fetch;
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

    @Column(name = "image")
    private String image;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "name")
    private String name;

    @Column(name = "code_name")
    private String codeName;

    @Column(name = "year_of_birth")
    private String yearOfBirth;

    @Column(name = "date_of_enlistment")
    private String dateOfEnlistment;

    @Column(name = "date_of_death")
    private String dateOfDeath;

    @Column(name = "rank_position_unit")
    private String rankPositionUnit;

    @Column(name = "home_town")
    private String homeTown;

    @Column(name = "place_of_exhumation")
    private String placeOfExhumation;

    @Column(name = "dieu_chinh")
    private String dieuChinh;

    @Column(name = "quy_tap")
    private String quyTap;

    @Column(name = "ngay_thang_nam")
    private String ngayThangNam;

    @Column(name = "note")
    private String note;

    @Column(name = "commune")
    private String commune;

    @Column(name = "district")
    private String district;

    @Column(name = "additionalField1")
    private String additionalField1;

    @Column(name = "additionalField2")
    private String additionalField2;

    @Column(name = "additionalField3")
    private String additionalField3;

    @Column(name = "additionalField4")
    private String additionalField4;

    @ManyToOne
    @JoinColumn(name = "grave_row_id")
    @Fetch(org.hibernate.annotations.FetchMode.JOIN)
    private GraveRow graveRow;
}
