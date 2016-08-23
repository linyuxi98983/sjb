package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.BlApplyDemandDao;
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.Pager;

@Repository
public class BlApplyDemandDaoImpl extends BaseDaoImpl<BlApplyDemand, Integer> implements BlApplyDemandDao {

	@Resource
	private BlDnDesignDemandDao demandDao;
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select m.* from Bl_DnApplyDemand m left join Bl_DnDesignDemand d on(d.id = m.Bl_DnDesignDemandID) ";
		String sqlCount = "select count(*) from Bl_DnApplyDemand m left join Bl_DnDesignDemand d on(d.id = m.Bl_DnDesignDemandID) ";
		String where = " where 1=1 and d.state = 3 ";
		if (searchProperties != null) {
			String Lt_SpMemberID = searchProperties.get("Lt_SpMemberID");
			String Bl_DnDesignDemandID = searchProperties.get("Bl_DnDesignDemandID");
			String state = searchProperties.get("state");
			String effective = searchProperties.get("effective");
			if (StringUtils.isNotEmpty(Lt_SpMemberID)) {
				where += " and m.Lt_SpMemberID =" + Lt_SpMemberID;
			}
			if (StringUtils.isNotEmpty(Bl_DnDesignDemandID)) {
				where += " and d.Bl_DnDesignDemandID = " + Bl_DnDesignDemandID;
			}
			
			if (StringUtils.isNotEmpty(state)) {
				where += " and d.state = " + state;
			}
			
			if (StringUtils.isNotEmpty(effective)) {
				where += " and d.effective = " + effective;
			}
		}
		if (StringUtils.isNotEmpty(where)) {
			sql += where;
			sqlCount += where;
		}
		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("m.ApplyTime");
			pager.setOrderDirection("DESC");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		List<BlApplyDemand> applyDemands = getSession().createSQLQuery(sql).addEntity(BlApplyDemand.class).list();
		for(BlApplyDemand applyDemand : applyDemands){		
			applyDemand.setDesignDemand(demandDao.getShopEntity(applyDemand.getBl_DnDesignDemandID()));
		}
		return applyDemands;
	}

	@Override
	public BlApplyDemand getShopEntity(Integer id) {
		BlApplyDemand entity = get(id);		
		
		entity.setDesignDemand(demandDao.get(entity.getBl_DnDesignDemandID()));;
		return entity;
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateShopEntity(BlApplyDemand entity)
			throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
			
			BlDnDesignDemand demand = demandDao.getShopEntity(entity.getBl_DnDesignDemandID());
			demand.setState(3);
			demand.setEffective(0);
			demandDao.saveOrUpdateShopEntity(demand);
			
			BlDnDesignDemand demand_new = demandDao.getShopEntity(entity.getBl_DnDesignDemandID());
			demand_new.setEffective(1);
			demandDao.saveOrUpdateShopEntity(demand_new);
		}else{
			updateDynamic(entity);
		}
		return id;
	}

	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BlApplyDemand getWebEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteWebIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateWebEntity(BlApplyDemand entity) throws Exception {
		
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		}else{
			updateDynamic(entity);
		}
		return id;
	}

	@Override
	public BlApplyDemand findApplyDemandByDemandIdAndMemberId(
			BlDnDesignDemand entity,LtSpMember member) {

		String sql = "select * from Bl_DnApplyDemand where Bl_DnDesignDemandID="+entity.getId() +" and Lt_SpMemberID="+member.getId();
		
		return (BlApplyDemand) getSession().createSQLQuery(sql).addEntity(BlApplyDemand.class).uniqueResult();	
	}

	/**
	 * 
	 */
	@Override
	public Integer agreeOrRefuse(BlApplyDemand applyDemand) throws Exception {
		/*String sql = "select * from Bl_DnApplyDemand where Bl_DnDesignDemandID="+applyDemand.getBl_DnDesignDemandID() +" and Lt_SpMemberID <>"+applyDemand.getLt_SpMemberID();
		
		List<BlApplyDemand> list = getSession().createSQLQuery(sql).addEntity(BlApplyDemand.class).list();	*/	
		switch (applyDemand.getState()) {
		case 1://同意			
			BlDnDesignDemand demand = demandDao.get(applyDemand.getBl_DnDesignDemandID());
			demand.setState(4);
			demand.setEffective(0);
			demandDao.saveOrUpdateShopEntity(demand);		
			getSession().createSQLQuery("update Bl_DnApplyDemand set state = 2 where Bl_DnDesignDemandID=" + applyDemand.getBl_DnDesignDemandID() + " and Lt_SpMemberID <>" + applyDemand.getLt_SpMemberID()).executeUpdate();
			
			break;
		case 4://拒绝
			
			break;

		default:
			break;
		}
		return saveOrUpdateWebEntity(applyDemand);
	}


}
