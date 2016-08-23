package com.baidu.ueditor.hunter;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.baidu.ueditor.PathFormat;
import com.baidu.ueditor.define.AppInfo;
import com.baidu.ueditor.define.BaseState;
import com.baidu.ueditor.define.MultiState;
import com.baidu.ueditor.define.State;
import com.jshop.common.FileEntity;
import com.jshop.util.FtpUtil;

public class FileManager {

	private String dir = null;
	private String rootPath = null;
	private String[] allowFiles = null;
	private int count = 0;

	public FileManager(Map<String, Object> conf) {

		this.rootPath = (String) conf.get("rootPath");
		this.dir = this.rootPath + (String) conf.get("dir");
		this.allowFiles = this.getAllowFiles(conf.get("allowFiles"));
		this.count = (Integer) conf.get("count");

	}

	public State listFile(int index) {

		File dir = new File(this.dir);
		State state = null;

		if (!dir.exists()) {
			return new BaseState(false, AppInfo.NOT_EXIST);
		}

		if (!dir.isDirectory()) {
			return new BaseState(false, AppInfo.NOT_DIRECTORY);
		}

		Collection<File> list = FileUtils.listFiles(dir, this.allowFiles, true);

		if (index < 0 || index > list.size()) {
			state = new MultiState(true);
		} else {
			Object[] fileList = Arrays.copyOfRange(list.toArray(), index, index
					+ this.count);
			state = this.getState(fileList);
		}

		state.putInfo("start", index);
		state.putInfo("total", list.size());

		return state;

	}

	/**
	 * added by syx 列出ftp文件夹列表
	 * 
	 * @param index
	 * @return
	 */
	public State listFtpFile(int index, Map<String, Object> conf) {

		String dir = (String) conf.get("dir");
		State state = null;
		int size = 0;

		try {
			List<FileEntity> list = (new FtpUtil()).getFtpFileList(dir);
			if (list != null && list.size() > 0) {
				size = list.size();
				state = new MultiState(true);
				BaseState fileState = null;
				for (FileEntity fileEntity : list) {
					fileState = new BaseState(true);
					fileState.putInfo("url", fileEntity.getUrl());
					((MultiState) state).addState(fileState);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			return new BaseState(false, AppInfo.NOT_DIRECTORY);
		}

		state.putInfo("start", index);
		state.putInfo("total", size);

		return state;
	}

	private State getState(Object[] files) {

		MultiState state = new MultiState(true);
		BaseState fileState = null;

		File file = null;

		for (Object obj : files) {
			if (obj == null) {
				break;
			}
			file = (File) obj;
			fileState = new BaseState(true);
			fileState.putInfo("url", PathFormat.format(this.getPath(file)));
			state.addState(fileState);
		}

		return state;

	}

	private String getPath(File file) {

		String path = file.getAbsolutePath();

		return path.replace(this.rootPath, "/");

	}

	private String[] getAllowFiles(Object fileExt) {

		String[] exts = null;
		String ext = null;

		if (fileExt == null) {
			return new String[0];
		}

		exts = (String[]) fileExt;

		for (int i = 0, len = exts.length; i < len; i++) {

			ext = exts[i];
			exts[i] = ext.replace(".", "");

		}

		return exts;

	}

}
