<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>系统管理员账号编辑</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 编辑系统管理员账号
	</div>
	<form id="inputForm" action="web/operator/operator!save.action" method="post" novalidate="novalidate">
		<input type="hidden" name="entity.id" value="<s:property value="entity.id"/>">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="管理员详情" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			<tr>
				<th>
					<span class="required">*</span>用户名:
				</th>
				<td>
					<input type="text" name="entity.loginName" class="text"  value="<s:property value="entity.loginName"/> ">
				</td>
			</tr>
			<tr>
				<th>
					密码:
				</th>
				<td>
					<input type="password" name="entity.password" class="text"  value="<s:property value="entity.password"/>">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>姓名:
				</th>
				<td>
					<input type="text" name="entity.name" class="text"  value="<s:property value="entity.name"/>">
				</td>
			</tr>
			<tr>
				<th>
					部门:
				</th>
				<td>
					<input type="text" name="entity.department" class="text"  value="<s:property value="entity.department"/>">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>是否停用:
				</th>
				<td>
					<input type="radio" name="entity.closed" value="1" <s:if test='entity.closed == 1'>checked="checked"</s:if>/>是
					<input type="radio" name="entity.closed" value="0" <s:if test='entity.closed == 0'>checked="checked"</s:if>/>否
				</td>
			</tr>
		</tbody></table>
		<table class="input">
			<tbody><tr>
				<th>&nbsp;
					
				</th>
				<td>
					<input type="submit" class="button" value="确 定">
					<input type="button" class="button" value="返 回" onclick="history.back(); return false;">
				</td>
			</tr>
		</tbody></table>
	</form>
</body>
</html>
