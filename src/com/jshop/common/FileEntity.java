package com.jshop.common;

public class FileEntity {

	private String name;
	private Long size;
	private Long lastModified;
	private String url;
	private Boolean isDirectory;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	public Long getLastModified() {
		return lastModified;
	}

	public void setLastModified(Long lastModified) {
		this.lastModified = lastModified;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Boolean getIsDirectory() {
		return isDirectory;
	}

	public void setIsDirectory(Boolean isDirectory) {
		this.isDirectory = isDirectory;
	}

}
