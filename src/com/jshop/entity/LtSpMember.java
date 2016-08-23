package com.jshop.entity;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * LtSpMember entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpMember", schema = "dbo")
public class LtSpMember implements java.io.Serializable {

	// Fields

	private Integer id;
	// private String name;
	private Integer closed;
	private String password;
	private Timestamp registerTime;
	private Timestamp loginTime;
	private Integer point;
	private String phoneNo;
	private String email;
	private String nickname;
	private String realName;
	private Integer sex;
	private Timestamp birthday;
	private Integer sysSpAreaId;
	private Integer otSpPictureId;
	private String zfbaccount;
	private String wxaccount;
	private SysSpArea area;// 地区表实体
	private File image;// 图片文件
	private String imageFileName;// 图片文件名称
	private String imagePath;// 图片路径

	private File idFrontPictureImage;// 身份证背面图片文件
	private String idFrontPictureImageFileName;// 身份证背面图片文件名称
	private String idFrontPictureImagePath;// 身份证背面图片路径
	
	private File idBackPictureImage;// 身份证背面图片文件
	private String idBackPictureImageFileName;// 身份证背面图片文件名称
	private String idBackPictureImagePath;// 身份证背面图片路径
	
	private Integer memberType;
	private String qq;
	private Integer ltDnRenovationStageId;
	private String description;
	private String idNumber;
	private Integer idFrontPictureId;
	private Integer idBackPictureId;
	private String bankName;
	private String bankAccount;
	private String bankArea;
	private String designExperience;
	private String goodsAtSpace;
	private String awards;
	private Integer minDesignAmt;
	private Integer browseCount;
	private Integer fansCount;
	private Integer followCount;
	private Integer demandCount;
	private Integer caseCount =0;
	private Integer appointmentCount;
	private List<BlDnDesignWorks> worksList;
	// Constructors

	/** default constructor */
	public LtSpMember() {
	}

	/** minimal constructor */
	public LtSpMember(Integer id, String name, Integer closed,
			Timestamp registerTime, Integer point, String phoneNo, Integer sex) {
		this.id = id;
		this.closed = closed;
		this.registerTime = registerTime;
		this.point = point;
		this.phoneNo = phoneNo;
		this.sex = sex;
	}

	/** full constructor */
	public LtSpMember(Integer id, String name, Integer closed, String password,
			Timestamp registerTime, Timestamp loginTime, Integer point,
			String phoneNo, String email, String nickname, String realName,
			Integer sex, Timestamp birthday, Integer sysSpAreaId,
			Integer otSpPictureId, String zfbaccount, String wxaccount) {
		this.id = id;
		this.closed = closed;
		this.password = password;
		this.registerTime = registerTime;
		this.loginTime = loginTime;
		this.point = point;
		this.phoneNo = phoneNo;
		this.email = email;
		this.nickname = nickname;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.sysSpAreaId = sysSpAreaId;
		this.otSpPictureId = otSpPictureId;
		this.zfbaccount = zfbaccount;
		this.wxaccount = wxaccount;
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

	/*
	 * @Column(name = "Name", unique = true, nullable = false, length = 40)
	 * public String getName() { return this.name; }
	 * 
	 * public void setName(String name) { this.name = name; }
	 */

	@Column(name = "Closed", nullable = false)
	public Integer getClosed() {
		return this.closed;
	}

	public void setClosed(Integer closed) {
		this.closed = closed;
	}

	@Column(name = "Password", length = 40)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "RegisterTime", nullable = false, length = 23)
	public Timestamp getRegisterTime() {
		return this.registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	@Column(name = "LoginTime", length = 23)
	public Timestamp getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	@Column(name = "Point", nullable = false)
	public Integer getPoint() {
		return this.point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	

	@Column(name = "PhoneNo", nullable = false, length = 20)
	public String getPhoneNo() {
		return this.phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	@Column(name = "EMail", length = 60)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Nickname", length = 60)
	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(name = "RealName", length = 20)
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "Sex", nullable = false)
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "Birthday", length = 23)
	public Timestamp getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	@Column(name = "Sys_SpAreaID")
	public Integer getSysSpAreaId() {
		return this.sysSpAreaId;
	}

	public void setSysSpAreaId(Integer sysSpAreaId) {
		this.sysSpAreaId = sysSpAreaId;
	}

	@Column(name = "Ot_SpPictureID")
	public Integer getOtSpPictureId() {
		return this.otSpPictureId;
	}

	public void setOtSpPictureId(Integer otSpPictureId) {
		this.otSpPictureId = otSpPictureId;
	}

	@Column(name = "ZFBAccount", length = 40)
	public String getZfbaccount() {
		return this.zfbaccount;
	}

	public void setZfbaccount(String zfbaccount) {
		this.zfbaccount = zfbaccount;
	}

	@Column(name = "WXAccount", length = 40)
	public String getWxaccount() {
		return this.wxaccount;
	}

	public void setWxaccount(String wxaccount) {
		this.wxaccount = wxaccount;
	}

	@JSON(serialize = false)
	@Transient
	public SysSpArea getArea() {
		return area;
	}

	public void setArea(SysSpArea area) {
		this.area = area;
	}

	@JSON(serialize = false)
	@Transient
	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	@JSON(serialize = false)
	@Transient
	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	@JSON(serialize = false)
	@Transient
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
	@Column(name = "MemberType")
	public Integer getMemberType() {
		return memberType;
	}

	public void setMemberType(Integer memberType) {
		this.memberType = memberType;
	}
	@Column(name = "QQ")
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	@Column(name = "Lt_DnRenovationStageID")
	public Integer getLtDnRenovationStageId() {
		return ltDnRenovationStageId;
	}

	public void setLtDnRenovationStageId(Integer ltDnRenovationStageId) {
		this.ltDnRenovationStageId = ltDnRenovationStageId;
	}
	@Column(name = "Description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name = "IDNumber")
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	@Column(name = "IDFrontPictureID")
	public Integer getIdFrontPictureId() {
		return idFrontPictureId;
	}

	public void setIdFrontPictureId(Integer idFrontPictureId) {
		this.idFrontPictureId = idFrontPictureId;
	}
	@Column(name = "IDBackPictureID")
	public Integer getIdBackPictureId() {
		return idBackPictureId;
	}

	public void setIdBackPictureId(Integer idBackPictureId) {
		this.idBackPictureId = idBackPictureId;
	}
	@Column(name = "BankName")
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	@Column(name = "BankAccount")
	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	@Column(name = "BankArea")
	public String getBankArea() {
		return bankArea;
	}

	public void setBankArea(String bankArea) {
		this.bankArea = bankArea;
	}
	@Column(name = "DesignExperience")
	public String getDesignExperience() {
		return designExperience;
	}

	public void setDesignExperience(String designExperience) {
		this.designExperience = designExperience;
	}
	@Column(name = "GoodsAtSpace")
	public String getGoodsAtSpace() {
		return goodsAtSpace;
	}

	public void setGoodsAtSpace(String goodsAtSpace) {
		this.goodsAtSpace = goodsAtSpace;
	}
	@Column(name = "Awards")
	public String getAwards() {
		return awards;
	}

	public void setAwards(String awards) {
		this.awards = awards;
	}
	@Column(name = "MinDesignAmt")
	public Integer getMinDesignAmt() {
		return minDesignAmt;
	}

	public void setMinDesignAmt(Integer minDesignAmt) {
		this.minDesignAmt = minDesignAmt;
	}
	@Column(name = "BrowseCount")
	public Integer getBrowseCount() {
		return browseCount;
	}

	public void setBrowseCount(Integer browseCount) {
		this.browseCount = browseCount;
	}
	@Column(name = "FansCount")
	public Integer getFansCount() {
		return fansCount;
	}

	public void setFansCount(Integer fansCount) {
		this.fansCount = fansCount;
	}
	@Column(name = "FollowCount")
	public Integer getFollowCount() {
		return followCount;
	}

	public void setFollowCount(Integer followCount) {
		this.followCount = followCount;
	}
	@Column(name = "DemandCount")
	public Integer getDemandCount() {
		return demandCount;
	}

	public void setDemandCount(Integer demandCount) {
		this.demandCount = demandCount;
	}
	
	
	@Column(name="CaseCount")
	public Integer getCaseCount() {
		if(caseCount != null){
			this.caseCount = 0;
		}
		return caseCount;
	}

	public void setCaseCount(Integer caseCount) {
		this.caseCount = caseCount;
	}

	@Transient
	public File getIdFrontPictureImage() {
		return idFrontPictureImage;
	}

	public void setIdFrontPictureImage(File idFrontPictureImage) {
		this.idFrontPictureImage = idFrontPictureImage;
	}
	
	@Transient
	public String getIdFrontPictureImageFileName() {
		return idFrontPictureImageFileName;
	}

	public void setIdFrontPictureImageFileName(String idFrontPictureImageFileName) {
		this.idFrontPictureImageFileName = idFrontPictureImageFileName;
	}
	
	@Transient
	public String getIdFrontPictureImagePath() {
		return idFrontPictureImagePath;
	}

	public void setIdFrontPictureImagePath(String idFrontPictureImagePath) {
		this.idFrontPictureImagePath = idFrontPictureImagePath;
	}

	@Transient
	public File getIdBackPictureImage() {
		return idBackPictureImage;
	}

	public void setIdBackPictureImage(File idBackPictureImage) {
		this.idBackPictureImage = idBackPictureImage;
	}
	
	@Transient
	public String getIdBackPictureImageFileName() {
		return idBackPictureImageFileName;
	}

	public void setIdBackPictureImageFileName(String idBackPictureImageFileName) {
		this.idBackPictureImageFileName = idBackPictureImageFileName;
	}
	
	@Transient
	public String getIdBackPictureImagePath() {
		return idBackPictureImagePath;
	}

	public void setIdBackPictureImagePath(String idBackPictureImagePath) {
		this.idBackPictureImagePath = idBackPictureImagePath;
	}
	@Transient
	public List<BlDnDesignWorks> getWorksList() {
		return worksList;
	}

	public void setWorksList(List<BlDnDesignWorks> worksList) {
		this.worksList = worksList;
	}
	@Column(name = "AppointmentCount")
	public Integer getAppointmentCount() {
		return appointmentCount;
	}

	public void setAppointmentCount(Integer appointmentCount) {
		this.appointmentCount = appointmentCount;
	}

	
}