package org.dongthap.lietsi.util;

import lombok.experimental.UtilityClass;
import org.dongthap.lietsi.dto.path.CurrentLocation;
import org.dongthap.lietsi.entity.Cell;
import org.dongthap.lietsi.entity.Edge;
import org.dongthap.lietsi.entity.GraveRow;
import org.dongthap.lietsi.entity.Vertex;

import java.util.*;

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

        double horizontalDistance = haversine(NW_LAT, NW_LNG, NE_LAT, NE_LNG);
        double verticalDistance = haversine(NW_LAT, NW_LNG, SW_LAT, SW_LNG);
        double latitudeDistance = verticalDistance / GRID_SIZE;
        double longitudeDistance = horizontalDistance / GRID_SIZE;

        double a = horizontalDistance, b = verticalDistance;
        double c = haversine(NW_LAT, NW_LNG, latitude, longitude);
        double d = haversine(NE_LAT, NE_LNG, latitude, longitude);
        double e = haversine(SW_LAT, SW_LNG, latitude, longitude);
        // d^2 = a^2 + c^2 - 2ac * cos(alpha)

        double cosAlpha = (a * a + c * c - d * d) / (2 * a * c);
        double colDistance = c * cosAlpha;
        double sinAlpha = Math.sqrt(1 - cosAlpha * cosAlpha);
        double rowDistance = c * sinAlpha;
        int rowId = (int) Math.ceil(rowDistance / latitudeDistance);
        int colId = (int) Math.ceil(colDistance / longitudeDistance);

        return Optional.of((long) (rowId - 1) * GRID_SIZE + colId);
    }

    private static double haversine(double lat1, double lon1, double lat2, double lon2) {
        double R = 6371; // Radius of the earth in km
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return R * c;
    }

    public static List<Vertex> findPath(List<Edge> edges, Cell currentCell, GraveRow graveRow,
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

        List<Vertex> path1 = dijkstra(edges, recommendVertex, destinationVertex1);
        List<Vertex> path2 = dijkstra(edges, recommendVertex, destinationVertex2);
        double distance1 = path1.stream().mapToDouble(vertex -> calculateDistance(vertex, recommendVertex)).sum();
        double distance2 = path2.stream().mapToDouble(vertex -> calculateDistance(vertex, recommendVertex)).sum();
        List<Vertex> path = distance1 < distance2 ? path1 : path2;
        path.add(0, currentVertex);
        return path;
    }

    private static class PathNode {
        Vertex vertex;
        double distance;
        Vertex previous;

        PathNode(Vertex vertex, double distance, Vertex previous) {
            this.vertex = vertex;
            this.distance = distance;
            this.previous = previous;
        }
    }

    private static List<Vertex> dijkstra(List<Edge> edges, Vertex startVertex, Vertex endVertex) {
        List<Vertex> path = new ArrayList<>();
        Map<Vertex, PathNode> pathNodes = new HashMap<>();
        Set<Vertex> visitedVertices = new HashSet<>();
        PriorityQueue<PathNode> priorityQueue = new PriorityQueue<>(Comparator.comparingDouble(node -> node.distance));
        PathNode startNode = new PathNode(startVertex, 0, null);
        pathNodes.put(startVertex, startNode);
        priorityQueue.add(startNode);

        while (!priorityQueue.isEmpty()) {
            PathNode currentNode = priorityQueue.poll();
            Vertex currentVertex = currentNode.vertex;
            if (currentVertex.equals(endVertex)) {
                while (currentNode != null) {
                    path.add(currentNode.vertex);
                    currentNode = pathNodes.get(currentNode.previous);
                }
                Collections.reverse(path);
                return path;
            }

            visitedVertices.add(currentVertex);
            List<Edge> adjacentEdges = getAdjacentEdges(edges, currentVertex);
            for (Edge edge : adjacentEdges) {
                Vertex nextVertex = edge.getVertex1().equals(currentVertex) ? edge.getVertex2() : edge.getVertex1();
                if (visitedVertices.contains(nextVertex)) {
                    continue;
                }

                double newDistance = currentNode.distance + edge.getDistance();
                PathNode nextNode = pathNodes.get(nextVertex);
                if (nextNode == null) {
                    nextNode = new PathNode(nextVertex, newDistance, currentVertex);
                    pathNodes.put(nextVertex, nextNode);
                    priorityQueue.add(nextNode);
                } else if (newDistance < nextNode.distance) {
                    nextNode.distance = newDistance;
                    nextNode.previous = currentVertex;
                    priorityQueue.remove(nextNode);
                    priorityQueue.add(nextNode);
                }
            }
        }

        return path;
    }

    private static List<Edge> getAdjacentEdges(List<Edge> edges, Vertex vertex) {
        List<Edge> adjacentEdges = new ArrayList<>();
        for (Edge edge : edges) {
            if (edge.getVertex1().equals(vertex) || edge.getVertex2().equals(vertex)) {
                adjacentEdges.add(edge);
            }
        }

        return adjacentEdges;
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
