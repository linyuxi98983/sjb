package com.jshop.action.web.common;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.web.BaseWebAction;
import com.jshop.common.GEnum.FilterList;
import com.jshop.common.GEnum.LSelect;
import com.jshop.common.GEnum.Select;
import com.jshop.common.Global;
import com.jshop.dao.ControlDao;

@ParentPackage(Global.PP_WEB)
public class ControlAction extends BaseWebAction {

	private static final long serialVersionUID = -8604187981798777439L;

	@Resource
	private ControlDao controlDao;

	private List list;
	private JSONObject json;
	private FilterList filterType;
	private LSelect lselectType;
	private Select selectType;
	private Integer parentId;
	private String tableName;
	private String orderNo;

	@Override
	public List getList() {
		return list;
	}

	public JSONObject getJson() {
		return json;
	}

	public void setFilterType(FilterList filterType) {
		this.filterType = filterType;
	}

	public void setLselectType(LSelect lselectType) {
		this.lselectType = lselectType;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public void setSelectType(Select selectType) {
		this.selectType = selectType;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String filterList() {
		HttpServletRequest request = getRequest();
		list = controlDao.getFilterList(filterType, request);
		success = true;
		return JSON;
	}

	public String lselect() {
		json = new JSONObject();
		List<Object[]> objList = controlDao.getLSelectList(lselectType,
				parentId);
		if (objList != null) {
			for (Object[] objects : objList) {
				json.put(objects[0], objects[1]);
			}
		}
		success = true;
		return JSON;
	}

	public String select() {
		list = controlDao.getSelectList(selectType, getRequest());
		success = true;
		return JSON;
	}

	public String updateListOrderNo() {
		controlDao.updateOrder(orderNo, tableName);
		success = true;
		return JSON;
	}
}
