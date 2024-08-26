package org.dongthap.lietsi.dto.path;

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
