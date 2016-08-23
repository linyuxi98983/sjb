<!DOCTYPE html>
<html>
    <head>
        <#include "/WEB-INF/ftl/shop/header.ftl"/>
        <@header "注册"/>
        <link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/skin_32.css"/>
        <link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/base.css"/>
        <link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/common.css"/>
        <script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
        <script type="text/javascript" src="${base}/resources/shop/js/jquery.cookie.js"></script>
        <script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
        <script type="text/javascript" src="${base}/resources/shop/js/banner.js"></script>
         <script type="text/javascript" src="${base}/resources/mobile/js/util.js"></script>
        <script type="text/javascript">
        	function sendCaptchaCode(){
        	if($("#phoneNo").val() == ""){
        			alert("请输入手机号码");
        			return ;
        		}
        		$.ajax({
		                cache: true,
		                type: "POST",
		                url:"${base}/shop/register/register!queryCode.action",
		                data:{
		                	"entity.phoneNo":$("#phoneNo").val()
		                },// 你的formid
		                async: false,
		                dataType:'json',
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                    if(data.success == false){
		                    	alert(data.msg);
		                    	return ;
		                    }
		                }
		            });
        	}
        	$(function(){
        		// 更换验证码
	        	var $captchaImage = $("#captchaImage");
				$captchaImage.click( function() {
					$captchaImage.attr("src", "${base}/captcha.cpg?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
				});
			/*	$("#phoneNo").on("change",function(){					
					$.ajax({
		                cache: true,
		                type: "POST",
		                url:"${base}/shop/register/register!valicode.action",
		                data:{
		                	"entity.phoneNo":$("#phoneNo").val()
		                },// 你的formid
		                async: false,
		                dataType:'json',
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                    if(data.success == false){
		                    	alert(data.msg);
		                    	$("#registerId").attr("disabled", true); 
		                    	return ;
		                    }
		                }
		            });
				});
				$("#phoneNo").on("blur",function(){
					var phoneNo = "${entity.phoneNo!}";
					if(phoneNo == "" || $("#phoneNo").val()!= phoneNo){
					$("#registerId").attr("disabled", false); 
					}
				});*/
				$("#registerId").click(function(){
				
					if($("#phoneNo").val() == ""){
        			alert("请输入手机号码");
        			return ;
        		}
        		if($("#password").val() == ""){
        			alert("${SpringUtil.getMessage("global.login.passwordRequired")}");
        			return ;
        		}
        		
        		if($("#password").val() == ""){
        			alert("${SpringUtil.getMessage("global.login.captchaRequired")}");
        			return ;
        		}
        		if($("#captcha").val() == ""){
        			alert("请输入短信验证码");
        			return ;
        		}
					setTimeout(function(){
						$.ajax({
		                cache: true,
		                type: "POST",
		                url:"${base}/shop/register/register!save.action",
		                data:{
		                	"entity.phoneNo":$("#phoneNo").val(),
		                	"entity.password":$("#password").val(),
		                	"captcha":$("#captcha").val(),
		                	"captchaStr":$("#captchaStr").val(),
		                	"captchaCode":$("#captchaCode").val()
		                },// 你的formid
		                async: false,
		                dataType:'json',
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                    if(data.success == false){
		                    	alert(data.msg);
		                    }else{
		                    	window.location.href ="${base}/mobile/member/home.action";
		                    }
		                }
		            });
					},3) ;
					
				});
        	});
        </script>
    </head>
    <body class="common">
		       	     
        <div class="clearfix">
            <div class="m-form register-form m-form-block pdtb60">
                  <fieldset>
                        <div class="formitm">
                            <label class="lab">手机号码</label>
                            <div class="ipt">
                                <input type="text" class="u-ipt" name="entity.phoneNo" id="phoneNo" value="">
                                <span class="domain">
                                </span>
                                <p class="u-ipt-warn">
                                </p>
                            </div>
                        </div>
                        <div class="formitm">
                            <label class="lab">登陆密码</label>
                            <div class="ipt">
                                <input type="text" class="u-ipt" name="entity.password" id="password" value="">
                                <span class="domain">
                                </span>
                                <p class="u-ipt-warn">
                                </p>
                            </div>
                        </div>
                       <div class="formitm short-ipt-wrap" style="width:300px">
                            <label class="lab">
                                验证码
                            </label>
                            <div class="ipt" style="width:300px">
                            	<input type="hidden" name="captchaStr" value="${captchaId}"/>
                                <input type="text" class="u-ipt" name="captcha" id="captcha" value="">
                                <span class="domain">
                                </span><img id="captchaImage" class="captchaImage"  width="100" height="25"
                              style="cursor:pointer"  src="${base}/captcha.cpg?captchaId=${captchaId}" title="点击更换验证码">
                                <p class="u-ipt-warn">
                                </p>
                            </div>
                        </div>
                        <div class="formitm short-ipt-wrap">
                            <label class="lab">
                                短信验证码：
                            </label>
                            <div class="ipt">
                                <input type="text" class="u-ipt" name="captchaCode" value="" id="captchaCode">
                                <input type="button" class="btn-get-code2" value="获取验证码" onclick="sendCaptchaCode(this)">
                                <!--<button class="btn-get-code" disabled>60s</button>-->
                                <p class="u-ipt-warn">
                                </p>
                            </div>
                        </div>
                        <div class="formitm" >
                            <input type="submit" value="立即注册" class="btn btn-long" id="registerId">
                            <!--<button class="btn btn-long" type="button">立即注册</button>-->
                        </div>
                    </fieldset>
            </div>
        </div>
        
        <@footer/>
    </body>
</html>