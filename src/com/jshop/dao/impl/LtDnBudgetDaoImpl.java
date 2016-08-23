package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.LtDnBudgetDao;
import com.jshop.entity.LtDnBudget;
import com.jshop.entity.Pager;

@Repository
public class LtDnBudgetDaoImpl extends BaseDaoImpl<LtDnBudget, Integer>
		implements LtDnBudgetDao {

	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select * from Lt_DnBudget";
		String sqlCount = "select count(*) from Lt_DnBudget m ";
		String where = " where 1=1";
		if (searchProperties != null) {
			String name = searchProperties.get("name");
			String closed = searchProperties.get("closed");
			if (StringUtils.isNotEmpty(name)) {
				where += " and Name like '%" + name + "%'";
			}
			if (StringUtils.isNotEmpty(closed)) {
				where += " and closed = " + closed;
			}
		}
		if (StringUtils.isNotEmpty(where)) {
			sql += where;
		}
		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("ID");
			pager.setOrderDirection("asc");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		return getSession().createSQLQuery(sql).addEntity(LtDnBudget.class).list();
	}

	@Override
	public LtDnBudget getWebEntity(Integer id) {
		return get(id);
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");
			getSession().createSQLQuery("delete from Lt_DnBudget where id in(:ids)")
			.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtDnBudget entity) throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		}else{
			updateDynamic(entity);
		}
		return id;
	}
	
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LtDnBudget getShopEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtDnBudget entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
