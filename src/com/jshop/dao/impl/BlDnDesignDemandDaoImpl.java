package com.jshop.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.BlApplyDemandDao;
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.SysSpAreaDao;
import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.Pager;

@Repository
public class BlDnDesignDemandDaoImpl extends BaseDaoImpl<BlDnDesignDemand, Integer>
		implements BlDnDesignDemandDao {
	
	@Resource
	private SysSpAreaDao areaDao;
	@Resource
	private BlApplyDemandDao applyDemandDao;
	@Resource
	private LtSpMemberDao memberDao;
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		
		String sql = "select g.*,a.name as areaName from Bl_DnDesignDemand g " +
				"left join Sys_SpArea a on(a.id = g.Sys_SpAreaID) ";
		String sqlCount = "select count(*) from Bl_DnDesignDemand m ";
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
		sql = pager.toPagerSql(sql);
		List<Object[]> list = getSession().createSQLQuery(sql)
		.addEntity(BlDnDesignDemand.class)
		.addScalar("areaName")
		.list();
		
		List<BlDnDesignDemand> designList = new ArrayList<BlDnDesignDemand>(0);
		for (Object[] objects : list) {
			BlDnDesignDemand design = (BlDnDesignDemand)objects[0];
			String areaName = (String)objects[1];
			design.setAreaName(areaName);
			designList.add(design);
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		return designList;
	}

	@Override
	public BlDnDesignDemand getWebEntity(Integer id) {
		BlDnDesignDemand entity = get(id);
		// 获取地区
		if (entity.getSysSpAreaId() != null) {
			entity.setArea(areaDao.getWebEntity(entity.getSysSpAreaId()));
		}
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");
			getSession().createSQLQuery("delete from Bl_DnDesignDemand where id in(:ids)")
			.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(BlDnDesignDemand entity) throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			entity.setEffective(0);
			id = saveDynamic(entity);
			BlDnDesignDemand entity_new = getShopEntity(id);
			entity_new.setEffective(1);
			updateDynamic(entity_new);
		}else{
			entity.setEffective(0);
			updateDynamic(entity);
			
			BlDnDesignDemand entity_new = getShopEntity(id);
			entity_new.setEffective(1);
			entity_new.setEffective(1);
			updateDynamic(entity_new);
			
		}
		return id;
	}
	
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select g.*,a.name as areaName from Bl_DnDesignDemand g " +
				"left join Sys_SpArea a on(a.id = g.Sys_SpAreaID) ";
		String sqlCount = "select count(*) from Bl_DnDesignDemand g ";
		String where = " where 1=1 ";
		
		if (searchProperties != null) {
				String nickname = searchProperties.get("nickname");
				String memberId = searchProperties.get("memberId");
				String Lt_SpMemberID = searchProperties.get("Lt_SpMemberID");
				String DesignMemberId = searchProperties.get("DesignMemberId");
				if (StringUtils.isNotEmpty(DesignMemberId)) {
					where += " and g.DesignMemberID = " + DesignMemberId;
				}
				String state = searchProperties.get("state");
				if (StringUtils.isNotEmpty(nickname)) {
					where += " and g.nickname like '%" + nickname + "%'";
				}
				if (StringUtils.isNotEmpty(memberId)) {
					where += " and g.DesignMemberID =" + memberId;
				}
				if (StringUtils.isNotEmpty(Lt_SpMemberID)) {
					where += " and g.Lt_SpMemberID =" + Lt_SpMemberID;
				}
				if (StringUtils.isNotEmpty(state)) {
					if(Integer.parseInt(state) == 4){ //成交
						where += " and g.state in (2,3)";
					}else if(Integer.parseInt(state) == 2){
						where += "and g.state = 1 OR g.state = 2";
					}else{
						where += "and g.state = " + state;
					}
				}
		}
		if (StringUtils.isEmpty(pager.getOrderProperty())) {
				pager.setOrderProperty("ID");
				pager.setOrderDirection("asc");
		}
		sql += where;
		sql = pager.toPagerSql(sql);
		sqlCount += where;
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		
		List<Object[]> list = getSession().createSQLQuery(sql)
				.addEntity(BlDnDesignDemand.class)
				.addScalar("areaName")
				.list();
				
		List<BlDnDesignDemand> designList = new ArrayList<BlDnDesignDemand>(0);
		for (Object[] objects : list) {
			
			BlDnDesignDemand design = (BlDnDesignDemand)objects[0];
			if(StringUtils.isNotEmpty(searchProperties.get("memberId"))){
				BlApplyDemand applyDemand = applyDemandDao.findApplyDemandByDemandIdAndMemberId(design, memberDao.getShopEntity(Integer.parseInt(searchProperties.get("memberId"))));
				if(applyDemand != null){
					if(applyDemand.getState() != null){
						design.setStatus(applyDemand.getState());
					}
				}
			}
			String areaName = (String)objects[1];
			design.setAreaName(areaName);
			designList.add(design);
		}		
		return designList;	
	}

	@Override
	public BlDnDesignDemand getShopEntity(Integer id) {
		BlDnDesignDemand entity = get(id);
		return entity;
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateShopEntity(BlDnDesignDemand entity) throws Exception {
		Integer id = entity.getId();
		/*if(entity.getDesignMemberId() != null && entity.getState() == 1){
			BlApplyDemand appDemand = new BlApplyDemand();
			appDemand.setApplyTime(new Date());
			appDemand.setBl_DnDesignDemandID(entity.getId());
			appDemand.setLt_SpMemberID(entity.getDesignMemberId());
			appDemand.setState(0);
			
			applyDemandDao.save(appDemand);
		}*/
		if (id == null) {
			entity.setEffective(0);
			id = saveDynamic(entity);
			BlDnDesignDemand entity_new = getShopEntity(id);
			entity_new.setEffective(1);
			updateDynamic(entity_new);
		}else{
			entity.setEffective(0);
			updateDynamic(entity);
			
			BlDnDesignDemand entity_new = getShopEntity(id);
			entity_new.setEffective(1);
			entity_new.setEffective(1);
			updateDynamic(entity_new);
			
		}
		return id;
	}

	@Override
	public Integer saveDemandAndApply(BlDnDesignDemand entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
