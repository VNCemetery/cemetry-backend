package org.dongthap.lietsi.repository.specification;

import jakarta.persistence.criteria.*;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dongthap.lietsi.model.dto.search.FilterRequest;
import org.dongthap.lietsi.model.dto.search.SearchRequest;
import org.dongthap.lietsi.model.dto.search.SortRequest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@AllArgsConstructor
public class SearchSpecification<T> implements Specification<T> {
    private final transient SearchRequest request;

    public static Pageable getPageable(Integer page, Integer size) {
        return PageRequest.of(Objects.requireNonNullElse(page, 0),
                Objects.requireNonNullElse(size, 100));
    }

    @Override
    public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
        Predicate predicate;
        if ("search_or".equalsIgnoreCase(this.request.getSearchType())) {
            predicate = criteriaBuilder.disjunction();
        } else {
            predicate = criteriaBuilder.equal(criteriaBuilder.literal(Boolean.TRUE), Boolean.TRUE);
        }
        for (FilterRequest filter : this.request.getFilters()) {
            log.info("Filter: {} {} {}", filter.getKey(), filter.getOperator().toString(), filter.getValue());
            log.info("Filter IN: {} {} {}", filter.getKey(), filter.getOperator().toString(), filter.getValues());
            predicate = filter.getOperator().build(root, criteriaBuilder, filter, predicate);
        }

        if ("select_distinct".equals(this.request.getSearchType())) {
            query.distinct(true);
        }

        List<Order> orders = new ArrayList<>();
        for (SortRequest sort : this.request.getSorts()) {
            orders.add(sort.getDirection().build(root, criteriaBuilder, sort));
        }

        query.orderBy(orders);
        return predicate;
    }
}
