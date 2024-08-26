package org.dongthap.lietsi.util;

import lombok.experimental.UtilityClass;
import org.dongthap.lietsi.dto.path.CurrentLocation;
import org.dongthap.lietsi.entity.Cell;
import org.dongthap.lietsi.entity.Edge;
import org.dongthap.lietsi.entity.GraveRow;
import org.dongthap.lietsi.entity.Vertex;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.dongthap.lietsi.constant.GridConstants.*;

@UtilityClass
public class PathFindingUtils {
    public static Optional<Long> getCurrentCellId(CurrentLocation currentLocation) {
        if (currentLocation == null) {
            return Optional.empty();
        }
        Double latitude = currentLocation.getLatitude();
        Double longitude = currentLocation.getLongitude();

        if (latitude == null || longitude == null) {
            return Optional.empty();
        }

        if (!isPointInPolygon(latitude, longitude)) {
            return Optional.empty();
        }

        Double latDiff = Math.abs(NW_LAT - latitude);
        Double lngDiff = Math.abs(NW_LNG - longitude);

        Double latStep = Math.abs(NW_LAT - SE_LAT) / GRID_SIZE;
        Double lngStep = Math.abs(NW_LNG - SE_LNG) / GRID_SIZE;

        long row = (long)Math.floor(latDiff / latStep);
        long col = (long)Math.floor(lngDiff / lngStep);

        return Optional.of(row * GRID_SIZE + col);
    }

    public static List<Edge> findPath(List<Edge> edges, Cell currentCell, GraveRow graveRow,
                                      CurrentLocation currentLocation) {
        Vertex currentVertex = Vertex.builder()
                .latitude(currentLocation.getLatitude())
                .longitude(currentLocation.getLongitude())
                .build();
        Vertex recommendVertex = getRecommendVertex(currentCell, currentVertex);
        if (recommendVertex == null) {
            return new ArrayList<>();
        }
        Vertex destinationVertex1 = graveRow.getVertex1();
        Vertex destinationVertex2 = graveRow.getVertex2();

        List<Edge> path1 = findPath(edges, recommendVertex, destinationVertex1);
        List<Edge> path2 = findPath(edges, recommendVertex, destinationVertex2);

        double distance1 = path1.stream().mapToDouble(Edge::getDistance).sum();
        double distance2 = path2.stream().mapToDouble(Edge::getDistance).sum();

        return distance1 < distance2 ? path1 : path2;
    }

    private static List<Edge> findPath(List<Edge> edges, Vertex startVertex, Vertex endVertex) {
        List<Edge> path = new ArrayList<>();
        Vertex currentVertex = startVertex;
        while (!currentVertex.equals(endVertex)) {
            Edge nextEdge = getNextEdge(edges, currentVertex, endVertex);
            if (nextEdge == null) {
                return new ArrayList<>();
            }
            path.add(nextEdge);
            currentVertex = nextEdge.getVertex2();
        }
        return path;
    }

    private static Edge getNextEdge(List<Edge> edges, Vertex currentVertex, Vertex endVertex) {
        Edge nextEdge = null;
        double minDistance = Double.MAX_VALUE;
        for (Edge edge : edges) {
            if (edge.getVertex1().equals(currentVertex)) {
                double distance = calculateDistance(edge.getVertex2(), endVertex);
                if (distance < minDistance) {
                    minDistance = distance;
                    nextEdge = edge;
                }
            }
        }

        return nextEdge;
    }

    private static Vertex getRecommendVertex(Cell currentCell, Vertex currentVertex) {
        Vertex recommendVertex = null;
        double minDistance = Double.MAX_VALUE;
        for (Vertex vertex : currentCell.getVertices()) {
            Double distance = calculateDistance(vertex, currentVertex);
            if (distance < minDistance) {
                minDistance = distance;
                recommendVertex = vertex;
            }
        }

        return recommendVertex;
    }

    private static Double calculateDistance(Vertex vertex1, Vertex vertex2) {
        return Math.sqrt(Math.pow(vertex1.getLatitude() - vertex2.getLatitude(), 2) +
                Math.pow(vertex1.getLongitude() - vertex2.getLongitude(), 2));
    }

    private static boolean isPointInPolygon(double latitude, double longitude) {
        double[][] polygon = {
                {NW_LAT, NW_LNG},
                {NE_LAT, NE_LNG},
                {SE_LAT, SE_LNG},
                {SW_LAT, SW_LNG}
        };

        int n = polygon.length;
        boolean isInside = false;
        for (int i = 0, j = n - 1; i < n; j = i++) {
            if (((polygon[i][1] > longitude) != (polygon[j][1] > longitude)) &&
                    (latitude < (polygon[j][0] - polygon[i][0]) * (longitude - polygon[i][1]) / (polygon[j][1] - polygon[i][1]) + polygon[i][0])) {
                isInside = !isInside;
            }
        }

        return isInside;
    }
}
