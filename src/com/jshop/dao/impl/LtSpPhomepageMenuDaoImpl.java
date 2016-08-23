package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.LtSpPhomepageMenuDao;
import com.jshop.entity.LtSpPhomepageMenu;
import com.jshop.entity.Pager;

@Repository
public class LtSpPhomepageMenuDaoImpl extends
		BaseDaoImpl<LtSpPhomepageMenu, Integer> implements LtSpPhomepageMenuDao {

	/******************************************** web部分 *************************************************/
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select m.* from Lt_SpPhomepageMenu m";
		String sqlCount = "select count(*) from Lt_SpPhomepageMenu m ";
		String where = " where 1=1 ";

		if (searchProperties != null) {
			String name = searchProperties.get("name");
			String closed = searchProperties.get("closed");
			if (StringUtils.isNotEmpty(name)) {
				where += " and m.name like '%" + name + "%'";
			}
			if (StringUtils.isNotEmpty(closed)) {

			}
			if (where.length() > 0) {
				sql += where;
				sqlCount += where;
			}
		}

		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("OrderNo");
			pager.setOrderDirection("asc");
		}
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));

		return getSession().createSQLQuery(sql)
				.addEntity(LtSpPhomepageMenu.class).list();
	}

	@Override
	public LtSpPhomepageMenu getWebEntity(Integer id) {
		LtSpPhomepageMenu entity = get(id);
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery(
							"delete from Lt_SpPhomepageMenu where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtSpPhomepageMenu entity)
			throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		} else {
			updateDynamic(entity);
		}
		return id;
	}

	/******************************************** web部分 *************************************************/

	/******************************************** mobile部分 *************************************************/
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		return getWebList(pager, searchProperties);
	}

	@Override
	public LtSpPhomepageMenu getShopEntity(Integer id) {
		return getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		deleteWebIds(ids);
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtSpPhomepageMenu entity)
			throws Exception {
		return saveOrUpdateWebEntity(entity);
	}
	/******************************************** mobile部分 *************************************************/
}
