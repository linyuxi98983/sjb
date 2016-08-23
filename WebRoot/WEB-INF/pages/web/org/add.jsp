<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>设计机构添加</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 添加设计机构
	</div>
	<form id="inputForm" action="web/org/org!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="设计机构信息" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			
			<tr>
				<th>
					机构名称:
				</th>
				<td>
					<input type="text" name="entity.nickname" class="text"  value="<s:property value="entity.nickname"/>">
				</td>
			</tr>
			
			<tr>
				<th>
					<span class="required">*</span>手机号码:
				</th>
				<td>
					<input type="text" name="entity.phoneNo" class="text"  value="<s:property value="entity.phoneNo"/>">
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
					真实姓名:
				</th>
				<td>
					<input type="text" name="entity.realName" class="text"  value="<s:property value="entity.realName"/>">
					<input type="hidden" name="entity.memberType" value="2"/>
				</td>
			</tr>
			<tr>
				<th>
					邮箱:
				</th>
				<td>
					<input type="text" name="entity.email" class="text"  value="<s:property value="entity.email"/>">
				</td>
			</tr>
			<tr>
				<th>
					图片：
				</th>
				<td>
					<input type="file" name="entity.image">
				</td>
			</tr>
			
			<tr>
				<th>
					地区:
				</th>
				<td>
					<input type="hidden" class="lselect" lselectType="AREA_NODES" id="sysSpAreaId" name="entity.sysSpAreaId" value="<s:property value="entity.sysSpAreaId"/>" treePath="<s:if test="null != entity.area.parent.parent.id">,<s:property value="entity.area.parent.parent.id"/></s:if>,<s:property value="entity.area.parent.id"/>,<s:property value="entity.area.id"/>,"/>
				</td>
			</tr>
			
			<tr>
				<th>
					<span class="required">*</span>状态:
				</th>
				<td>
					<input type="radio" name="entity.closed" value="0" checked="checked"/>运行中
		 			<input type="radio" name="entity.closed" value="1"/>冻结
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
