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
    <title>系统参数</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
	<script type="text/javascript">
	$().ready(function() {
	
		var $inputForm = $("#inputForm");
		
		// 表单验证
		$inputForm.validate({
			
		});
	});
	</script>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 系统参数管理
	</div>
	<form id="inputForm" action="web/param/param!save.action" method="post" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="系统参数管理" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			<s:iterator value="list" status="statu" var="param">  
			<tr>
				<th>
					<span style="color:red">*</span><s:property value="#param.description"/>:
				</th>
				<td>
					<input type="hidden" name="list[<s:property value="#statu.index"/>].id" value="<s:property value="#param.id"/>"/>
					<s:if test="#param.id == 3">
						<textarea style="width:700px;height:100px;" name="list[<s:property value="#statu.index"/>].value"><s:property value="#param.value"/></textarea><span style="color:red"><s:property value="#param.remark"/></span>
					</s:if>
					<s:else>
						<input type="text" name="list[<s:property value="#statu.index"/>].value" class="text" required="true" number="true" value="<s:property value="#param.value"/>"><span style="color:red"><s:property value="#param.remark"/></span>
					</s:else>
				</td>
			</tr>
			</s:iterator>
		</tbody></table>
		<table class="input">
			<tbody><tr>
				<th>&nbsp;
					
				</th>
				<td>
					<input type="submit" class="button" value="保 存">
				</td>
			</tr>
		</tbody></table>
	</form>
</body>
</html>
