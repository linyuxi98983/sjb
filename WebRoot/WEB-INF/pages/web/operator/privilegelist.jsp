<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id = request.getParameter("id") == null ? "" : request.getParameter("id");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>权限设置</title>
    <link href="resources/admin/css/common.css" rel="stylesheet" type="text/css">
    <link href="resources/admin/datePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="resources/admin/js/jquery.js"></script>
	<script type="text/javascript" src="resources/admin/js/jquery.tools.js"></script>
	<script type="text/javascript" src="resources/admin/js/jquery.lSelect.js"></script>
	<script type="text/javascript" src="resources/admin/js/jquery.validate.js"></script>
	<script type="text/javascript" src="resources/admin/js/common.js"></script>
	<script type="text/javascript" src="resources/admin/js/input.js"></script>
	<script type="text/javascript" src="resources/admin/datePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	$().ready(function() {
	
		var $inputForm = $("#inputForm");
	});
	</script>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 权限设置
	</div>
	<form id="inputForm" action="web/operator/operator!privilegesave.action" method="post" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="权限设置" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			<tr>
				<th>
					请选择菜单权限:
				</th>
				<td>
					<input type="hidden" name="id" value="<s:property value='id'/>">
					<s:iterator value="modulelist" status="statu">
						<input name="modules" type="checkbox" value="<s:property value="id"/>" <s:if test="checked == 1 || #request['id'] == '1'">checked="checked"</s:if>/><s:property value="name"/><br/>
					</s:iterator>
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
