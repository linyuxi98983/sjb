package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.LtDepartmentDao;
import com.jshop.entity.LtDepartment;
import com.jshop.entity.Pager;

@Repository
public class LtDepartmentDaoImpl extends BaseDaoImpl<LtDepartment, Integer>
		implements LtDepartmentDao {




	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select * from Lt_Department";
		String where = " where 1=1";
		if (searchProperties != null) {
			String name = searchProperties.get("name");
			String closed = searchProperties.get("closed");
			if (StringUtils.isNotEmpty(name)) {
				where += " and Name = " + name;
			}
			if (StringUtils.isNotEmpty(closed)) {
				where += " and closed = " + closed;
			}
		}
		if (StringUtils.isNotEmpty(where)) {
			sql += where;
		}
		//sql += " order by orderNo";
		return getSession().createSQLQuery(sql).addEntity(LtDepartment.class).list();
	}

	@Override
	public LtDepartment getWebEntity(Integer id) {
		return get(id);
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");
			getSession().createSQLQuery("delete from Lt_Department where id in(:ids)")
			.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtDepartment entity) throws Exception {
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
	public LtDepartment getShopEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtDepartment entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
