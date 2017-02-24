package kr.madison.util;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDateTime;

@MappedTypes(LocalDateTime.class)
public class LocalDateTimeTypeHandler implements TypeHandler<LocalDateTime> {
	@Override
	public void setParameter(PreparedStatement ps, int i, LocalDateTime parameter, JdbcType jdbcType) throws SQLException {
		if (parameter != null) {
			ps.setTimestamp(i, new Timestamp(parameter.toDateTime(DateTimeZone.getDefault()).getMillis()));
		} else {
			ps.setTimestamp(i, null);
		}
	}
	@Override

	public LocalDateTime getResult(ResultSet rs, String columnLabel) throws SQLException {
		Timestamp ts = rs.getTimestamp(columnLabel);
		if (ts != null) {
			return new LocalDateTime(ts.getTime(), DateTimeZone.getDefault());
		} else {
			return null;
		}
	}
	
	@Override
	public LocalDateTime getResult(CallableStatement cs, int columnIndex) throws SQLException {
		Timestamp ts = cs.getTimestamp(columnIndex);
		if (ts != null) {
			return new LocalDateTime(ts.getTime(), DateTimeZone.getDefault());
		} else {
			return null;
		}
	}
	
	@Override
	public LocalDateTime getResult(ResultSet rs, int columnIndex) throws SQLException {
		Timestamp ts = rs.getTimestamp(columnIndex);
		if (ts != null) {
			return new LocalDateTime(ts.getTime(), DateTimeZone.getDefault());
		} else {
			return null;
		}
	}
}
