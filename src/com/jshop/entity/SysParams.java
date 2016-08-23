package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * SysParams entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Sys_Params", schema = "dbo", uniqueConstraints = @UniqueConstraint(columnNames = "Name"))
public class SysParams implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String description;
	private String value;
	private Integer notNull;
	private Integer readonly;
	private String paramType;
	private Integer editType;
	private String pickItems;

	// Constructors

	/** default constructor */
	public SysParams() {
	}

	/** minimal constructor */
	public SysParams(Integer id, String name, Integer notNull,
			Integer readonly, Integer editType) {
		this.id = id;
		this.name = name;
		this.notNull = notNull;
		this.readonly = readonly;
		this.editType = editType;
	}

	/** full constructor */
	public SysParams(Integer id, String name, String description, String value,
			Integer notNull, Integer readonly, String paramType,
			Integer editType, String pickItems) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.value = value;
		this.notNull = notNull;
		this.readonly = readonly;
		this.paramType = paramType;
		this.editType = editType;
		this.pickItems = pickItems;
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

	@Column(name = "Name", unique = true, nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Description", length = 50)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "Value", length = 1000)
	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Column(name = "NotNull", nullable = false)
	public Integer getNotNull() {
		return this.notNull;
	}

	public void setNotNull(Integer notNull) {
		this.notNull = notNull;
	}

	@Column(name = "Readonly", nullable = false)
	public Integer getReadonly() {
		return this.readonly;
	}

	public void setReadonly(Integer readonly) {
		this.readonly = readonly;
	}

	@Column(name = "ParamType", length = 20)
	public String getParamType() {
		return this.paramType;
	}

	public void setParamType(String paramType) {
		this.paramType = paramType;
	}

	@Column(name = "EditType", nullable = false)
	public Integer getEditType() {
		return this.editType;
	}

	public void setEditType(Integer editType) {
		this.editType = editType;
	}

	@Column(name = "PickItems", length = 400)
	public String getPickItems() {
		return this.pickItems;
	}

	public void setPickItems(String pickItems) {
		this.pickItems = pickItems;
	}

}