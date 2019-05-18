
package com.act.common.spring.redis;

import java.lang.reflect.Type;

import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.PropertyFilter;
import com.alibaba.fastjson.serializer.SerializeConfig;

/**
 * ClassName: JsonRedisSerializer <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月19日 下午1:35:09 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class JsonRedisSerializer<T> implements RedisSerializer<T> {
	private final byte[] NONE = new byte[0];
	private final Type type;
	private final SerializeConfig serializeConfig;
	private final String[] skip;
	private final PropertyFilter filter = new PropertyFilter() {
		@Override
		public boolean apply(Object object, String name, Object value) {
			if (value == null) {
				return false;
			}
			for (String s : skip) {
				if (s.equals(name)) {
					return false;
				}
			}
			return true;
		}
	};

	public JsonRedisSerializer(Class<T> type,String... skip) {
		this.type = type;
		this.skip = skip;
		this.serializeConfig = new SerializeConfig();

		serializeConfig.addFilter(type, filter);
	}
	@Override
	public byte[] serialize(T t) throws SerializationException {
		if (t == null) {
			return NONE;
		}
		return JSON.toJSONBytes(t, serializeConfig);
	}
	@Override
	public T deserialize(byte[] bytes) throws SerializationException {
		if (bytes == null || bytes.length==0) {
			return null;
		}
		return JSON.parseObject(bytes, this.getType());
	}
	public Type getType() {
		return type;
	}
}

