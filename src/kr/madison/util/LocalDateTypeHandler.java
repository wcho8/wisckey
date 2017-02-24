package kr.madison.util;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;

import java.sql.*;

@MappedTypes(LocalDate.class)
public class LocalDateTypeHandler implements TypeHandler<LocalDate> {
	@Override
	public void setParameter(PreparedStatement ps, int i, LocalDate parameter, JdbcType jdbcType) throws SQLException {
		if (parameter != null) {
			ps.setDate(i, new Date(parameter.toDateTimeAtStartOfDay().toDate().getTime()));
		} else {
			ps.setDate(i, null);
		}
	}
	
	@Override
	public LocalDate getResult(ResultSet rs, String columnName) throws SQLException {
		Date date = rs.getDate(columnName);
		if (date != null) {
			return new LocalDate(date.getTime(), DateTimeZone.getDefault());
		} else {
			return null;
		}
	}
	
	@Override
	public LocalDate getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Date date = cs.getDate(columnIndex);
		if (date != null) {
			return new LocalDate(date.getTime(), DateTimeZone.getDefault());
		} else {
			return null;
		}
	}
	
	@Override
	public LocalDate getResult(ResultSet rs, int columnIndex) throws SQLException {
		Date date = rs.getDate(columnIndex);
		if (date != null) {
			return new LocalDate(date.getTime(), DateTimeZone.getDefault());
		} else {
			return null;
		}
	}
}
