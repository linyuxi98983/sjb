package com.jshop.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import com.jshop.action.web.BaseAction;
import com.jshop.common.ApplicationConfig;
import com.jshop.common.FileEntity;
import com.jshop.common.GEnum.PicType;

public class FtpUtil {

	private static FtpUtil ftpUtil;

	public static synchronized FtpUtil getInstance() {
		if (ftpUtil == null) {
			ftpUtil = new FtpUtil();
		}
		return ftpUtil;
	}

	private FTPClient createFTPClient() throws SocketException, IOException {
		ApplicationConfig appConfig = ApplicationConfig.getInstance();
		String ftpuser = appConfig.getFtpuser();
		String ftppasswd = appConfig.getFtppassword();
		String ftpurl = appConfig.getFtpurl();
		Integer ftpport = appConfig.getFtpport();

		BufferedInputStream buffIn = null;
		FTPClient ftpClient = new FTPClient();
		ftpClient.connect(ftpurl, ftpport);
		ftpClient.login(ftpuser, ftppasswd);
		ftpClient.setSoTimeout(1000 * 60 * 5);
		ftpClient.setControlEncoding("UTF-8");
		ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
		int reply = ftpClient.getReplyCode();
		if (!FTPReply.isPositiveCompletion(reply)) {
			ftpClient.disconnect();
			BaseAction.logger
					.error("FTP Server refused connection.replyCode = " + reply
							+ ",replyString=" + ftpClient.getReplyString());
		}

		return ftpClient;
	}

	public String uploadFtpFile(PicType picType, File sourceFile,
			String fileName) throws SocketException, IOException {
		return uploadFtpFile(picType, sourceFile, "/", fileName);
	}

	public String uploadFtpFile(PicType picType, File sourceFile,
			String fileName, boolean isUUID) throws SocketException,
			IOException {
		return uploadFtpFile(picType, sourceFile, "/", fileName, isUUID);
	}

	public String uploadFtpFile(PicType picType, File sourceFile,
			String uploadPath, String fileName) throws SocketException,
			IOException {
		return uploadFtpFile(picType, sourceFile, uploadPath, fileName, true);
	}

	public String uploadFtpFile(PicType picType, InputStream inputStream,
			String uploadPath, String fileName, boolean isUUID)
			throws SocketException, IOException {
		ApplicationConfig appConfig = ApplicationConfig.getInstance();
		String uploaddir = appConfig.getUploaddir();

		FTPClient ftpClient = createFTPClient();
		if (isUUID) {
			UUID uuid = UUID.randomUUID();
			fileName = picType.name() + "_" + uuid
					+ fileName.substring(fileName.indexOf("."));
		}
		// File destFile = new File(uploaddir+imageFilesFileName[i]);
		// FileUtils.copyFile(imageFile, destFile);
		BufferedInputStream buffIn = new BufferedInputStream(inputStream);
		String dir = uploaddir + uploadPath;
		boolean isNotExist = ftpClient.makeDirectory(dir);
		BaseAction.logger.debug("isNotExist:" + isNotExist);
		String name = dir + fileName;
		BaseAction.logger.debug("filename:" + name);
		ftpClient.storeFile(name, buffIn);
		return fileName;
	}

	public String uploadFtpFile(PicType picType, File sourceFile,
			String uploadPath, String fileName, boolean isUUID)
			throws SocketException, IOException {
		return uploadFtpFile(picType, new FileInputStream(sourceFile),
				uploadPath, fileName, isUUID);
	}

	public List<FileEntity> getFtpFileList(String filePath) throws IOException {
		FTPClient ftpClient = createFTPClient();
		boolean f = ftpClient.changeWorkingDirectory(filePath);
		System.out.println("changeWorkingDirectory,success=" + f);
		FTPFile[] files = ftpClient.listFiles();
		List<FileEntity> list = new ArrayList<FileEntity>(0);
		FileEntity fileEntity = null;
		for (FTPFile ftpFile : files) {
			fileEntity = new FileEntity();
			fileEntity.setIsDirectory(ftpFile.isDirectory());
			fileEntity.setName(ftpFile.getName());
			fileEntity.setSize(ftpFile.getSize());
			fileEntity
					.setLastModified(ftpFile.getTimestamp().getTimeInMillis());
			fileEntity.setUrl(ApplicationConfig.getFilePath(filePath
					+ ftpFile.getName()));
			list.add(fileEntity);
		}
		return list;
	}

	/**
	 * 下载FTP文件
	 * 
	 * @param ftpFileName
	 *            ftp 文件路径
	 * @param localFileName
	 *            本地文件路径
	 * @return
	 * @throws Exception
	 */
	public boolean downFtpFile(String ftpFileName, File localFile)
			throws Exception {
		FTPClient ftpClient = createFTPClient();
		FileOutputStream fos = new FileOutputStream(localFile);
		try {
			boolean isSuccess = ftpClient.retrieveFile(ftpFileName, fos);
			return isSuccess;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			fos.flush();
			fos.close();
		}
		return false;
	}
}
