package com.jshop.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class FileUtil {

	public static final String ENCODING = "UTF-8";

	/**
	 * 得到文件扩展名
	 */
	public static String getExt(String fileName) {
		int potPos = fileName.lastIndexOf('.') + 1;
		String type = fileName.substring(potPos, fileName.length());
		return type;
	}

	/**
	 * 生成唯一名字
	 */
	public static String getUniqueName(String fileName) {
		return UUID.randomUUID().toString() + "." + getExt(fileName);
	}

	/**
	 * 读取文件内容并以字符串的形式返回
	 */
	public static String readFileContent(String path) {
		File file = new File(ServletActionContext.getServletContext()
				.getRealPath(path));
		String fileContent = null;
		if (file.exists()) {
			try {
				fileContent = FileUtils.readFileToString(file, ENCODING);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileContent;
	}

	/**
	 * 将字符串内容写入文件中
	 * 
	 * @param path
	 *            文件路径
	 * @param fileContent
	 *            文件内容
	 * @return 成功与否
	 */
	public static boolean writeFileContent(String path, String fileContent) {
		File file = new File(ServletActionContext.getServletContext()
				.getRealPath(path));
		boolean isSuccess = false;
		if (file.exists()) {
			try {
				FileUtils.writeStringToFile(file, fileContent, ENCODING);
				isSuccess = true;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	/**
	 * 递归删除文件及文件夹
	 * 
	 * @param dir
	 *            文件夹路径
	 * @return 成功与否标志
	 */
	public static boolean deleteFolder(File dir) {
		File filelist[] = dir.listFiles();
		for (int i = 0; i < filelist.length; i++) {
			if (filelist[i].isDirectory()) {
				deleteFolder(filelist[i]);
			} else {
				if (!filelist[i].delete()) {
					return false;
				}
			}
		}
		if (!dir.delete()) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 判断文件夹是否存在，不存在则创建
	 * 
	 * @param filePath
	 * @return
	 */
	public static boolean createIfNotExists(String filePath) {
		File file = new File(filePath);
		if (!file.exists() || !file.isDirectory()) {
			file.mkdir();
		}
		return true;
	}

	public static boolean copyFile(String fileFrom, String fileTo) {
		try {
			FileInputStream in = new java.io.FileInputStream(fileFrom);
			FileOutputStream out = new FileOutputStream(fileTo);
			byte[] bt = new byte[1024];
			int count;
			while ((count = in.read(bt)) > 0) {
				out.write(bt, 0, count);
			}
			in.close();
			out.close();
			return true;
		} catch (IOException ex) {
			return false;
		}
	}
}
