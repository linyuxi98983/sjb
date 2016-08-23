<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "登陆-" + SpringUtil.getMessage('global.project.shopname')/>
        <!-- 处理顶部菜单 -->
        <link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/mobile/css/login.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
        <script>
            $(function() {
            	var $loginForm = $("#myForm");
            	var $username = $("#username");
            	var $password = $("#password");
            	var $loginBtn = $("#loginBtn")
                
                var userData = $.cookie("userData");
                if(userData != undefined){
                	userData = JSON.parse(userData);
                	$username.val(userData.username);
                	$password.val(userData.password);
                	//loginFun();
                }
              
                // 顶部菜单,点击下拉div,可选择进入主页等
                $(".header .menu").on("click",
                function(e) {
                    if ($(this).hasClass("active")) {
                        $(this).removeClass("active");
                        $(".t-nav").removeClass("active");
                    } else {
                        $(this).addClass("active");
                        $(".t-nav").addClass("active");
                    }
                    e.preventDefault();
                });
                $(".header .goback").on("click",
                function(e) {
                    history.go( - 1);
                });
                
                $loginBtn.on('click',function(e){                	
					if($username.val() == ""){
						showError("<@spring "global.login.phonenoRequired"/>");
						return false;
					}
					if($password.val() == ""){
						showError("<@spring "global.login.passwordRequired"/>");
						return false;
					}
					
					loginFun();
				});
				
				// 激活清除功能
				$('#password').bind('input propertychange', function() {
					if($password.val()){
						$loginBtn.addClass("ok");
					}else{
						$loginBtn.removeClass("ok");
					}
				});
              
	             function loginFun(){
	             	$.ajax({
						url: $loginForm.attr('action'),
						type: "POST",
						data: $loginForm.serialize(),
						dataType: "json",
						cache: false,
						success: function(message) {
							if(message.success == true || message.success == 'true'){
								var userData = {
									username:$username.val(),
									password:$password.val()
								};
								$.cookie("userData",JSON.stringify(userData),{path:"/"});
								var href = window.location.href;
								var currentUrl= queryUrlParam("currentUrl");
								
								if(currentUrl == null){
									if(href.indexOf("${url_login!}") != -1){
										window.location.href = "${url_memberhome!}";
									}else{
										window.location.href = href;
									}
								}else{									
									window.location.href = currentUrl;
								}															
							}else{
								showError(message.msg);
							}
						}
					});
	             }
            });
        </script>
    </head>
    
    <body>
        <!-- 头部开始 -->
        <@footer "登陆"/>
        <!-- 头部结束 -->
        <section class="content">
            <!-- 登录开始 -->
            <section class="page_lr main">
                <form action="${base}/mobile/login/login!login.action" method="post" id="myForm">
                	<div class="inp user bg">
	                    <span class="icon"></span>
	                    <span class="input"><input id="username" name="username" type="text" placeholder="手机号" autocomplet="off"/></span>
	                    <span class="more"></span>
	                    <span class="clear"></span>
	                </div>
	                <ul class="detail"></ul>
	                <div class="inp pw bg">
	                    <span class="icon"></span>
	                    <span class="input"><input id="password" name="password" type="password" placeholder="密码"/></span>
	                    <span class="change"></span>
	                    <span class="clear"></span>
	                </div>
	                <div class="pw_contain">
	                    <div class="inp graphics short small bg">
	                        <span class="input"><input class="identify_code" type="text" placeholder="请输入图形验证码"/></span>
	                        <span class="clear"></span>
	                    </div>
	                    <div class="identify">
	                        <a class="refresh" href="#" onclick="return false;">refresh</a>
	                        <img class="repic" src="" />
	                    </div>
	                </div>
	                <a id="loginBtn" class="btn ok">登录</a>
	                <dl class="func">
	                    <dt><a href="${base}/mobile/login/password.action">找回密码</a></dt>
	                    <dd><a href="${url_register!}">注册</a></dd>
	                </dl>
                </form>
            </section>
            <!-- 登录结束 -->
        </section>
        <section class="loading"></section>
    </body>
</html>