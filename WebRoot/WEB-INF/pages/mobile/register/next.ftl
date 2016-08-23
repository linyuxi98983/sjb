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
            <!-- 输入验证码开始 -->
            <section class="page_lr main">
                
                <form id="next_step_form" method="post" action="register!finl.action">
                <p class="title" id="mobile_text">
                   
                </p>
                	<div class="contain">
                    <div class="inp user short small bg">
                        <span class="input">
                        	<input type="hidden" value="" id="phoneNo" name="phoneNo"/>
                            <input type="text" id="verify" name="verify" placeholder="请输入验证码"/>
                        </span>
                        <span class="clear"></span>
                    </div>
                    <button id="reget" class="new" type="button" on="获取验证码" off="重新获取" time="60">
                        <em>获取验证码</em>
                        <i></i>
                    </button>
                </div>
                <div id=v_verify class="pw_contain">
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
                <div id=v_identify class="pw_contain">
                    <div class="inp graphics short small bg">
                        <span class="input">
                            <input class="identify_code" type="text" placeholder="请输入图形验证码"/>
                        </span>
                        <span class="clear"></span>
                    </div>
                    <div class="identify">
                        <a class="refresh" href="#" onclick="return false;">refresh</a>
                        <img class="repic" src=""/>
                    </div>
                </div>
                <a class="btn" href="#" id="next_step">下一步</a>
                </form>
            </section>
            <!-- 输入验证码结束 -->
        </section>
        <section class="error">
            <div>
                <p>
                    <span class="text"></span>
                </p>
            </div>
        </section>
        <section class="loading"></section>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
          <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
        <script>
            $(function() {
                
            	function getCode(){
            		var getbtn = $("#reget"),
	                t = parseInt(getbtn.attr("time")),
	                tempt = 0,
	                getclass = "new",
	                getinterval = null,
	                reget = function() {
	                    if ( !! getinterval) {
	                        clearInterval(getinterval);
	                        getinterval = null;
	                    }
	                    tempt = 0;
	                    getbtn.removeClass(getclass);
	                    getbtn.find("em").html(getbtn.attr("off"));
	                    getbtn.find("i").html(t);
	                    getinterval = setInterval(function() {
	                        if (tempt < t) {
	                            getbtn.find("i").html(t - tempt);
	                            tempt++;
	                        } else {
	                            defget();
	                        }
	                    },
	                    1000);
	                },
	                defget = function() {
	                    if ( !! getinterval) {
	                        clearInterval(getinterval);
	                        getinterval = null;
	                    }
	                    getbtn.addClass(getclass);
	                    getbtn.find("em").html(getbtn.attr("on"));
	                    getbtn.find("i").hide();
	                };
	                reget();
            	}
            	var getbtn = $("#reget");
            	getbtn.click(function(){
            		$.ajax({
				                cache: true,
				                type: "POST",
				                url:"register!queryCode.action?result=json",
				                data:{
				                	"phoneNo":$("#phoneNo").val()
				                },// 你的formid
				                async: true,
				                error: function(request) {
				                    alert("网络繁忙");
				                },
				                success: function(data) {
				                    
				                }
				            });
            		getCode()
            	});
            	 $("#next_step").click(function(){               
	                $.ajax({
	                    type: "GET",
	                    url: "register!valicode.action",
	                    dataType: "json",
	                    data:{
	                    	"verify":$("#verify").val(),
	                    	"phoneNo":$("#phoneNo").val()
	                    },
	                    success: function(c) {	                    
	                    if(c.msg != ""){
	                    		showError(c.msg);
	                    		var getbtn = $("#reget"),
				                t = parseInt(getbtn.attr("time")),
				                tempt = 0,
				                getclass = "new",
				                getinterval = null,
				                reget = function() {
				                    if ( !! getinterval) {
				                        clearInterval(getinterval);
				                        getinterval = null;
				                    }
				                    tempt = 0;
				                    getbtn.removeClass(getclass);
				                    getbtn.find("em").html(getbtn.attr("off"));
				                    getbtn.find("i").html(t);
				                    getinterval = setInterval(function() {
				                        if (tempt < t) {
				                            getbtn.find("i").html(t - tempt);
				                            tempt++;
				                        } else {
				                            defget();
				                        }
				                    },
				                    1000);
				                },
				                defget = function() {
				                    if ( !! getinterval) {
				                        clearInterval(getinterval);
				                        getinterval = null;
				                    }
				                    getbtn.addClass(getclass);
				                    getbtn.find("em").html(getbtn.attr("on"));
				                    getbtn.find("i").hide();
				                };
				                defget();
	                    	}else{
	                    		$("form").submit();
	                    	}
	                    },
	                    error: function(a, b, d) {
	                    }
	                });	
	                
	                $(this).attr("disable",false);	
                });
            	$("#mobile_text").text($.cookie('mobile'));
            	$("#phoneNo").val($.cookie('mobile'));
            
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