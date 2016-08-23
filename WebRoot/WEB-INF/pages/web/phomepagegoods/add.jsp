<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String phomepageId = request.getParameter("phomepageId") == null ? "" : request.getParameter("phomepageId");
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>手机主页板块商品添加</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 添加板块商品
	</div>
	<form id="inputForm" action="web/phomepagegoods/phomepagegoods!save.action" method="post" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="板块商品详情" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<input type="hidden" name="entity.ltSpPhomepageId" value="<%=phomepageId%>"/>
			<input type="hidden" name="searchProperties.phomepageId" value="<%=phomepageId%>"/>
			<tbody>
			<tr>
				<th>
					<span class="required">*</span>商品:
				</th>
				<td>
					<input type="hidden" class="filterList" id="ltSpGoodsId" name="entity.ltSpGoodsId" text_name="goods_name" value="<s:property value="entity.goodsName"/>" text_value="<s:property value="entity.goodsName"/>" value_path="id" text_path="name" filterType="GOODS"/>
				</td>
			</tr>
			<tr>
				<th>
					序号:
				</th>
				<td>
					<input type="text" name="entity.orderNo" class="text"  value="<s:property value="entity.orderNo"/>">
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
