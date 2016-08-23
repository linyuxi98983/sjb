<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header/>
        <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
        <link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/mobile/css/register.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <!-- 头部开始 -->
        <@footer "注册"/>
        <!-- 头部结束 -->
        <section class="content">
            <!-- 注册开始 -->
            <section class="page_lr main">
               <form action="register!next.action" method="post" id="next_form">
                <div class="inp user short bg">
                    <span class="icon">
                    </span>
                    <span class="input">
                        <input type="tel" id="mobile" placeholder="请输入你的手机号" name="phoneNo"/>
                    </span>
                    <span class="clear"></span>
                </div>
              
                <div class="pw_contain">
                    <div class="inp graphics short small bg">
                        <span class="input">
                            <input class="identify_code" type="text" placeholder="请输入图形验证码" />
                        </span>
                        <span class="clear"></span>
                    </div>
                    <div class="identify">
                        <a class="refresh" href="#" onclick="return false;">refresh</a>
                        <img class="repic" src=""/>
                    </div>
                </div>
                <!-- <a class="btn" href="" onclick="return false;"> -->
                <a class="btn" id="next_btn" href="#">下一步</a>
                <p class="tips">
                    注册即表示您同意《
                    <a href="trade-agreement.htm"><@spring 'global.project.shopname'/>用户协议</a>
                    》
                </p>
                 </form>
            </section>
            <!-- 注册结束 -->
            <section class="support_space"></section>
        </section>
        <section class="error">
            <div><p><span class="text"></p></div>
        </section>
        <section class="loading"></section>
        <!-- 处理顶部菜单 -->
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
        <script>
            $(function() {
                // 顶部菜单
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
                // 清除功能
                $(".clear").click(function() {
                    $(this).parent().find("input").val("").focus();
                    $(this).hide();
                    changeBtn();
                });
                // 激活清除功能
                $(".main input").on("input propertychange",
                function() {
                    var len = $(this).val().length;
                    if (len > 0) {
                        $(this).closest(".inp").removeClass("err").find(".clear").show();
                    } else {
                        $(this).closest(".inp").find(".clear").hide();
                    }
                    changeBtn();
                });
                
                $("#next_btn").click(function(){
                	var mobile = $("#mobile").val();
                	if(mobile == null || mobile == ""){
                		showError("请填写要注册的手机号");
                		return;
                	}
                	$.cookie('mobile',mobile,{path:"/"});
                	 $.ajax({
	                    type: "GET",
	                    url: "register!valicode.action",
	                    dataType: "json",
	                    data:{
	                    	"result":"validate",
	                    	"entity.phoneNo":$("#mobile").val()
	                    },
	                    success: function(c) {
	                   		if(c.success !=false){
	                   			$("form").submit();
                				$(this).unbind('click');
                				$(this).removeClass("ok");
	                   		}else{	                   		
	                   			showError(c.msg);
	                   		}
	                    },
	                    error: function(a, b, d) {
	                    }
	                });	
                	
                });
                // 改变提交按钮状态
                function changeBtn() {
                    if ($(".main .btn").length > 0) {
                        var flag = true;
                        if ($("#username").length > 0 && $.trim($("#username").val()) == "") {
                            flag = false;
                        }
                        if ($("#password").length > 0 && $.trim($("#password").val()) == "") {
                            flag = false;
                        }
                        if ($("#mobile").length > 0 && $.trim($("#mobile").val()) == "") {
                            flag = false;
                        }
                        if ($("#verify").length > 0 && $.trim($("#verify").val()) == "") {
                            flag = false;
                        }
                        if ($("#v_verify").length > 0 && $("#v_verify").css("display") != "none" && $.trim($("#v_verify").find(".identify_code").val()) == "") {
                            flag = false;
                        }
                        if ($("#v_identify").length > 0 && $("#v_identify").css("display") != "none" && $.trim($("#v_identify").find(".identify_code").val()) == "") {
                            flag = false;
                        }
                        if (flag) {
                            $(".main .btn").addClass("ok");
                        } else {
                            $(".main .btn").removeClass("ok");
                        }
                    }
                }
            });
        </script>
    </body>
</html>