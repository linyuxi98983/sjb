package com.jshop.dao.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.common.GEnum.PicType;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.LtDnHouseTypeDao;
import com.jshop.dao.LtDnProjectTypeDao;
import com.jshop.dao.LtDnRenovationStyleDao;
import com.jshop.dao.LtDnSpaceTypeDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.dao.SysSpAreaDao;
import com.jshop.entity.LtDnHouseType;
import com.jshop.entity.LtDnRenovationStyle;
import com.jshop.entity.LtDnSpaceType;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.OtSpPicture;
import com.jshop.entity.Pager;
import com.jshop.entity.SysSpArea;
import com.jshop.vo.designer.LtSpMemberIndexData;

@Repository
public class LtSpMemberDaoImpl extends BaseDaoImpl<LtSpMember, Integer>
		implements LtSpMemberDao {

	/*@Resource
	private SysSpAreaDao areaDao;*/
	@Resource
	private OtSpPictureDao pictureDao;
	@Resource
	private SysSpAreaDao areaDao;
	
	@Resource
	private BlDnDesignWorksDao workDao;
	
	@Resource
	private LtDnRenovationStyleDao styleDao;
	
	@Resource
	private LtDnHouseTypeDao hourseTypeDao;
	
	@Resource
	private LtDnSpaceTypeDao spaceTypeDao;
	
	@Resource
	private LtDnProjectTypeDao projectTypeDao;
	/**
	 * 按名字查找电竞风格
	 * @param spaceType
	 * @return
	 */
	public LtDnSpaceType getSpaceType(String spaceType){
		String sql = "select * from Lt_DnSpaceType where name like '%"+spaceType+"%'";
		LtDnSpaceType o = (LtDnSpaceType) getSession().createSQLQuery(sql).addEntity(LtDnSpaceType.class).uniqueResult();
		return o;
	}
	
	/**
	 * 按名字查找装修网咖风格
	 * @param spaceType
	 * @return
	 */
	public LtDnRenovationStyle getRenovationStyle(String Lt_DnRenovationStyle){
		String sql = "select * from Lt_DnRenovationStyle where name like '%"+Lt_DnRenovationStyle+"%'";
		LtDnRenovationStyle o = (LtDnRenovationStyle) getSession().createSQLQuery(sql).addEntity(LtDnRenovationStyle.class).uniqueResult();
		return o;
	}
	
	/**
	 * 按名字查找地段类别
	 * @param spaceType
	 * @return
	 */
	public LtDnHouseType getHouseType(String spaceType){
		String sql = "select * from Lt_DnHouseType where name like '%"+spaceType+"%'";
		LtDnHouseType o = (LtDnHouseType) getSession().createSQLQuery(sql).addEntity(LtDnHouseType.class).uniqueResult();
		return o;
	}
	
	public SysSpArea getSysSpArea(String area){
		String sql = "select * from Sys_SpArea where FullName like '%"+area+"%'";
		SysSpArea o = (SysSpArea) getSession().createSQLQuery(sql).addEntity(SysSpArea.class).uniqueResult();
		return o;
	}
	/******************************************** web部分 *************************************************/
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select * from Lt_SpMember m";
		String sqlCount = "select count(*) from Lt_SpMember m ";
		String where = " where 1=1 ";

		
		
		if (searchProperties != null) {
			String phoneNo = searchProperties.get("phoneNo");
			String startDate = searchProperties.get("startDate");
			String endDate = searchProperties.get("endDate");
			String nickName = searchProperties.get("nickName");
			String type = searchProperties.get("type");
			String closed = searchProperties.get("closed");
			String selectType = searchProperties.get("selectType");
			if (StringUtils.isNotEmpty(selectType)) {
				where += " and m.memberType ="+selectType;
			}
			if (StringUtils.isNotEmpty(phoneNo)) {
				where += " and m.phoneNo like '%" + phoneNo + "%'";
			}
			if (StringUtils.isNotEmpty(startDate)) {
				where += " and m.registerTime > '" + startDate + "'";
			}
			if (StringUtils.isNotEmpty(endDate)) {
				where += " and m.registerTime < '" + endDate + "'";
			}
			if (StringUtils.isNotEmpty(nickName)) {
				where += " and m.nickName like '%" + nickName + "%'";
			}
			if (StringUtils.isNotEmpty(closed) && !"2".equals(closed)) {
				where += " and m.closed = " + closed;
			}
			if (StringUtils.isNotEmpty(type)) {
				where += " and m.MemberType = " + type;
			}else{
				where += " and m.MemberType > 0";
			}
			if (where.length() > 0) {
				sql += where;
				sqlCount += where;
			}
		}

		if (StringUtils.isEmpty(pager.getOrderProperty())) {
			pager.setOrderProperty("LoginTime");
			pager.setOrderDirection("desc");
		}
		sql = pager.toPagerSql(sql);
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));

		List<LtSpMember> list = getSession().createSQLQuery(sql)
				.addEntity(LtSpMember.class).list();
		return list;
	}

	@Override
	public LtSpMember getWebEntity(Integer id) {
		LtSpMember entity = get(id);
		
		if (entity.getSysSpAreaId() != null) {
			entity.setArea(areaDao.getWebEntity(entity.getSysSpAreaId()));
		}

		// 图片路径
		if (entity.getOtSpPictureId() != null) {
			OtSpPicture picture = pictureDao.get(entity.getOtSpPictureId());
			if (picture != null) {
				entity.setImagePath(pictureDao.getImagePath(picture));
			}
		}
		
		
		if (entity.getIdFrontPictureId() != null) {
			OtSpPicture picture = pictureDao.get(entity.getIdFrontPictureId());
			if (picture != null) {
				entity.setIdFrontPictureImagePath(pictureDao.getImagePath(picture));
			}
		}
		
		if (entity.getIdBackPictureId() != null) {
			OtSpPicture picture = pictureDao.get(entity.getIdBackPictureId());
			if (picture != null) {
				entity.setIdBackPictureImagePath(pictureDao.getImagePath(picture));
			}
		}

		
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery("delete from Lt_SpMember where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(LtSpMember entity) throws Exception {
		/* 上传图片 */
		if (entity.getImage() != null) {
			OtSpPicture picture = null;
			if (entity.getOtSpPictureId() != null) {
				picture = pictureDao.get(entity.getOtSpPictureId());
			}
			picture = pictureDao.saveImage(picture, entity.getImage(),
					entity.getImageFileName(), PicType.PMEMBER);
			entity.setOtSpPictureId(picture.getId());
		}

		/* 上传身份证正面图片 */
		if (entity.getIdFrontPictureImage() != null) {
			OtSpPicture picture = null;
			if (entity.getIdFrontPictureId() != null) {
				picture = pictureDao.get(entity.getIdFrontPictureId());
			}
			picture = pictureDao.saveImage(picture, entity.getIdFrontPictureImage(),
					entity.getIdFrontPictureImageFileName(), PicType.PMEMBER);
			entity.setIdFrontPictureId(picture.getId());
		}

		
		/* 上传身份证背面图片 */
		if (entity.getIdBackPictureImage() != null) {
			OtSpPicture picture = null;
			if (entity.getIdBackPictureId() != null) {
				picture = pictureDao.get(entity.getIdBackPictureId());
			}
			picture = pictureDao.saveImage(picture, entity.getIdBackPictureImage(),
					entity.getIdBackPictureImageFileName(), PicType.PMEMBER);
			entity.setIdBackPictureId(picture.getId());
		}

		Integer id = entity.getId();
		if (id == null) {
			entity.setPoint(0);
			entity.setRegisterTime(new Timestamp(new Date().getTime()));
			id = saveDynamic(entity);
		} else {
			updateDynamic(entity);
		}
		return id;
	}
	public LtSpMemberIndexData getDesignerIndexData(Pager pager, Map<String, String> searchProperties){
		
		LtSpMemberIndexData data = new LtSpMemberIndexData();
		data.setMemberList(getShopList(pager, searchProperties));
		
		String sql = "select top 10 * from Lt_SpMember m order by newId()";
		
		List<LtSpMember> list = getSession().createSQLQuery(sql)
		.addEntity(LtSpMember.class).list();
		
		for(LtSpMember member : list){
			// 图片路径
			if (member.getOtSpPictureId() != null) {
				OtSpPicture picture = pictureDao.get(member.getOtSpPictureId());
				if (picture != null) {
					member.setImagePath(pictureDao.getImagePath(picture));
				}
			}
		}
		
		data.setMemberOnline(list);
		return data;
	}
	/******************************************** web部分 *************************************************/

	/******************************************** mobile部分 *************************************************/
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		String sql ="";
		String sqlCount = "";
		boolean flag = false;
		boolean pc_index = false;
		if(searchProperties != null){
			String index = searchProperties.get("index");
			if(StringUtils.isNotEmpty(index)){
				flag = true;
			}
			
			String des_work = searchProperties.get("DESIGNWORK");
			if(StringUtils.isNotEmpty(des_work)){
				pc_index = true;
			}
		}
		String where = " where 1=1";
		if(flag){
			sql = "select top 5 * from Lt_SpMember m";
		}else{
			sql = "select m.* from Lt_SpMember m" ;
			sqlCount= "select count(*) from Lt_SpMember m ";
			String leftJoinSql = null;
			String searchByArea = null;
			if(searchProperties != null){
				searchByArea = searchProperties.get("searchByArea");
				String MinDesignAmt = searchProperties.get("MinDesignAmt");
				String MaxDesignAmt = searchProperties.get("MaxDesignAmt");
				if(StringUtils.isNotEmpty(MinDesignAmt)){
					
					where += " and m.MinDesignAmt >=" + MinDesignAmt + " and m.MinDesignAmt <" + MaxDesignAmt;
				}else if(StringUtils.isEmpty(MinDesignAmt)&&StringUtils.isNotEmpty(MaxDesignAmt)){
					where += " and MaxDesignAmt >=" + MaxDesignAmt;
				}
				where += " and 1=1";
				String houseTypeOrSpaceType = searchProperties.get("houseTypeOrSpaceType");	
				
				if(StringUtils.isNotEmpty(houseTypeOrSpaceType)){
					/*LtDnHouseType houseTypeObj = getHouseType(houseTypeOrSpaceType);
					LtDnSpaceType spaceTypeObj = getSpaceType(houseTypeOrSpaceType);
					LtDnRenovationStyle style = getRenovationStyle(houseTypeOrSpaceType);*/
					SysSpArea area = getSysSpArea(houseTypeOrSpaceType);
					
					where += "and m.GoodsAtSpace like '%" +houseTypeOrSpaceType+"%'"; 
					if( area != null){
						
						if(area != null) {
							where += " or m.Sys_SpAreaID="+area.getId();
						}
					}
				}
				if (StringUtils.isNotEmpty(searchByArea)) {
					leftJoinSql =  " left join Sys_SpArea area on (area.ID = m.Sys_SpAreaId)";
					sql +=  leftJoinSql;
					sqlCount +=  leftJoinSql;
				}
			}
			
			if(leftJoinSql != null && !leftJoinSql.equals("")){
				where += " and area.FullName like '%"+ searchByArea +"%'";
			}
			if (searchProperties != null) {
				String phoneNo = searchProperties.get("phoneNo");
				String startDate = searchProperties.get("startDate");
				String endDate = searchProperties.get("endDate");
				String nickName = searchProperties.get("nickName");
				String type = searchProperties.get("type");
				String closed = searchProperties.get("closed");
				String keyword = searchProperties.get("keyword");
				String memberType = searchProperties.get("memberType");
				
				
				if (StringUtils.isNotEmpty(keyword)) {
					where += " and m.nickName like '%" + keyword + "%'";
				}
				if (StringUtils.isNotEmpty(phoneNo)) {
					where += " and m.phoneNo like '%" + phoneNo + "%'";
				}
				if (StringUtils.isNotEmpty(startDate)) {
					where += " and m.registerTime > '" + startDate + "'";
				}
				if (StringUtils.isNotEmpty(endDate)) {
					where += " and m.registerTime < '" + endDate + "'";
				}
				if (StringUtils.isNotEmpty(nickName)) {
					where += " and m.nickName like '%" + nickName + "%'";
				}
				if (StringUtils.isNotEmpty(closed) && !"2".equals(closed)) {
					where += " and m.closed = " + closed;
				}

				if (StringUtils.isNotEmpty(memberType)) {
					where += " and m.memberType >0 ";
				}
				
				
				if (StringUtils.isNotEmpty(type)) {
					where += " and m.type = " + type;
				}
			
				if (where.length() > 0) {
					sql += where;
					sqlCount += where;
				}
			}

			if (StringUtils.isEmpty(pager.getOrderProperty())) {
				pager.setOrderProperty("id");
				pager.setOrderDirection("desc");
			}
			
		}
		
		Object o = getSession().createSQLQuery(sqlCount).uniqueResult();
		
		sql = pager.toPagerSql(sql);
		List<LtSpMember> list = getSession().createSQLQuery(sql)
				.addEntity(LtSpMember.class).list();
		
		if(pc_index){
			for(LtSpMember member :list){
				
				// 图片路径
				if (member.getOtSpPictureId() != null) {
					OtSpPicture picture = pictureDao.get(member.getOtSpPictureId());
					if (picture != null) {
						member.setImagePath(pictureDao.getImagePath(picture));
					}
				}
				Pager p = new Pager();
				p.setPageSize(4);
				p.setOrderProperty("id");
				Map<String, String> searchProperties2 = new HashMap<String, String>();
				searchProperties2.put("memberId", member.getId()+"");
				
				if(member.getSysSpAreaId() != null){
					SysSpArea area = areaDao.get(member.getSysSpAreaId());
					if(area.getParentId()!=null){
						area.setParent(areaDao.get(area.getParentId()));						
					}
					member.setArea(area);
				}
				member.setWorksList(workDao.getShopList(pager, searchProperties2));
			}
		}
		pager.setPageCount(Integer.parseInt(o.toString()));
		return list;
	}

	@Override
	public LtSpMember getShopEntity(Integer id) {
		return getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		deleteWebIds(ids);
	}

	@Override
	public Integer saveOrUpdateShopEntity(LtSpMember entity) throws Exception {
		return saveOrUpdateWebEntity(entity);
	}

	@Override
	public LtSpMember getLogin(String name, String password) {
		return (LtSpMember) getSession()
				.createSQLQuery(
						"SELECT top 1 * FROM Lt_SpMember WHERE PhoneNo = ? and Password = ?")
				.addEntity(LtSpMember.class).setParameter(0, name.trim())
				.setParameter(1, password.trim()).uniqueResult();
	}

	/******************************************** mobile部分 *************************************************/

	@Override
	public Integer veridate(String phoneNo) {
		Object obj = getSession()
				.createSQLQuery(
						"SELECT top 1 * FROM Lt_SpMember WHERE phoneNo = ?")
				.addEntity(LtSpMember.class).setParameter(0, phoneNo.trim())
				.uniqueResult();
		if (obj != null) {
			return 1;
		}
		return 0;
	}

	@Override
	public Integer getTicketCount(Integer memberId) {
		Object o = getSession().createSQLQuery(
				"select count(*) from GetSpTicket(" + memberId + ", 1)")
				.uniqueResult();
		return Integer.parseInt(o.toString());
	}
}
