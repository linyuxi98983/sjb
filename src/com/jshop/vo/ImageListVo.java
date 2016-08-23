package com.jshop.vo;

import java.io.File;

import com.jshop.common.GEnum.PicType;

/**
 * 用于传递图片列表，如商品图片列表
 * 
 * @author syx
 * 
 */
public class ImageListVo {

	private Integer id;// 主表实体ID，如商品ID
	private File[] imageFiles;// 上传图片文件
	private String[] imageFilesFileName;// 上传图片名称
	private String orderNos;// 图片排序号
	private String deleteImageIds;// 被删除的图片ID
	private String idField;// 从表上的主表字段名，如Lt_SpGoodsID
	private String pk;// 外键字段
	private String imgTableName;// 图片从表
	private PicType picType;// 图片类型

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public File[] getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(File[] imageFiles) {
		this.imageFiles = imageFiles;
	}

	public String[] getImageFilesFileName() {
		return imageFilesFileName;
	}

	public void setImageFilesFileName(String[] imageFilesFileName) {
		this.imageFilesFileName = imageFilesFileName;
	}

	public String getOrderNos() {
		return orderNos;
	}

	public void setOrderNos(String orderNos) {
		this.orderNos = orderNos;
	}

	public String getDeleteImageIds() {
		return deleteImageIds;
	}

	public void setDeleteImageIds(String deleteImageIds) {
		this.deleteImageIds = deleteImageIds;
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}

	public String getImgTableName() {
		return imgTableName;
	}

	public void setImgTableName(String imgTableName) {
		this.imgTableName = imgTableName;
	}

	public String getPk() {
		return pk;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}

	public PicType getPicType() {
		return picType;
	}

	public void setPicType(PicType picType) {
		this.picType = picType;
	}

}
