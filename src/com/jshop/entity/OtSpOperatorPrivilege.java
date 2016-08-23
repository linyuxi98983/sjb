package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OtSpOperatorPrivilege entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Ot_SpOperatorPrivilege", schema = "dbo")
public class OtSpOperatorPrivilege implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer ltSpOperatorId;
	private Integer sysModuleId;

	// Constructors

	/** default constructor */
	public OtSpOperatorPrivilege() {
	}

	/** full constructor */
	public OtSpOperatorPrivilege(Integer id, Integer ltSpOperatorId,
			Integer sysModuleId) {
		this.id = id;
		this.ltSpOperatorId = ltSpOperatorId;
		this.sysModuleId = sysModuleId;
	}

	// Property accessors
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "Lt_SpOperatorID", nullable = false)
	public Integer getLtSpOperatorId() {
		return this.ltSpOperatorId;
	}

	public void setLtSpOperatorId(Integer ltSpOperatorId) {
		this.ltSpOperatorId = ltSpOperatorId;
	}

	@Column(name = "Sys_ModuleID", nullable = false)
	public Integer getSysModuleId() {
		return this.sysModuleId;
	}

	public void setSysModuleId(Integer sysModuleId) {
		this.sysModuleId = sysModuleId;
	}

}