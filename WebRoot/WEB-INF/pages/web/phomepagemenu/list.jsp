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
    <title>PC主页菜单管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
	<script type="text/javascript">
	</script>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » PC主页菜单列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/phomepagemenu/phomepagemenu!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						PC主页菜单名称：
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
			<a href="web/phomepagemenu/phomepagemenu!add.action" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/phomepagemenu/phomepagemenu!delete.action">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
				<a href="javascript:;" id="updateButton" class="iconButton" onclick="saveListOrderNo('LtSpPhomepageMenu'); return false;">
					<span class="updateIcon">&nbsp;</span>更新排序
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="orderNo">排序号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="url">链接</a>
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
						<input type="checkbox" name="ids" value="<s:property value="id" />">
					</td>
					<td>
						<input name="orderNo" class="orderNo" type="text" value="<s:property value="orderNo" />" cid="<s:property value="id" />"/>
					</td>
					<td>
						<s:property value="name" />
					</td>
					<td>
						<s:property value="url" />
					</td>
					<td>
						<s:if test="closed == 1">是</s:if>
						<s:else>否</s:else>
					</td>
					<td>
						<a href="web/phomepagemenu/phomepagemenu!edit.action?id=<s:property value="id"/>">[编辑]</a>
					</td>
				</tr>
				</s:iterator>
		</tbody></table>
	</form>

</body>
</html>
