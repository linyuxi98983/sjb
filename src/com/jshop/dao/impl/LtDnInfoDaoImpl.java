package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.LtDnBudgetDao;
import com.jshop.dao.LtDnInfoDao;
import com.jshop.entity.LtDnBudget;
import com.jshop.entity.LtDnInfo;
import com.jshop.entity.Pager;

@Repository
public class LtDnInfoDaoImpl extends BaseDaoImpl<LtDnInfo, Integer>
		implements LtDnInfoDao {

	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select * from Lt_DnInfo";
		String sqlCount = "select count(*) from Lt_DnInfo ";
		String where = " where 1=1";
		if (searchProperties != null) {
			String name = searchProperties.get("title");
			
			if (StringUtils.isNotEmpty(name)) {
				where += " and title like '%" + name + "%'";
			}
			
		}
		if (StringUtils.isNotEmpty(where)) {
			sql += where;
		}
		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("orderNo");
			pager.setOrderDirection("asc");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		return getSession().createSQLQuery(sql).addEntity(LtDnInfo.class).list();
	}

	@Override
	public LtDnInfo getWebEntity(Integer id) {
		return get(id);
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");
			getSession().createSQLQuery("delete from Lt_DnInfo where id in(:ids)")
			.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtDnInfo entity) throws Exception {
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
		return this.getWebList(pager, searchProperties);
	}

	@Override
	public LtDnInfo getShopEntity(Integer id) {
		// TODO Auto-generated method stub
		return this.getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtDnInfo entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
