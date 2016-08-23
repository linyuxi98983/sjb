package com.jshop.action.pc.ds;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.BlApplyDemandDao;
import com.jshop.dao.BlDnAppointmentDao;
import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.BlDnAppointment;
import com.jshop.entity.LtSpMember;
@Namespace("/" + Global.PP_PC + "/ds/appointment")
@ParentPackage(Global.PP_PC)
@Action("appointment")
public class AppointmentAction  extends BaseMobileAction<BlDnAppointment, Integer>{
	
	
	private BlDnAppointmentDao appointmentDao;
	@Resource
	public void setBlDnAppointmentDao(BlDnAppointmentDao appointmentDao) {
		this.setBaseShopCRUDDao(appointmentDao);
		this.appointmentDao = appointmentDao;
		this.entity = new BlDnAppointment();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	public String save() throws Exception{
		appointmentDao.saveOrUpdateShopEntity(entity);
		return JSON;
	}
	/**
	 * 项目申请列表
	 */
	@Override
	public String list(){
		
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);
		
		if(member == null){
			return "toLogin";
		}
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		searchProperties.put("memberId", member.getId()+"");
		searchProperties.put("status", "status");
		list = appointmentDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	private String state;
	private String effective;
	public void setState(String state) {
		this.state = state;
	}

	public void setEffective(String effective) {
		this.effective = effective;
	}
	
	
}