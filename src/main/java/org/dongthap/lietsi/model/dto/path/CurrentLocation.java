package org.dongthap.lietsi.model.dto.path;

import lombok.*;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CurrentLocation {
    private Double latitude;
    private Double longitude;
}
