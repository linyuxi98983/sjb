package com.jshop.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.common.GEnum.PicType;
import com.jshop.dao.LtDnInfoDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.LtSpPhomepageDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.BlDnDesignDemand;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.LtSpPhomePagePicture;
import com.jshop.entity.LtSpPhomepage;
import com.jshop.entity.OtSpPicture;
import com.jshop.entity.Pager;
import com.jshop.util.HibernateUtil;
import com.jshop.vo.ImageListVo;
import com.jshop.vo.index.IndexData;

@Repository
public class LtSpPhomepageDaoImpl extends BaseDaoImpl<LtSpPhomepage, Integer>
		implements LtSpPhomepageDao {

	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	private LtSpMemberDao memberDao;
	
	@Resource
	private LtDnInfoDao dnInfoDao;

	/******************************************** web部分 *************************************************/
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select m.* from Lt_SpPhomepage m";
		// + " left join Ot_SpPicture p on m.Ot_SpPictureID = p.ID";
		String sqlCount = "select count(*) from Lt_SpPhomepage m ";
		String where = " where 1=1 ";

		if (searchProperties != null) {
			String title = searchProperties.get("title");
			String moduleType = searchProperties.get("moduleType");
			if (StringUtils.isNotEmpty(title)) {
				where += " and m.title like '%" + title + "%'";
			}
			if (StringUtils.isNotEmpty(moduleType) && !"-1".equals(moduleType)) {
				where += " and m.moduleType = " + moduleType;
			}
			if (where.length() > 0) {
				sql += where;
				sqlCount += where;
			}
		}

		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("OrderNo");
			pager.setOrderDirection("asc");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));

		return getSession().createSQLQuery(sql).addEntity(LtSpPhomepage.class)
				.list();
	}

	@Override
	public LtSpPhomepage getWebEntity(Integer id) {
		LtSpPhomepage entity = get(id);
		entity.setPicList(getPicList(id));
		/*
		 * // 获取商品图片
		 * 
		 * 
		 * // 促销与团购 if (entity.getLtSpPromotionId() != null) {
		 * entity.setPromotionName((String) promotionDao.getPropertyValue(
		 * entity.getLtSpPromotionId(), "name")); }
		 */
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery(
							"delete from Lt_SpPhomepage where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtSpPhomepage entity) throws Exception {
		Integer id = entity.getId();
		if (id == null) {
			id = saveDynamic(entity);
		} else {
			updateDynamic(entity);
		}

		// 保存图片相关
		ImageListVo imageListVo = new ImageListVo();
		imageListVo.setId(id);
		imageListVo.setDeleteImageIds(entity.getDeleteImageIds());
		imageListVo.setImageFiles(entity.getImageFiles());
		imageListVo.setImageFilesFileName(entity.getImageFilesFileName());
		imageListVo.setImgTableName("Lt_SpPHomePagePicture");
		imageListVo.setOrderNos(entity.getOrderNos());
		imageListVo.setPicType(PicType.PHOMEPAGE);
		imageListVo.setPk("Ot_SpPictureID");
		imageListVo.setIdField("Lt_SpPHomepageID");
		pictureDao.saveImageList(imageListVo);
		// 保存图片路径
		if (StringUtils.isNotEmpty(entity.getUrls())) {
			updatePicListUrl(id, entity.getUrls());
		}
		return id;
	}

	/**
	 * 更新图片链接
	 * 
	 * @param mhomepageId
	 * @param urls
	 */
	private void updatePicListUrl(Integer homepageId, String urls) {
		if (StringUtils.isNotEmpty(urls)) {
			String[] urlArr = urls.split(",");
			List<LtSpPhomePagePicture> picList = getSession()
					.createQuery(
							"from LtSpPhomePagePicture where ltSpPhomepageId = ?")
					.setParameter(0, homepageId).list();
			for (int i = 0; i < picList.size(); i++) {
				if (urlArr.length < i + 1) {
					break;
				}
				String url = urlArr[i].trim();
				if (StringUtils.isNotEmpty(url)) {
					LtSpPhomePagePicture picture = picList.get(i);
					getSession()
							.createSQLQuery(
									"update lt_spphomepagePicture set url = ? where ID = ?")
							.setParameter(0, url)
							.setParameter(1, picture.getId()).executeUpdate();
				}
			}
		}
	}

	/**
	 * ID获取图片列表
	 * 
	 * @param goodsId
	 * @return
	 */
	public List<LtSpPhomePagePicture> getPicList(Integer phomepageId) {
		List<LtSpPhomePagePicture> phomePagePictureList = new ArrayList<LtSpPhomePagePicture>(
				0);
		List<Object[]> list = getSession()
				.createSQLQuery(
						"select sp.*,p.picFileName from Lt_SpPHomePagePicture sp,Ot_SpPicture p where"
								+ " sp.Ot_SpPictureId = p.ID and Lt_SpPHomePageId = ?")
				.addEntity(LtSpPhomePagePicture.class).addScalar("picFileName")
				.setParameter(0, phomepageId).list();
		for (Object[] objects : list) {
			LtSpPhomePagePicture phomePagePicture = (LtSpPhomePagePicture) objects[0];
			String picFileName = (String) objects[1];
			phomePagePicture.setImagePath(pictureDao.getImagePath(picFileName));
			phomePagePictureList.add(phomePagePicture);
		}
		return phomePagePictureList;
	}

	/******************************************** web部分 *************************************************/

	/******************************************** mobile部分 *************************************************/
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {

		return null;
	}

	String sql = "select g.*,lm.nickname as member,"
			+ HibernateUtil.getFirstPicFileNameSql("Bl_DnDesignWorksPicture",
					"Bl_DnDesignWorksID") + " as imagePath "
			+ " from Bl_DnDesignWorks g "
			+ " left join Lt_SpMember lm on (g.lt_SpMemberID = lm.ID)";

	@Override
	public IndexData getMobileIndexData() {
		IndexData data = new IndexData();
		String sql = "select * from Lt_SpPhomepage m where m.closed = 0 and "
				+ "moduleType = 1  order by orderNo";
		List<LtSpPhomepage> list = getSession().createSQLQuery(sql)
				.addEntity(LtSpPhomepage.class).list();
		for (LtSpPhomepage ltSpPhomepage : list) {
			ltSpPhomepage.setPicList(getPicList(ltSpPhomepage.getId()));
		}

		String caseSql = "select top 3 g.*,lm.nickname as member,"
				+ HibernateUtil.getFirstPicFileNameSql(
						"Bl_DnDesignWorksPicture", "Bl_DnDesignWorksID")
				+ " as imagePath " + " from Bl_DnDesignWorks g"
				+ " left join Lt_SpMember lm on (g.lt_SpMemberID = lm.ID) "
				+ " " + "order by g.BrowseCount";
		List<Object[]> caseList = getSession().createSQLQuery(caseSql)
				.addEntity(BlDnDesignWorks.class).addScalar("member")
				.addScalar("imagePath").list();
		List<BlDnDesignWorks> dsList = new ArrayList<BlDnDesignWorks>(0);
		for (Object[] objects : caseList) {
			BlDnDesignWorks ds = (BlDnDesignWorks) objects[0];
			String member = (String) objects[1];
			String picFileName = (String) objects[2];

			if (StringUtils.isNotEmpty(picFileName)) {
				ds.setImagePath(pictureDao.getImagePath(picFileName));
			}
			if (StringUtils.isNotEmpty(picFileName)) {
				ds.setMember(member);
			}

			if (ds.getLtSpMemberId() != null) {
				// 图片路径
				LtSpMember mb = memberDao.get(ds.getLtSpMemberId());
				if (mb.getOtSpPictureId() != null) {
					OtSpPicture picture = pictureDao.get(mb.getOtSpPictureId());
					if (picture != null) {
						ds.setMemberImagePath(pictureDao.getImagePath(picture));
					}
				}
			}

			dsList.add(ds);
		}

		data.setPhomepage(list);
		data.setMemberList(getShopPhomepageMemberList(1," order by newid()"));
		data.setOrgList(getShopPhomepageMemberList(2," order by newid()"));
		data.setDesignWorks(dsList);
		// 发布最近需求
		data.setDemandList(getShopDemandList());

		return data;
	}

	@Override
	public IndexData getIndexData() {
		IndexData data = new IndexData();
		//主页轮播
		String sql = "select * from Lt_SpPhomepage m where m.closed = 0 and "
				+ "moduleType != 1  order by orderNo";

		List<LtSpPhomepage> list = getSession().createSQLQuery(sql)
				.addEntity(LtSpPhomepage.class).list();
		for (LtSpPhomepage ltSpPhomepage : list) {
			ltSpPhomepage.setPicList(getPicList(ltSpPhomepage.getId()));
		}
		//主页案例
		

		data.setPhomepage(list);
		//设计大咖
		data.setMemberList(getShopPhomepageMemberList(1," order by newid()"));
		//行业大腕
		data.setHydwList(getShopPhomepageMemberList(1, "  order by newid()"));
		//擅长空间
		data.setSckjList(getShopPhomepageMemberList(1, " and goodsAtSpace like '%餐厅%' order by newid()"));
		data.setOrgList(getShopPhomepageMemberList(2,"  order by newid()"));
		data.setDesignWorks(getIndexCaseData(" order by newid()"));
		
		//网咖
		data.setJiazhuangWorks(getIndexCaseData(" and g.WorksKind =0 order by newid()"));
		//电竞
		data.setGongzhuangWorks(getIndexCaseData(" and g.WorksKind =1 order by newid()"));
		// 发布最近需求
		data.setDemandList(getShopDemandList());
		data.setDemandList2(getShopDemandList2());
		Pager pager = new Pager();
		pager.setOrderProperty("OrderNo");
		pager.setOrderDirection("ASC");
		
		pager.setPageNumber(1);		
		pager.setPageSize(10);	
		Map<String,String>	searchProperties = new HashMap<String, String>(0);
		
		//行业资讯
		data.setLtDnInfos(dnInfoDao.getShopList(pager, searchProperties));
		return data;
	}

	
	public List<BlDnDesignWorks> getIndexCaseData(String where){
		String caseSql = "select top 8 g.*,lm.nickname as member,"
			+ HibernateUtil.getFirstPicFileNameSql(
					"Bl_DnDesignWorksPicture", "Bl_DnDesignWorksID")
			+ " as imagePath " + " from Bl_DnDesignWorks g"
			+ " left join Lt_SpMember lm on (g.lt_SpMemberID = lm.ID) where 1=1" + where;
		
		List<Object[]> caseList = getSession().createSQLQuery(caseSql)
				.addEntity(BlDnDesignWorks.class).addScalar("member")
				.addScalar("imagePath").list();
		List<BlDnDesignWorks> dsList = new ArrayList<BlDnDesignWorks>(0);
		for (Object[] objects : caseList) {
			BlDnDesignWorks ds = (BlDnDesignWorks) objects[0];
			String member = (String) objects[1];
			String picFileName = (String) objects[2];
	
			if (StringUtils.isNotEmpty(picFileName)) {
				ds.setImagePath(pictureDao.getImagePath(picFileName));
			}
			if (StringUtils.isNotEmpty(picFileName)) {
				ds.setMember(member);
			}
	
			if (ds.getLtSpMemberId() != null) {
				// 图片路径
				LtSpMember mb = memberDao.get(ds.getLtSpMemberId());
				if (mb.getOtSpPictureId() != null) {
					OtSpPicture picture = pictureDao.get(mb.getOtSpPictureId());
					if (picture != null) {
						ds.setMemberImagePath(pictureDao.getImagePath(picture));
					}
				}
			}
	
			dsList.add(ds);
		}
		
		return dsList;
	}
	@Override
	public LtSpPhomepage getShopEntity(Integer id) {
		return getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		deleteWebIds(ids);
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtSpPhomepage entity)
			throws Exception {
		return saveOrUpdateWebEntity(entity);
	}

	/*
	 * public List<LtSpGoodsType> getShopGoodsTypeList(Integer level1Top,
	 * Integer level2Top) { List<LtSpGoodsType> list =
	 * goodsTypeDao.getWebList(null, level1Top); for (LtSpGoodsType
	 * ltSpGoodsType : list) { List<LtSpGoodsType> childList =
	 * goodsTypeDao.getWebList( ltSpGoodsType.getId(), level2Top);
	 * ltSpGoodsType.setChildList(childList); } return list; return null; }
	 */
	
	public List<LtSpMember> getShopPhomepageMemberList(Integer type, String where) {
		int count = 10;
		if(type ==2){
			count = 4;
		}
		String sql = "select top "+count+" * from Lt_SpMember m where m.memberType = "
				+ type + where;
		Pager pager = new Pager();
		List<LtSpMember> list = getSession().createSQLQuery(sql)
				.addEntity(LtSpMember.class).list();

		for (LtSpMember member : list) {
			if (member.getOtSpPictureId() != null) {
				member.setImagePath(pictureDao.getImagePath(pictureDao.get(
						member.getOtSpPictureId()).getPicFileName()));
			}
		}

		return list;
	}

	public List<BlDnDesignDemand> getShopDemandList() {
		String sql = "select top 15 * from Bl_DnDesignDemand m   order by newid()";
		Pager pager = new Pager();
		pager.setOrderProperty("PubilcDate");
		pager.setOrderDirection("desc");
		List<BlDnDesignDemand> list = getSession().createSQLQuery(sql)
				.addEntity(BlDnDesignDemand.class).list();
		for(BlDnDesignDemand demand :list){
			if(demand.getLtSpMemberId()!= null){
				demand.setMember(memberDao.getShopEntity(demand.getLtSpMemberId()).getNickname());
			}
			if(memberDao.get("phoneNo", demand.getPhoneNo())!= null){
				demand.setImagePath(memberDao.get("phoneNo", demand.getPhoneNo()).getImagePath());
			}
		}
		return list;
	}
	
	public List<BlDnDesignDemand> getShopDemandList2() {
		String sql = "select top 15 * from Bl_DnDesignDemand m   order by newid()";
		Pager pager = new Pager();
		pager.setOrderProperty("PubilcDate");
		pager.setOrderDirection("desc");
		List<BlDnDesignDemand> list = getSession().createSQLQuery(sql)
				.addEntity(BlDnDesignDemand.class).list();
		for(BlDnDesignDemand demand :list){
			if(demand.getLtSpMemberId()!= null){
				demand.setMember(memberDao.getShopEntity(demand.getLtSpMemberId()).getNickname());
			}
			/*if(memberDao.get("phoneNo", demand.getPhoneNo())!= null){
				demand.setImagePath(memberDao.get("phoneNo", demand.getPhoneNo()).getImagePath());
			}*/
		}
		return list;
	}
	/******************************************** mobile部分 *************************************************/

}
