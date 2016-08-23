package com.jshop.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.LtSpSeoDao;
import com.jshop.entity.LtSpSeo;
import com.jshop.entity.Pager;
import com.jshop.util.FreemarkerUtil;

@Repository
public class LtSpSeoDaoImpl extends BaseDaoImpl<LtSpSeo, Integer> implements
		LtSpSeoDao {

	/*@Resource
	private LtSpGoodsDao goodsDao;
	@Resource
	private LtSpGoodsTypeDao goodsTypeDao;*/
	@Resource
	private LtSpMemberDao memberDao;

	/*
	 * @Resource private BlSpOrderDao orderDao;
	 */
	/******************************************** web部分 *************************************************/
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select m.* from Lt_SpSeo m";
		String sqlCount = "select count(*) from Lt_SpSeo m ";
		String where = " where 1=1 ";

		if (searchProperties != null) {
			String keywords = searchProperties.get("keywords");
			if (StringUtils.isNotEmpty(keywords)) {
				where += " and m.keywords like '%" + keywords + "%'";
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

		List<LtSpSeo> list = getSession().createSQLQuery(sql)
				.addEntity(LtSpSeo.class).list();
		return list;
	}

	@Override
	public LtSpSeo getWebEntity(Integer id) {
		LtSpSeo entity = get(id);
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery("delete from Lt_SpSeo where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtSpSeo entity) throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		} else {
			updateDynamic(entity);
		}
		return id;
	}

	/******************************************** web部分 *************************************************/

	/******************************************** mobile部分 *************************************************/
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		return getWebList(pager, searchProperties);
	}

	@Override
	public LtSpSeo getShopEntity(Integer id) {
		return getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		deleteWebIds(ids);
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtSpSeo entity) throws Exception {
		return saveOrUpdateWebEntity(entity);
	}

	@Override
	public LtSpSeo getShopEntityByUrl(String url, String moduleName,
			HttpServletRequest request) {
		LtSpSeo seo = (LtSpSeo) getSession()
				.createSQLQuery("select top 1 * from Lt_SpSeo where remark = ?")
				.addEntity(LtSpSeo.class).setParameter(0, url).uniqueResult();

		if (seo != null && StringUtils.isNotEmpty(moduleName)) {
			String idstr = request.getParameter("id");
			if (StringUtils.isNotEmpty(idstr)) {
				Integer id = Integer.parseInt(idstr);
				String rootname = "entity";
				Map<String, Object> root = new HashMap<String, Object>();
				/*if (moduleName.equals("goods")) {// 商品
					LtSpGoods entity = goodsDao.get(id);
					root.put(rootname, entity);
				} else if (moduleName.equals("goodstype")) {// 商品分类
					LtSpGoodsType entity = goodsTypeDao.get(id);
					root.put(rootname, entity);
				} else if (moduleName.equals("member")) {// 会员
					LtSpMember entity = memberDao.get(id);
					root.put(rootname, entity);
				} else if (moduleName.equals("order")) {// 订单
					
					 * BlSpOrder entity = orderDao.get(id); root.put(rootname,
					 * entity);
					 
				}*/

				if (root.size() > 0) {
					seo = getShopEntitySeo(seo, root);
				}
			}
		}
		return seo;
	}

	private LtSpSeo getShopEntitySeo(LtSpSeo entity, Map<String, Object> root) {
		entity.setTitle(FreemarkerUtil.processTemplateContent(
				entity.getTitle(), root));
		entity.setDescription(FreemarkerUtil.processTemplateContent(
				entity.getDescription(), root));
		entity.setKeywords(FreemarkerUtil.processTemplateContent(
				entity.getKeywords(), root));
		return entity;
	}
	/******************************************** mobile部分 *************************************************/
}
