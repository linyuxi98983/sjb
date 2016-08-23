<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String orderData  = request.getParameter("orderData");
out.println("<input type='hidden' id='orderDataJson' name='orderDataJson' value='"+orderData+"'/>");
%>
<!DOCTYPE html>
<html>
	<head>
	<title>支付中心</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="<%=basePath%>resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="<%=basePath%>resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="<%=basePath%>resources/mobile/js/util.js" type="text/javascript"></script>
       
	<script type="text/javascript">
		
	

	$(function(){
		var order = $("#orderDataJson").val();
	
	$("#orderData").val(order);
		$("form").submit();
	});
//window.location="<%=basePath%>mobile/servlet/toPayServlet.do?code=<%=request.getParameter("code")%>";
		/*var url = "/mobile/servlet/toPayServlet.do?code=<%=request.getParameter("code")%>";
		$.ajax({
                type: "GET",
                url: url,
                dataType: "json",
                success: function(data) {
                	if(data.success){                	
                		callpay(data.appid,data.timeStamp,data.nonceStr,data.packages,data.sign);
                	}
                	
                },
                error: function(a, b, d) {
                   alert("fail");
                }
         });
         
         
         function callpay(appId,timeStamp,nonceStr,packageValue,paySign){
         WeixinJSBridge.invoke('getBrandWCPayRequest',{
		  		 "appId" : appId,"timeStamp" : timeStamp, "nonceStr" : nonceStr, "package" :packageValue,"signType" : "MD5", "paySign" : paySign
		   			},function(res){
						WeixinJSBridge.log(res.err_msg);
		
			            if(res.err_msg == "get_brand_wcpay_request:ok"){  
			                alert("微信支付成功!");  
			            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
			                alert("用户取消支付!");  
			            }else{  
			               alert("支付失败!");  
			            }  
			})
       
	  	 document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		  	 
	  	
	  	});
		
}*/
	
	</script>
	
</head>
<body>
	<form id="myForm" action="/mobile/servlet/toPayServlet.do">
		<input name="code" value="<%=request.getParameter("code")%>" type="hidden"/>
		<input id="orderData" name="orderData" value="" type="hidden"/>
	</form>
</body>
</html>