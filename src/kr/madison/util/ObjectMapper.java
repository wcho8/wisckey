package kr.madison.util;

import org.codehaus.jackson.Version;
import org.codehaus.jackson.map.module.SimpleModule;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.stereotype.Component;

@Component
public class ObjectMapper extends org.codehaus.jackson.map.ObjectMapper {
    public ObjectMapper() {
	SimpleModule module = new SimpleModule("JodaSerializer", new Version(1, 0, 0, "SNAPSHOT"))
		.addSerializer(LocalDate.class, new LocalDateSerializer())
		.addSerializer(LocalDateTime.class, new LocalDateTimeSerializer());
	
	this.registerModule(module);
    }
}
