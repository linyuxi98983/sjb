package com.jshop.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.common.GEnum.PicType;
import com.jshop.dao.LtSpMhomepageDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.LtSpMhomePagePicture;
import com.jshop.entity.LtSpMhomepage;
import com.jshop.entity.Pager;
import com.jshop.vo.ImageListVo;

@Repository
public class LtSpMhomepageDaoImpl extends BaseDaoImpl<LtSpMhomepage, Integer>
		implements LtSpMhomepageDao {

	
	@Resource
	private OtSpPictureDao pictureDao;

	/******************************************** web部分 *************************************************/
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select m.* from Lt_SpMhomepage m";
		// + " left join Ot_SpPicture p on m.Ot_SpPictureID = p.ID";
		String sqlCount = "select count(*) from Lt_SpMhomepage m ";
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

		return getSession().createSQLQuery(sql).addEntity(LtSpMhomepage.class)
				.list();
	}

	@Override
	public LtSpMhomepage getWebEntity(Integer id) {
		LtSpMhomepage entity = get(id);

		// 获取商品图片
		entity.setPicList(getPicList(id));

		
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery(
							"delete from Lt_SpMhomepage where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtSpMhomepage entity) throws Exception {
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
		imageListVo.setImgTableName("Lt_SpMHomePagePicture");
		imageListVo.setOrderNos(entity.getOrderNos());
		imageListVo.setPicType(PicType.MHOMEPAGE);
		imageListVo.setPk("Ot_SpPictureID");
		imageListVo.setIdField("Lt_SpMHomepageID");
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
	private void updatePicListUrl(Integer mhomepageId, String urls) {
		if (StringUtils.isNotEmpty(urls)) {
			String[] urlArr = urls.split(",");
			List<LtSpMhomePagePicture> picList = getSession()
					.createQuery(
							"from LtSpMhomePagePicture where ltSpMhomepageId = ?")
					.setParameter(0, mhomepageId).list();
			for (int i = 0; i < picList.size(); i++) {
				if (urlArr.length < i + 1) {
					break;
				}
				String url = urlArr[i].trim();
				if (StringUtils.isNotEmpty(url)) {
					LtSpMhomePagePicture picture = picList.get(i);
					getSession()
							.createSQLQuery(
									"update lt_spmhomepagePicture set url = ? where ID = ?")
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
	public List<LtSpMhomePagePicture> getPicList(Integer mhomepageId) {
		List<LtSpMhomePagePicture> mhomePagePictureList = new ArrayList<LtSpMhomePagePicture>(
				0);
		List<Object[]> list = getSession()
				.createSQLQuery(
						"select sp.*,p.picFileName from Lt_SpMHomePagePicture sp,Ot_SpPicture p where"
								+ " sp.Ot_SpPictureId = p.ID and Lt_SpMHomePageId = ?")
				.addEntity(LtSpMhomePagePicture.class).addScalar("picFileName")
				.setParameter(0, mhomepageId).list();
		for (Object[] objects : list) {
			LtSpMhomePagePicture mhomePagePicture = (LtSpMhomePagePicture) objects[0];
			String picFileName = (String) objects[1];
			mhomePagePicture.setImagePath(pictureDao.getImagePath(picFileName));
			mhomePagePictureList.add(mhomePagePicture);
		}
		return mhomePagePictureList;
	}

	/******************************************** web部分 *************************************************/

	/******************************************** mobile部分 *************************************************/
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select * from Lt_SpMhomepage where closed = 0 and getdate() < showEndTime and (moduleType != 1 or lt_SpPromotionID not in(select ID from lt_SpPromotion where closed = 1 or endTime < getdate())) order by orderNo";
		List<LtSpMhomepage> list = getSession().createSQLQuery(sql)
				.addEntity(LtSpMhomepage.class).list();
		for (LtSpMhomepage ltSpMhomepage : list) {
			switch (ltSpMhomepage.getModuleType()) {
			case 0:// 广告
				ltSpMhomepage.setPicList(getPicList(ltSpMhomepage.getId()));
				break;
			
			case 4:// 纯HTML片段
				break;
			}
		}
		return list;
	}

	@Override
	public LtSpMhomepage getShopEntity(Integer id) {
		return getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		deleteWebIds(ids);
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtSpMhomepage entity)
			throws Exception {
		return saveOrUpdateWebEntity(entity);
	}

	/*public List<LtSpGoodsType> getShopGoodsTypeList(Integer level1Top,
			Integer level2Top) {
		List<LtSpGoodsType> list = goodsTypeDao
				.getHomepageList(null, level1Top);
		for (LtSpGoodsType ltSpGoodsType : list) {
			List<LtSpGoodsType> childList = goodsTypeDao.getHomepageList(
					ltSpGoodsType.getId(), level2Top);
			ltSpGoodsType.setChildList(childList);
		}
		return null;
	}*/


	/******************************************** mobile部分 *************************************************/
}
