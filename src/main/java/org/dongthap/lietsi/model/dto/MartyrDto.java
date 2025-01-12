package org.dongthap.lietsi.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

import java.util.UUID;

@Schema(
        description = "Represents detailed information about a martyr",
        title = "Martyr Details"
)
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MartyrDto {
    @Schema(
            description = "Unique identifier of the martyr",
            example = "123e4567-e89b-12d3-a456-426614174000",
            requiredMode = Schema.RequiredMode.REQUIRED
    )
    private UUID id;

    @Schema(
            description = "Name of the cemetery area where the martyr is buried",
            example = "Area A - South Section",
            requiredMode = Schema.RequiredMode.REQUIRED
    )
    private String areaName;

    private String graveCode;

    @Schema(
            description = "Row identifier within the cemetery area",
            example = "Row 1-B",
            requiredMode = Schema.RequiredMode.REQUIRED
    )
    private String rowName;

    @Schema(description = "Image URL/path", example = "martyrs/image1.jpg")
    private String image;

    @Schema(
            description = "Full formal name of the martyr",
            example = "Nguyen Van Anh",
            requiredMode = Schema.RequiredMode.REQUIRED
    )
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
