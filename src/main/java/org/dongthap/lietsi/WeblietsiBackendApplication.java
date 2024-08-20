package org.dongthap.lietsi;

import org.dongthap.lietsi.service.MigrateService;
import org.dongthap.lietsi.service.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

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
