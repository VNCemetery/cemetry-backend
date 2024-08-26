package org.dongthap.lietsi.pathfinding;

import lombok.*;
import org.dongthap.lietsi.entity.Cell;
import org.dongthap.lietsi.entity.Edge;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PathFinding {
    private Map<Long, Cell> cellMap;
    private Set<Cell> cells;
    private List<Edge> edges;
}
