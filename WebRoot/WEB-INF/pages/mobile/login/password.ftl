<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <#include "/WEB-INF/ftl/mobile/header.ftl"/>
    <@header "密码重置"/>
    
    <link rel="apple-touch-icon-precomposed" href="http://img62.ddimg.cn/upload_img/00555/touch/touch-icon-iphone.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="http://img61.ddimg.cn/upload_img/00555/touch/touch-icon-ipad.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://img63.ddimg.cn/upload_img/00555/touch/touch-icon-iphone4.png"/>
    <title>密码重置</title>
    <link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css" />
    <link href="${base}/resources/mobile/css/password.css" rel="stylesheet" type="text/css" />
     <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
    <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
  </head>
  <body>
    <@footer "密码重置"/>
    <!-- 头部结束 -->
    <section class="content">
      <!-- 密码重置开始 -->
      <section class="page_lr main" id="step-two">
		  <div class="inp user short bg">
	          <span class="icon"></span>
	          <span class="input"><input id="phoneNo" name="entity.phoneNo" placeholder="请输入登录手机号"/></span>
	          <span class="clear"></span>
          </div>
		  <div class="contain">
		    <div class="inp user short small bg">
		      <span class="input">
		        <input type="text" placeholder="获取验证码" id="verify"/>
		      </span>
		      <span class="clear" style="display: none;">
		      </span>
		    </div>
		    <button id="reget" class="new" type="button"  on="获取验证码" off="重新获取" time="60">
		      <em>获取验证码</em>
		      <i></i>
		    </button>
		  </div>
		  <div class="contain">
		    <div class="inp user short small bg">
		      <span class="input"><input type="text" id="password" placeholder="请输入新密码"/></span>
		    </div>
		  </div>
		  <a class="btn" id = "queding" href="#" onclick="return false;">确定</a>
		</section>
      <!-- 密码重置结束 -->
    </section>
    <section class="error">
      <div>
        <p>
          <span class="text">
          </span>
        </p>
      </div>
    </section>
    <script>
        $(function() {
            // 顶部菜单,点击下拉div,可选择进入主页等
           
            $("#queding").click(function(){
            	
	            if($("#password").val() == ""){
	            	showError("请输入新密码");return;
	            }
            	$.ajax({
	                    type: "GET",
	                    url: "${base}/mobile/register/register!valicode.action",
	                    dataType: "json",
	                    data:{
	                    	"verify":$("#verify").val(),
	                    	"phoneNo":$("#phoneNo").val()
	                    },
	                    success: function(c) {        
	                    console.log(c );
	                    console.log(c.success + "---" + c.msg);         
		                    if(c.success == false){
		                    		showError(c.msg);
		                    }else{
		                    	$.ajax({
				                    type: "GET",
				                    url: "${base}/mobile/login/password!save.action",
				                    dataType: "json",
				                    data:{
				                    	"entity.phoneNo":$("#phoneNo").val(),
				                    	"entity.password":$("#password").val()
				                    },
				                    success: function(c) {	    
				                    	if(c.success){
				                    		showError("修改密码成功，请重新登录!");
				                    	setTimeout(function(){
				                    		window.location.href = "${base}/mobile/login/login.action";
				                    	},300);
				                    	}else{
				                    		
				                    		showError(c.msg);
				                    	}
				                    }
			            });
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
                history.go( - 1);
            });
            
	        // 输入框如果有内容显示清除按钮
			$("input").each(function(key, val){
				var that = $(this);
				if(that.val() != ""){
					that.closest(".inp").find(".clear").show();
				}else{
					that.closest(".inp").find(".clear").hide();
				}
			});
			// 显示隐藏密码
			$(".change").click(function(){
				var that = $(this),
					input = that.closest(".pw").find("input");
				if(that.attr("class").indexOf("show") < 0){
					input.prop("type", "text");
					that.addClass("show");
				}else{
					input.prop("type", "password");
					that.removeClass("show");
				}
			});
			// 清除功能
			$(".clear").click(function(){
				$(this).parent().find("input").val("").focus();
				$(this).hide();
				changeBtn();
			});
			// 激活清除功能
			$(".main input").on("input propertychange", function(){
				var len = $(this).val().length;
				if(len > 0){
					$(this).closest(".inp").removeClass("err").find(".clear").show();
				}else{
					$(this).closest(".inp").find(".clear").hide();
				}
				changeBtn();
			});
			// 改变提交按钮状态
			function changeBtn(){
				if($(".main .btn").length > 0){
					var flag = true;
					if($("#username").length > 0 && $.trim($("#username").val()) == ""){
						flag = false;
					}
					if($("#password").length > 0 && $.trim($("#password").val()) == ""){
						flag = false;
					}
					if($("#mobile").length > 0 && $.trim($("#mobile").val()) == ""){
						flag = false;
					}
					if($("#verify").length > 0 && $.trim($("#verify").val()) == ""){
						flag = false;
					}
					if($("#v_verify").length > 0 && $("#v_verify").css("display") != "none" && $.trim($("#v_verify").find(".identify_code").val()) == ""){
						flag = false;
					}
					if($("#v_identify").length > 0 && $("#v_identify").css("display") != "none" && $.trim($("#v_identify").find(".identify_code").val()) == ""){
						flag = false;
					}
					if(flag){
						$(".main .btn").addClass("ok");
					}else{
						$(".main .btn").removeClass("ok");
					}
				}
			}
			// 显示错误提示
			var errTips = function(text){
				var that = $(".error");
				if(!text){
					text = "该用户不存在，请注册";
				}
				that.find(".text").html(text);
				that.show();
				setTimeout(function(){
					that.hide();
				}, 2000);
			};
			// 改变提交按钮状态
			//changeBtn();
			//获取验证码
			$("#reget").on("click",function(){
			
			$("#reget").css("background-color","gray");
				if($("#phoneNo").val() == ""){
					showError("请输入手机号");
					return ;
				}
				getCode();
				$.ajax({
				                cache: true,
				                type: "POST",
				                url:"${base}/mobile/login/password!queryCode.action?result=json",
				                data:{
				                	"phoneNo":$("#phoneNo").val()
				                },// 你的formid
				                async: false,
				                error: function(request) {
				                    showError("Connection error");
				                },
				                success: function(data) {
				                    
				                }
				            });
			});
        });
        
        //获取手机验证码按钮状态
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
           	 
                getbtn.css("background","#ff463c");
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
    </script>
  </body>
</html>