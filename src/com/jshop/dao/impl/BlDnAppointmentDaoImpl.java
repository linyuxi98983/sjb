package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.BlDnAppointmentDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.entity.BlDnAppointment;
import com.jshop.entity.Pager;

@Repository
public class BlDnAppointmentDaoImpl extends BaseDaoImpl<BlDnAppointment, Integer>
		implements BlDnAppointmentDao {

	@Resource
	private LtSpMemberDao memberDao;
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select g.* from Bl_DnAppointment g ";
		String sqlCount = "select count(*) from Bl_DnAppointment g ";
		
		String where = " where 1=1";
		if (searchProperties != null) {
			String memberId = searchProperties.get("memberId");
			String type = searchProperties.get("type");
			
			//业主发出的预约咨询
			if (StringUtils.isNotEmpty(type)) {
				where += " and g.Lt_SpMemberID = " + memberId;
			}else{
				//设计师/设计机构
				if (StringUtils.isNotEmpty(memberId)) {
					where += " and g.DesignMemberID = " + memberId;
				}
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
		List<BlDnAppointment> list =getSession().createSQLQuery(sql).addEntity(BlDnAppointment.class).list();
		if (searchProperties != null) {
			String type = searchProperties.get("type");
			if (StringUtils.isNotEmpty(type)) {
				for(BlDnAppointment appointment : list){
					appointment.setDesigner(memberDao.getShopEntity(appointment.getDesignMemberID()));
				}
			}else{
				for(BlDnAppointment appointment : list){
					appointment.setMember(memberDao.getShopEntity(appointment.getLt_SpMemberID()));
				}
			}
		}
		
		return list;
		
	}

	@Override
	public BlDnAppointment getShopEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateShopEntity(BlDnAppointment entity)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BlDnAppointment getWebEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteWebIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateWebEntity(BlDnAppointment entity)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}
