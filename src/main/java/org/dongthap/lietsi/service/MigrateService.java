package org.dongthap.lietsi.service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.dongthap.lietsi.entity.GraveRow;
import org.dongthap.lietsi.entity.MartyrGrave;
import org.dongthap.lietsi.repository.GraveRowRepository;
import org.dongthap.lietsi.repository.MartyrRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MigrateService {
    private static final Logger log = LoggerFactory.getLogger(MigrateService.class);
    private final MartyrRepository martyrRepository;
    private final GraveRowRepository graveRowRepository;

    private final DataFormatter formatter;

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
                    martyrGrave = MartyrGrave.builder()
                            .graveRow(graveRow)
                            .id((long) row.getCell(2).getNumericCellValue())
                            .fullName(formatter.formatCellValue(row.getCell(3)))
                            .name(formatter.formatCellValue(row.getCell(4)))
                            .codeName(formatter.formatCellValue(row.getCell(5)))
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
                            .id((long) row.getCell(3).getNumericCellValue())
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

        GraveRow graveRow = graveRowRepository.findByAreaNameAndRowName(areaName, rowName);
        if (graveRow == null) {
            graveRow = graveRowRepository.save(
                    GraveRow.builder()
                            .areaName(areaName)
                            .rowName(rowName)
                            .build()
            );
        }
        return graveRow;
    }
}
