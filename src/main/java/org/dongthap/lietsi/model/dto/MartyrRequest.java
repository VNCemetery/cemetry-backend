package org.dongthap.lietsi.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Schema(description = "Martyr creation/update request")
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MartyrRequest {
    @Schema(description = "Martyr ID (null for creation)", example = "1")
    private Long id;

    @Schema(description = "Image URL/path", example = "martyrs/image1.jpg")
    private String image;

    @Schema(description = "Full name of the martyr", example = "Nguyen Van A")
    @NotBlank(message = "Full name is required")
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

    @Schema(description = "Dieu chinh information")
    private String dieuChinh;

    @Schema(description = "Quy tap information")
    private String quyTap;

    @Schema(description = "Date information")
    private String ngayThangNam;

    @Schema(description = "Additional notes")
    private String note;

    @Schema(description = "Commune/ward", example = "Xa ABC")
    private String commune;

    @Schema(description = "District", example = "Huyen XYZ")
    private String district;

    @Schema(description = "ID of the grave row", example = "1")
    @NotNull(message = "Grave row ID is required")
    private Long graveRowId;
}
