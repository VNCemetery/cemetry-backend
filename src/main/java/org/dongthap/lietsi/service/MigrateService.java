package org.dongthap.lietsi.service;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.dongthap.lietsi.model.entity.*;
import org.dongthap.lietsi.repository.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.*;

@Service
@RequiredArgsConstructor
public class MigrateService {
    private static final Logger log = LoggerFactory.getLogger(MigrateService.class);
    private final MartyrRepository martyrRepository;
    private final GraveRowRepository graveRowRepository;
    private final VertexRepository vertexRepository;
    private final EdgeRepository edgeRepository;
    private final CellRepository cellRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final DataFormatter formatter;

    private long nextGraveRowId = 1000; // Start from 1000 to avoid conflicts with existing IDs

    @Transactional
    public void migrateAll() throws Exception {
        migrateUsers();
        migrateVertices();
        migrateEdges();
        migrateCells();
        migrateGraveRows();
        migrateMartyr();
    }

    @Transactional
    public void migrateUsers() {
        if (userRepository.count() > 0) {
            return;
        }

        User adminUser = User.builder()
                .id(UUID.fromString("00000000-0000-0000-0000-000000000001"))
                .username("admin")
                .password("$2a$12$vN.fbI69UOW7pKYDglW7vurfnFGm3PL4ou/YwOa3QCpVIz/chqqfG")
                .email("safeyouteam@gmail.com")
                .build();

        userRepository.save(adminUser);
    }

    @Transactional
    public void migrateVertices() throws IOException, CsvValidationException {
        if (vertexRepository.count() > 0) {
            return;
        }

        try (Reader reader = new InputStreamReader(getClass().getClassLoader()
                .getResourceAsStream("data/vertex.csv"))) {
            CSVReader csvReader = new CSVReader(reader);
            String[] header = csvReader.readNext();
            String[] line;

            List<Vertex> vertices = new ArrayList<>();
            while ((line = csvReader.readNext()) != null) {
                long id = Long.parseLong(line[0]);
                double lat = Double.parseDouble(line[1]);
                double lon = Double.parseDouble(line[2]);

                Vertex vertex = Vertex.builder()
                        .id(id)
                        .latitude(lat)
                        .longitude(lon)
                        .build();
                vertices.add(vertex);
            }

            vertexRepository.saveAll(vertices);
        }
    }

    @Transactional
    public void migrateEdges() throws IOException, CsvValidationException {
        if (edgeRepository.count() > 0) {
            return;
        }

        Map<Long, Vertex> vertexMap = new HashMap<>();
        vertexRepository.findAll().forEach(v ->
                vertexMap.put(v.getId(), v)
        );

        try (Reader reader = new InputStreamReader(getClass().getClassLoader()
                .getResourceAsStream("data/edge.csv"))) {
            CSVReader csvReader = new CSVReader(reader);
            String[] header = csvReader.readNext();
            String[] line;

            List<Edge> edges = new ArrayList<>();
            while ((line = csvReader.readNext()) != null) {
                long id = Long.parseLong(line[0]);
                long vertex1Id = Long.parseLong(line[1]);
                long vertex2Id = Long.parseLong(line[2]);
                double distance = Double.parseDouble(line[3]);

                Edge edge = Edge.builder()
                        .id(id)
                        .vertex1(vertexMap.get(vertex1Id))
                        .vertex2(vertexMap.get(vertex2Id))
                        .distance(distance)
                        .oneWay(false)
                        .build();
                edges.add(edge);
            }

            edgeRepository.saveAll(edges);
        }
    }

    @Transactional
    public void migrateCells() throws IOException, CsvValidationException {
        if (cellRepository.count() > 0) {
            return;
        }

        // Load all vertices into a map using coordinates as key for lookup
        Map<String, Vertex> vertexCoordMap = new HashMap<>();
        vertexRepository.findAll().forEach(v -> {
            String key = v.getLatitude() + "," + v.getLongitude();
            vertexCoordMap.put(key, v);
        });

        // Process cell_vertex.csv and map vertices to cells
        Map<Long, Set<Vertex>> cellVertices = new HashMap<>();
        try (Reader reader = new InputStreamReader(getClass().getClassLoader()
                .getResourceAsStream("data/cell_vertex.csv"))) {
            CSVReader csvReader = new CSVReader(reader);
            csvReader.readNext(); // Skip header
            String[] line;

            while ((line = csvReader.readNext()) != null) {
                long cellId = Long.parseLong(line[0]);
                int vertexId = Integer.parseInt(line[1]);

                // Find vertex coordinates from vertex.csv
                try (Reader vertexReader = new InputStreamReader(getClass().getClassLoader()
                        .getResourceAsStream("data/vertex.csv"))) {
                    CSVReader vertexCsvReader = new CSVReader(vertexReader);
                    vertexCsvReader.readNext(); // Skip header
                    String[] vertexLine;

                    while ((vertexLine = vertexCsvReader.readNext()) != null) {
                        if (Integer.parseInt(vertexLine[0]) == vertexId) {
                            String coordKey = vertexLine[1] + "," + vertexLine[2];
                            Vertex vertex = vertexCoordMap.get(coordKey);
                            if (vertex != null) {
                                cellVertices.computeIfAbsent(cellId, k -> new HashSet<>())
                                        .add(vertex);
                            }
                            break;
                        }
                    }
                }
            }
        }

        // Create and save cells with their Long IDs
        List<Cell> cells = new ArrayList<>();
        cellVertices.forEach((id, vertices) -> {
            Cell cell = Cell.builder()
                    .id(id) // Now using Long ID from CSV
                    .vertices(vertices)
                    .build();
            cells.add(cell);
        });

        cellRepository.saveAll(cells);
    }

    @Transactional
    public void migrateGraveRows() throws IOException, CsvValidationException {
        if (graveRowRepository.count() > 0) {
            return;
        }

        Map<Long, Vertex> vertexMap = new HashMap<>();
        vertexRepository.findAll().forEach(v -> vertexMap.put(v.getId(), v));

        try (Reader reader = new InputStreamReader(getClass().getClassLoader()
                .getResourceAsStream("data/grave_row_with_vertex.csv"))) {
            CSVReader csvReader = new CSVReader(reader);
            String[] header = csvReader.readNext();
            String[] line;

            List<GraveRow> rows = new ArrayList<>();
            while ((line = csvReader.readNext()) != null) {
                long id = Long.parseLong(line[0]);
                String areaName = line[3];
                String rowName = line[4];
                if (line[5].isEmpty() || line[6].isEmpty()) {
                    log.warn("Empty vertex ID at row {}", id);
                    continue;
                }
                long vertex1Id = Long.parseLong(line[5]);
                long vertex2Id = Long.parseLong(line[6]);

                GraveRow row = GraveRow.builder()
                        .id(id)
                        .areaName(areaName)
                        .rowName(rowName)
                        .vertex1(vertexMap.get(vertex1Id))
                        .vertex2(vertexMap.get(vertex2Id))
                        .build();
                rows.add(row);
            }

            graveRowRepository.saveAll(rows);
        }
    }

    @Transactional
    public void migrateMartyr() throws IOException, InvalidFormatException {
        if (martyrRepository.count() > 0) {
            return;
        }
        //classpath: data/martyr.xls
        InputStream inputStream = getClass().getClassLoader()
                .getResourceAsStream("data/martyr.xls");
        assert inputStream != null;
        Workbook workbook = new HSSFWorkbook(inputStream);
        List<MartyrGrave> martyrGraves = new ArrayList<>();

        for (int i = 0; i < 2; i++) {
            Sheet sheet = workbook.getSheetAt(i);
            int j = i;

            sheet.forEach(row -> {
                if (row.getRowNum() <= j) {
                    return;
                }
                if (StringUtils.isEmpty(formatter.formatCellValue(row.getCell(j)))) {
                    log.warn("Empty area name at row {}", row.getRowNum());
                    return;
                }

                // grave row
                String areaName = formatter.formatCellValue(row.getCell(j));
                String rowName = formatter.formatCellValue(row.getCell(j + 1));
                GraveRow graveRow = getGraveRow(areaName, rowName);

                // martyr grave
                MartyrGrave martyrGrave;
                if (j == 0) {
                    String fullName = StringUtils.trimToEmpty(formatter.formatCellValue(row.getCell(3)));
                    String name = StringUtils.trimToEmpty(formatter.formatCellValue(row.getCell(4)));
                    if (StringUtils.isEmpty(name)) {
                        String[] split = fullName.split(" ");
                        name = split[split.length - 1];
                    }
                    String codeName = StringUtils.trimToEmpty(formatter.formatCellValue(row.getCell(5)));
                    martyrGrave = MartyrGrave.builder()
                            .graveRow(graveRow)
//                            .id((long) row.getCell(2).getNumericCellValue())
                            .fullName(fullName)
                            .name(name)
                            .codeName(codeName)
                            .yearOfBirth(formatter.formatCellValue(row.getCell(6)))
                            .dateOfEnlistment(formatter.formatCellValue(row.getCell(7)))
                            .dateOfDeath(formatter.formatCellValue(row.getCell(8)))
                            .rankPositionUnit(formatter.formatCellValue(row.getCell(9)))
                            .homeTown(formatter.formatCellValue(row.getCell(10)))
                            .placeOfExhumation(formatter.formatCellValue(row.getCell(11)))
                            .dieuChinh(formatter.formatCellValue(row.getCell(12)))
                            .quyTap(formatter.formatCellValue(row.getCell(13)))
                            .ngayThangNam(formatter.formatCellValue(row.getCell(14)))
                            .note(formatter.formatCellValue(row.getCell(15)))
                            .commune(formatter.formatCellValue(row.getCell(16)))
                            .district(formatter.formatCellValue(row.getCell(17)))
                            .build();
                } else {
                    martyrGrave = MartyrGrave.builder()
                            .graveRow(graveRow)
//                            .id((long) row.getCell(3).getNumericCellValue())
                            .fullName(formatter.formatCellValue(row.getCell(4)))
                            .yearOfBirth(formatter.formatCellValue(row.getCell(5)))
                            .dateOfEnlistment(formatter.formatCellValue(row.getCell(6)))
                            .dateOfDeath(formatter.formatCellValue(row.getCell(7)))
                            .rankPositionUnit(formatter.formatCellValue(row.getCell(8)))
                            .homeTown(formatter.formatCellValue(row.getCell(9)))
                            .build();
                }

                martyrGraves.add(martyrGrave);
            });
        }

        martyrRepository.saveAll(martyrGraves);
    }

    private GraveRow getGraveRow(String areaName, String rowName) {
        if (StringUtils.isNumeric(rowName)) {
            rowName = "Hàng " + rowName;
        }

        // remove multiple continuous spaces
        rowName = rowName.replaceAll("\\s+", " ");

        GraveRow graveRow = graveRowRepository.findByAreaNameAndRowName(areaName, rowName);
        if (graveRow == null) {
            graveRow = GraveRow.builder()
                    .id(nextGraveRowId++)
                    .areaName(areaName)
                    .rowName(rowName)
                    .build();
            graveRow = graveRowRepository.save(graveRow);
        }
        return graveRow;
    }
}
