package com.jshop.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * OtSpLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Ot_SpLog", schema = "dbo")
public class OtSpLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer ltSpOperatorId;
	private Integer sysModuleId;
	private Integer recordId;
	private String content;
	private Timestamp operateTime;
	private String operatorName;// 操作人名称
	private String moduleName;// 模块名称

	// Constructors

	/** default constructor */
	public OtSpLog() {
	}

	/** minimal constructor */
	public OtSpLog(Integer id, Integer ltSpOperatorId, Timestamp operateTime) {
		this.id = id;
		this.ltSpOperatorId = ltSpOperatorId;
		this.operateTime = operateTime;
	}

	/** full constructor */
	public OtSpLog(Integer id, Integer ltSpOperatorId, Integer sysModuleId,
			Integer recordId, String content, Timestamp operateTime) {
		this.id = id;
		this.ltSpOperatorId = ltSpOperatorId;
		this.sysModuleId = sysModuleId;
		this.recordId = recordId;
		this.content = content;
		this.operateTime = operateTime;
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

	@Column(name = "Sys_ModuleID")
	public Integer getSysModuleId() {
		return this.sysModuleId;
	}

	public void setSysModuleId(Integer sysModuleId) {
		this.sysModuleId = sysModuleId;
	}

	@Column(name = "RecordID")
	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	@Column(name = "Content", length = 200)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "OperateTime", nullable = false, length = 23)
	public Timestamp getOperateTime() {
		return this.operateTime;
	}

	public void setOperateTime(Timestamp operateTime) {
		this.operateTime = operateTime;
	}

	@Transient
	@JSON(serialize = false)
	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	@Transient
	@JSON(serialize = false)
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
}