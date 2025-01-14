package org.dongthap.lietsi.model.entity;

import jakarta.persistence.*;
import lombok.*;
import org.dongthap.lietsi.model.entity.common.BaseEntity;
import org.hibernate.annotations.Fetch;

import java.util.UUID;

@EqualsAndHashCode(callSuper = true)
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "martyr_graves", indexes = {
        @Index(name = "index_martyr_graves_full_name", columnList = "full_name"),
        @Index(name = "index_martyr_graves_name", columnList = "name"),
        @Index(name = "index_martyr_graves_code_name", columnList = "code_name"),
        @Index(name = "index_grave_code", columnList = "grave_code"),
})
public class MartyrGrave extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(name = "grave_code")
    private String graveCode;

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
