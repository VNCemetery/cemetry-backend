package org.dongthap.lietsi.model.dto.search;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.dongthap.lietsi.filter.FieldType;
import org.dongthap.lietsi.filter.Operator;

import java.util.List;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class FilterRequest {
    private String key;
    private Operator operator;
    private FieldType fieldType;
    private Object value;
    private Object valueTo;
    private List<Object> values;
}
