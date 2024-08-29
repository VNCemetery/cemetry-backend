package org.dongthap.lietsi.service.impl;

import org.dongthap.lietsi.dto.path.CurrentLocation;
import org.dongthap.lietsi.dto.path.PathFindingRequest;
import org.dongthap.lietsi.entity.Cell;
import org.dongthap.lietsi.entity.Edge;
import org.dongthap.lietsi.entity.GraveRow;
import org.dongthap.lietsi.entity.Vertex;
import org.dongthap.lietsi.exception.BadRequestException;
import org.dongthap.lietsi.pathfinding.PathFinding;
import org.dongthap.lietsi.repository.GraveRowRepository;
import org.dongthap.lietsi.service.PathFindingService;
import org.dongthap.lietsi.util.PathFindingUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PathFindingServiceImpl implements PathFindingService {
    @Autowired
    private PathFinding pathFinding;
    @Autowired
    private GraveRowRepository graveRowRepository;

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
}
