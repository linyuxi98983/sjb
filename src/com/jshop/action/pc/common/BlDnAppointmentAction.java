package com.jshop.action.pc.common;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.BlDnAppointmentDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlDnAppointment;
import com.jshop.entity.LtSpMember;

@Namespace("/" + Global.PP_PC + "/appointment")
@ParentPackage(Global.PP_PC)
@Action("appointment")
public class BlDnAppointmentAction extends BaseMobileAction<BlDnAppointment, Integer>{
	
	private BlDnAppointmentDao appointmentDao;
	
	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	public void setBlDnAppointmentDao(BlDnAppointmentDao appointmentDao) {
		this.setBaseShopCRUDDao(appointmentDao);
		this.appointmentDao = appointmentDao;
		super.entity = new BlDnAppointment();
	}
	
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	
	
	@Override
	public String save() throws Exception {
		
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_LOGINER);
		if(member == null){
			return "toLogin";
		}
		entity.setLt_SpMemberID(member.getId());
		if(entity.getId() == null){
			entity.setStatus(0);
			entity.setAppointDate(new Date());
		}
		appointmentDao.saveOrUpdateShopEntity(entity);
		
		
		this.success=true;
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	@Override
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		list = appointmentDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}

	

}
