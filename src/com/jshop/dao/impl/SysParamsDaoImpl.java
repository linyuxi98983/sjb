package com.jshop.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.SysParamsDao;
import com.jshop.entity.Pager;
import com.jshop.entity.SysParams;

@Repository
public class SysParamsDaoImpl extends BaseDaoImpl<SysParams, Integer> implements
		SysParamsDao {

	/******************************************** web部分 *************************************************/
	@Override
	public List<SysParams> getWebList(Pager pager,
			Map<String, String> searchProperties) {
		String sql = "select * from Sys_Params m";
		String sqlCount = "select count(*) from Sys_Params m ";
		String where = " where id > 1100000 ";

		if (searchProperties != null) {
			String memberLevel = searchProperties.get("memberLevel");
			if (StringUtils.isNotEmpty(memberLevel)) {
				where += " and name like 'MemberLevelName%' and value is not null and value != ''";
			}
		}

		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("ID");
			pager.setOrderDirection("asc");
		}
		if (StringUtils.isNotEmpty(where)) {
			sql += where;
		}
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));

		return getSession().createSQLQuery(sql).addEntity(SysParams.class)
				.list();
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery("delete from SysParams where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(SysParams entity) throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		} else {
			updateDynamic(entity);
		}
		return id;
	}

	@Override
	public void saveOrUpdateWebEntity(List list) throws Exception {
		for (Object object : list) {
			SysParams entity = (SysParams) object;
			if (entity.getEditType() != null && entity.getEditType() == 1) {// checkbox
				if ("on".equalsIgnoreCase(entity.getValue())) {
					entity.setValue("1");
				} else {
					entity.setValue("0");
				}
			}
			saveOrUpdateWebEntity(entity);
		}
	}

	@Override
	public SysParams getWebEntity(Integer id) {
		return get(id);
	}

	@Override
	public List<SysParams> getWebMemberLevelList() {
		Map<String, String> searchProperties = new HashMap<String, String>();
		searchProperties.put("memberLevel", "1");
		return getWebList(new Pager(), searchProperties);
	}

	@Override
	public String getWebValueByName(String name) {
		List<SysParams> list = getList("name", name);
		if (list != null && list.size() > 0) {
			if (list.get(0).getValue() != null)
				return list.get(0).getValue();
		}
		return "";
	}
	/******************************************** web部分 *************************************************/
}
