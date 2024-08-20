package org.dongthap.lietsi.controller.api;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.dto.MartyrDto;
import org.dongthap.lietsi.dto.MartyrRequest;
import org.dongthap.lietsi.dto.search.SearchRequest;
import org.dongthap.lietsi.service.MartyrService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/martyrs")
@RequiredArgsConstructor
public class MartyrController {
    private final MartyrService martyrService;

    @PostMapping("/search")
    public ResponseEntity<List<MartyrDto>> search(@RequestBody SearchRequest searchRequest) {
        return ResponseEntity.ok(martyrService.search(searchRequest));
    }

    @GetMapping("/{id}")
    public ResponseEntity<MartyrDto> findById(@PathVariable Long id) {
        return ResponseEntity.ok(martyrService.findById(id));
    }

    @PostMapping("/upsert")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<MartyrDto> upsert(@RequestBody MartyrRequest martyrRequest) {
        return ResponseEntity.ok(martyrService.upsert(martyrRequest));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        martyrService.delete(id);
        return ResponseEntity.ok().build();
    }
}
