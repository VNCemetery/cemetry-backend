package org.dongthap.lietsi.filter;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Expression;
import jakarta.persistence.criteria.Order;
import jakarta.persistence.criteria.Root;
import org.apache.commons.lang3.StringUtils;
import org.dongthap.lietsi.dto.search.SortRequest;

public enum SortDirection {
    ASC {
        public <T> Order build(Root<T> root, CriteriaBuilder cb, SortRequest request) {
            return cb.asc(root.get(request.getKey()));
        }
    }, DESC {
        public <T> Order build(Root<T> root, CriteriaBuilder cb, SortRequest request) {
            return cb.desc(root.get(request.getKey()));
        }
    }, ASC_LIKE {
        @Override
        public <T> Order build(Root<T> root, CriteriaBuilder cb, SortRequest request) {
            CriteriaBuilder.Case<Number> selectCase = cb.selectCase();
            int order = 1;
            return cb.asc(selectCase.otherwise(order));
        }
    };

    public abstract <T> Order build(Root<T> root, CriteriaBuilder cb, SortRequest request);
}
