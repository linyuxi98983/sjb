package com.jshop.action.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jshop.common.Global;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.LtSpPhomepageMenuDao;
import com.jshop.entity.LtSpPhomepageMenu;
import com.jshop.entity.Pager;

@ParentPackage(Global.PP_SHOP)
public class BannerAction extends BaseShopAction<LtSpPhomepageMenu, Integer> {

	private static final long serialVersionUID = 1L;
	private LtSpPhomepageMenuDao phomepageMenuDao;
	/*@Resource
	private LtSpGoodsTypeDao goodsTypeDao;*/
	private List<LtSpPhomepageMenu> menuList;
	/*private List<LtSpGoodsType> typeList;*/
	private Integer isIndex;// 是否首页
	@Resource
	private LtSpMemberDao memberDao;

	@Resource
	public void setPhomepageMenuDao(LtSpPhomepageMenuDao phomepageMenuDao) {
		this.phomepageMenuDao = phomepageMenuDao;
	}

	@Override
	public void setSearchProperties(Map<String, String> searchProperties) {
		this.searchProperties = searchProperties;
	}

	public List<LtSpPhomepageMenu> getMenuList() {
		return menuList;
	}

	/*public List<LtSpGoodsType> getTypeList() {
		return typeList;
	}*/

	public Integer getIsIndex() {
		return isIndex;
	}

	public void setIsIndex(Integer isIndex) {
		this.isIndex = isIndex;
	}

	@Override
	public String execute() throws Exception {
		// getSession().put(Global.SESSION_KEY_SHOP_LOGINER, memberDao.get(1));
		Map<String, String> searchPropertiesMenu = new HashMap<String, String>();
		searchPropertiesMenu.put("closed", "0");
		Pager pagerMenu = new Pager();
		/*typeList = goodsTypeDao.getShopListIndex(pagerMenu,
				searchPropertiesMenu);*/
		menuList = phomepageMenuDao
				.getShopList(pagerMenu, searchPropertiesMenu);
		return "banner";
	}
}
