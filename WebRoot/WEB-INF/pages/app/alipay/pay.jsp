<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String appId = request.getParameter("appid");
String timeStamp = request.getParameter("timeStamp");
String nonceStr = request.getParameter("nonceStr");
String packageValue = request.getParameter("package");
String paySign = request.getParameter("sign");
String orderData = request.getParameter("orderData");
out.print("<input id='orderData' type='hidden' name ='orderData' value='"+orderData+"'/>");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信支付</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="<%=basePath%>resources/mobile/js/zepto.min.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="<%=basePath%>resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="<%=basePath%>resources/mobile/js/util.js" type="text/javascript"></script>
  </head>

  
  <body>
		
  </body>
  <script type="text/javascript">
 	function callpay(){
  	  
	var order = JSON.parse($("#orderData").val());

  	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
  	 WeixinJSBridge.invoke('getBrandWCPayRequest',{
  		 "appId" : "<%=appId%>","timeStamp" : "<%=timeStamp%>", "nonceStr" : "<%=nonceStr%>", "package" : "<%=packageValue%>","signType" : "MD5", "paySign" : "<%=paySign%>" 
   			},function(res){
				WeixinJSBridge.log(res.err_msg);

	            if(res.err_msg == "get_brand_wcpay_request:ok"){  
	            	showError("支付成功");
		             window.location.href = "${base}/mobile/order/order!list.action";
	              	/*$.ajax({
		                type: "GET",
		                url: "${base}/mobile/order/order!returnNotify.action",
		                dataType: "json",
		                data:{
		                	"entity.id":order.orderId,
		                	"entity.payType":"1",
					"entity.payAmt":order.orderAmt,
		                	"result":"json"
		                },
		                success: function(c) {
		                	if(c.success){
		                		window.location.href = "${base}/mobile/order/order!list.action";
		                	}else{
		                		showError(c.msg);
		                	}
		                },
		                error: function(a, b, d) {		
		                	showError(a);                 
		            	}
		            });	*/
	            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){ 
	            	showError("取消支付"); 
	                window.location.href = "<%=basePath%>mobile/order/order!list.action";
	            }else{  
	               showError("支付失败!");  
			window.location.href = "<%=basePath%>mobile/order/order!list.action";
	            }  
			})
  	
  	});
		
		}
		
		callpay()
$(function(){
	
	
});
  	
  </script>
  
</html>
