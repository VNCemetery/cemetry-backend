package org.dongthap.lietsi.dto;

import lombok.*;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MartyrRequest {
    private Long id;
    private String image;
    private String fullName;
    private String name;
    private String codeName;
    private String yearOfBirth;
    private String dateOfEnlistment;
    private String dateOfDeath;
    private String rankPositionUnit;
    private String homeTown;
    private String placeOfExhumation;
    private String dieuChinh;
    private String quyTap;
    private String ngayThangNam;
    private String note;
    private String commune;
    private String district;
    private Long graveRowId;
}
