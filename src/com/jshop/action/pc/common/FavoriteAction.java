package com.jshop.action.pc.common;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.action.shop.BaseShopAction;
import com.jshop.common.Global;
import com.jshop.dao.LtSpFavoriteDao;
import com.jshop.entity.LtSpFavorite;
import com.jshop.util.SpringUtil;
@Namespace("/"+Global.PP_SHOP+"/member")
@ParentPackage(Global.PP_SHOP)
@Action("favorite")
public class FavoriteAction extends BaseShopAction<LtSpFavorite,Integer>{

	
	private LtSpFavoriteDao favoriteDao;
	@Resource
	public void setFavoriteDao(LtSpFavoriteDao favoriteDao) {
		this.setBaseShopCRUDDao(favoriteDao);
		this.favoriteDao = favoriteDao;
		super.entity = new LtSpFavorite();
		this.setSession(getSession());
	}

	
	public String list(){
		if (searchProperties == null) {
			searchProperties = new HashMap<String, String>();
		}
		searchProperties.put("result", ("goods"));
		list = favoriteDao.getShopList(loadPager(), searchProperties);
		return "favorite";
	}
	
	public String save() throws Exception {
		LtSpFavorite favorite =  favoriteDao.getShopEntity(entity.getObjectId());
		if(favorite != null){			
			this.success = false;
			this.msg = SpringUtil.getMessage("global.favorite.exisits");
		}else{
			favoriteDao.saveOrUpdateShopEntity(entity);
			this.msg = SpringUtil.getMessage("global.favorite.success");
			this.success = true;
		}
		
		return JSON;
	}
	
	
	public String delete() {
		favoriteDao.deleteByObject(entity);
		this.success = true;
		return JSON;
	}
}
