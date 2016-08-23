package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LtSpSeo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpSeo", schema = "dbo")
public class LtSpSeo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String keywords;
	private String description;
	private String title;
	private String moduleName;
	private String remark;

	// Constructors

	/** default constructor */
	public LtSpSeo() {
	}

	/** minimal constructor */
	public LtSpSeo(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public LtSpSeo(Integer id, String keywords, String description,
			String title, String moduleName, String remark) {
		this.id = id;
		this.keywords = keywords;
		this.description = description;
		this.title = title;
		this.moduleName = moduleName;
		this.remark = remark;
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

	@Column(name = "Keywords", length = 400)
	public String getKeywords() {
		return this.keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	@Column(name = "Description", length = 400)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "Title", length = 100)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "ModuleName", length = 50)
	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	@Column(name = "Remark", length = 100)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}