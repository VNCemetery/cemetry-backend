package org.dongthap.lietsi.dto.search;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.dongthap.lietsi.filter.SortDirection;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class SortRequest {
    private String key;

    private SortDirection direction;
}
