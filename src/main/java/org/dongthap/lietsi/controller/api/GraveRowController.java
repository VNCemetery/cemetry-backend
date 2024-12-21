package org.dongthap.lietsi.controller.api;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.model.entity.GraveRow;
import org.dongthap.lietsi.repository.GraveRowRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/grave-row")
@RequiredArgsConstructor
public class GraveRowController {
    private final GraveRowRepository graveRowRepository;

    @GetMapping
    public ResponseEntity<List<GraveRow>> findAll() {
        return ResponseEntity.ok(graveRowRepository.findAll());
    }
}
