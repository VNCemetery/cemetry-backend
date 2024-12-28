package org.dongthap.lietsi.model.dto.search;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

@EqualsAndHashCode(callSuper = true)
@Schema(
    description = "Search criteria for finding martyrs",
    title = "Martyr Search Parameters"
)
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MartyrSearchRequest extends SearchRequest {
    @Schema(
        description = "Search term to match against name, codename, or full name fields",
        example = "Nguyen Van",
        maxLength = 100
    )
    private String name;
}
