package com.jshop.vo.index;

import java.util.List;

import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtDnInfo;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.LtSpPhomepage;

public class IndexData {

	//设计大咖
	private List<LtSpMember> memberList;
	//行业大腕
	private List<LtSpMember> hydwList;
	//餐厅设计
	private List<LtSpMember> sckjList;
	
	
	private List<LtSpPhomepage> phomepage;
	
	private List<BlDnDesignWorks> designWorks;
	
	

	private List<BlDnDesignWorks> jiazhuangWorks;

	private List<BlDnDesignWorks> gongzhuangWorks;
	
	private List<LtSpMember> orgList;
	
	private List<BlDnDesignDemand> demandList;
	private List<BlDnDesignDemand> demandList2;
	
	private List<LtDnInfo> ltDnInfos;
	
	public IndexData() {
		super();
	}

	public IndexData(List<LtSpMember> memberList, List<LtSpPhomepage> phomepage) {
		super();
		this.memberList = memberList;
		this.phomepage = phomepage;
	}

	
	
	public List<BlDnDesignDemand> getDemandList2() {
		return demandList2;
	}

	public void setDemandList2(List<BlDnDesignDemand> demandList2) {
		this.demandList2 = demandList2;
	}

	public List<LtDnInfo> getLtDnInfos() {
		return ltDnInfos;
	}

	public void setLtDnInfos(List<LtDnInfo> ltDnInfos) {
		this.ltDnInfos = ltDnInfos;
	}

	public List<BlDnDesignWorks> getJiazhuangWorks() {
		return jiazhuangWorks;
	}

	public void setJiazhuangWorks(List<BlDnDesignWorks> jiazhuangWorks) {
		this.jiazhuangWorks = jiazhuangWorks;
	}

	public List<BlDnDesignWorks> getGongzhuangWorks() {
		return gongzhuangWorks;
	}

	public void setGongzhuangWorks(List<BlDnDesignWorks> gongzhuangWorks) {
		this.gongzhuangWorks = gongzhuangWorks;
	}

	public List<LtSpMember> getSckjList() {
		return sckjList;
	}

	public void setSckjList(List<LtSpMember> sckjList) {
		this.sckjList = sckjList;
	}

	public List<LtSpMember> getHydwList() {
		return hydwList;
	}

	public void setHydwList(List<LtSpMember> hydwList) {
		this.hydwList = hydwList;
	}

	public List<LtSpPhomepage> getPhomepage() {
		return phomepage;
	}

	public void setPhomepage(List<LtSpPhomepage> phomepage) {
		this.phomepage = phomepage;
	}

	public List<LtSpMember> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<LtSpMember> memberList) {
		this.memberList = memberList;
	}

	public List<BlDnDesignWorks> getDesignWorks() {
		return designWorks;
	}

	public void setDesignWorks(List<BlDnDesignWorks> designWorks) {
		this.designWorks = designWorks;
	}

	public List<LtSpMember> getOrgList() {
		return orgList;
	}

	public void setOrgList(List<LtSpMember> orgList) {
		this.orgList = orgList;
	}

	public List<BlDnDesignDemand> getDemandList() {
		return demandList;
	}

	public void setDemandList(List<BlDnDesignDemand> demandList) {
		this.demandList = demandList;
	}
	
	
}
