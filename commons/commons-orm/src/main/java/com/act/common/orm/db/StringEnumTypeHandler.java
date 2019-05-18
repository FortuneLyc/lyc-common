package com.act.common.orm.db;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.act.common.orm.type.StringEnum;

/**
 * ClassName: StringEnumTypeHandler <br/>
 * Function: 将实现了 {@link StringEnum} 接口的枚举进行类型转换，方便数据库String值与枚举值进行对应<br/>
 * Reason: <br/>
 * Date: 2016年9月21日 下午2:36:00 <br/>
 *
 * @author lyc
 * @see StringEnum
 * @version
 * @since JDK 1.7
 * @see
 */
public class StringEnumTypeHandler extends BaseTypeHandler<StringEnum> {

	private Class<StringEnum> type;
	private Map<String, StringEnum> map;

	public StringEnumTypeHandler() {
		super();
	}

	public StringEnumTypeHandler(Class<StringEnum> type) {
		if (type == null) {
			throw new IllegalArgumentException("Type argument cannot be null");
		}
		this.type = type;
		StringEnum[] enums = type.getEnumConstants();
		if (enums == null) {
			throw new IllegalArgumentException(type.getSimpleName() + " does not represent an enum type.");
		}
		map = new ConcurrentHashMap<>();
		for (StringEnum e : enums) {
			map.put(e.getStringType(), e);
		}
	}

	private StringEnum getValuedEnum(String i) {

		try {
			if (StringUtils.isBlank(i)) {
				return null;
			}
			return map.get(i);
		} catch (Exception ex) {
			throw new IllegalArgumentException("Cannot convert " + i + " to " + type.getSimpleName() + " by value.",
					ex);
		}
	}

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, StringEnum parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, parameter.getStringType());
	}

	@Override
	public StringEnum getNullableResult(ResultSet rs, String columnName) throws SQLException {
		String i = rs.getString(columnName);//当此列为null时i拿到的是默认值0，需要通过rs.wasNull()来判断是真的0还是null
		return getValuedEnum(i);
	}

	@Override
	public StringEnum getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		String i = rs.getString(columnIndex);
		return getValuedEnum(i);
	}

	@Override
	public StringEnum getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String i = cs.getString(columnIndex);
		return getValuedEnum(i);
	}
}
