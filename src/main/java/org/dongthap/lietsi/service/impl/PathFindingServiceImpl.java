package org.dongthap.lietsi.service.impl;

import org.dongthap.lietsi.exception.BadRequestException;
import org.dongthap.lietsi.model.dto.path.CurrentLocation;
import org.dongthap.lietsi.model.dto.path.PathFindingRequest;
import org.dongthap.lietsi.model.dto.path.PathGeoJsonResponse;
import org.dongthap.lietsi.model.entity.*;
import org.dongthap.lietsi.pathfinding.PathFinding;
import org.dongthap.lietsi.repository.GraveRowRepository;
import org.dongthap.lietsi.repository.PathRepository;
import org.dongthap.lietsi.repository.VertexRepository;
import org.dongthap.lietsi.service.PathFindingService;
import org.dongthap.lietsi.util.PathFindingUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class PathFindingServiceImpl implements PathFindingService {
    @Autowired
    private PathFinding pathFinding;
    @Autowired
    private GraveRowRepository graveRowRepository;
    @Autowired
    private PathRepository pathRepository;
    @Autowired
    private VertexRepository vertexRepository;

    @Override
    public List<Vertex> findPath(PathFindingRequest pathFindingRequest) {
        GraveRow graveRow = graveRowRepository.findById(pathFindingRequest.getGraveRowId())
                .orElseThrow(() -> BadRequestException.message("Không tìm thấy hàng mộ"));

        CurrentLocation currentLocation = pathFindingRequest.getCurrentLocation();
        Long currentCellId = PathFindingUtils.getCurrentCellId(currentLocation)
                .orElseThrow(() -> BadRequestException.message("Vị trí hiện tại không hợp lệ"));

        Cell currentCell = pathFinding.getCellMap().get(currentCellId);
        if (currentCell == null) {
            throw BadRequestException.message("Vị trí hiện tại không hợp lệ");
        }

        List<Edge> edges = pathFinding.getEdges();
        List<Vertex> path = PathFindingUtils.findPath(edges, currentCell, graveRow, currentLocation);
        if (path.isEmpty()) {
            throw BadRequestException.message("Không tìm được đường đi");
        }
        return path;
    }

    @Override
    public PathGeoJsonResponse findPathGeoJson(PathFindingRequest pathFindingRequest) {
        List<Vertex> vertices = findPath(pathFindingRequest);
        
        // Handle transient vertices
        List<Vertex> savedVertices = new ArrayList<>();
        for (Vertex vertex : vertices) {
            if (vertex.getId() == null) {
                // For transient vertices (like current location), first try to find existing one
                Optional<Vertex> existingVertex = vertexRepository.findByLatitudeAndLongitude(
                    vertex.getLatitude(), 
                    vertex.getLongitude()
                );
                
                // If not found, save as new vertex
                savedVertices.add(existingVertex.orElseGet(() -> vertexRepository.save(vertex)));
            } else {
                savedVertices.add(vertex);
            }
        }
        
        // Save the path with saved vertices
        Path path = Path.builder()
                .vertices(savedVertices)
                .isGood(null) // Initially null until feedback is received
                .build();
        path = pathRepository.save(path);
        
        List<List<Double>> coordinates = savedVertices.stream()
                .map(vertex -> List.of(vertex.getLongitude(), vertex.getLatitude()))
                .toList();

        // Create list of vertex IDs
        List<Long> vertexIds = savedVertices.stream()
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

    @Override
    public void provideFeedback(UUID pathId, boolean isGood) {
        Path path = pathRepository.findById(pathId)
                .orElseThrow(() -> BadRequestException.message("Path not found"));
        path.setIsGood(isGood);
        pathRepository.save(path);
    }
}
