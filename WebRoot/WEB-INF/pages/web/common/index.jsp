<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    <link href="resources/web/css/common.css" rel="stylesheet" type="text/css">
  	<style type="text/css">
	.input .powered {
		font-size: 11px;
		text-align: right;
		color: #cccccc;
	}
</style>
  </head>
  
<body>
	欢迎！
</body>
</html>
