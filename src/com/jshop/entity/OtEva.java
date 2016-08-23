package com.jshop.entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

@SuppressWarnings("serial")
@Entity
@Table(name = "Ot_Eva", schema = "dbo")
public class OtEva implements java.io.Serializable {

	private Integer id;
	private Integer ltSpMemberId;
	private String content;
	private Integer parentId;
	private Date evaTime;
	private Integer evaKind;
	private Integer objectId;
	private Integer otSpPictureId;
	private String member;
	private SysSpArea area;// 地区表实体
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public OtEva(){
		
	}
	public OtEva(Integer id, Integer ltSpMemberId, String content,
			Integer parentId, Timestamp evaTime, Integer evaKind,
			Integer objectId, Integer otSpPictureId) {
		super();
		this.id = id;
		this.ltSpMemberId = ltSpMemberId;
		this.content = content;
		this.parentId = parentId;
		this.evaTime = evaTime;
		this.evaKind = evaKind;
		this.objectId = objectId;
		this.otSpPictureId = otSpPictureId;
	}
	@Column(name = "Lt_SpMemberID")
	public Integer getLtSpMemberId() {
		return ltSpMemberId;
	}
	public void setLtSpMemberId(Integer ltSpMemberId) {
		this.ltSpMemberId = ltSpMemberId;
	}
	@Column(name = "Content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(name = "ParentID")
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	@Column(name = "EvaTime")
	public Date getEvaTime() {
		return evaTime;
	}
	public void setEvaTime(Date evaTime) {
		this.evaTime = evaTime;
	}
	@Column(name = "EvaKind")
	public Integer getEvaKind() {
		return evaKind;
	}
	public void setEvaKind(Integer evaKind) {
		this.evaKind = evaKind;
	}
	@Column(name = "ObjectID")
	public Integer getObjectId() {
		return objectId;
	}
	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}
	@Column(name = "Ot_SpPictureID")
	
	public Integer getOtSpPictureId() {
		return otSpPictureId;
	}
	public void setOtSpPictureId(Integer otSpPictureId) {
		this.otSpPictureId = otSpPictureId;
	}
	@JSON(serialize = false)
	@Transient
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	@Transient
	public SysSpArea getArea() {
		return area;
	}
	public void setArea(SysSpArea area) {
		this.area = area;
	}
	
	
}
