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
    <title>系统日志管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 系统日志列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/log/log!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						操作人：
					</th>
					<td>
						<input type="text" name="searchProperties['operatorName']" class="text"  value="<s:property value="searchProperties['operatorName']"/>"/>
					</td>
					<th>
						操作时间：
					</th>
					<td>
						从<input type="text" class="Wdate" name="searchProperties['startDate']" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'})" value="<s:property value="searchProperties['startDate']"/>"/>
						至<input type="text" class="Wdate" name="searchProperties['endDate']" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'})" value="<s:property value="searchProperties['endDate']"/>"/>
					</td>
				</tr>
				<tr>
					<th>
						操作模块：
					</th>
					<td>
						<select name="searchProperties['module']">
							<option value="">--全部--</option>
							<s:iterator value="modulelist" status="statu">
								<option value="<s:property value="id"/>"><s:property value="name"/></option>
							</s:iterator>
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
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/log/log!delete.action">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
				<div class="menuWrap pageSizeMenu"></div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="operateTime">时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="o.id">操作人</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="s.id">操作类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="content">操作内容</a>
				</th>
			</tr>
			<s:iterator value="list" status="statu" >   
				<tr>
					<td>
						<input type="checkbox" name="ids" value="<s:property value="id"/>">
					</td>
					<td>
						<s:property value="operateTime" />
					</td>
					<td>
						<s:property value="operatorName" />
					</td>
					<td>
						<s:property value="moduleName" />
					</td>
					<td>
						<s:property value="content" />
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
		</div>
	</form>

</body>
</html>
