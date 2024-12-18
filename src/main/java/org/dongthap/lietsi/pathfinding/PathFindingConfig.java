package org.dongthap.lietsi.pathfinding;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.model.entity.Cell;
import org.dongthap.lietsi.repository.CellRepository;
import org.dongthap.lietsi.repository.EdgeRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashSet;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Configuration
@RequiredArgsConstructor
public class PathFindingConfig {
    @Bean
    public PathFinding pathFinding(EdgeRepository edgeRepository, CellRepository cellRepository) {
        Set<Cell> cells = new HashSet<>(cellRepository.findAll());
        return PathFinding.builder()
                .cells(cells)
                .cellMap(cellRepository.findAll().stream()
                        .collect(Collectors.toMap(Cell::getId, Function.identity())))
                .edges(edgeRepository.findAll())
                .build();
    }
}
