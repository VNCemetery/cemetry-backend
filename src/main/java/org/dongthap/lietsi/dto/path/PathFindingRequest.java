package org.dongthap.lietsi.dto.path;

import jakarta.validation.constraints.NotNull;
import lombok.*;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PathFindingRequest {
    @NotNull(message = "Vị trí hiện tại không được để trống")
    private CurrentLocation currentLocation;
    @NotNull(message = "Hàng mộ không được để trống")
    private Long graveRowId;
}
