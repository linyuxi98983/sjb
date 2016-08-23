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
    <title>设计需求类型编辑</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 编辑设计需求类型
	</div>
	<form id="inputForm" action="web/designDemand/designDemand!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<input type="hidden" name="entity.id" value="<s:property value="entity.id"/>">
		
		<table class="input tabContent" style="display: table;">
			<tbody>
			
			<tr>
				<th>
					称呼:
				</th>
				<td>
					<input type="text" name="entity.nickname" class="text"  value="<s:property value="entity.nickname"/>">
				</td>
			</tr>
			
			<tr>
				<th>
					手机号码:
				</th>
				<td>
					<input type="text" name="entity.phoneNo" class="text"  value="<s:property value="entity.phoneNo"/>">
				</td>
			</tr>			
			<tr>
				<th>
					<span class="required">*</span>地区:<s:property value="entity.sysSpAreaId"/>
				</th>
				<td>
					<input type="hidden" class="lselect" lselectType="AREA_NODES" id="sysSpAreaId" name="entity.sysSpAreaId" value="<s:property value="entity.sysSpAreaId"/>" treePath="<s:if test="null != entity.area.parent.parent.id">,<s:property value="entity.area.parent.parent.id"/></s:if>,<s:property value="entity.area.parent.id"/>,<s:property value="entity.area.id"/>,"/>
				</td>
			</tr>
			<tr>
				<th>
					需求风格:
				</th>
				<td>
					<select class="select" name="entity.projectType" value_path="name" selectType="PROJECT_TYPE" selectvalue="<s:property value="entity.projectType"/>"></select>
				</td>
			</tr>	
			<tr>
				<th>
					项目面积:
				</th>
				<td>
					<input type="text" name="entity.areaSqm" class="text"  value="<s:property value="entity.areaSqm"/>">
				</td>
			</tr>	
			<tr>
				<th>
					设计预算:
				</th>
				<td>
					<input type="text" name="entity.budgetName" class="text"  value="<s:property value="entity.budgetName"/>">
				</td>
			</tr>	
			<tr>
				<th>
					预算最小值:
				</th>
				<td>
					<input type="text" name="entity.minAmt" class="text"  value="<s:property value="entity.minAmt"/>">
				</td>
			</tr>	
			<tr>
				<th>
					预算最大值:
				</th>
				<td>
					<input type="text" name="entity.maxAmt" class="text"  value="<s:property value="entity.maxAmt"/>">
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
