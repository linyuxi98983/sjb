package com.jshop.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.LtSpOperatorDao;
import com.jshop.entity.LtSpOperator;
import com.jshop.entity.Pager;

@Repository
public class LtSpOperatorDaoImpl extends BaseDaoImpl<LtSpOperator, Integer>
		implements LtSpOperatorDao {

	/******************************************** web部分 *************************************************/
	@Override
	public List<LtSpOperator> getWebList(Pager pager,
			Map<String, String> searchProperties) {
		String sql = "select * from Lt_SpOperator m";
		String sqlCount = "select count(*) from Lt_SpOperator m ";
		String where = " where 1=1 ";

		if (searchProperties != null) {
			String name = searchProperties.get("name");
			String loginName = searchProperties.get("loginName");
			String department = searchProperties.get("department");
			if (StringUtils.isNotEmpty(name)) {
				where += " and m.name like '%" + name + "%'";
			}
			if (StringUtils.isNotEmpty(loginName)) {
				where += " and m.loginName like '%" + loginName + "%'";
			}
			if (StringUtils.isNotEmpty(department)) {
				where += " and m.department like '%" + department + "%'";
			}
			if (where.length() > 0) {
				sql += where;
				sqlCount += where;
			}
		}

		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("ID");
			pager.setOrderDirection("asc");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));

		return getSession().createSQLQuery(sql).addEntity(LtSpOperator.class)
				.list();
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery(
							"delete from Lt_SpOperator where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtSpOperator entity) throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		} else {
			updateDynamic(entity);
		}
		return id;
	}

	@Override
	public LtSpOperator getWebEntity(Integer id) {
		return get(id);
	}

	@Override
	public LtSpOperator getLoginer(String loginName, String password) {
		return (LtSpOperator) getSession()
				.createSQLQuery(
						"SELECT top 1 * FROM Lt_SpOperator WHERE loginName = ? and Password = ?")
				.addEntity(LtSpOperator.class)
				.setParameter(0, loginName.trim())
				.setParameter(1, password.trim()).uniqueResult();
	}

	/******************************************** web部分 *************************************************/
}
