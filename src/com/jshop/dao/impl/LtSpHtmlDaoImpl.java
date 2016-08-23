package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.LtSpHtmlDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.LtSpHtml;
import com.jshop.entity.Pager;

@Repository
public class LtSpHtmlDaoImpl extends BaseDaoImpl<LtSpHtml, Integer> implements
		LtSpHtmlDao {

	@Resource
	private OtSpPictureDao pictureDao;

	/******************************************** web部分 *************************************************/
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select m.* from Lt_SpHtml m";
		String sqlCount = "select count(*) from Lt_SpHtml m ";
		String where = " where 1=1 ";

		if (searchProperties != null) {
			if (where.length() > 0) {
				sql += where;
				sqlCount += where;
			}
		}

		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("ID");
			pager.setOrderDirection("desc");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));

		return getSession().createSQLQuery(sql).addEntity(LtSpHtml.class)
				.list();
	}

	@Override
	public LtSpHtml getWebEntity(Integer id) {
		LtSpHtml entity = get(id);
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery("delete from Lt_SpHtml where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtSpHtml entity) throws Exception {
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
	public LtSpHtml getShopEntity(Integer id) {
		return getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		deleteWebIds(ids);
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtSpHtml entity) throws Exception {
		return saveOrUpdateWebEntity(entity);
	}
	/******************************************** mobile部分 *************************************************/
}
