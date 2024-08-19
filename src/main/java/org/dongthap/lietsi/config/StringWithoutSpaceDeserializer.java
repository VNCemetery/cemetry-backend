package org.dongthap.lietsi.config;

import java.io.IOException;
import java.io.Serial;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import org.apache.commons.lang3.StringUtils;

public class StringWithoutSpaceDeserializer extends StdDeserializer<String> {
    /**
     * 
     */
    @Serial
    private static final long serialVersionUID = -6972065572263950443L;

    protected StringWithoutSpaceDeserializer(Class<String> vc) {
        super(vc);
    }

    @Override
    public String deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        return p.getText() != null ? StringUtils.trimToNull(p.getText()) : null;
    }
}