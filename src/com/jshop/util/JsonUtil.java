package com.jshop.util;

import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

/**
 * json工具类
 * 
 * @author Jacky Shen
 * 
 */
public class JsonUtil {

	/**
	 * 设置过滤（防止死循环）
	 * 
	 * @param filternames
	 * @return
	 */
	public static JsonConfig getJsonPropertyFilter(final String[] filternames) {
		JsonConfig cfg = new JsonConfig();
		cfg.setJsonPropertyFilter(new PropertyFilter() {
			@Override
			public boolean apply(Object source, String name, Object value) {
				for (String filtername : filternames) {
					if (filtername.equals(name)) {
						return true;
					}
				}
				return false;
			}
		});
		return cfg;
	}
}
