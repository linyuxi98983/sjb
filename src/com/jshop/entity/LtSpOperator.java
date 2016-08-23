package com.jshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * LtSpOperator entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpOperator", schema = "dbo", uniqueConstraints = @UniqueConstraint(columnNames = "LoginName"))
public class LtSpOperator implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer closed;
	private String loginName;
	private String password;
	private String department;

	// Constructors

	/** default constructor */
	public LtSpOperator() {
	}

	/** minimal constructor */
	public LtSpOperator(Integer id, String name, Integer closed,
			String loginName) {
		this.id = id;
		this.name = name;
		this.closed = closed;
		this.loginName = loginName;
	}

	/** full constructor */
	public LtSpOperator(Integer id, String name, Integer closed,
			String loginName, String password, String department) {
		this.id = id;
		this.name = name;
		this.closed = closed;
		this.loginName = loginName;
		this.password = password;
		this.department = department;
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

	@Column(name = "Name", nullable = false, length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Closed", nullable = false)
	public Integer getClosed() {
		return this.closed;
	}

	public void setClosed(Integer closed) {
		this.closed = closed;
	}

	@Column(name = "LoginName", unique = true, nullable = false, length = 40)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "Password", length = 40)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "Department", length = 20)
	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

}