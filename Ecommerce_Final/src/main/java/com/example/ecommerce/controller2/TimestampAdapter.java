package com.example.ecommerce.controller2;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimestampAdapter extends TypeAdapter<Timestamp> {
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Override
    public void write(JsonWriter out, Timestamp value) throws IOException {
        if (value == null) {
            out.nullValue();
        } else {
            out.value(value.toLocalDateTime().format(formatter));
        }
    }

    @Override
    public Timestamp read(JsonReader in) throws IOException {
        String str = in.nextString();
        LocalDateTime ldt = LocalDateTime.parse(str, formatter);
        return Timestamp.valueOf(ldt);
    }
}
