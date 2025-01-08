package org.dongthap.lietsi.service;

import org.dongthap.lietsi.model.dto.path.PathFindingRequest;
import org.dongthap.lietsi.model.dto.path.PathGeoJsonResponse;
import org.dongthap.lietsi.model.entity.Vertex;

import java.util.List;
import java.util.UUID;

public interface PathFindingService {
    List<Vertex> findPath(PathFindingRequest pathFindingRequest);
    PathGeoJsonResponse findPathGeoJson(PathFindingRequest pathFindingRequest);
    PathGeoJsonResponse getPathById(UUID pathId);
    void provideFeedback(UUID pathId, boolean isGood);
}
