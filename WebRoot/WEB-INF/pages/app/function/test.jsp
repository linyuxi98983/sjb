<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>json测试</title>
	<script type="text/javascript" src="resources/web/js/jquery.js"></script>
	<script type="text/javascript">
	
		function ttt(){
			/*$.getJSON("app/login/test!data.action","data=" + $("#data").val(),function(jsonData){
					alert(jsonData);
				}
			);*/
			
			$.ajax({
                  url: "app/function/AppFunction!data.action",
                  //url: "app/appServlet",
                  type: 'POST',
                  data: { json: $("#json").val() },
                  dataType: 'text',
                  timeout: 100000,
                  error: function(XMLHttpRequest, textStatus, errorThrown) { alert(textStatus) },
                  success: function(result) {
                      $("#data").val(result);
                  }
              });
		}
	
	</script>
  </head>
  
<body>
	json:<textarea id="json" style="width:500px;height:200px;">{name:"getsorderlist", data:{memberid:36, filter:""}}</textarea><br/>
	<input type="button" style="width:200px;height:50px" value="提交" onclick="ttt()"/><br/>
	data:<textarea id="data" style="width:500px;height:200px;"></textarea>
</body>
</html>
