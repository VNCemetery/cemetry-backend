package org.dongthap.lietsi;

import org.dongthap.lietsi.entity.Cell;
import org.dongthap.lietsi.pathfinding.PathFinding;
import org.dongthap.lietsi.repository.CellRepository;
import org.dongthap.lietsi.repository.EdgeRepository;
import org.dongthap.lietsi.service.MigrateService;
import org.dongthap.lietsi.service.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.HashSet;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@SpringBootApplication
public class WeblietsiBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(WeblietsiBackendApplication.class, args);
    }

    @Bean
    CommandLineRunner runner(UserService userService, MigrateService migrateService) {
        return args -> {
//            migrateService.migrateMartyr();
        };
    }
}
