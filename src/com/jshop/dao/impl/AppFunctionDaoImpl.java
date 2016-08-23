package com.jshop.dao.impl;

import org.springframework.stereotype.Repository;

import com.jshop.dao.AppFunctionDao;
import com.jshop.entity.AppFunction;
import net.sf.json.JSONObject;
import com.jshop.action.app.function.HandleAppFunction;

@Repository
public class AppFunctionDaoImpl extends BaseDaoImpl<AppFunction, Integer>
		implements AppFunctionDao {
	@Override
	public String getData(JSONObject data) {
		return HandleAppFunction.getInstance().HandleData(getSession(), data);
	}

	@Override
	public String updateData(JSONObject data) {
		return HandleAppFunction.getInstance().HandleData(getSession(), data);
	}
}
