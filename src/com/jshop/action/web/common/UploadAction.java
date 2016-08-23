package com.jshop.action.web.common;

import java.io.File;
import java.io.IOException;
import java.net.SocketException;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.FileEntity;
import com.jshop.common.Global;
import com.jshop.util.FtpUtil;

@ParentPackage(Global.PP_WEB)
public class UploadAction extends BaseWebAction {

	private static final long serialVersionUID = 1715839689298061688L;

	private String fileType;
	private File file;
	private String fileFileName;
	private Integer error;
	private String url;
	private String path;
	private String uploadpath = "301/detail/";
	private List<FileEntity> list;

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public Integer getError() {
		return error;
	}

	public String getUrl() {
		return url;
	}

	@Override
	public List<FileEntity> getList() {
		return list;
	}

	public void setList(List<FileEntity> list) {
		this.list = list;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String upload() throws SocketException, IOException {
		logger.debug("fileType=" + fileType + ",file=" + file
				+ ",fileFileName=" + fileFileName);
		// {"error":0,"url":"\/ke4\/attached\/11385343fbf2b211e9875a05ca8065380dd78ed4.jpg"}
		/*
		 * String filename = (new FtpUtil()).uploadFtpFile(file, uploadpath,
		 * fileFileName, true); error = 0; url =
		 * ApplicationConfig.getFilePath(uploadpath + filename);
		 */
		return JSON;
	}

	public String file_manager_json() throws IOException {
		if ("/".equals(path)) {
			path = uploadpath;
		}
		logger.debug("path=" + path);
		list = (new FtpUtil()).getFtpFileList(path);
		return JSON;
	}
}
