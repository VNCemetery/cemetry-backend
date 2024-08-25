package org.dongthap.lietsi.pathfinding;

import lombok.RequiredArgsConstructor;
import org.dongthap.lietsi.repository.CellRepository;
import org.dongthap.lietsi.repository.EdgeRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.util.HashSet;

@Component
@RequiredArgsConstructor
public class PathFindingConfig {
    private final EdgeRepository edgeRepository;
    private final CellRepository cellRepository;

    @Bean
    public PathFinding pathFinding() {
        return PathFinding.builder()
                .cells(new HashSet<>(cellRepository.findAll()))
                .edges(edgeRepository.findAll())
                .build();
    }
}
