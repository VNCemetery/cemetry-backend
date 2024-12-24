package org.dongthap.lietsi.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.dongthap.lietsi.exception.BadRequestException;
import org.dongthap.lietsi.model.dto.path.CurrentLocation;
import org.dongthap.lietsi.model.dto.path.PathFindingRequest;
import org.dongthap.lietsi.model.dto.path.PathGeoJsonResponse;
import org.dongthap.lietsi.model.entity.Cell;
import org.dongthap.lietsi.model.entity.Edge;
import org.dongthap.lietsi.model.entity.GraveRow;
import org.dongthap.lietsi.model.entity.Path;
import org.dongthap.lietsi.model.entity.Vertex;
import org.dongthap.lietsi.pathfinding.PathFinding;
import org.dongthap.lietsi.repository.GraveRowRepository;
import org.dongthap.lietsi.repository.PathRepository;
import org.dongthap.lietsi.repository.VertexRepository;
import org.dongthap.lietsi.service.PathFindingService;
import org.dongthap.lietsi.util.PathFindingUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return PathFindingUtils.findPath(edges, currentCell, graveRow, currentLocation);
    }

    @Override
    public PathGeoJsonResponse findPathGeoJson(PathFindingRequest pathFindingRequest) {
        List<Vertex> vertices = findPath(pathFindingRequest);
        
        // Handle transient vertices
        List<Vertex> savedVertices = new ArrayList<>();
        for (Vertex vertex : vertices) {
            if (vertex.getId() == null) {
                // For transient vertices (like current location), find or create them
                Vertex existingVertex = vertexRepository.findByLatitudeAndLongitude(
                    vertex.getLatitude(), 
                    vertex.getLongitude()
                ).orElseGet(() -> vertexRepository.save(vertex));
                savedVertices.add(existingVertex);
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

        PathGeoJsonResponse.Feature feature = PathGeoJsonResponse.Feature.builder()
                .type("Feature")
                .geometry(PathGeoJsonResponse.Geometry.builder()
                        .type("LineString")
                        .coordinates(coordinates)
                        .build())
                .properties(Map.of("pathId", path.getId()))
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
