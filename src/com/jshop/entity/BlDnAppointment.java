package com.jshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "Bl_DnAppointment", schema = "dbo")
public class BlDnAppointment implements java.io.Serializable {

	private Integer id;
	private Integer Lt_SpMemberID;
	private LtSpMember member;
	private Integer designMemberID;
	private LtSpMember designer;
	private String requirement;
	private Date appointDate;
	private Integer status;
	
	@Id 
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "Lt_SpMemberID")
	public Integer getLt_SpMemberID() {
		return Lt_SpMemberID;
	}
	public void setLt_SpMemberID(Integer lt_SpMemberID) {
		Lt_SpMemberID = lt_SpMemberID;
	}
	
	@Column(name = "DesignMemberID")
	public Integer getDesignMemberID() {
		return designMemberID;
	}
	public void setDesignMemberID(Integer designMemberID) {
		this.designMemberID = designMemberID;
	}
	@Column(name = "Requirement")
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	@Column(name = "Appoint_Date")
	public Date getAppointDate() {
		return appointDate;
	}
	public void setAppointDate(Date appointDate) {
		this.appointDate = appointDate;
	}
	@Column(name = "Status")
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Transient
	public LtSpMember getMember() {
		return member;
	}
	public void setMember(LtSpMember member) {
		this.member = member;
	}
	@Transient
	public LtSpMember getDesigner() {
		return designer;
	}
	public void setDesigner(LtSpMember designer) {
		this.designer = designer;
	}
	
	
	
}
