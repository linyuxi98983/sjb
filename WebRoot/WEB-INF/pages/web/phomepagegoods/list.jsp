<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String phomepageId = request.getParameter("searchProperties.phomepageId") == null ? "" : request.getParameter("searchProperties.phomepageId");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>PC主页板块商品管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
	<script type="text/javascript">
	</script>
  </head>
<body>
	<div class="path" style="display:none">
		<a href="web/common/main.action">首页</a> » PC主页板块商品列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/phomepagegoods/phomepagegoods!list.action" method="post">
		<input type="hidden" name="searchProperties.phomepageId" value="<%=phomepageId%>"/>
		<div class="bar">
			<a href="web/phomepagegoods/phomepagegoods!add.action?phomepageId=<s:property value="searchProperties.phomepageId"/>" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/phomepagegoods/phomepagegoods!delete.action">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
				<a href="javascript:;" id="updateButton" class="iconButton" onclick="saveListOrderNo('LtSpPhomepageGoods'); return false;">
					<span class="updateIcon">&nbsp;</span>更新排序
				</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="menuWrap pageSizeMenu"></div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.orderNo">序号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="m.lt_SpGoodsID">图片</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="g.name">商品名称</a>
				</th>
			</tr>
			<s:iterator value="list" status="statu" >   
				<tr>
					<td>
						<input type="checkbox" name="ids" value="<s:property value="id" />">
					</td>
					<td>
						<input name="orderNo" class="orderNo" type="text" value="<s:property value="orderNo" />" cid="<s:property value="id" />"/>
					</td>
					<td>
						<a href="app/goods/goods!detail.action?id=<s:property value="id"/>" target="_Blank">
							<img src="<s:property value="imagePath" />" style="width:50px;"/> 
						</a>
					</td>
					<td>
						<s:property value="goodsName" />
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
