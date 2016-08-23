package com.jshop.dao.impl;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import com.jshop.common.EntityInterceptor;
import com.jshop.common.SmsClient;
import com.jshop.dao.BaseDao;
import com.jshop.entity.Pager;
import com.jshop.util.HibernateUtil;
import com.jshop.util.StringUtil;
import com.opensymphony.xwork2.ActionContext;

@Repository
public class BaseDaoImpl<T, PK extends Serializable> implements BaseDao<T, PK> {

	protected static Log logger = LogFactory.getLog(BaseDaoImpl.class);
	private Class<T> entityClass;
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		this.entityClass = null;
		Class c = getClass();
		Type type = c.getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type[] parameterizedType = ((ParameterizedType) type)
					.getActualTypeArguments();
			this.entityClass = (Class<T>) parameterizedType[0];
		}
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Object getSession(String name) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		return session.get(name);
	}

	// 设置Session
	public void setSession(String name, Object value) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.put(name, value);
	}

	// 删除Session
	public void deleteSession(String name) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.remove(name);
	}

	@Override
	@SuppressWarnings("unchecked")
	public T get(PK id) {
		Assert.notNull(id, "id is required");
		return (T) getSession().get(entityClass, id);
	}

	@Override
	@SuppressWarnings("unchecked")
	public T load(PK id) {
		Assert.notNull(id, "id is required");
		return (T) getSession().load(entityClass, id);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> get(PK[] ids) {
		Assert.notEmpty(ids, "ids must not be empty");
		String hql = "from " + entityClass.getName()
				+ " as model where model.id in(:ids)";
		return getSession().createQuery(hql).setParameterList("ids", ids)
				.list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public T get(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(value, "value is required");
		String hql = "from " + entityClass.getName() + " as model where model."
				+ propertyName + " = ?";
		return (T) getSession().createQuery(hql).setParameter(0, value)
				.uniqueResult();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> getList(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(value, "value is required");
		String hql = "from " + entityClass.getName() + " as model where model."
				+ propertyName + " = ?";
		return getSession().createQuery(hql).setParameter(0, value).list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		String hql = "from " + entityClass.getName();
		return getSession().createQuery(hql).list();
	}

	@Override
	public Long getTotalCount() {
		String hql = "select count(*) from " + entityClass.getName();
		return (Long) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public Object getPropertyValue(PK id, String propertyName) {
		String hql = "select model." + propertyName + " from "
				+ entityClass.getName() + " as model where id = ?";
		return getSession().createQuery(hql).setParameter(0, id).uniqueResult();
	}

	@Override
	public boolean isUnique(String propertyName, Object oldValue,
			Object newValue) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(newValue, "newValue is required");
		if (newValue == oldValue || newValue.equals(oldValue)) {
			return true;
		}
		if (newValue instanceof String) {
			if (oldValue != null
					&& StringUtils.equalsIgnoreCase((String) oldValue,
							(String) newValue)) {
				return true;
			}
		}
		T object = get(propertyName, newValue);
		return (object == null);
	}

	@Override
	public boolean isExist(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(value, "value is required");
		T object = get(propertyName, value);
		return (object != null);
	}

	@Override
	@SuppressWarnings("unchecked")
	public PK save(T entity) {
		Assert.notNull(entity, "entity is required");
		return (PK) getSession().save(entity);
	}

	@Override
	public void update(T entity) {
		Assert.notNull(entity, "entity is required");
		getSession().update(entity);
	}

	@Override
	public void delete(T entity) {
		Assert.notNull(entity, "entity is required");
		getSession().delete(entity);
	}

	@Override
	public void delete(PK id) {
		Assert.notNull(id, "id is required");
		T entity = load(id);
		getSession().delete(entity);
	}

	@Override
	public void delete(PK[] ids) {
		Assert.notEmpty(ids, "ids must not be empty");
		for (PK id : ids) {
			T entity = load(id);
			getSession().delete(entity);
		}
	}

	@Override
	public void flush() {
		getSession().flush();
	}

	@Override
	public void clear() {
		getSession().clear();
	}

	@Override
	public void evict(Object object) {
		Assert.notNull(object, "object is required");
		getSession().evict(object);
	}

	@Override
	@SuppressWarnings("unchecked")
	public PK saveDynamic(T entity) throws Exception {
		// ------------处理ID自增------------------ //
		/*
		 * PK id = getNextID(entity);
		 * entity.getClass().getMethod("setId",id.getClass()).invoke(entity,id);
		 */
		// ------------处理ID自增------------------ //
		List parameters = null;
		String fieldSql = "";
		String valueSql = "";
		if (entity != null) {
			String tableName = HibernateUtil.getTableName(entity);
			parameters = new ArrayList<Object>();
			Map<String, Object> columns = HibernateUtil.getColumns(entity);
			for (Map.Entry<String, Object> entry : columns.entrySet()) {
				if (!EntityInterceptor.MODIFY_DATE.equals(entry.getKey())) {
					fieldSql += entry.getKey() + ",";
					valueSql += "?,";
					parameters.add(entry.getValue());
				}
			}
			if (StringUtils.isNotEmpty(fieldSql)) {
				fieldSql = StringUtil.subEnd(fieldSql, ",");
				valueSql = StringUtil.subEnd(valueSql, ",");
				String sql = MessageFormat.format(
						"insert into {0}({1}) values({2})", tableName,
						fieldSql, valueSql);
				Session session = getSession();
				SQLQuery query = session.createSQLQuery(sql);
				for (int i = 0; i < parameters.size(); i++) {
					query.setParameter(i, parameters.get(i));
				}
				query.executeUpdate();
			}
		}
		return getLastInsertID(entity);
	}

	@Override
	@SuppressWarnings("unchecked")
	public void updateDynamic(T entity) throws Exception {
		List parameters = null;
		String fieldSql = "";
		if (entity != null) {
			String tableName = HibernateUtil.getTableName(entity);
			Integer id = (Integer) entity.getClass().getMethod("getId")
					.invoke(entity);
			parameters = new ArrayList<Object>();
			Map<String, Object> columns = HibernateUtil.getColumns(entity);
			for (Map.Entry<String, Object> entry : columns.entrySet()) {
				if (!EntityInterceptor.CREATE_DATE.equals(entry.getKey())) {
					fieldSql += entry.getKey() + "=?,";
					parameters.add(entry.getValue());
				}
			}
			if (StringUtils.isNotEmpty(fieldSql)) {
				fieldSql = StringUtil.subEnd(fieldSql, ",");
				String sql = MessageFormat.format(
						"update {0} set {1} where {2}=?", tableName, fieldSql,
						"id");
				Session session = getSession();
				SQLQuery query = session.createSQLQuery(sql);
				parameters.add(id);
				for (int i = 0; i < parameters.size(); i++) {
					query.setParameter(i, parameters.get(i));
				}
				query.executeUpdate();
			}
		}
	}

	public PK getLastInsertID(T entity) {
		return (PK) getSession().createSQLQuery(
				"SELECT MAX(ID) FROM " + HibernateUtil.getTableName(entity))
				.uniqueResult();
	}

	public PK getNextID(T entity) {
		return (PK) getSession().createSQLQuery(
				"SELECT MAX(ISNULL(ID,0)) + 1 FROM "
						+ HibernateUtil.getTableName(entity)).uniqueResult();
	}

	public Map<String, String> prepareSearchProperties(Pager pager,
			Map<String, String> searchProperties) {
		String classname = "web" + this.getClass().getName();
		if (getSession(classname + "save") == "true") {
			deleteSession(classname + "save");
			searchProperties = (Map<String, String>) getSession(classname
					+ "searchproperties");
			pager.setPageNumber((Integer) getSession(classname + "pagenumber"));
		}
		return searchProperties;
	}

	public void cacheSearchProperties(Pager pager,
			Map<String, String> searchProperties) {
		String classname = "web" + this.getClass().getName();
		setSession(classname + "searchproperties", searchProperties);
		setSession(classname + "pagenumber", pager.getPageNumber());

	}

	public void saveCacheSession() {
		// setSession("web" + this.getClass().getName() + "save", "true");
	}

	public void setSourceTypeSession(Integer sourceType) {
		setSession("sourceType", sourceType.toString());
	}

	public Integer getSourceTypeSession() {
		if (getSession("sourceType") != null)
			return Integer.valueOf((String) getSession("sourceType"));
		else
			return 0;
	}

	public Integer SendSMS(String PhoneNo, String Text) {
		try {
			SmsClient.sendSmsByUrl(PhoneNo, Text);
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}// 悦信的短信平台
		return 0;
		// return SmsClient.getClient().sendSMS(new String[] {PhoneNo}, Text, ""
		// ,5);
	}

}
