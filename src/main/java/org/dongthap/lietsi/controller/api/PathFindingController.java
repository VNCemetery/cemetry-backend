package org.dongthap.lietsi.controller.api;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.dto.path.PathFindingRequest;
import org.dongthap.lietsi.entity.Edge;
import org.dongthap.lietsi.service.PathFindingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/path-finding")
@RequiredArgsConstructor
public class PathFindingController {
    private final PathFindingService pathFindingService;

    @PostMapping
    public ResponseEntity<List<Edge>> pathFinding(@Valid @RequestBody PathFindingRequest pathFindingRequest) {
        return ResponseEntity.ok(pathFindingService.findPath(pathFindingRequest));
    }
}
