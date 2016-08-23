package com.jshop.action.web.sjb;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.BlApplyDemandDao;
import com.jshop.dao.BlDnDesignDemandDao;
import com.jshop.entity.BlApplyDemand;
import com.jshop.entity.BlDnDesignDemand;
@Namespace(value = "/web/designDemand")
@ParentPackage(Global.PP_WEB)
@Action("designDemand")
public class BlDnDesignDemandAction extends BaseWebAction<BlDnDesignDemand, Integer> {
	private static final long serialVersionUID = 1L;
	@Resource
	private BlApplyDemandDao applyDemandDaop;
	private BlDnDesignDemandDao designDemandDao;
	
	@Resource
	
	public void setBlDnDesignDemandDao(BlDnDesignDemandDao designDemandDao) {
		this.setBaseWebCRUDDao(designDemandDao);		
		this.designDemandDao = designDemandDao;
		this.entity = new BlDnDesignDemand();
	}
	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	@Override
	public String add() {		
		
		return super.add();
	}

	public String zhipai(){
	
		entity = designDemandDao.getWebEntity(id);
		
		if (StringUtils.isNotEmpty(result)) {
			success = true;
			return result;
		}
		return "zhipai";
	}
	public String zhipaiMember() throws Exception{
		
		BlApplyDemand applyDemand = new BlApplyDemand();
		applyDemand.setApplyTime(new Date());
		applyDemand.setBl_DnDesignDemandID(entity.getId());
		applyDemand.setLt_SpMemberID(memberId);
		applyDemand.setState(0);
		
		applyDemandDaop.saveOrUpdateWebEntity(applyDemand);
		
		entity.setState(1);
		designDemandDao.saveOrUpdateWebEntity(entity);
		return list();
	}
	@Override
	public String edit() {
		return super.edit();
	}

	@Override
	public String save() throws Exception {
		designDemandDao.saveOrUpdateWebEntity(entity);	
		if(result != null && !"".equals(result)){
			this.success = true;
			return "json";
		}else{
			return list();
		}		
	}
	
	private Integer memberId;
	
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	@Override
	public String delete() {

		designDemandDao.deleteWebIds(ids);
		return list();
	}
}
