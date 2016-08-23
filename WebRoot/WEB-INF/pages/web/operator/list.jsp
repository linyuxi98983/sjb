<%@page import="com.jshop.entity.LtSpOperator"%>
<%@page import="com.jshop.common.Global"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object loginer = request.getSession().getAttribute(Global.SESSION_KEY_LOGINER);
LtSpOperator operator = null;
if(loginer instanceof LtSpOperator){
	operator = (LtSpOperator)loginer;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>系统管理员账号管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 管理员列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/operator/operator!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						账号：
					</th>
					<td>
						<input type="text" name="searchProperties['loginName']" class="text"  value="<s:property value="searchProperties['loginName']"/>"/>
					</td>
					<th>
						名称：
					</th>
					<td>
						<input type="text" name="searchProperties['name']" class="text"  value="<s:property value="searchProperties['name']"/>"/>
					</td>
					<th>
						部门：
					</th>
					<td>
						<input type="text" name="searchProperties['department']" class="text"  value="<s:property value="searchProperties['department']"/>"/>
					</td>
					<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		<div class="bar">
			<a href="web/operator/operator!add.action" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/operator/operator!del.action">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="loginName">账号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="department">部门</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="closed">是否停用</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			<s:iterator value="list" status="statu" >   
				<tr>
					<td>
						<input type="checkbox" name="ids" value="<s:property value="id"/>">
					</td>
					<td>
						<s:property value="loginName" />
					</td>
					<td>
						<s:property value="name" />
					</td>
					<td>
						<s:property value="department" />
					</td>
					<td>
						<s:if test="closed==1">是</s:if>
						<s:else>否</s:else>
					</td>
					<td>
						<a href="web/operator/operator!edit.action?id=<s:property value="id"/>">[编辑]</a>
						<s:if test="#session['loginer'].loginName.trim() == 'admin' && loginName.trim() != 'admin'">
							<a href="web/operator/operator!privilegelist.action?id=<s:property value="id"/>">[权限设置]</a>
						</s:if>
					</td>
				</tr>
				</s:iterator>
		</tbody></table>
		<!-- 分页条 -->
		<div class="pagination" pageNumber="<s:property value="#request.pager.pageNumber"/>" 
			pageSize="<s:property value="#request.pager.pageSize"/>"
			searchProperty="<s:property value="#request.pager.searchProperty"/>"
			orderProperty="<s:property value="#request.pager.orderProperty"/>"
			orderDirection="<s:property value="#request.pager.orderDirection"/>"/>
	</form>

</body>
</html>
