package org.dongthap.lietsi.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Schema(description = "Martyr details response")
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MartyrDto {
    @Schema(description = "Unique identifier", example = "1")
    private Long id;

    @Schema(description = "Cemetery area name", example = "Area A")
    private String areaName;

    @Schema(description = "Row name/number", example = "Row 1")
    private String rowName;

    @Schema(description = "Image URL/path", example = "martyrs/image1.jpg")
    private String image;

    @Schema(description = "Full name", example = "Nguyen Van A")
    private String fullName;

    @Schema(description = "Short name", example = "Van A")
    private String name;

    @Schema(description = "Code name/alias", example = "A123")
    private String codeName;

    @Schema(description = "Year of birth", example = "1950")
    private String yearOfBirth;

    @Schema(description = "Date of enlistment", example = "1970")
    private String dateOfEnlistment;

    @Schema(description = "Date of death", example = "1975")
    private String dateOfDeath;

    @Schema(description = "Rank, position and unit", example = "Lieutenant, 7th Division")
    private String rankPositionUnit;

    @Schema(description = "Home town", example = "Ha Noi")
    private String homeTown;

    @Schema(description = "Place of exhumation", example = "Dien Bien")
    private String placeOfExhumation;

    @Schema(description = "Additional notes")
    private String note;

    @Schema(description = "Commune/ward", example = "Xa ABC")
    private String commune;

    @Schema(description = "District", example = "Huyen XYZ")
    private String district;
}
