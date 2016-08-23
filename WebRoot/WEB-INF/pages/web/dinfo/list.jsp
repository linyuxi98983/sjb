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
    <title>行业咨询管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
    <script type="text/javascript" src="resources/pc/js/util.js"></script>
	<script type="text/javascript">
	    
	</script>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 行业咨询列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/dinfo/dinfo!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						标题：
					</th>
					<td>
						<input type="text" name="searchProperties['title']" class="text"  value="<s:property value="searchProperties['title']"/>"/>
					</td>
					
					<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		<div class="bar">
			<a href="web/dinfo/dinfo!add.action" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<a onclick="checkRecord();">
				选择
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/dinfo/dinfo!delete.action">
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
				<a href="javascript:;" class="sort" name="orderNo">序号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">标题</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="preview">预览文</a>
				</th>
				
				<th>
					<span>操作</span>
				</th>
			</tr>
			<s:iterator value="list" status="statu" >   
				<tr>
					<td>
						<input type="checkbox" name="ids" id="ids" value="<s:property value="id" />">
					</td>
					<td>
						<s:property value="orderNo"/>
					</td>
					<td>
						<s:property value="title" />
					</td>
					
					<td>
						<s:property value="preview" />
					</td>
					
					
					<td>
						<a href="web/dinfo/dinfo!edit.action?id=<s:property value="id"/>">[编辑]</a>
						
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