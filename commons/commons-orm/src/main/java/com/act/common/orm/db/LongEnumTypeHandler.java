package com.act.common.orm.db;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.act.common.orm.type.LongEnum;

/**
 * ClassName: LongEnumTypeHandler <br/>
 * Function: 将实现了 {@link LongEnum} 接口的枚举进行类型转换，方便数据库long值与枚举值进行对应<br/>
 * Reason: <br/>
 * Date: 2016年9月21日 下午2:36:00 <br/>
 *
 * @author lyc
 * @see LongEnum
 * @version
 * @since JDK 1.7
 * @see
 */
public class LongEnumTypeHandler extends BaseTypeHandler<LongEnum> {

	private Class<LongEnum> type;
	private Map<Long, LongEnum> map;

	public LongEnumTypeHandler() {
		super();
	}

	public LongEnumTypeHandler(Class<LongEnum> type) {
		if (type == null) {
			throw new IllegalArgumentException("Type argument cannot be null");
		}
		this.type = type;
		LongEnum[] enums = type.getEnumConstants();
		if (enums == null) {
			throw new IllegalArgumentException(type.getSimpleName() + " does not represent an enum type.");
		}
		map = new ConcurrentHashMap<>();
		for (LongEnum e : enums) {
			map.put(e.getLongType(), e);
		}
	}

	private LongEnum getValuedEnum(long i) {

		try {
			return map.get(i);
		} catch (Exception ex) {
			throw new IllegalArgumentException("Cannot convert " + i + " to " + type.getSimpleName() + " by value.",
					ex);
		}
	}

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, LongEnum parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setLong(i, parameter.getLongType());
	}

	@Override
	public LongEnum getNullableResult(ResultSet rs, String columnName) throws SQLException {
		long i = rs.getLong(columnName);//当此列为null时i拿到的是默认值0，需要通过rs.wasNull()来判断是真的0还是null
		if (rs.wasNull()) {
			return null;
		} else {
			return getValuedEnum(i);
		}
	}

	@Override
	public LongEnum getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		long i = rs.getLong(columnIndex);
		if (rs.wasNull()) {
			return null;
		} else {
			return getValuedEnum(i);
		}
	}

	@Override
	public LongEnum getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		long i = cs.getLong(columnIndex);
		if (cs.wasNull()) {
			return null;
		} else {
			return getValuedEnum(i);
		}
	}
}
