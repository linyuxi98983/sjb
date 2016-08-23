package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LtSpHtml entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpHtml", schema = "dbo")
public class LtSpHtml implements java.io.Serializable {

	// Fields

	private Integer id;
	private String html;
	private String description;

	// Constructors

	/** default constructor */
	public LtSpHtml() {
	}

	/** full constructor */
	public LtSpHtml(Integer id, String html) {
		this.id = id;
		this.html = html;
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

	@Column(name = "HTML", nullable = false)
	public String getHtml() {
		return this.html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	@Column(name = "Description", nullable = false, length = 100)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}