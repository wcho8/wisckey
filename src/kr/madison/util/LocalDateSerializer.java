package kr.madison.util;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.SerializerProvider;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class LocalDateSerializer extends org.codehaus.jackson.map.JsonSerializer<LocalDate> {
	private static DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd");
	@Override
	public void serialize(LocalDate value, JsonGenerator generator, SerializerProvider provider) throws IOException, JsonProcessingException {
		generator.writeString(formatter.print(value));
	}
}
