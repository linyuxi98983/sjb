package com.jshop.action.pc.demand;

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
import com.jshop.dao.BlApplyDemandDao;
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;
@Namespace("/" + Global.PP_PC + "/demand")
@ParentPackage(Global.PP_PC)
@Action("demand")
public class DesignDemandAction  extends BaseMobileAction<BlDnDesignDemand, Integer>{

	private BlDnDesignDemandDao demandDao;
	
	
	@Resource
	private LtSpMemberDao memberDao;
	@Resource
	private BlApplyDemandDao applyDemandDao;
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	@Resource
	public void setDemandDao(BlDnDesignDemandDao demandDao) {
		this.setBaseShopCRUDDao(demandDao);
		this.demandDao = demandDao;
		this.entity = new BlDnDesignDemand();
	}
	
	
	@Override
	public String save() throws Exception {
		System.out.println(entity);
		demandDao.saveOrUpdateShopEntity(entity);
		
		if(entity.getDesignMemberId() != null && entity.getState() == 1){
			LtSpMember member = memberDao.getShopEntity(entity.getDesignMemberId());
			member.setFollowCount(member.getAppointmentCount() + 1);
			memberDao.save(member);
		}
		this.success=true;
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	public String apply()throws Exception{
	
		LtSpMember member = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_YEZHU_LOGINER);
		
		LtSpMember member2 = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_DESIGNER_LOGINER);				
		
		LtSpMember member3 = (LtSpMember) getSession().get(Global.SESSION_KEY_PC_ORG_LOGINER);
		
		if(member == null && member2 == null && member3==null){
			this.success = false;
			this.msg = "用户未登陆，请登录再申请！";
			return "json";
		}
		entity = demandDao.get(id);
		
		if(member != null){
			if(applyDemandDao.findApplyDemandByDemandIdAndMemberId(entity, member) != null){
				this.success = false;
				this.msg = "已经申请接单！";
				return "json";
			}
		}
		if(member2 != null){
			if(applyDemandDao.findApplyDemandByDemandIdAndMemberId(entity, member2) != null){
				this.success = false;
				this.msg = "已经申请接单！";
				return "json";
			}
		}
		
		if(member3 != null){
			if(applyDemandDao.findApplyDemandByDemandIdAndMemberId(entity, member3) != null){
				this.success = false;
				this.msg = "已经申请接单！";
				return "json";
			}
		}
		entity = demandDao.getShopEntity(id);
		BlApplyDemand applyDemand = new BlApplyDemand();
		applyDemand.setApplyTime(new Date());
		applyDemand.setBl_DnDesignDemandID(entity.getId());
		if(member != null){
			applyDemand.setLt_SpMemberID(member.getId());
		}
		
		if(member2 != null){
			applyDemand.setLt_SpMemberID(member2.getId());
		}
		if(member3 != null){
			applyDemand.setLt_SpMemberID(member3.getId());
		}
		applyDemandDao.saveOrUpdateShopEntity(applyDemand);
		
		this.success = true;
		this.msg = "申请成功！";
		return "json";
	}
	
	@Override
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>(0);
		}
		
		pager = loadPager();
		list = demandDao.getShopList(pager, searchProperties);
		if (StringUtils.isEmpty(result)) {
			result = LIST;
		}
		return result;
	}
	
	/**
	 * 详情
	 * @return
	 */
	public String detail(){		
		entity = demandDao.getShopEntity(id);
		return "detail";
	}
}
