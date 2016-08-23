package com.jshop.util;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

/**
 * 反射工具类
 * 
 * @author Jackyshen
 * 
 */
public class ReflectUtil {

	/**
	 * 将实体类对象中的非空属性转换为map类型
	 * 
	 * @param entity
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map entity2Map(Object entity) {

		Map map = null;
		Map fieldMap = null;
		try {
			map = BeanUtils.describe(entity);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}

		if (map != null) {
			String classType = "class";
			fieldMap = new HashMap();
			Iterator it = map.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry entry = (Map.Entry) it.next();
				String key = entry.getKey().toString();
				Object value = entry.getValue();
				if (!classType.equals(key) && value != null) {
					fieldMap.put(key, value);
				}
			}
		}
		return fieldMap;
	}
}
