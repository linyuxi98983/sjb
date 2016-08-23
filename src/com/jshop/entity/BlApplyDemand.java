package com.jshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "Bl_DnApplyDemand", schema = "dbo")
public class BlApplyDemand implements java.io.Serializable {

	private Integer id;
	private Integer Lt_SpMemberID;
	private Integer Bl_DnDesignDemandID;
	private Date applyTime;
	private BlDnDesignDemand designDemand;
	private Integer state;
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
	@Column(name = "Bl_DnDesignDemandID")
	public Integer getBl_DnDesignDemandID() {
		return Bl_DnDesignDemandID;
	}
	public void setBl_DnDesignDemandID(Integer bl_DnDesignDemandID) {
		Bl_DnDesignDemandID = bl_DnDesignDemandID;
	}
	@Column(name = "ApplyTime")
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@Transient
	public BlDnDesignDemand getDesignDemand() {
		return designDemand;
	}
	public void setDesignDemand(BlDnDesignDemand designDemand) {
		this.designDemand = designDemand;
	}
	@Column(name = "State")
	public Integer getState() {
		return state;
	}
	
	public void setState(Integer state) {
		this.state = state;
	}
	
	
	
}
