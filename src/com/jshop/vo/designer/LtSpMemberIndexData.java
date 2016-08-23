package com.jshop.vo.designer;

import java.util.List;

import com.jshop.entity.LtSpMember;

public class LtSpMemberIndexData {
	
	private List<LtSpMember> memberList;
	
	private List<LtSpMember> memberOnline;

	public List<LtSpMember> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<LtSpMember> memberList) {
		this.memberList = memberList;
	}

	public List<LtSpMember> getMemberOnline() {
		return memberOnline;
	}

	public void setMemberOnline(List<LtSpMember> memberOnline) {
		this.memberOnline = memberOnline;
	}
	
	
}
