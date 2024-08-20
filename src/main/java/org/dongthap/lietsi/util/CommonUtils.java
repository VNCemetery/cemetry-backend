package org.dongthap.lietsi.util;

import lombok.experimental.UtilityClass;

@UtilityClass
public class CommonUtils {
    public static boolean isNewRecord(Long id) {
        return id == null || id <= 0;
    }
}
