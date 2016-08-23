package com.jshop.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.common.GEnum.FilterList;
import com.jshop.common.GEnum.LSelect;
import com.jshop.common.GEnum.Select;
import com.jshop.dao.ControlDao;

@Repository
public class ControlDaoImpl extends BaseDaoImpl implements ControlDao {

	@Override
	public List getFilterList(FilterList type, HttpServletRequest request) {
		String sql = null;
		switch (type) {
		case GOODS:
			sql = "select id,name from Lt_SpGoods where closed = 0 and saleStartTime <= getdate() and getdate() < saleEndTime order by editTime desc";
			break;
		case SPEC:
			String groupId = request.getParameter("groupId");
			sql = "select id,name from Lt_SpSpec where Lt_SpSpecGroupId = "
					+ groupId;
			break;
		case BRAND:
			sql = "select id,name from Lt_SpBrand order by OrderNo";
			break;
		case SHOP:
			sql = "select id,name from Lt_SpShop";
			break;
		case MEMBER:
			sql = "select id,nickname as name,phoneNo from lt_spmember order by registerTime desc";
			break;
		case PROMOTION:
			sql = "select id,name,case when promotionType=0 then '促销' else '团购' end as promotionType from lt_sppromotion order by orderNo asc";
			break;
		case DELIVERYMAN:
			sql = "select id,name,jobNo from lt_spdeliveryman where closed=0 order by ID DESC";
			break;
		
		default:
			break;
		}
		return getSession().createSQLQuery(sql).list();
	}

	@Override
	public List getLSelectList(LSelect type, Integer parentId) {
		String sql = null;
		String where = " where parentId is null";
		if (parentId != null) {
			where = " where parentId = " + parentId;
		}
		switch (type) {
		case GOODSTYPE_NODES:
			// 只选有三级的
			if (parentId == null) {
				where += " and id in(select distinct(topParentId) from Lt_SpGoodsType)";
			} else {
				where += " and ((topParentID is null and ID in (select distinct(parentId) from lt_spgoodstype)) or topParentID is not null)";
			}
			sql = "select id,name from Lt_SpGoodsType" + where;
			break;
		case GOODSTYPE_PARENTS:
			sql = "select id,name from Lt_SpGoodsType" + where
					+ " and topParentId is null";
			break;
		case GOODSTYPE_TOPPARNETS:
			if (parentId != null) {
				return null;
			}
			sql = "select id,name from Lt_SpGoodsType where parentId is null";
			break;
		case SHOPTYPE_NODES:
			sql = "select id,name from Lt_SpShopType" + where;
			break;
		case SHOPTYPE_PARENTS:
			if (parentId != null) {
				return null;
			}
			sql = "select id,name from Lt_SpShopType where parentId is null";
			break;
		case AREA_NODES:
			where = where + " and closed = 0";
			sql = "select id,name from Sys_SpArea" + where;
			break;
		case STREET_NODES:
			sql = "select * from Lt_spstreet where closed=0 and sys_spareaId = "
					+ parentId;
			break;
		default:
			break;
		}
		return getSession().createSQLQuery(sql).list();
	}

	@Override
	public List getSelectList(Select type, HttpServletRequest request) {
		String sql = null;
		switch (type) {
		case PROJECT_TYPE:
			sql = "select id,name from Lt_DnProjectType where 1=1 order By orderNo";
			
		case DESIGN_STYLE:
			sql = "select id,name from Lt_DnRenovationStyle where 1=1 order By orderNo";
			break;
		case SPACE_TYPE:
			sql = "select id,name from Lt_DnSpaceType where 1=1 order By orderNo";
			break;
		case MEMBER_TYPE_DESIGN:
			sql = "select id,nickname from Lt_SpMember where 1=1 and MemberType = 1 order By PhoneNo";
			break;
		case MEMBER_TYPE_ORG:
			sql = "select id,nickname from Lt_SpMember where 1=1 and MemberType = 2 order By PhoneNo";
			break;
		case HOUSE_TYPE:
			sql = "select id,name from Lt_DnHouseType where 1=1 order By orderNo";
			break;
		case MEMBER:
			sql = "select id,nickname from Lt_SpMember where 1=1 and MemberType >0 order By PhoneNo";
			break;
		default:
			break;
		}
		return getSession().createSQLQuery(sql).list();
	}

	/**
	 * 更新列表排序号
	 * 
	 * @param orderNo
	 * @param tableName
	 */
	@Override
	public void updateOrder(String orderNo, String tableName) {

		String[] orders = orderNo.split(",");
		for (int i = 0; i < orders.length; i++) {
			String[] arr = orders[i].split("_");
			if (arr.length == 2) {
				String id = arr[0].trim();
				String no = arr[1].trim();
				if (StringUtils.isNotEmpty(id) && StringUtils.isNotEmpty(no)) {
					String sql = "update " + tableName
							+ " set orderNo = ? where id = ?";
					getSession().createQuery(sql)
							.setParameter(0, Integer.parseInt(no))
							.setParameter(1, Integer.parseInt(id))
							.executeUpdate();
				}
			}
		}
	}
}
