package com.jshop.action.app.function;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseAction;
import com.jshop.common.Global;
import com.jshop.dao.AppFunctionDao;
import com.jshop.entity.AppFunction;

@Action("AppFunction")
@ParentPackage(Global.PP_APP)
public class AppFunctionAction extends BaseAppAction {

	private static final long serialVersionUID = -121009178677940592L;

	private String data;
	private String json;
	private AppFunctionDao testDao;
	private AppFunction test;
	Map map;
/*
	@Resource
	private LtSpGoodsDao goodsDao;
*/
	@Resource
	public void setTestDao(AppFunctionDao testDao) {
		this.testDao = testDao;
	}

	public String getData() {
		return data;
	}

	@Override
	public void setData(String data) {
		this.data = data;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public String getJson() {
		return json;
	}

	public Map getMap() {
		return map;
	}

	public String test() {
		return "test";
	}

	public String test2() {
		this.json = "222";

		map = new HashMap();
		for (int i = 0; i < 10; i++) {
			map.put(i + "", i + "");
			System.out.println("添加" + i + "成功");
		}
		return "test2";
	}

	public String data() {
		/*
		 * JSONObject jsonObject = JSONObject.fromObject(json); data =
		 * testDao.getData(jsonObject);
		 */

		// data = JSONArray.fromObject(goodsDao.getListTest()).toString();
		success = true;
		msg = "成功调用";
		return BaseAction.JSON;
	}

	public String updatedata() {
		JSONObject jsonObject = JSONObject.fromObject(json);
		data = testDao.updateData(jsonObject);
		success = true;
		msg = "成功调用";
		return BaseAction.JSON;
	}
}
