package com.jshop.action.app.function;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.jshop.dao.AppFunctionDao;
import com.jshop.util.SpringUtil;

public class AppServlet extends HttpServlet {

	private static final long serialVersionUID = 154861281026532538L;

	/*
	 * @Override protected void doGet(HttpServletRequest req,
	 * HttpServletResponse resp) throws ServletException, IOException { }
	 */

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map requestmap = req.getParameterMap();
		JSONObject mapjson = JSONObject.fromObject(requestmap);
		/*
		 * System.out.println(mapjson.toString()); for (Object key :
		 * requestmap.keySet()) {
		 * System.out.println("key="+key+","+((String[])requestmap
		 * .get(key))[0]); }
		 */
		AppFunctionDao appFunctionDao = (AppFunctionDao) SpringUtil
				.getBean("appFunctionDaoImpl");
		JSONObject jsonObject;
		JSONArray jsonarray = mapjson.getJSONArray("json");
		if (jsonarray != null) {
			String jsonstring = mapjson.getJSONArray("json").toString();
			jsonstring = jsonstring.substring(1, jsonstring.length() - 1);
			jsonObject = JSONObject.fromObject(jsonstring);
		} else {
			jsonObject = mapjson;
		}
		String response = appFunctionDao.updateData(jsonObject);
		resp.setContentType("application/json; charset=utf-8");
		resp.setCharacterEncoding("UTF-8");
		JSONObject responsejson = new JSONObject();
		responsejson.put("success", true);
		// responsejson.put("msg", "成功调用");
		responsejson.put("result", response);
		resp.getWriter().append(responsejson.toString());
		resp.getWriter().close();
	}
}
