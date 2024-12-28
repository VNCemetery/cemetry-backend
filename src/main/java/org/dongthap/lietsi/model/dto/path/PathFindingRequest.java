package org.dongthap.lietsi.model.dto.path;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Request object for path finding")
public class PathFindingRequest {
    @Schema(description = "Current location coordinates", required = true)
    @NotNull(message = "Vị trí hiện tại không được để trống")
    private CurrentLocation currentLocation;

    @Schema(description = "ID of the target grave row", required = true)
    @NotNull(message = "Hàng mộ không được để trống")
    private Long graveRowId;
}
