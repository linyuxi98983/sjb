package com.jshop.dao;

import java.util.Map;

import com.jshop.entity.LtSpMember;
import com.jshop.entity.Pager;
import com.jshop.vo.designer.LtSpMemberIndexData;

public interface LtSpMemberDao extends BaseCRUDDao<LtSpMember, Integer> {

	/**
	 * 手机端登录
	 * 
	 * @param loginName
	 * @param password
	 * @return
	 */
	public LtSpMember getLogin(String name, String password);

	public Integer veridate(String phoneNo);

	public Integer getTicketCount(Integer memberId);
	
	public LtSpMemberIndexData getDesignerIndexData(Pager pager, Map<String, String> searchProperties);
}
