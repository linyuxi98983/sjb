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
    <title>电竞风格管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
	<script type="text/javascript">
	</script>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 电竞风格列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/spaceType/spaceType!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						名称：
					</th>
					<td>
						<input type="text" name="searchProperties['name']" class="text"  value="<s:property value="searchProperties['name']"/>"/>
					</td>
					
					<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		<div class="bar">
			<a href="web/spaceType/spaceType!add.action" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/spaceType/spaceType!delete.action">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="menuWrap pageSizeMenu"></div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="closed">停用状态</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="orderNo">序号</a>
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
						<s:property value="name" />
					</td>
					
					<td>
						<s:if test='closed == 0'>
							未停用
						</s:if>
						<s:else>
							已停用
						</s:else>
					</td>
					
					<td>
						<s:property value="orderNo" />
					</td>
					<td>
						<a href="web/spaceType/spaceType!edit.action?id=<s:property value="id"/>">[编辑]</a>
						
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
