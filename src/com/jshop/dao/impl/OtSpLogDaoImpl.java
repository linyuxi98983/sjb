package com.jshop.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.StrutsStatics;
import org.springframework.stereotype.Repository;

import com.jshop.dao.OtSpLogDao;
import com.jshop.entity.LtSpOperator;
import com.jshop.entity.OtSpLog;
import com.jshop.entity.Pager;
import com.jshop.util.SpringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;

@Repository
public class OtSpLogDaoImpl extends BaseDaoImpl<OtSpLog, Integer> implements
		OtSpLogDao {

	/******************************************** web部分 *************************************************/
	@Override
	public List<OtSpLog> getWebList(Pager pager,
			Map<String, String> searchProperties) {
		String s = " left join Lt_SpOperator o on m.Lt_SpOperatorID = o.ID "
				+ " left join Sys_module s on m.Sys_ModuleId = s.ID ";
		String sql = "select m.*,o.name as operatorName,s.name as moduleName from Ot_SpLog m"
				+ s;
		String sqlCount = "select count(*) from Ot_SpLog m " + s;
		String where = " where 1=1 ";

		if (searchProperties != null) {
			String operatorName = searchProperties.get("operatorName");
			String startDate = searchProperties.get("startDate");
			String endDate = searchProperties.get("endDate");
			String module = searchProperties.get("module");
			String record = searchProperties.get("record");
			if (StringUtils.isNotEmpty(operatorName)) {
				where += " and o.name like '%" + operatorName + "%'";
			}
			if (StringUtils.isNotEmpty(startDate)) {
				where += " and operateTime >= '" + startDate + "'";
			}
			if (StringUtils.isNotEmpty(endDate)) {
				where += " and operateTime <= '" + endDate + "'";
			}
			if (StringUtils.isNotEmpty(module)) {
				where += " and s.ID = " + module;
			}
			if (StringUtils.isNotEmpty(record)) {
				where += " and recordId = " + record;
			}
			if (where.length() > 0) {
				sql += where;
				sqlCount += where;
			}
		}

		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("operateTime");
			pager.setOrderDirection("desc");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));

		List<Object[]> list = getSession().createSQLQuery(sql)
				.addEntity(OtSpLog.class).addScalar("operatorName")
				.addScalar("moduleName").list();

		List<OtSpLog> logList = new ArrayList<OtSpLog>(0);
		for (Object[] objects : list) {
			OtSpLog log = (OtSpLog) objects[0];
			String operatorName = (String) objects[1];
			String moduleName = (String) objects[2];
			log.setOperatorName(operatorName);
			log.setModuleName(moduleName);
			logList.add(log);
		}
		return logList;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");
			getSession()
					.createSQLQuery("delete from Ot_SpLog where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(OtSpLog entity) throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		} else {
			updateDynamic(entity);
		}
		return id;
	}

	@Override
	public OtSpLog getWebEntity(Integer id) {
		return get(id);
	}

	@Override
	public void saveWebLog(ActionInvocation invocation, LtSpOperator operator)
			throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.get(StrutsStatics.HTTP_REQUEST);
		String actionMethodName = invocation.getProxy().getMethod();
		String namespace = invocation.getProxy().getNamespace();
		namespace = namespace.split("/")[2];
		String pre = MESSAGE_PACKAGE_PRE;
		String methodCn = SpringUtil.getMessage(MESSAGE_LOG_PRE
				+ actionMethodName);
		String packageCn = SpringUtil.getMessage(pre + namespace);
		if (methodCn.indexOf(MESSAGE_LOG_PRE) != -1
				|| packageCn.indexOf(pre) != -1) {
			return;
		}
		if ("save".equalsIgnoreCase(actionMethodName)) {
			String id = request.getParameter("entity.id");
			String name = request.getParameter("entity.name");
			if (StringUtils.isNotEmpty(id)) {
				OtSpLog log = new OtSpLog();
				log.setRecordId(Integer.parseInt(id));
				log.setLtSpOperatorId(operator.getId());
				log.setContent(methodCn + packageCn + ":" + name);
				saveOrUpdateWebEntity(log);
			}
		} else if ("delete".equalsIgnoreCase(actionMethodName)) {
			String ids = request.getParameter("ids");
			if (StringUtils.isNotEmpty(ids.trim())) {
				String content = methodCn + packageCn + ":" + namespace;
				String[] idArr = ids.split(",");
				for (String delId : idArr) {
					OtSpLog log = new OtSpLog();
					log.setRecordId(Integer.parseInt(delId.trim()));
					log.setLtSpOperatorId(operator.getId());
					log.setContent(content);
					saveOrUpdateWebEntity(log);
				}
			}
		}
	}
	/******************************************** web部分 *************************************************/
}
