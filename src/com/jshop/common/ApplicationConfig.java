package com.jshop.common;

import com.jshop.util.SpringUtil;

public class ApplicationConfig {

	private static ApplicationConfig appConfig;

	public static synchronized ApplicationConfig getInstance() {
		if (appConfig == null) {
			appConfig = (ApplicationConfig) SpringUtil.getBean("appConfig");
		}
		return appConfig;
	}

	/**
	 * @param filepath
	 *            1/bf3b6e74-4373-4b38-aedf-58bae10d9fec.jpeg
	 * @return http://120.24.50.82:8080/ypmz/upload/1/bf3b6e74-4373-4b38-aedf-58
	 *         bae10d9fec.jpeg
	 */
	public static String getFilePath(String filepath) {
		return getInstance().getFileserverurl() + filepath;
	}

	/**
	 * @param picTypeId
	 *            1
	 * @param fileName
	 *            bf3b6e74-4373-4b38-aedf-58bae10d9fec.jpeg
	 * @return http://120.24.50.82:8080/ypmz/upload/1/bf3b6e74-4373-4b38-aedf-58
	 *         bae10d9fec.jpeg
	 */
	public static String getFilePath(Integer picTypeId, String fileName) {
		return getInstance().getFileserverurl() + picTypeId + "/" + fileName;
	}

	private String uploaddir;
	private String fileserverurl;
	private String ftpuser;
	private String ftpurl;
	private String ftppassword;
	private Integer ftpport;
	private Double imageratio;
	private Integer imageheight;
	private Integer imagewidth;
	private String smssoftwareSerialNo;
	private String smskey;

	public String getFileserverurl() {
		return fileserverurl;
	}

	public void setFileserverurl(String fileserverurl) {
		this.fileserverurl = fileserverurl;
	}

	public String getUploaddir() {
		return uploaddir;
	}

	public void setUploaddir(String uploaddir) {
		this.uploaddir = uploaddir;
	}

	public String getFtpuser() {
		return ftpuser;
	}

	public void setFtpuser(String ftpuser) {
		this.ftpuser = ftpuser;
	}

	public String getFtpurl() {
		return ftpurl;
	}

	public void setFtpurl(String ftpurl) {
		this.ftpurl = ftpurl;
	}

	public String getFtppassword() {
		return ftppassword;
	}

	public void setFtppassword(String ftppassword) {
		this.ftppassword = ftppassword;
	}

	public Double getImageratio() {
		return imageratio;
	}

	public void setImageratio(Double imageratio) {
		this.imageratio = imageratio;
	}

	public Integer getImageheight() {
		return imageheight;
	}

	public void setImageheight(Integer imageheight) {
		this.imageheight = imageheight;
	}

	public Integer getImagewidth() {
		return imagewidth;
	}

	public void setImagewidth(Integer imagewidth) {
		this.imagewidth = imagewidth;
	}

	public Integer getFtpport() {
		return ftpport;
	}

	public void setFtpport(Integer ftpport) {
		this.ftpport = ftpport;
	}

	public String getSmssoftwareSerialNo() {
		return smssoftwareSerialNo;
	}

	public void setSmssoftwareSerialNo(String smssoftwareSerialNo) {
		this.smssoftwareSerialNo = smssoftwareSerialNo;
	}

	public String getSmskey() {
		return smskey;
	}

	public void setSmskey(String smskey) {
		this.smskey = smskey;
	}
}
