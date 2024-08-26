package org.dongthap.lietsi.config;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.dongthap.lietsi.entity.Cell;
import org.dongthap.lietsi.pathfinding.PathFinding;
import org.dongthap.lietsi.repository.CellRepository;
import org.dongthap.lietsi.repository.EdgeRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Configuration
public class AppConfig {

    @Bean
    ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        JavaTimeModule javaTimeModule = new JavaTimeModule();
        // Hack time module to allow 'Z' at the end of string (i.e. javascript json's)
        javaTimeModule.addDeserializer(LocalDateTime.class, new LocalDateTimeDeserializer(DateTimeFormatter.ISO_DATE_TIME));
        objectMapper.registerModule(javaTimeModule);
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        return objectMapper;
    }

    @Bean
    DataFormatter dataFormatter() {
        return new DataFormatter();
    }
}
