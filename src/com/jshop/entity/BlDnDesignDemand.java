package com.jshop.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

@SuppressWarnings("serial")
@Entity
@Table(name = "Bl_DnDesignDemand", schema = "dbo")
public class BlDnDesignDemand implements java.io.Serializable {
	private Integer id;
	private String phoneNo;
	private String nickname;
	private Integer sysSpAreaId;
	private SysSpArea area;// 地区实体
	private String areaName;
	private String projectType;
	private double areaSqm;
	private String budgetName;
	private Integer minAmt;
	private Integer maxAmt;
	private Integer ltSpMemberId;
	private String member;
	private String requirement;
	private Integer designMemberId;
	private Integer effective;
	private String title;
	private String areaZone;
	private Timestamp pubilcDate;
	private Integer state;
	private Integer status;
	private Date publicDate;
	private String reason;
	private String imagePath;
	private List<BlApplyDemand> applyDemands;
	
	@Id 
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "PhoneNo")
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	@Column(name = "Nickname")
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Column(name = "Sys_SpAreaID")
	public Integer getSysSpAreaId() {
		return sysSpAreaId;
	}
	public void setSysSpAreaId(Integer sysSpAreaId) {
		this.sysSpAreaId = sysSpAreaId;
	}
	@Column(name = "ProjectType")
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	@Column(name = "AreaSqm")
	public double getAreaSqm() {
		return areaSqm;
	}
	public void setAreaSqm(double areaSqm) {
		this.areaSqm = areaSqm;
	}
	@Column(name = "BudgetName")
	public String getBudgetName() {
		return budgetName;
	}
	public void setBudgetName(String budgetName) {
		this.budgetName = budgetName;
	}
	@Column(name = "MinAmt")
	public Integer getMinAmt() {
		return minAmt;
	}
	public void setMinAmt(Integer minAmt) {
		this.minAmt = minAmt;
	}
	@Column(name = "MaxAmt")
	public Integer getMaxAmt() {
		return maxAmt;
	}
	public void setMaxAmt(Integer maxAmt) {
		this.maxAmt = maxAmt;
	}
	@Column(name = "State")
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Transient 
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	@JSON(serialize = false)
	@Transient
	public SysSpArea getArea() {
		return area;
	}

	public void setArea(SysSpArea area) {
		this.area = area;
	}
	@Column(name = "Lt_SpMemberID")
	public Integer getLtSpMemberId() {
		return ltSpMemberId;
	}
	public void setLtSpMemberId(Integer ltSpMemberId) {
		this.ltSpMemberId = ltSpMemberId;
	}
	@Column(name = "Requirement")
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	@Column(name = "DesignMemberID")
	public Integer getDesignMemberId() {
		return designMemberId;
	}
	public void setDesignMemberId(Integer designMemberId) {
		this.designMemberId = designMemberId;
	}
	@Column(name = "Effective")
	public Integer getEffective() {
		return effective;
	}
	public void setEffective(Integer effective) {
		this.effective = effective;
	}
	
	@Column(name = "Title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name = "PubilcDate")
	public Timestamp getPubilcDate() {
		return pubilcDate;
	}
	public void setPubilcDate(Timestamp pubilcDate) {
		this.pubilcDate = pubilcDate;
	}
	@Column(name = "Area")
	public String getAreaZone() {
		return areaZone;
	}
	public void setAreaZone(String areaZone) {
		this.areaZone = areaZone;
	}
	@Transient
	public List<BlApplyDemand> getApplyDemands() {
		return applyDemands;
	}
	public void setApplyDemands(List<BlApplyDemand> applyDemands) {
		this.applyDemands = applyDemands;
	}
	@Transient
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Column(name = "Reason")
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Transient
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	@Transient
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
}
