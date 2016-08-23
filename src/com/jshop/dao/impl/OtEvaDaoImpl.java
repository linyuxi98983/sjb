package com.jshop.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.OtEvaDao;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.OtEva;
import com.jshop.entity.Pager;

@Repository
public class OtEvaDaoImpl extends BaseDaoImpl<OtEva, Integer> implements
		OtEvaDao {

	@Resource
	private BlDnDesignWorksDao worksDao;
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select g.* from Ot_Eva g ";
		String sqlCount = "select count(*) from Ot_Eva g ";
		String where = " where 1=1";
		if (searchProperties != null) {
			String nickname = searchProperties.get("nickname");
			if (StringUtils.isNotEmpty(nickname)) {
				where += " and g.nickname like '%" + nickname + "%'";
			}

		}
		if (StringUtils.isNotEmpty(where)) {
			sql += where;
		}
		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("ID");
			pager.setOrderDirection("asc");
		}
		List<Object[]> list = getSession().createSQLQuery(sql)
				.addEntity(OtEva.class).list();

		List<OtEva> evaList = new ArrayList<OtEva>(0);
		for (Object[] objects : list) {
			OtEva eva = (OtEva) objects[0];
			
			evaList.add(eva);
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		return evaList;
	}

	@Override
	public OtEva getShopEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub

	}

	@Override
	public Integer saveOrUpdateShopEntity(OtEva entity) throws Exception {

		Integer id = entity.getId();
		BlDnDesignWorks  works = worksDao.getShopEntity(entity.getObjectId());
		works.setEvaCount(works.getEvaCount()==null?0:works.getEvaCount());
		worksDao.saveOrUpdateShopEntity(works);
		if (id == null) {
			id = saveDynamic(entity);
		}else{
			updateDynamic(entity);
		}
		return id;
	}

	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select g.* ,lm.nickname as member from Ot_Eva g "+
		" left join Lt_SpMember lm on (g.lt_SpMemberID = lm.ID)";
		String sqlCount = "select count(*) from Ot_Eva g ";
		String where = " where 1=1";
		if (searchProperties != null) {
			String nickname = searchProperties.get("nickname");
			if (StringUtils.isNotEmpty(nickname)) {
				where += " and g.nickname like '%" + nickname + "%'";
			}

		}
		if (StringUtils.isNotEmpty(where)) {
			sql += where;
		}
		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("ID");
			pager.setOrderDirection("asc");
		}
		List<Object[]> list = getSession().createSQLQuery(sql)
		.addEntity(OtEva.class)
		.addScalar("member")
		.list();
		

		List<OtEva> evaList = new ArrayList<OtEva>(0);
		for (Object[] objects : list) {
			OtEva eva = (OtEva) objects[0];
			String member = (String)objects[1];
			eva.setMember(member);
			evaList.add(eva);
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		return evaList;
	}

	@Override
	public OtEva getWebEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteWebIds(String ids) {
		// TODO Auto-generated method stub

	}

	@Override
	public Integer saveOrUpdateWebEntity(OtEva entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
