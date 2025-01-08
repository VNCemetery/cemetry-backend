package org.dongthap.lietsi.util;

import lombok.experimental.UtilityClass;
import org.dongthap.lietsi.model.dto.path.PathGeoJsonResponse;
import org.dongthap.lietsi.model.entity.Path;
import org.dongthap.lietsi.model.entity.Vertex;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.PrecisionModel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@UtilityClass
public class GeometryUtils {
    private static final GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), 4326);

    public static Point createPoint(double longitude, double latitude) {
        Point point = geometryFactory.createPoint(new Coordinate(longitude, latitude));
        point.setSRID(4326);
        return point;
    }

    public static PathGeoJsonResponse buildGeoJsonWithPath(Path path) {
        List<Vertex> vertices = path.getVertices();
        List<List<Double>> coordinates = vertices.stream()
                .map(vertex -> List.of(vertex.getLongitude(), vertex.getLatitude()))
                .toList();

        // Create list of vertex IDs
        List<Long> vertexIds = vertices.stream()
                .map(Vertex::getId)
                .toList();

        Map<String, Object> properties = new HashMap<>();
        properties.put("pathId", path.getId());
        properties.put("vertexIds", vertexIds);

        PathGeoJsonResponse.Feature feature = PathGeoJsonResponse.Feature.builder()
                .type("Feature")
                .geometry(PathGeoJsonResponse.Geometry.builder()
                        .type("LineString")
                        .coordinates(coordinates)
                        .build())
                .properties(properties)
                .build();

        return PathGeoJsonResponse.builder()
                .type("FeatureCollection")
                .features(List.of(feature))
                .build();
    }
}
