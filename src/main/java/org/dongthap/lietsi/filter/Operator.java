package org.dongthap.lietsi.filter;

import jakarta.persistence.criteria.*;
import lombok.extern.slf4j.Slf4j;
import org.dongthap.lietsi.dto.search.FilterRequest;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public enum Operator {

    EQUAL {
        public <T> Predicate build(Root<T> root, CriteriaBuilder cb, FilterRequest request, Predicate predicate) {
            Object value = request.getFieldType().parse(request.getValue().toString());
            String[] relations = request.getKey().split("\\.");
            Expression<?> key;
            if (relations.length <= 1) {
                key = root.get(request.getKey());
            } else {
                key = root.join(relations[0]).get(relations[1]);
            }
            return cb.and(cb.equal(key, value), predicate);
        }
    },
    NOT_EQUAL {
        public <T> Predicate build(Root<T> root, CriteriaBuilder cb, FilterRequest request, Predicate predicate) {
            Object value = request.getFieldType().parse(request.getValue().toString());
            String[] relations = request.getKey().split("\\.");
            Expression<?> key;
            if (relations.length <= 1) {
                key = root.get(request.getKey());
            } else {
                key = root.join(relations[0]).get(relations[1]);
            }
            return cb.and(cb.notEqual(key, value), predicate);
        }
    },

    LIKE {
        public <T> Predicate build(Root<T> root, CriteriaBuilder cb, FilterRequest request, Predicate predicate) {
            String[] relations = request.getKey().split("\\.");
            Expression<String> key;
            if (relations.length <= 1) {
                key = root.get(request.getKey());
            } else {
                key = root.join(relations[0]).get(relations[1]);
            }

            return cb.and(cb.like(cb.upper(key), "%" + request.getValue().toString().toUpperCase() + "%"), predicate);
        }
    },

    LIKE_OR {
        public <T> Predicate build(Root<T> root, CriteriaBuilder cb, FilterRequest request, Predicate predicate) {
            List<Predicate> predicates = new ArrayList<>();

            String key = request.getKey();
            String[] relations = key.split("\\.");
            Expression<String> keyExpression = relations.length <= 1 ? root.get(key) : root.join(relations[0], JoinType.LEFT).get(relations[1]);
            List<Object> values = request.getValues() != null && !request.getValues().isEmpty() ? request.getValues() : List.of(request.getValue());

            values.forEach(value -> predicates.add(cb.like(cb.upper(keyExpression), "%" + value.toString().toUpperCase() + "%")));

            Predicate combinedPredicate = cb.or(predicates.toArray(new Predicate[0]));
            return cb.and(predicate, combinedPredicate);
        }
    },

    IN {
        public <T> Predicate build(Root<T> root, CriteriaBuilder cb, FilterRequest request, Predicate predicate) {
            String[] relations = request.getKey().split("\\.");
            Expression<String> key;
            if (relations.length <= 1) {
                key = root.get(request.getKey());
            } else {
                key = root.join(relations[0]).get(relations[1]);
            }
            CriteriaBuilder.In<Object> inClause = cb.in(key);

            List<Object> values = request.getValues();
            for (Object value : values) {
                inClause.value(request.getFieldType().parse(value.toString()));
            }
            return cb.and(inClause, predicate);
        }
    },

    BETWEEN {
        public <T> Predicate build(Root<T> root, CriteriaBuilder cb, FilterRequest request, Predicate predicate) {
            Object value = request.getFieldType().parse(request.getValue().toString());
            Object valueTo = request.getFieldType().parse(request.getValueTo().toString());
            if (request.getFieldType() == FieldType.DATE) {
                LocalDateTime startDate = (LocalDateTime) value;
                LocalDateTime endDate = (LocalDateTime) valueTo;
                Expression<LocalDateTime> key = root.get(request.getKey());
                return cb.and(cb.and(cb.greaterThanOrEqualTo(key, startDate), cb.lessThanOrEqualTo(key, endDate)), predicate);
            }

            if (request.getFieldType() != FieldType.CHAR && request.getFieldType() != FieldType.BOOLEAN) {
                Number start = (Number) value;
                Number end = (Number) valueTo;
                Expression<Number> key = root.get(request.getKey());
                return cb.and(cb.and(cb.ge(key, start), cb.le(key, end)), predicate);
            }

            log.info("Can not use between for {} field type.", request.getFieldType());
            return predicate;
        }
    };

    public abstract <T> Predicate build(Root<T> root, CriteriaBuilder cb, FilterRequest request, Predicate predicate);
}
