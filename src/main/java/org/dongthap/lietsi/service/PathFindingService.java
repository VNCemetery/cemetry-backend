package org.dongthap.lietsi.service;

import org.dongthap.lietsi.dto.path.PathFindingRequest;
import org.dongthap.lietsi.entity.Edge;

import java.util.List;

public interface PathFindingService {
    List<Edge> findPath(PathFindingRequest pathFindingRequest);
}
