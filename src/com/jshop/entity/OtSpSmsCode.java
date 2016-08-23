package com.jshop.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

import com.jshop.common.GEnum.SMSType;

/**
 * OtSpSmsCode entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Ot_SpSmsCode", schema = "dbo")
public class OtSpSmsCode implements java.io.Serializable {

	// Fields

	private String phoneNo;
	private String code;
	private Timestamp sendTime;
	private SMSType smsType;// 短信类型

	// Constructors

	/** default constructor */
	public OtSpSmsCode() {
	}

	/** minimal constructor */
	public OtSpSmsCode(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	/** full constructor */
	public OtSpSmsCode(String phoneNo, String code, Timestamp sendTime) {
		this.phoneNo = phoneNo;
		this.code = code;
		this.sendTime = sendTime;
	}

	// Property accessors
	@Id
	@Column(name = "PhoneNo", unique = true, nullable = false, length = 20)
	public String getPhoneNo() {
		return this.phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	@Column(name = "Code", length = 10)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "SendTime", length = 23)
	public Timestamp getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}

	@Transient
	@JSON(serialize = false)
	public SMSType getSmsType() {
		return smsType;
	}

	public void setSmsType(SMSType smsType) {
		this.smsType = smsType;
	}

}