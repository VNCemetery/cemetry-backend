package org.dongthap.lietsi.controller.api;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.dto.MartyrDto;
import org.dongthap.lietsi.dto.search.SearchRequest;
import org.dongthap.lietsi.service.MartyrService;
import org.springframework.http.ResponseEntity;
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
}
