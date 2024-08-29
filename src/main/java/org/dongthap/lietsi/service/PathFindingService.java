package org.dongthap.lietsi.service;

import org.dongthap.lietsi.dto.path.PathFindingRequest;
import org.dongthap.lietsi.entity.Edge;
import org.dongthap.lietsi.entity.Vertex;

import java.util.List;

public interface PathFindingService {
    List<Vertex> findPath(PathFindingRequest pathFindingRequest);
}
