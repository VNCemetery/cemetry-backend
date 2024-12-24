package org.dongthap.lietsi.controller.api;

import org.dongthap.lietsi.model.dto.path.PathFeedbackRequest;
import org.dongthap.lietsi.model.dto.path.PathFindingRequest;
import org.dongthap.lietsi.model.dto.path.PathGeoJsonResponse;
import org.dongthap.lietsi.service.PathFindingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/path-finding")
@RequiredArgsConstructor
@Tag(name = "Path Finding", description = "Path finding operations")
public class PathFindingController {
    private final PathFindingService pathFindingService;

    @Operation(
        summary = "Find path to grave row",
        description = "Returns a GeoJSON object representing the path from current location to the specified grave row"
    )
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Successfully found path",
            content = @Content(mediaType = "application/json",
            schema = @Schema(implementation = PathGeoJsonResponse.class))),
        @ApiResponse(responseCode = "400", description = "Invalid request parameters"),
        @ApiResponse(responseCode = "404", description = "Grave row not found")
    })
    @PostMapping
    public ResponseEntity<PathGeoJsonResponse> pathFinding(@Valid @RequestBody PathFindingRequest pathFindingRequest) {
        return ResponseEntity.ok(pathFindingService.findPathGeoJson(pathFindingRequest));
    }

    @Operation(
        summary = "Provide feedback for a path",
        description = "Allows users to mark a path as good or not good"
    )
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Feedback recorded successfully"),
        @ApiResponse(responseCode = "404", description = "Path not found")
    })
    @PostMapping("/feedback")
    public ResponseEntity<Void> provideFeedback(@Valid @RequestBody PathFeedbackRequest feedbackRequest) {
        pathFindingService.provideFeedback(feedbackRequest.getPathId(), feedbackRequest.getIsGood());
        return ResponseEntity.ok().build();
    }
}
