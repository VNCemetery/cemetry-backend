package org.dongthap.lietsi.service;

import org.dongthap.lietsi.model.dto.path.PathFindingRequest;
import org.dongthap.lietsi.model.entity.Vertex;

import java.util.List;

public interface PathFindingService {
    List<Vertex> findPath(PathFindingRequest pathFindingRequest);
}
