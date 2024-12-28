package org.dongthap.lietsi.util;

import lombok.experimental.UtilityClass;
import org.dongthap.lietsi.model.dto.path.CurrentLocation;
import org.dongthap.lietsi.model.entity.Cell;
import org.dongthap.lietsi.model.entity.Edge;
import org.dongthap.lietsi.model.entity.GraveRow;
import org.dongthap.lietsi.model.entity.Vertex;

import java.util.*;

import static org.dongthap.lietsi.constant.GridConstants.*;

@UtilityClass
public class PathFindingUtils {
    private static final double EARTH_RADIUS = 6371; // km
    private static final Map<String, Double> distanceCache = new HashMap<>();

    // Add grid distance calculation in initialization
    private static double gridHorizontalDistance;
    private static double gridVerticalDistance;
    private static double gridLatitudeDistance;
    private static double gridLongitudeDistance;

    static {
        // Pre-calculate grid distances once
        gridHorizontalDistance = getCachedHaversine(NW_LAT, NW_LNG, NE_LAT, NE_LNG);
        gridVerticalDistance = getCachedHaversine(NW_LAT, NW_LNG, SW_LAT, SW_LNG);
        gridLatitudeDistance = gridVerticalDistance / GRID_SIZE;
        gridLongitudeDistance = gridHorizontalDistance / GRID_SIZE;
    }

    public static Optional<Long> getCurrentCellId(CurrentLocation currentLocation) {
        if (currentLocation == null || currentLocation.getLatitude() == null ||
                currentLocation.getLongitude() == null) {
            return Optional.empty();
        }

        double latitude = currentLocation.getLatitude();
        double longitude = currentLocation.getLongitude();

        if (!isPointInPolygon(latitude, longitude)) {
            return Optional.empty();
        }

        // Calculate distances similar to C++ code
        double c = getCachedHaversine(NW_LAT, NW_LNG, latitude, longitude);
        double d = getCachedHaversine(NE_LAT, NE_LNG, latitude, longitude);

        double cosX = (gridHorizontalDistance * gridHorizontalDistance + c * c - d * d) /
                (2 * gridHorizontalDistance * c);
        double disCol = c * cosX;
        double sinX = Math.sqrt(1 - cosX * cosX);
        double disRow = c * sinX;

        int rowId = (int) Math.ceil(disRow / gridLatitudeDistance);
        int colId = (int) Math.ceil(disCol / gridLongitudeDistance);

        // Validate cell bounds like in C++
        if (colId < 1 || colId > GRID_SIZE || rowId < 1 || rowId > GRID_SIZE) {
            return Optional.empty();
        }

        return Optional.of((long) ((rowId - 1) * GRID_SIZE + colId));
    }

    private static double getCachedHaversine(double lat1, double lon1, double lat2, double lon2) {
        String key = String.format("%.6f:%.6f:%.6f:%.6f", lat1, lon1, lat2, lon2);
        return distanceCache.computeIfAbsent(key, k -> haversine(lat1, lon1, lat2, lon2));
    }

    private static double haversine(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);
        return 2 * EARTH_RADIUS * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    }

    public static List<Vertex> findPath(List<Edge> edges, Cell currentCell, GraveRow graveRow,
                                        CurrentLocation currentLocation) {
        if (edges == null || edges.isEmpty() || currentCell == null || graveRow == null) {
            return new ArrayList<>();
        }

        Vertex currentVertex = Vertex.builder()
                .latitude(currentLocation.getLatitude())
                .longitude(currentLocation.getLongitude())
                .build();

        Vertex recommendVertex = getRecommendVertex(currentCell, currentVertex);
        if (recommendVertex == null) {
            return new ArrayList<>();
        }

        // Build adjacency list for faster edge lookup
        Map<Vertex, List<Edge>> adjacencyList = buildAdjacencyList(edges);

        // Find shortest path to both possible destinations
        List<Vertex> path1 = dijkstra(adjacencyList, recommendVertex, graveRow.getVertex1());
        if (Objects.equals(graveRow.getVertex1().getId(), graveRow.getVertex2().getId())) {
            return path1;
        }
        List<Vertex> path2 = dijkstra(adjacencyList, recommendVertex, graveRow.getVertex2());

        // Choose shorter path
        List<Vertex> path = calculatePathDistance(path1, recommendVertex) <
                calculatePathDistance(path2, recommendVertex) ? path1 : path2;
        path.add(0, currentVertex);
        return path;
    }

    private static Map<Vertex, List<Edge>> buildAdjacencyList(List<Edge> edges) {
        Map<Vertex, List<Edge>> adjacencyList = new HashMap<>();
        for (Edge edge : edges) {
            adjacencyList.computeIfAbsent(edge.getVertex1(), k -> new ArrayList<>()).add(edge);
            adjacencyList.computeIfAbsent(edge.getVertex2(), k -> new ArrayList<>()).add(edge);
        }
        return adjacencyList;
    }

    private static List<Vertex> dijkstra(Map<Vertex, List<Edge>> adjacencyList,
                                         Vertex start, Vertex end) {
        // Add distance to start vertex calculation
        double initialDistance = calculateDistance(start, end);

        Map<Vertex, DijkstraNode> nodeMap = new HashMap<>();
        PriorityQueue<DijkstraNode> queue = new PriorityQueue<>();

        DijkstraNode startNode = new DijkstraNode(start, 0, null);
        nodeMap.put(start, startNode);
        queue.offer(startNode);

        while (!queue.isEmpty()) {
            DijkstraNode current = queue.poll();
            if (current.vertex.equals(end)) {
                return reconstructPath(current);
            }

            List<Edge> adjacentEdges = adjacencyList.getOrDefault(current.vertex, Collections.emptyList());
            for (Edge edge : adjacentEdges) {
                Vertex next = edge.getVertex1().equals(current.vertex) ?
                        edge.getVertex2() : edge.getVertex1();
                double newDist = current.distance + edge.getDistance();

                DijkstraNode nextNode = nodeMap.get(next);
                if (nextNode == null || newDist < nextNode.distance) {
                    nextNode = new DijkstraNode(next, newDist, current);
                    nodeMap.put(next, nextNode);
                    queue.offer(nextNode);
                }
            }
        }
        return new ArrayList<>();
    }

    private static class DijkstraNode implements Comparable<DijkstraNode> {
        final Vertex vertex;
        final double distance;
        final DijkstraNode previous;

        DijkstraNode(Vertex vertex, double distance, DijkstraNode previous) {
            this.vertex = vertex;
            this.distance = distance;
            this.previous = previous;
        }

        @Override
        public int compareTo(DijkstraNode other) {
            return Double.compare(this.distance, other.distance);
        }
    }

    private static List<Vertex> reconstructPath(DijkstraNode endNode) {
        List<Vertex> path = new ArrayList<>();
        DijkstraNode current = endNode;
        while (current != null) {
            path.add(0, current.vertex);
            current = current.previous;
        }
        return path;
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
        if (vertex1 == null || vertex2 == null) {
            return Double.MAX_VALUE;
        }

        return getCachedHaversine(vertex1.getLatitude(), vertex1.getLongitude(),
                vertex2.getLatitude(), vertex2.getLongitude());
    }

    private static double calculatePathDistance(List<Vertex> path, Vertex startVertex) {
        if (path == null || path.isEmpty()) {
            return Double.MAX_VALUE;
        }

        double totalDistance = calculateDistance(startVertex, path.get(0));
        for (int i = 0; i < path.size() - 1; i++) {
            totalDistance += calculateDistance(path.get(i), path.get(i + 1));
        }
        return totalDistance;
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
