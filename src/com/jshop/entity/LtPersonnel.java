package com.jshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LtSpMember entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "Lt_Personnel", schema = "dbo")
public class LtPersonnel implements java.io.Serializable {

	private Integer id;
	private String code;
	private String name;
	private Integer isOperator;
	private String password;
	private String  groups;
	private byte[] pvg;
	private Integer closed;
	private Integer ltBranchId;
	private Integer ltDepartmentId;
	private Integer ltPersonnelTypeId;
	private Date birthday;
	private Integer isLady;
	private String nativePlace;
	private String studyLevel;
	private Date entryDate;
	private String idCardNumber;
	private Integer isSaleman;
	private String job;
	private String wageAccount;
	private String handphoneNumber;
	private String telephoneNumber;
	private String address;
	private String email;
	private String remark;
	private Integer branchAccessType;
	private Integer departmentAccessType;
	
	
	
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "Code", length = 40)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Column(name = "Name", length = 40)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "IsOperator")
	public Integer getIsOperator() {
		return isOperator;
	}
	public void setIsOperator(Integer isOperator) {
		this.isOperator = isOperator;
	}
	@Column(name = "Password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name = "Groups")
	public String getGroups() {
		return groups;
	}
	public void setGroups(String groups) {
		this.groups = groups;
	}
	@Column(name = "Pvg")
	public byte[] getPvg() {
		return pvg;
	}
	public void setPvg(byte[] pvg) {
		this.pvg = pvg;
	}
	@Column(name = "Closed")
	public Integer getClosed() {
		return closed;
	}
	public void setClosed(Integer closed) {
		this.closed = closed;
	}
	@Column(name = "Lt_BranchID")
	public Integer getLtBranchId() {
		return ltBranchId;
	}
	public void setLtBranchId(Integer ltBranchId) {
		this.ltBranchId = ltBranchId;
	}
	@Column(name = "Lt_DepartmentID")
	public Integer getLtDepartmentId() {
		return ltDepartmentId;
	}
	public void setLtDepartmentId(Integer ltDepartmentId) {
		this.ltDepartmentId = ltDepartmentId;
	}
	@Column(name = "Lt_PersonnelTypeID")
	public Integer getLtPersonnelTypeId() {
		return ltPersonnelTypeId;
	}
	public void setLtPersonnelTypeId(Integer ltPersonnelTypeId) {
		this.ltPersonnelTypeId = ltPersonnelTypeId;
	}
	@Column(name = "Birthday")
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@Column(name = "IsLady")
	public Integer getIsLady() {
		return isLady;
	}
	public void setIsLady(Integer isLady) {
		this.isLady = isLady;
	}
	@Column(name = "NativePlace")
	public String getNativePlace() {
		return nativePlace;
	}
	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}
	@Column(name = "StudyLevel")
	public String getStudyLevel() {
		return studyLevel;
	}
	public void setStudyLevel(String studyLevel) {
		this.studyLevel = studyLevel;
	}
	@Column(name = "EntryDate")
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	@Column(name = "IDCardNumber")
	public String getIdCardNumber() {
		return idCardNumber;
	}
	public void setIdCardNumber(String idCardNumber) {
		this.idCardNumber = idCardNumber;
	}
	@Column(name = "IsSalesman")
	public Integer getIsSaleman() {
		return isSaleman;
	}
	public void setIsSaleman(Integer isSaleman) {
		this.isSaleman = isSaleman;
	}
	@Column(name = "Job")
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Column(name = "WageAccount")
	public String getWageAccount() {
		return wageAccount;
	}
	public void setWageAccount(String wageAccount) {
		this.wageAccount = wageAccount;
	}
	@Column(name = "HandphoneNumber")
	public String getHandphoneNumber() {
		return handphoneNumber;
	}
	public void setHandphoneNumber(String handphoneNumber) {
		this.handphoneNumber = handphoneNumber;
	}
	@Column(name = "TelephoneNumber")
	public String getTelephoneNumber() {
		return telephoneNumber;
	}
	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}
	@Column(name = "Address")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name = "Email")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name = "Remark")
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Column(name = "BranchAccessType")
	public Integer getBranchAccessType() {
		return branchAccessType;
	}
	public void setBranchAccessType(Integer branchAccessType) {
		this.branchAccessType = branchAccessType;
	}
	@Column(name = "DepartmentAccessType")
	public Integer getDepartmentAccessType() {
		return departmentAccessType;
	}
	public void setDepartmentAccessType(Integer departmentAccessType) {
		this.departmentAccessType = departmentAccessType;
	}
	
}