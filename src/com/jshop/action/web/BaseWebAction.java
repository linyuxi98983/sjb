package com.jshop.action.web;

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

import com.jshop.common.Global;
import com.jshop.dao.BaseWebCRUDDao;
import com.jshop.entity.LtSpOperator;

public class BaseWebAction<T, PK extends Serializable> extends
		BaseCRUDAction<T, PK> {

	private static final long serialVersionUID = -4912295180934545532L;

	private BaseWebCRUDDao<T, PK> baseWebCRUDDao;

	public void setBaseWebCRUDDao(BaseWebCRUDDao<T, PK> baseWebCRUDDao) {
		this.baseWebCRUDDao = baseWebCRUDDao;
	}

	@Override
	public String list() {
		pager = loadPager();
		list = baseWebCRUDDao.getWebList(pager, searchProperties);
		return LIST;
	}

	public String save() throws Exception {
		baseWebCRUDDao.saveOrUpdateWebEntity(entity);
		if (StringUtils.isNotEmpty(result)) {
			success = true;
			return result;
		}
		return list();
	}

	@Override
	public String add() {
		return ADD;
	}

	@Override
	public String edit() {
		entity = baseWebCRUDDao.getWebEntity(id);
		if (StringUtils.isNotEmpty(result)) {
			success = true;
			return result;
		}
		return EDIT;
	}

	public String delete() {
		baseWebCRUDDao.deleteWebIds(ids);
		this.success = true;
		return JSON;
	}

	public String update() throws Exception {
		baseWebCRUDDao.updateDynamic(entity);
		this.success = true;
		return JSON;
	}

	protected LtSpOperator getLoginer() {
		LtSpOperator loginer = (LtSpOperator) getSession(Global.SESSION_KEY_LOGINER);
		return loginer;
	}
}
