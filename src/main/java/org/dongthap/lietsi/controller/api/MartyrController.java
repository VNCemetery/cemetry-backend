package org.dongthap.lietsi.controller.api;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
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

    @Operation(summary = "Search for martyrs", description = "Search for martyrs based on the provided search criteria.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Found martyrs",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = MartyrDto.class)) }),
            @ApiResponse(responseCode = "400", description = "Invalid input",
                    content = @Content),
            @ApiResponse(responseCode = "500", description = "Internal server error",
                    content = @Content)
    })
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
    @SecurityRequirement(name = "bearerAuth")
    public ResponseEntity<MartyrDto> upsert(@RequestBody MartyrRequest martyrRequest) {
        return ResponseEntity.ok(martyrService.upsert(martyrRequest));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    @SecurityRequirement(name = "bearerAuth")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        martyrService.delete(id);
        return ResponseEntity.ok().build();
    }
}
