package com.jshop.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LtSpFavorite entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "Lt_SpFavorite", schema = "dbo")
public class LtSpFavorite implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer ltSpMemberId;
	private Integer keepKind;
	private Integer objectId;
	private Timestamp keepTime;

	// Constructors

	/** default constructor */
	public LtSpFavorite() {
	}

	/** full constructor */
	public LtSpFavorite(Integer id, Integer ltSpMemberId, Integer keepKind,
			Integer objectId, Timestamp keepTime) {
		this.id = id;
		this.ltSpMemberId = ltSpMemberId;
		this.keepKind = keepKind;
		this.objectId = objectId;
		this.keepTime = keepTime;
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

	@Column(name = "Lt_SpMemberID", nullable = false)
	public Integer getLtSpMemberId() {
		return this.ltSpMemberId;
	}

	public void setLtSpMemberId(Integer ltSpMemberId) {
		this.ltSpMemberId = ltSpMemberId;
	}

	@Column(name = "KeepKind", nullable = false)
	public Integer getKeepKind() {
		return this.keepKind;
	}

	public void setKeepKind(Integer keepKind) {
		this.keepKind = keepKind;
	}

	@Column(name = "ObjectID", nullable = false)
	public Integer getObjectId() {
		return this.objectId;
	}

	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}

	@Column(name = "KeepTime", nullable = false, length = 23)
	public Timestamp getKeepTime() {
		return this.keepTime;
	}

	public void setKeepTime(Timestamp keepTime) {
		this.keepTime = keepTime;
	}

}