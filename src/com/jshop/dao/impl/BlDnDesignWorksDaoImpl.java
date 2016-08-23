package com.jshop.dao.impl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.net.SyslogAppender;
import org.springframework.stereotype.Repository;

import com.jshop.common.GEnum.PicType;
import com.jshop.dao.BlDnDesignWorksDao;
import com.jshop.dao.LtDnAreaMeasureDao;
import com.jshop.dao.LtDnBudgetDao;
import com.jshop.dao.LtDnHouseTypeDao;
import com.jshop.dao.LtDnProjectTypeDao;
import com.jshop.dao.LtDnRenovationStyleDao;
import com.jshop.dao.LtDnSpaceTypeDao;
import com.jshop.dao.LtSpMemberDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.dao.SysSpAreaDao;
import com.jshop.entity.BlDnDesignWorks;
import com.jshop.entity.BlDnDesignWorksPicture;
import com.jshop.entity.LtDnAreaMeasure;
import com.jshop.entity.LtDnBudget;
import com.jshop.entity.LtDnHouseType;
import com.jshop.entity.LtDnRenovationStyle;
import com.jshop.entity.LtDnSpaceType;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.OtSpPicture;
import com.jshop.entity.Pager;
import com.jshop.entity.SysSpArea;
import com.jshop.util.HibernateUtil;
import com.jshop.vo.ImageListVo;
import com.jshop.vo.cas.CaseData;
import com.jshop.vo.cas.CaseTypeIDS;
import com.jshop.vo.conditions.ConditionsVo;

@Repository
public class BlDnDesignWorksDaoImpl extends BaseDaoImpl<BlDnDesignWorks, Integer>
		implements BlDnDesignWorksDao {

	@Resource
	private OtSpPictureDao pictureDao;
	
	@Resource
	private LtDnAreaMeasureDao measureDao;
	
	@Resource
	private LtDnBudgetDao budgetDao;
	
	@Resource
	private LtDnRenovationStyleDao styleDao;
	
	@Resource
	private LtDnHouseTypeDao hourseTypeDao;
	
	@Resource
	private LtSpMemberDao memberDao;
	
	@Resource
	private LtDnSpaceTypeDao spaceTypeDao;
	@Resource
	private SysSpAreaDao areaDao;
	
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
	@Override
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		
		
		String sql = "select g.*,lm.nickname as member," +
			HibernateUtil.getFirstPicFileNameSql("Bl_DnDesignWorksPicture", "Bl_DnDesignWorksID") + " as imagePath " +
			" from Bl_DnDesignWorks g " +
			" left join Lt_SpMember lm on (g.lt_SpMemberID = lm.ID)";
		// + " left join Ot_SpPicture p on m.Ot_SpPictureID = p.ID";
		String sqlCount = "select count(*) from Bl_DnDesignWorks g ";
		String where = " where 1=1 ";

		if (searchProperties != null) {
			String title = searchProperties.get("title");
			String costAmt = searchProperties.get("costAmt");
			String sqm = searchProperties.get("sqm");
						
			String styleId = searchProperties.get("styleId");
			String typeId = searchProperties.get("typeId");
			String priceId = searchProperties.get("priceId");
			String sqmId = searchProperties.get("sqmId");
			String houseType = searchProperties.get("houseType");
			String spaceTypeId = searchProperties.get("spaceTypeId");
			String type = searchProperties.get("type");
			String projectTypeId =  searchProperties.get("projectTypeId");
			String keyword =  searchProperties.get("keyword");			
			String memberId =  searchProperties.get("memberId");
			String houseTypeOrSpaceTypeOrg = searchProperties.get("houseTypeOrSpaceType");
			String houseTypeOrSpaceType = "";
			try {
				if (houseTypeOrSpaceTypeOrg != null)
					houseTypeOrSpaceType = new String(houseTypeOrSpaceTypeOrg.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(StringUtils.isNotEmpty(houseTypeOrSpaceType)){
				LtDnHouseType houseTypeObj = getHouseType(houseTypeOrSpaceType);
				LtDnSpaceType spaceTypeObj = getSpaceType(houseTypeOrSpaceType);
				LtDnRenovationStyle style = getRenovationStyle(houseTypeOrSpaceType);
				SysSpArea area = getSysSpArea(houseTypeOrSpaceType);
				if(houseTypeObj != null || spaceTypeObj!= null || style != null || area != null){
					Boolean b = false;
					if(houseTypeObj != null){
						where += " and (g.Lt_DnHouseTypeID=" + houseTypeObj.getId();
						b = true;
					}
					if(spaceTypeObj !=null ){
						if (b)
							where += " or ";
						else
							where += " and (";
						where += "g.Lt_DnSpaceTypeID="+spaceTypeObj.getId();
						b = true;
					}
					
					if(style != null){
						if (b) 
							where += " or ";
						else
							where += " and (";
						where += "g.Lt_DnRenovationStyleID="+style.getId();
						b = true;
					}
					if (b)
						where += ")";
				}
				
			}
			
			
			if (StringUtils.isNotEmpty(styleId)) {
				where += " and g.Lt_DnRenovationStyleId ="+styleId;
			}
			if (StringUtils.isNotEmpty(keyword)) {
				where += " and g.title like '%"+keyword + "%'";
			}
			
			if (StringUtils.isNotEmpty(typeId)) {
				where += " and g.Lt_DnHouseTypeID ="+typeId;
			}
			if (StringUtils.isNotEmpty(spaceTypeId)) {
				where += " and g.Lt_DnSpaceTypeID ="+spaceTypeId;
			}
			if (StringUtils.isNotEmpty(projectTypeId)) {
				where += " and g.Lt_DnSpaceTypeID ="+projectTypeId;
			}
			
			if (StringUtils.isNotEmpty(type)) {
				where += " and g.WorksKind ="+type;
			}
			if (StringUtils.isNotEmpty(memberId)) {
				where += " and g.Lt_SpMemberID ="+memberId;
			}
			if (StringUtils.isNotEmpty(priceId)) {
				
				LtDnBudget budGet = budgetDao.get(Integer.parseInt(priceId));
				where += " and g.costAmt >= "+budGet.getMinAmt()/10000  + " and g.costAmt <= "+ budGet.getMaxAmt()/10000 ;
			}
			
			if (StringUtils.isNotEmpty(sqmId)) {
				
				LtDnAreaMeasure area = measureDao.get(Integer.parseInt(sqmId));
				where += " and g. sqm >= "+area.getMinSqm()+ " and g.sqm <= "+ area.getMaxSqm();
			}
			
			if (StringUtils.isNotEmpty(title)) {
				where += " and g.title like '%" + title + "%'";
			}
			
			
			ConditionsVo vo = ConditionsVo .getData(costAmt, sqm);
			if(vo!=null){
				if(vo.getMinAmt() >= 0 && vo.getMaxAmt() > 0){
					where += " and g.costAmt > "+vo.getMinAmt() + " and g.costAmt < "+ vo.getMaxAmt();
				}
				
				if(vo.getMinSqm() >= 0 && vo.getMaxSqm() > 0){
					where += " and g. sqm > "+vo.getMinSqm() + " and g.sqm < "+ vo.getMaxSqm();
				}
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
		
		List<Object[]> list = getSession().createSQLQuery(sql)
		.addEntity(BlDnDesignWorks.class)
		.addScalar("member")
		.addScalar("imagePath")
		.list();
		
		List<BlDnDesignWorks> dsList = new ArrayList<BlDnDesignWorks>(0);
		for (Object[] objects : list) {
			BlDnDesignWorks ds = (BlDnDesignWorks)objects[0];
			String member = (String)objects[1];
			String picFileName = (String)objects[2];
			LtSpMember mb = memberDao.getShopEntity(ds.getLtSpMemberId());
			String personDetail =  searchProperties.get("personDetail");
			if(StringUtils.isNotEmpty(personDetail)){
				ds.setPicList(getPicList(ds.getId()));
			}
			if (StringUtils.isNotEmpty(picFileName)) {
				ds.setImagePath(pictureDao.getImagePath(picFileName));
			}	
			if (StringUtils.isNotEmpty(member)) {
				ds.setMember(member);
			}	
			
			// 图片路径
			if (mb.getOtSpPictureId() != null) {
				OtSpPicture picture = pictureDao.get(mb.getOtSpPictureId());
				if (picture != null) {
					ds.setMemberImagePath(pictureDao.getImagePath(picture));
				}
			}
			ds.setMb(mb);
			dsList.add(ds);
		}
		return dsList;
	}
	@Override
	public CaseData getData(Pager pager, Map<String, String> searchProperties) {
		CaseData data = new CaseData();		
		/**
		 * 主页分类查询
		 */
		String Lt_DnHouseType = searchProperties.get("Lt_DnHouseType");
		String Lt_DnRenovationStyle = searchProperties.get("Lt_DnRenovationStyle");
		CaseTypeIDS typeIds = null;
		//按Lt_DnHouseType查询
		if(StringUtils.isNotEmpty(Lt_DnHouseType)){
			String Lt_DnHouseTypeSql = "select * from Lt_DnHouseType where name like '%" + Lt_DnHouseType + "%'";
			LtDnHouseType houseTypeObj = (LtDnHouseType) getSession().createSQLQuery(Lt_DnHouseTypeSql).addEntity(LtDnHouseType.class).uniqueResult();
			if(houseTypeObj != null){
				searchProperties.put("houseType", houseTypeObj.getId() + "");
				typeIds = new CaseTypeIDS();
				typeIds.setHouseType(houseTypeObj.getId()+"");
			}
		}
		//按Lt_DnRenovationStyle查询
		if(StringUtils.isNotEmpty(Lt_DnRenovationStyle)){
			String Lt_DnRenovationStyleSql = "select * from Lt_DnRenovationStyle where name like '%" + Lt_DnRenovationStyle + "%'";				
			LtDnRenovationStyle renovationStyleObj = (LtDnRenovationStyle) getSession().createSQLQuery(Lt_DnRenovationStyleSql).addEntity(LtDnRenovationStyle.class).uniqueResult();
			if(renovationStyleObj != null){
				searchProperties.put("houseType", renovationStyleObj.getId() + "");
				typeIds = new CaseTypeIDS();
				typeIds.setStyleId(renovationStyleObj.getId()+"");
			}
		}
		
		List list = this.getShopList(pager, searchProperties);
		data.setType(searchProperties.get("type"));
		data.setDesignWorks(list);		
		data.setAreaMeasures(measureDao.getAll());
		data.setBudgets(budgetDao.getAll());
		data.setHouseTypes(hourseTypeDao.getAll());
		data.setStyles(styleDao.getAll());
		data.setSpaceTypes(spaceTypeDao.getAll());
		data.setProjectType(projectTypeDao.getAll());
		if(typeIds != null){
			data.setTypeIds(typeIds);
		}
		return data;
	}
	@Override
	public BlDnDesignWorks getShopEntity(Integer id) {
		// TODO Auto-generated method stub
		return this.getWebEntity(id);
	}

	@Override
	public void deleteShopIds(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer saveOrUpdateShopEntity(BlDnDesignWorks entity)
			throws Exception {
		// TODO Auto-generated method stub
		return this.saveOrUpdateWebEntity(entity);
	}
	;
	
	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {

		String sql = "select m.*,lm.nickname as memberName,ds.name as designStyle, st.name as spaceType from Bl_DnDesignWorks m "
				   + "left join  Lt_SpMember lm on (m.Lt_SpMemberID = lm.id)"
				   + "left join Lt_DnRenovationStyle ds on (m.Lt_DnRenovationStyleID = ds.id)"
				   + "left join Lt_DnSpaceType st on (m.Lt_DnSpaceTypeID = st.id)";
		// + " left join Ot_SpPicture p on m.Ot_SpPictureID = p.ID";
		String sqlCount = "select count(*) from Bl_DnDesignWorks ";
		String where = " where 1=1 ";

		if (searchProperties != null) {
			String title = searchProperties.get("title");
			if (StringUtils.isNotEmpty(title)) {
				where += " and m.title like '%" + title + "%'";
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
		
		Object o  = getSession().createSQLQuery(sqlCount).uniqueResult();
		pager.setPageCount(Integer.parseInt(o.toString()));
		
		List<Object[]> list = getSession().createSQLQuery(sql)
		.addEntity(BlDnDesignWorks.class)
		.addScalar("memberName")
		.addScalar("designStyle")
		.addScalar("spaceType")		
		.list();
		List<BlDnDesignWorks> caseList = new ArrayList<BlDnDesignWorks>(0);
		for (Object[] objects : list) {
			BlDnDesignWorks cas = (BlDnDesignWorks)objects[0];
			String memberName = (String)objects[1];
			String designStyle = (String)objects[2];
			String spaceType = (String)objects[3];
			
			cas.setMemberName(memberName);
			cas.setDesignStyle(designStyle);
			cas.setSpaceType(spaceType);
			caseList.add(cas);
		}
		return caseList;
	}

	@Override
	public BlDnDesignWorks getWebEntity(Integer id) {
		BlDnDesignWorks entity = get(id);
		// 获取商品图片
		
		
		entity.setPicList(getPicList(id));
		entity.setMemberType(memberDao.get(entity.getLtSpMemberId()).getMemberType());
		String sql = "select g.*,"+
		HibernateUtil.getFirstPicFileNameSql("Bl_DnDesignWorksPicture", "Bl_DnDesignWorksID") + " as imagePath " +" from Bl_DnDesignWorks g where g.Lt_SpMemberID = "+entity.getLtSpMemberId()+" and g.id !="+id ;
		List<BlDnDesignWorks> other = getSession().createSQLQuery(sql).list();
		List<Object[]> list = getSession().createSQLQuery(sql)
		.addEntity(BlDnDesignWorks.class)
		.addScalar("imagePath")
		.list();
		
		List<BlDnDesignWorks> dsList = new ArrayList<BlDnDesignWorks>(0);
		for (Object[] objects : list) {
			BlDnDesignWorks ds = (BlDnDesignWorks)objects[0];
			String picFileName = (String)objects[1];
			
			if (StringUtils.isNotEmpty(picFileName)) {
				ds.setImagePath(pictureDao.getImagePath(picFileName));
			}	
			
			dsList.add(ds);
		}
		LtSpMember mb = memberDao.get(entity.getLtSpMemberId());
		// 图片路径
		if (mb.getOtSpPictureId() != null) {
			OtSpPicture picture = pictureDao.get(mb.getOtSpPictureId());
			if (picture != null) {
				mb.setImagePath(pictureDao.getImagePath(picture));
			}
		}
		if(mb.getSysSpAreaId() != null){
			if(mb.getSysSpAreaId()!= null){
				SysSpArea area = areaDao.get(mb.getSysSpAreaId());
				if(area != null){
					if(area.getParentId() != null){
						area.setParent(areaDao.get(area.getParentId()));
					}else{
						area.setParent(new SysSpArea());
					}
					
					mb.setArea(area);
				}
			}
			
			
		}
		
		entity.setMb(mb);
		entity.setHisDesigns(dsList);
		return entity;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");
			getSession().createSQLQuery("delete from Bl_DnDesignWorks where id in(:ids)")
			.setParameterList("ids", idArr).executeUpdate();
		}
	}

	@Override
	public Integer saveOrUpdateWebEntity(BlDnDesignWorks entity)
			throws Exception {
		
		Integer id = entity.getId();
		
	
		if (id == null) {
			id = saveDynamic(entity);
		}else{
			updateDynamic(entity);
		}
		
		// 保存图片相关
		ImageListVo imageListVo = new ImageListVo();
		imageListVo.setId(id);
		imageListVo.setDeleteImageIds(entity.getDeleteImageIds());
		imageListVo.setImageFiles(entity.getImageFiles());
		imageListVo.setImageFilesFileName(entity.getImageFilesFileName());
		imageListVo.setImgTableName("Bl_DnDesignWorksPicture");
		imageListVo.setOrderNos(entity.getOrderNos());
		imageListVo.setPicType(PicType.CASE);
		imageListVo.setPk("Ot_SpPictureID");
		imageListVo.setIdField("Bl_DnDesignWorksID");
		pictureDao.saveImageList(imageListVo);		
		System.out.println(entity.getLtSpMemberId());
		LtSpMember member = memberDao.getShopEntity(entity.getLtSpMemberId());
		
		System.out.println(member.getCaseCount());
		
		member.setCaseCount((member.getCaseCount()==null?0:member.getCaseCount()) + 1);
		memberDao.saveOrUpdateShopEntity(member);
		return id;
	}

	

	/**
	 * ID获取图片列表
	 * 
	 * @param goodsId
	 * @return
	 */
	public List<BlDnDesignWorksPicture> getPicList(Integer phomepageId) {
		List<BlDnDesignWorksPicture> phomePagePictureList = new ArrayList<BlDnDesignWorksPicture>(
				0);
		List<Object[]> list = getSession()
				.createSQLQuery(
						"select sp.*,p.picFileName from Bl_DnDesignWorksPicture sp,Ot_SpPicture p where"
								+ " sp.Ot_SpPictureId = p.ID and Bl_DnDesignWorksID = ?")
				.addEntity(BlDnDesignWorksPicture.class).addScalar("picFileName")
				.setParameter(0, phomepageId).list();
		for (Object[] objects : list) {
			BlDnDesignWorksPicture phomePagePicture = (BlDnDesignWorksPicture) objects[0];
			String picFileName = (String) objects[1];
			phomePagePicture.setImagePath(pictureDao.getImagePath(picFileName));
			phomePagePictureList.add(phomePagePicture);
		}
		return phomePagePictureList;
	}
	
}
