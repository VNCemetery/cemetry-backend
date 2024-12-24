package org.dongthap.lietsi.util;

import lombok.experimental.UtilityClass;

import java.util.UUID;

@UtilityClass
public class CommonUtils {
    public static boolean isNewRecord(Long id) {
        return id == null || id <= 0;
    }

    public static boolean isNewRecord(UUID id) {
        return id == null;
    }
}
