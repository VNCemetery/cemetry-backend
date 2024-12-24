package org.dongthap.lietsi.service;

import java.util.List;
import java.util.UUID;

import org.dongthap.lietsi.model.dto.path.PathFindingRequest;
import org.dongthap.lietsi.model.dto.path.PathGeoJsonResponse;
import org.dongthap.lietsi.model.entity.Vertex;

public interface PathFindingService {
    List<Vertex> findPath(PathFindingRequest pathFindingRequest);
    PathGeoJsonResponse findPathGeoJson(PathFindingRequest pathFindingRequest);
    void provideFeedback(UUID pathId, boolean isGood);
}
