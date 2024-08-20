package org.dongthap.lietsi.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MartyrDto {
    private Long id;
    private String areaName;
    private String rowName;

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
    private String note;
    private String commune;
    private String district;
}
