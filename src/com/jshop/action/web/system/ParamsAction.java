package com.jshop.action.web.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.Global;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.dao.SysParamsDao;
import com.jshop.entity.SysParams;

@Namespace("/" + Global.PP_WEB + "/params")
@ParentPackage(Global.PP_WEB)
@Action("params")
public class ParamsAction extends BaseWebAction<SysParams, Integer> {

	private static final long serialVersionUID = 1L;
	private SysParamsDao paramsDao;
	@Resource
	private OtSpPictureDao pictureDao;

	@Resource
	public void setParamsDao(SysParamsDao paramsDao) {
		setBaseWebCRUDDao(paramsDao);
		this.paramsDao = paramsDao;
		// super.entity = new SysParams();
		super.list = new ArrayList<SysParams>(0);
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}

	public void setList(List<SysParams> list) {
		this.list = list;
	}

	@Override
	public String save() throws Exception {
		paramsDao.saveOrUpdateWebEntity(list);
		return list();
	}

	// 重新生成图片缩略图
	public String recreateimg() throws Exception {
		pictureDao.saveReCutImage();
		success = true;
		return JSON;
	}
}
