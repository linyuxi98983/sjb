<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
       <#include "/WEB-INF/ftl/mobile/header.ftl"/>
       <@header/>
       <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
       <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
       <link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
       <link href="${base}/resources/mobile/css/register.css" rel="stylesheet" type="text/css" />
         <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <!-- 头部开始 -->
        <@footer "注册"/>
        <!-- 头部结束 -->
        <section class="content">
            <!-- 输入密码开始 -->
            <section class="page_lr main">
               <form id="myForm" action="register!save.action" method="post">
	               	 <div class="inp pw bg nomar">
	                    <span class="icon"></span>
	                    <span class="input">
	                    	<input id="phoneNo" name="entity.phoneNo" type="hidden"/>
	                        <input id="password" name="entity.password" type="password" placeholder="密码：6-20位字母或数字" />
	                    </span>
	                    <span class="change show"></span>
	                    <span class="clear"></span>
	                </div>
	                <a class="btn" href="#">完成</a>
               </form>
            </section>
            <!-- 输入密码结束 -->
        </section>
        <section class="error">
            <div><p><span class="text"></span></p></div>
        </section>
        <section class="loading"></section>
        <!-- 处理顶部菜单 -->
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
          <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
        <script>
            $(function() {
                // 顶部菜单
                
                if($.cookie('mobile')){
                	$("#phoneNo").val($.cookie('mobile'));
                }
                $(".btn").click(function(){
                
                	if($("#password").val().length >20 ||$("#password").val().length <6 ){
                		showError("请输入6-20位字母或数字");
                		return ;
                	}
                	$(this).unbind('click');
                	$(this).removeClass("ok");
                	$.ajax({
		                cache: true,
		                type: "POST",
		                url:"register!save.action",
		                data:$('#myForm').serialize(),// 你的formid
		                async: true,
		                dataType:'json',
		                error: function(request) {
		                    alert("网络繁忙");
		                },
		                success: function(data) {
		                    if(data.success == false){
		                    	showError(data.msg);
		                    }else{
		                    	window.location.href ="${base}/mobile/index.action";
		                    }
		                }
		            });
                });
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
                    history.go( - 2);
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