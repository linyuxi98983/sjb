package com.jshop.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jshop.common.GEnum.FilterList;
import com.jshop.common.GEnum.LSelect;
import com.jshop.common.GEnum.Select;

/**
 * 用于获取组件数据
 * 
 * @author syx
 * 
 */
public interface ControlDao {

	public List getFilterList(FilterList type, HttpServletRequest request);

	public List getLSelectList(LSelect type, Integer parentId);

	public List getSelectList(Select type, HttpServletRequest request);

	/**
	 * 更新列表排序号
	 * 
	 * @param orderNo
	 * @param tableName
	 */
	public void updateOrder(String orderNo, String tableName);
}
