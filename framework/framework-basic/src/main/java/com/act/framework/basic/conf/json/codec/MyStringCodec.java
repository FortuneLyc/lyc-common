
package com.act.framework.basic.conf.json.codec;

import java.lang.reflect.Type;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.SerializeWriter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.StringCodec;

/**
 * ClassName: MyStringCodec <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年11月1日 上午10:09:45 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class MyStringCodec extends StringCodec {
	@SuppressWarnings("hiding")
	public static final MyStringCodec instance = new MyStringCodec();
    @Override
	public void write(JSONSerializer serializer, String value) {
        SerializeWriter out = serializer.out;
        if (StringUtils.isBlank(value)) {
            out.writeNull(SerializerFeature.WriteNullStringAsEmpty);
            return;
        }
        out.writeString(value);
    }

    @Override
	public <T> T deserialze(DefaultJSONParser parser, Type clazz, Object fieldName) {
        T t = super.deserialze(parser, clazz, fieldName);
        if (t instanceof CharSequence && StringUtils.isEmpty((CharSequence) t)) {
			return null;
		}else{
			return t;
		}
    }
}

