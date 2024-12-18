package org.dongthap.lietsi.model.dto.search;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.SuperBuilder;

@EqualsAndHashCode(callSuper = true)
@Schema(description = "Martyr search criteria")
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MartyrSearchRequest extends SearchRequest {
    @Schema(description = "Search by name, codename, or full name", example = "Nguyen Van")
    private String name;
}
