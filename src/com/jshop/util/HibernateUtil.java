package com.jshop.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import org.apache.commons.lang.StringUtils;

import com.jshop.annotation.Pk;

/**
 * Hibernate工具类
 * 
 * @author Jackyshen
 * 
 */
public class HibernateUtil {

	/**
	 * 通过hibernate注解获取实体的ID
	 * 
	 * @param entity
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Object[] getId(Object entity) {
		Object ID = null;
		String name = null;
		Class c = null;
		if (entity != null) {
			c = entity.getClass().getSuperclass();
			if (c == null)
				c = entity.getClass();
			Method[] methods = c.getDeclaredMethods();
			try {
				for (Method method : methods) {
					if (method.isAnnotationPresent(Column.class)) {
						if (method.isAnnotationPresent(Id.class)) {
							Column column = method.getAnnotation(Column.class);
							Object value = method.invoke(entity, null);
							name = column.name();
							ID = value;
						}
					}
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		if (ID != null && name != null) {
			return new Object[] { name, ID };
		}
		return null;
	}

	/**
	 * 通过Hibernate注解获取表名
	 * 
	 * @param entity
	 * @return
	 */
	public static String getTableName(Object entity) {
		String tableName = null;
		if (entity != null) {
			if (entity.getClass().isAnnotationPresent(Table.class)) {
				Table table = entity.getClass().getAnnotation(Table.class);
				tableName = table.name();
			} else {
				tableName = entity.getClass().getName();
			}
		}
		return tableName;
	}

	/**
	 * 根据注解获取实体中值<>NULL的字段集合
	 * 
	 * @param entity
	 * @return
	 */
	public static Map<String, Object> getColumns(Object entity) {
		Map<String, Object> map = null;
		if (entity != null) {
			map = new HashMap<String, Object>();
			Method[] methods = entity.getClass().getDeclaredMethods();
			try {
				for (Method method : methods) {
					String name = null;
					if (method.isAnnotationPresent(Id.class)) {

					} else if (method.isAnnotationPresent(JoinColumn.class)) {
						JoinColumn joinColumn = method
								.getAnnotation(JoinColumn.class);
						name = joinColumn.name();
					} else if (method.isAnnotationPresent(Column.class)) {
						Column column = method.getAnnotation(Column.class);
						name = column.name();
					}
					if (StringUtils.isNotEmpty(name)) {
						Object value = method.invoke(entity, null);
						if (value != null) {
							map.put(name, value);
						}
					}
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	/**
	 * 通过注解获取从表集合
	 * 
	 * @param entity
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List getPks(Object entity) {
		List list = null;
		if (entity != null) {
			list = new ArrayList();
			Method[] methods = entity.getClass().getDeclaredMethods();
			try {
				for (Method method : methods) {
					if (method.isAnnotationPresent(Pk.class)) {
						Object value = method.invoke(entity, null);
						list.add(value);
					}
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public static Object getDataType(Object entity) throws SecurityException,
			NoSuchMethodException {
		Object dataType = entity.getClass().getDeclaredMethod("getDataType",
				null);
		return dataType;
	}

	/**
	 * 为字段field保留round位小数
	 * 
	 * @param field
	 * @param round
	 */
	public static String getFieldRoundSql(String field, Integer round) {
		return "Convert(decimal(18," + round + ")," + field + ")";
	}

	/**
	 * 为字段field保留2位小数
	 * 
	 * @param field
	 */
	public static String getFieldRoundSql(String field) {
		return getFieldRoundSql(field, 2);
	}

	/**
	 * 获取图册第一张图片
	 * 
	 * @param picTableName
	 * @param joinField
	 * @return
	 */
	public static String getFirstPicFileNameSql(String picTableName,
			String joinField) {
		return getFirstPicFileNameSql(picTableName, joinField, "g");
	}

	public static String getFirstPicFileNameSql(String picTableName,
			String joinField, String asName) {
		return "(select top 1 p.picFileName from Ot_SpPicture p inner join "
				+ picTableName + " sp on p.ID = sp.Ot_SpPictureID where sp."
				+ joinField + " = " + asName + ".ID order by sp.OrderNo) ";
	}
}
