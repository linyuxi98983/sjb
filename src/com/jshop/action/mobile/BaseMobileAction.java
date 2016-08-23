package com.jshop.action.mobile;

import java.io.Serializable;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.jshop.action.web.BaseCRUDAction;
import com.jshop.common.Global;
import com.jshop.dao.BaseShopCRUDDao;
import com.jshop.entity.LtSpMember;

public class BaseMobileAction<T, PK extends Serializable> extends
		BaseCRUDAction<T, PK> {

	private static final long serialVersionUID = 3599523309647286611L;

	private BaseShopCRUDDao<T, PK> baseShopCRUDDao;

	public void setBaseShopCRUDDao(BaseShopCRUDDao<T, PK> baseShopCRUDDao) {
		this.baseShopCRUDDao = baseShopCRUDDao;
	}

	private Map<String, Object> session;

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public String list() {
		pager = loadPager();
		list = baseShopCRUDDao.getShopList(pager, searchProperties);
		if (StringUtils.isNotEmpty(result)) {
			success = true;
			return result;
		}
		return LIST;
	}

	/**
	 * 添加或修改实体
	 * 
	 * @return
	 */
	protected String save() throws Exception {
		baseShopCRUDDao.saveOrUpdateShopEntity(entity);
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
		entity = baseShopCRUDDao.getShopEntity(id);
		if (StringUtils.isNotEmpty(result)) {
			success = true;
			return result;
		}
		return EDIT;
	}

	protected String delete() {
		baseShopCRUDDao.deleteShopIds(ids);
		this.success = true;
		return JSON;
	}

	protected String update() throws Exception {
		baseShopCRUDDao.updateDynamic(entity);
		this.success = true;
		return JSON;
	}

	protected LtSpMember getLoginer() {
		LtSpMember loginer = (LtSpMember) getSession(Global.SESSION_KEY_MOBILE_LOGINER);
		return loginer;
	}
}
