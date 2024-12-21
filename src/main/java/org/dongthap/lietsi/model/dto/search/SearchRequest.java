package org.dongthap.lietsi.model.dto.search;

import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SearchRequest {
    private List<FilterRequest> filters;
    private List<SortRequest> sorts;
    private Integer page = 0;
    private Integer size = 20;
    private String searchType;

    public List<FilterRequest> getFilters() {
        if (Objects.isNull(this.filters)) return new ArrayList<>();
        return this.filters;
    }

    public List<SortRequest> getSorts() {
        if (Objects.isNull(this.sorts)) return new ArrayList<>();
        return this.sorts;
    }
}
