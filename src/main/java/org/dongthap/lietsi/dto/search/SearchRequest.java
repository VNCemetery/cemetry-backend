package org.dongthap.lietsi.dto.search;

import lombok.*;

import java.util.List;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SearchRequest {
    private List<FilterRequest> filters;
    private List<SortRequest> sorts;
    private Integer page = 0;
    private Integer size = 20;
    private String searchType;
}
