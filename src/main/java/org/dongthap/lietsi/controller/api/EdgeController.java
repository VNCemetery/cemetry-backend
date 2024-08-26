package org.dongthap.lietsi.controller.api;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.entity.Edge;
import org.dongthap.lietsi.pathfinding.PathFinding;
import org.dongthap.lietsi.repository.EdgeRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/edges")
@RequiredArgsConstructor
public class EdgeController {
    private final PathFinding pathFinding;

    @GetMapping
    public ResponseEntity<List<Edge>> getEdges() {
        return ResponseEntity.ok(pathFinding.getEdges());
    }
}
