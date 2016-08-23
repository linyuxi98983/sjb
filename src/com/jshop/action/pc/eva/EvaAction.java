package com.jshop.action.pc.eva;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.mobile.BaseMobileAction;
import com.jshop.common.Global;
import com.jshop.dao.OtEvaDao;
import com.jshop.entity.OtEva;

@Namespace("/" + Global.PP_PC + "/eva")
@ParentPackage(Global.PP_PC)
@Action("eva")
public class EvaAction extends BaseMobileAction<OtEva, Integer>{

	

	private OtEvaDao evaDao;
	@Resource
	public void setEvaDao(OtEvaDao evaDao) {
		this.setBaseShopCRUDDao(evaDao);
		this.evaDao = evaDao;
		this.entity = new OtEva();
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}
	

	public String save() throws Exception {

		entity.setEvaTime(new Date());
		entity.setEvaKind(101);
		evaDao.saveOrUpdateShopEntity(entity);
		if (StringUtils.isNotEmpty(result)) {
			success = true;
			return result;
		}
		return LIST;
	}
	
}
