package org.dongthap.lietsi.controller.api;

import io.swagger.v3.oas.annotations.media.ExampleObject;
import org.dongthap.lietsi.model.dto.MartyrDto;
import org.dongthap.lietsi.model.dto.MartyrRequest;
import org.dongthap.lietsi.model.dto.search.MartyrSearchRequest;
import org.dongthap.lietsi.service.MartyrService;
import org.dongthap.lietsi.util.ResponseUtils;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/martyrs")
@RequiredArgsConstructor
@Tag(name = "Martyr Management", description = "APIs for managing martyr records")
public class MartyrController {
    private final MartyrService martyrService;

    @Operation(
        summary = "Search for martyrs",
        description = "Search for martyrs based on various criteria including name, date ranges, and location."
    )
    @io.swagger.v3.oas.annotations.parameters.RequestBody(
        description = "Search criteria",
        required = true,
        content = @Content(
            mediaType = "application/json",
            schema = @Schema(implementation = MartyrSearchRequest.class),
            examples = @ExampleObject(
                name = "Basic Search",
                summary = "Search for martyrs by name",
                value = """
                {
                    "name": "Nguyen Van",
                    "page": 0,
                    "size": 10
                }
                """
            )
        )
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200",
            description = "Successfully retrieved martyr list",
            content = @Content(
                mediaType = "application/json",
                array = @ArraySchema(schema = @Schema(implementation = MartyrDto.class)),
                examples = @io.swagger.v3.oas.annotations.media.ExampleObject(
                    name = "Search Results",
                    summary = "Example search results",
                    value = """
                    [
                        {
                            "id": 1,
                            "areaName": "Area A",
                            "rowName": "Row 1",
                            "fullName": "Nguyen Van Anh",
                            "name": "Van Anh",
                            "codeName": "NA123",
                            "yearOfBirth": "1950",
                            "dateOfDeath": "1975",
                            "rankPositionUnit": "Lieutenant, 7th Division",
                            "homeTown": "Ha Noi"
                        },
                        {
                            "id": 2,
                            "areaName": "Area B",
                            "rowName": "Row 3",
                            "fullName": "Nguyen Van Binh",
                            "name": "Van Binh",
                            "codeName": "NB456",
                            "yearOfBirth": "1952",
                            "dateOfDeath": "1975",
                            "rankPositionUnit": "Captain, 9th Division",
                            "homeTown": "Hai Phong"
                        }
                    ]
                    """
                )
            )
        ),
        @ApiResponse(
            responseCode = "400",
            description = "Invalid search criteria provided",
            content = @Content
        ),
        @ApiResponse(
            responseCode = "401",
            description = "Unauthorized access",
            content = @Content
        )
    })
    @PostMapping("/search")
    public ResponseEntity<Page<MartyrDto>> search(@RequestBody MartyrSearchRequest searchRequest) {
        return ResponseEntity.ok(martyrService.search(searchRequest));
    }

    @Operation(
        summary = "Get martyr by ID",
        description = "Retrieve detailed information about a specific martyr by their ID"
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200",
            description = "Martyr found",
            content = @Content(schema = @Schema(implementation = MartyrDto.class))
        ),
        @ApiResponse(
            responseCode = "404",
            description = "Martyr not found",
            content = @Content
        )
    })
    @GetMapping("/{id}")
    public ResponseEntity<MartyrDto> findById(
        @Parameter(description = "ID of the martyr to retrieve", required = true)
        @PathVariable Long id
    ) {
        return ResponseEntity.ok(martyrService.findById(id));
    }

    @Operation(
        summary = "Create or update martyr",
        description = "Create a new martyr record or update an existing one"
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200",
            description = "Martyr created/updated successfully",
            content = @Content(schema = @Schema(implementation = MartyrDto.class))
        ),
        @ApiResponse(
            responseCode = "400",
            description = "Invalid input data",
            content = @Content
        ),
        @ApiResponse(
            responseCode = "401",
            description = "Unauthorized access",
            content = @Content
        )
    })
    @PostMapping("/upsert")
    @PreAuthorize("isAuthenticated()")
    @SecurityRequirement(name = "bearerAuth")
    public ResponseEntity<MartyrDto> upsert(@RequestBody MartyrRequest martyrRequest) {
        return ResponseEntity.ok(martyrService.upsert(martyrRequest));
    }

    @Operation(
        summary = "Delete martyr",
        description = "Delete a martyr record by ID"
    )
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200",
            description = "Martyr deleted successfully",
            content = @Content
        ),
        @ApiResponse(
            responseCode = "404",
            description = "Martyr not found",
            content = @Content
        ),
        @ApiResponse(
            responseCode = "401",
            description = "Unauthorized access",
            content = @Content
        )
    })
    @DeleteMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    @SecurityRequirement(name = "bearerAuth")
    public ResponseEntity<?> delete(
        @Parameter(description = "ID of the martyr to delete", required = true)
        @PathVariable Long id
    ) {
        martyrService.delete(id);
        return ResponseEntity.ok(ResponseUtils.OK);
    }
}
