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
    <title>项目面积添加</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 添加项目面积
	</div>
	<form id="inputForm" action="web/areaMeasure/areaMeasure!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="项目面积信息" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			
			<tr>
				<th>
					名称:
				</th>
				<td>
					<input type="text" name="entity.name" class="text"  value="<s:property value="entity.name"/>">
				</td>
			</tr>
			
			<tr>
				<th>
					排序号:
				</th>
				<td>
					<input type="text" name="entity.orderNo" class="text"  value="<s:property value="entity.orderNo"/>">
				</td>
			</tr>			
			<tr>
				<th>
					<span class="required">*</span>是否停用:
				</th>
				<td>
					<input type="radio" name="entity.closed" value="1" />是
		 			<input type="radio" name="entity.closed" value="0" checked="checked"/>否
				</td>
			</tr>
			<tr>
				<th>
					面积最小值:
				</th>
				<td>
					<input type="text" name="entity.minSqm" class="text"  value="<s:property value="entity.minSqm"/>">
				</td>
			</tr>	
			<tr>
				<th>
					面积最大值:
				</th>
				<td>
					<input type="text" name="entity.maxSqm" class="text"  value="<s:property value="entity.maxSqm"/>">
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
