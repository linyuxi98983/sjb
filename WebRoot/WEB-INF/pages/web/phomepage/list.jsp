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
    <title>主页板块管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
	<script type="text/javascript">
	</script>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » PC主页板块列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/phomepage/phomepage!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						展现标题：
					</th>
					<td>
						<input type="text" name="searchProperties['title']" class="text"  value="<s:property value="searchProperties['title']"/>"/>
					</td>
					<th>
						类型：
					</th>
					<td>
						<select name="searchProperties['moduleType']">
							<option value="-1" <s:if test='searchProperties || searchProperties.moduleType = -1'>selected="selected"</s:if>>全部</option>
							<option value="0" <s:if test='searchProperties.moduleType == 0'>selected="selected"</s:if>>PC首页轮播</option>
							<option value="1" <s:if test='searchProperties.moduleType == 1'>selected="selected"</s:if>>APP首页轮播</option>
							<option value="2" <s:if test='searchProperties.moduleType == 2'>selected="selected"</s:if>>商品分类</option>
							<option value="3" <s:if test='searchProperties.moduleType == 3'>selected="selected"</s:if>>商品列表</option>
							<option value="4" <s:if test='searchProperties.moduleType == 4'>selected="selected"</s:if>>纯HTML片段</option>
						</select>
					</td>
					<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		<div class="bar">
			
			<div class="buttonWrap">
				
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
					<a href="javascript:;" class="sort" name="orderNo">序号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">展现标题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="moduleType">类型</a>
				</th>
				<th>
					<span>操作</span>
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
						<s:property value="title" />
					</td>
					<td>
						<s:if test="id == 1">
							PC首页轮播
						</s:if>
						<s:if test="id == 2">
							APP首页轮播
						</s:if>
					</td>
					<td>
						<a href="web/phomepage/phomepage!edit.action?id=<s:property value="id"/>">[编辑]</a>
						<s:if test="closed == 0">
							<a href="#" onclick="updateField('phomepage',{'entity.id':<s:property value="id"/>,'entity.closed':1}); return false;">[使失效]</a>
						</s:if>
						<s:else>
							<span class="disabled">已失效</span>
						</s:else>
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
