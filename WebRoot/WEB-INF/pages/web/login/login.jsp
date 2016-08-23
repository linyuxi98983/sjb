<%@page import="com.jshop.util.SpringUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String captchaId = UUID.randomUUID().toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    <link href="resources/web/css/common.css" rel="stylesheet" type="text/css">
	<link href="resources/web/css/login.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="resources/web/js/jquery.js"></script>
	<script type="text/javascript" src="resources/web/js/common.js"></script>
	<script type="text/javascript">
		$().ready( function() {
			var $loginForm = $("#loginForm");
			var $loginButton = $(".loginButton");
			var $enPassword = $("#enPassword");
			var $username = $("#username");
			var $password = $("#password");
			var $captcha = $("#captcha");
			var $captchaImage = $("#captchaImage");
			var $isRememberUsername = $("#isRememberUsername");
		
			// 更换验证码
			$captchaImage.click( function() {
				$captchaImage.attr("src", "<%=basePath%>/captcha.cpg?captchaId=<%=captchaId%>&timestamp=" + (new Date()).valueOf());
			});
			
			// 表单验证、记住用户名
			$loginButton.click(function() {
				if($username.val() == ""){
					$.message("warn", "<%=SpringUtil.getMessage("global.login.usernameRequired")%>");
					return false;
				}
				if($password.val() == ""){
					$.message("warn", "<%=SpringUtil.getMessage("global.login.passwordRequired")%>");
					return false;
				}
				if($captcha.val() == ""){
					$.message("warn", "<%=SpringUtil.getMessage("global.login.captchaRequired")%>");
					return false;
				}
				
				$.ajax({
					url: $loginForm.attr('action'),
					type: "POST",
					data: $loginForm.serialize(),
					dataType: "json",
					cache: false,
					success: function(message) {
						if(message.success == true || message.success == 'true'){
							window.location.href = "web/common/main.jhtml";
						}else{
							$.message("warn",message.msg);
							$captcha.val('');
							$captchaImage.click();
						}
					}
				});
			});
		});
	</script>
  </head>
  
<body>
	<div style="text-align:center;width:100%">
		<input type="hidden" id="error" name="error" value="<s:property value='error'/>"/>
		<div class="login">
			<form id="loginForm" action="web/login/login!login.action" method="post">
				<input type="hidden" name="captchaId" value="<%=captchaId%>"/>
				<table>
					<tbody><tr>
						<td width="220" rowspan="2" align="center" valign="bottom" style="background-image: url('resources/pc/images/back.png');
    background-position: -2 49px;
    height: 50px;
    padding-top: 0px;
    background-size: 100%;
    background-repeat: no-repeat;">
						</td>
						<th>
							用户名:
						</th>
						<td>
							<input type="text" id="username" name="username" class="text" >
						</td>
					</tr>
					<tr>
						<th>
							密&nbsp;&nbsp;&nbsp;码:
						</th>
						<td>
							<input type="password" id="password" name="password" class="text"  autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							验证码:
						</th>
						<td><input type="hidden" name="type" value="-1" checked="checked"/>
							<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off"><img id="captchaImage" class="captchaImage" src="<%=basePath%>/captcha.cpg?captchaId=<%=captchaId%>" title="点击更换验证码">
						</td>
					</tr>
					<tr style="display:none;">
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
						<td>
							<label>
								<input type="checkbox" id="isRememberUsername" value="true">
								记住用户名:
							</label>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
						<td>
							<input type="button" class="homeButton" value="" onclick="location.href='pc/index.action'"><input type="button" class="loginButton" value="登录">
						</td>
					</tr>
				</tbody></table>
				<div class="powered"><%=SpringUtil.getMessage("global.project.copyright")%></div>
				<div class="link" style="display:none;">
					<a href="">前台首页</a> |
					<a href="#">官方网站</a> |
					<a href="#">交流论坛</a> |
					<a href="#">关于我们</a> |
					<a href="#">联系我们</a> |
					<a href="#">授权查询</a>
				</div>
			</form>
		</div>
	
</div>
</body>
</html>
