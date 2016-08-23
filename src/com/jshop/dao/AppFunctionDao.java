package com.jshop.dao;

import com.jshop.entity.AppFunction;
import net.sf.json.JSONObject;

public interface AppFunctionDao extends BaseDao<AppFunction, Integer> {

	public String getData(JSONObject data);

	public String updateData(JSONObject data);
}
