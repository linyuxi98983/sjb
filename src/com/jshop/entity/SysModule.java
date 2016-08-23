package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysModule entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Sys_Module", schema = "dbo")
public class SysModule implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer parentId;
	private Integer isFunction;
	private String name;
	private String operates;
	private Integer closed;
	private String flowData;

	// Constructors

	/** default constructor */
	public SysModule() {
	}

	/** minimal constructor */
	public SysModule(Integer id, Integer parentId, Integer isFunction,
			String name, Integer closed) {
		this.id = id;
		this.parentId = parentId;
		this.isFunction = isFunction;
		this.name = name;
		this.closed = closed;
	}

	/** full constructor */
	public SysModule(Integer id, Integer parentId, Integer isFunction,
			String name, String operates, Integer closed, String flowData) {
		this.id = id;
		this.parentId = parentId;
		this.isFunction = isFunction;
		this.name = name;
		this.operates = operates;
		this.closed = closed;
		this.flowData = flowData;
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

	@Column(name = "ParentID", nullable = false)
	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	@Column(name = "IsFunction", nullable = false)
	public Integer getIsFunction() {
		return this.isFunction;
	}

	public void setIsFunction(Integer isFunction) {
		this.isFunction = isFunction;
	}

	@Column(name = "Name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Operates", length = 100)
	public String getOperates() {
		return this.operates;
	}

	public void setOperates(String operates) {
		this.operates = operates;
	}

	@Column(name = "Closed", nullable = false)
	public Integer getClosed() {
		return this.closed;
	}

	public void setClosed(Integer closed) {
		this.closed = closed;
	}

	@Column(name = "FlowData")
	public String getFlowData() {
		return this.flowData;
	}

	public void setFlowData(String flowData) {
		this.flowData = flowData;
	}

}