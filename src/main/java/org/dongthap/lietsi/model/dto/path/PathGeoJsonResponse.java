package org.dongthap.lietsi.model.dto.path;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class PathGeoJsonResponse {
    private String type;
    private List<Feature> features;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Feature {
        private String type;
        private Geometry geometry;
        private Map<String, Object> properties;
    }

    @Data
    @Builder
    public static class Geometry {
        private String type;
        private List<List<Double>> coordinates;
    }
}
