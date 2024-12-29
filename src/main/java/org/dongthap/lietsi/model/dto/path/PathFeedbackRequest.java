package org.dongthap.lietsi.model.dto.path;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.UUID;

@Data
@Schema(description = "Request object for path feedback")
public class PathFeedbackRequest {
    @NotNull(message = "Path ID is required")
    private UUID pathId;

    @NotNull(message = "Feedback is required")
    private Boolean isGood;
}
