package com.jshop.entity;

import java.io.File;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("serial")
@Entity
@Table(name = "Bl_DnDesignWorks", schema = "dbo")
public class BlDnDesignWorks implements java.io.Serializable {
	private Integer id;
	
	private Integer ltSpMemberId;
	private Integer costAmt;
	private Integer ltDnRenovationStyleId;
	private Integer ltDnSpaceTypeId;
	private Integer sqm;
	private Integer browseCount;
	private String caseDescription;
	private String memberName;
	private String designStyle;
	private String spaceType;
	private File[] imageFiles;// 上传图片文件
	private String[] imageFilesFileName;// 上传图片名称
	private String orderNos;// 图片排序号
	private String deleteImageIds;// 被删除的图片ID
	private String imagePath;
	private String member;
	private String memberImagePath;
	private String title;
	private List<BlDnDesignWorks> hisDesigns;
	private Integer memberType;
	private LtSpMember mb;
	private Integer worksKind;
	private Integer ltDnHouseTypeID;
	private Integer evaCount;
	private Integer orderNo;
	@Transient
	@JSON(serialize = false)
	public File[] getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(File[] imageFiles) {
		this.imageFiles = imageFiles;
	}

	@Transient
	@JSON(serialize = false)
	public String[] getImageFilesFileName() {
		return imageFilesFileName;
	}

	public void setImageFilesFileName(String[] imageFilesFileName) {
		this.imageFilesFileName = imageFilesFileName;
	}

	@Transient
	@JSON(serialize = false)
	public String getOrderNos() {
		return orderNos;
	}

	public void setOrderNos(String orderNos) {
		this.orderNos = orderNos;
	}

	@Transient
	@JSON(serialize = false)
	public String getDeleteImageIds() {
		return deleteImageIds;
	}

	public void setDeleteImageIds(String deleteImageIds) {
		this.deleteImageIds = deleteImageIds;
	}
	private List<BlDnDesignWorksPicture> picList;
	

	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	@Column(name = "Lt_SpMemberID")
	public Integer getLtSpMemberId() {
		return ltSpMemberId;
	}
	public void setLtSpMemberId(Integer ltSpMemberId) {
		this.ltSpMemberId = ltSpMemberId;
	}
	@Column(name = "CostAmt")
	public Integer getCostAmt() {
		return costAmt;
	}
	public void setCostAmt(Integer costAmt) {
		this.costAmt = costAmt;
	}
	@Column(name = "Lt_DnRenovationStyleID")
	public Integer getLtDnRenovationStyleId() {
		return ltDnRenovationStyleId;
	}
	public void setLtDnRenovationStyleId(Integer ltDnRenovationStyleId) {
		this.ltDnRenovationStyleId = ltDnRenovationStyleId;
	}
	@Column(name = "Sqm")
	public Integer getSqm() {
		return sqm;
	}
	public void setSqm(Integer sqm) {
		this.sqm = sqm;
	}
	@Column(name = "BrowseCount")
	public Integer getBrowseCount() {
		return browseCount;
	}
	public void setBrowseCount(Integer browseCount) {
		this.browseCount = browseCount;
	}
	@Column(name = "CaseDescription")
	public String getCaseDescription() {
		return caseDescription;
	}
	public void setCaseDescription(String caseDescription) {
		this.caseDescription = caseDescription;
	}
	@Column(name = "Lt_DnSpaceTypeID")
	public Integer getLtDnSpaceTypeId() {
		return ltDnSpaceTypeId;
	}
	public void setLtDnSpaceTypeId(Integer ltDnSpaceTypeId) {
		this.ltDnSpaceTypeId = ltDnSpaceTypeId;
	}
	@JSON(serialize = true)
	@Transient
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@JSON(serialize = true)
	@Transient
	public String getDesignStyle() {
		return designStyle;
	}
	public void setDesignStyle(String designStyle) {
		this.designStyle = designStyle;
	}
	@JSON(serialize = true)
	@Transient
	public String getSpaceType() {
		return spaceType;
	}
	public void setSpaceType(String spaceType) {
		this.spaceType = spaceType;
	}
	@JSON(serialize = true)
	@Transient
	public List<BlDnDesignWorksPicture> getPicList() {
		return picList;
	}
	public void setPicList(List<BlDnDesignWorksPicture> picList) {
		this.picList = picList;
	}
	@JSON(serialize = true)
	@Transient
	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@JSON(serialize = true)
	@Transient
	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	@Column(name = "Title")
	public String getTitle() {
		
		return title;
	}

	public void setTitle(String title) {
		
		this.title = title;	
	}
	@JSON(serialize = true)
	@Transient
	public Integer getMemberType() {
		return memberType;
	}

	public void setMemberType(Integer memberType) {
		this.memberType = memberType;
	}
	@JSON(serialize = true)
	@Transient
	public List<BlDnDesignWorks> getHisDesigns() {
		return hisDesigns;
	}

	public void setHisDesigns(List<BlDnDesignWorks> hisDesigns) {
		this.hisDesigns = hisDesigns;
	}
	@JSON(serialize = true)
	@Transient
	public LtSpMember getMb() {
		return mb;
	}

	public void setMb(LtSpMember mb) {
		this.mb = mb;
	}
	@Column(name = "WorksKind")
	public Integer getWorksKind() {
		return worksKind;
	}

	public void setWorksKind(Integer worksKind) {
		this.worksKind = worksKind;
	}
	@Column(name = "Lt_DnHouseTypeID")
	public Integer getLtDnHouseTypeID() {
		return ltDnHouseTypeID;
	}

	public void setLtDnHouseTypeID(Integer ltDnHouseTypeID) {
		this.ltDnHouseTypeID = ltDnHouseTypeID;
	}
	@Transient
	public String getMemberImagePath() {
		return memberImagePath;
	}

	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}

	@Column(name = "EvaCount")
	public Integer getEvaCount() {
		return evaCount;
	}

	public void setEvaCount(Integer evaCount) {
		this.evaCount = evaCount;
	}
	
	
		
	
}
