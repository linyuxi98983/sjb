package com.jshop.dao.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Hibernate;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.jshop.action.mobile.login.SessionMember;
import com.jshop.dao.LtSpFavoriteDao;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.LtSpFavorite;
import com.jshop.entity.LtSpMember;
import com.jshop.entity.Pager;
import com.jshop.util.HibernateUtil;
import com.jshop.util.StringUtil;
import com.jshop.vo.FavritorVo;
@Repository
public class LtSpFavoriteDaoImpl extends BaseDaoImpl<LtSpFavorite, Integer> implements LtSpFavoriteDao{
	@Resource
	private OtSpPictureDao pictureDao;
	public List getShopList(Pager pager, Map<String, String> searchProperties) {
		String sql = "select f.*," + HibernateUtil.getFirstPicFileNameSql("Bl_DnDesignWorksPicture", "Bl_DnDesignWorksID") + " as imgPath from Lt_SpFavorite f left join Bl_DnDesignWorks g" +
				" on(g.id = f.ObjectID)" 				
				+" where 1=1";
		
		if(searchProperties != null){
			/*boolean result = searchProperties.get("result") != null && "goods".equals(searchProperties.get("result"));
			if(result){
				sql += " and f.KeepKind= 0";
			}else{
				sql += " and f.KeepKind= 1";
			}*/
			
			String memberId = searchProperties.get("memberId");
			if(StringUtils.isNotEmpty(memberId)){
				sql += " and f.Lt_SpMemberID = " + memberId;
			}
		}
		
		
		List<FavritorVo> list = getSession().createSQLQuery(sql)
		.addScalar("id")
		.addScalar("keepKind")
		.addScalar("objectId")
		.addScalar("keepTime")
		.addScalar("imgPath")
		.setResultTransformer(Transformers.aliasToBean(FavritorVo.class))
		.list();
		for(FavritorVo fav : list){
			fav.setImgPath(pictureDao.getSmallImagePath(fav.getImgPath()));
		}
		return list;
	}

	public LtSpFavorite getShopEntity(Integer id) {
		
		return null;
	}

	public void deleteShopIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");
			
			getSession().createSQLQuery("delete from Lt_SpFavorite where id in(:ids)")
			.setParameterList("ids", idArr).executeUpdate();
		}
		
	}

	public Integer saveOrUpdateShopEntity(LtSpFavorite entity) throws Exception {
		Integer id = entity.getId();
		LtSpMember member = SessionMember.getSessionUser();
		if(member != null){
			entity.setLtSpMemberId(member.getId());
		}
		if (id == null) {
			id = saveDynamic(entity);
		}else{
			updateDynamic(entity);
		}
		return id;
	}

	public void deleteByObject(LtSpFavorite entity) {
		if(entity.getId() != null){
			getSession().createSQLQuery("delete from Lt_SpFavorite where id = ?")
			.setParameter(0, entity.getId())
			.executeUpdate();
		}else{
			getSession().createSQLQuery("delete from Lt_SpFavorite where ObjectID = ? and KeepKind =? and Lt_SpMemberID = ?")
			.setParameter(0, entity.getObjectId())
			.setParameter(1, entity.getKeepKind())
			.setParameter(2, SessionMember.getSessionUserId())
			.executeUpdate();
		}	
		
	}

	
}
