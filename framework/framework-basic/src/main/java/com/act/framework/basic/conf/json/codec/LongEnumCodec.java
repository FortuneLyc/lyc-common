
package com.act.framework.basic.conf.json.codec;

import java.io.IOException;
import java.lang.reflect.Type;

import com.act.common.orm.type.EnumUtils;
import com.act.common.orm.type.LongEnum;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.JSONToken;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.ObjectSerializer;
import com.alibaba.fastjson.serializer.SerializeWriter;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * ClassName: LongEnumCodec <br/>
 * Function: <br/>
 * Reason: <br/>
 * Date: 2016年11月1日 上午10:09:45 <br/>
 *
 * @author lyc
 * @version
 * @since JDK 1.7
 * @see
 */
public class LongEnumCodec implements ObjectSerializer, ObjectDeserializer {

	public static final LongEnumCodec instance = new LongEnumCodec();

	@Override
	public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features)
			throws IOException {
		SerializeWriter out = serializer.out;
		LongEnum value = (LongEnum) object;
		if (value == null) {
			out.writeNull(SerializerFeature.WriteNullStringAsEmpty);
			return;
		}

		out.writeString(value.getLongType()+"");
	}

	@Override
	@SuppressWarnings("unchecked")
	public <T> T deserialze(DefaultJSONParser parser, Type clazz, Object fieldName) {
		try {
            Object value;
            final JSONLexer lexer = parser.lexer;
            final int token = lexer.token();
            if (token == JSONToken.LITERAL_INT) {
                long intValue = lexer.longValue();
                lexer.nextToken(JSONToken.COMMA);

                return (T) EnumUtils.getEnumFromLongType((Class<LongEnum>)clazz, intValue);
            } else if (token == JSONToken.LITERAL_STRING) {
                String strVal = lexer.stringVal();
                lexer.nextToken(JSONToken.COMMA);

                if (strVal.length() == 0) {
                    return (T) null;
                }

                return (T) EnumUtils.getEnumFromLongType((Class<LongEnum>)clazz, Long.valueOf(strVal));
            } else if (token == JSONToken.NULL) {
                value = null;
                lexer.nextToken(JSONToken.COMMA);

                return null;
            } else {
                value = parser.parse();
            }

            throw new JSONException("parse enum " + clazz.getTypeName()+ " error, value : " + value);
        } catch (JSONException e) {
            throw e;
        } catch (Exception e) {
            throw new JSONException(e.getMessage(), e);
        }
	}

	@Override
	public int getFastMatchToken() {
		return JSONToken.LITERAL_INT;
	}
}
