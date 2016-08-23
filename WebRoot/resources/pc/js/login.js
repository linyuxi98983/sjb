/*
* Description:pc账号登录以及第三方微信账号登录
* modified by wind
* Date: 2016-04-19
*/

define(function(require, exports, module) {
	var getCodeStatus = 0;
	var qrcode_id = 0 ;
	var weixin_url = 'http://www.shejiben.com/weixin/run.php';
	// tab切换
	/*getCode();
	function loginTab(){
		$('.tab_name ul').on('click','li',function(event){
			var index = $(event.target).index();
			$(this).addClass('on').siblings().removeClass('on');
			$('.login_wrap>.tab_content').eq(index).show().siblings().hide();
		});
	}*/
	// 获取二维码
	/*function getCode(){
	    jQuery.ajax({
	        async: true,
	        type: "POST",
	        dataType: 'json',
	        url: weixin_url,
	        data: {action: 'createQrcode'},
	        success: function (res) {
	            if (res.errCode == 0) {
	                var heaimg = new Image();
	                heaimg.src = res.imageUrl;
	                heaimg.onload = function () {
	                    var img = '<span class="icon_code"><img src='+res.imageUrl+'><em class="icon_logo"></em></span>';
	                   	$('.weixin_login_code').html('');
	                    $(".weixin_login_code").append(img);
	                }
	                qrcodeSession(res.sceneId);
	                $(".weixin_login_msg").hide();
	                $(".weixin_login_bottom").show();
	                getCodeStatus = 1;
	                // 二维码获取成功后轮询扫描状态
	                getmxStatus(res.sceneId);
	            }
	            else if(res.errCode == 1){
	            	alert('二维码获取失败，请重试');
	            }
	        },
	        error:function(){
	        	alert('请求失败，请重试');
	        }
	    });
	} */
	// 获取二维码的扫描状态
	/*function getmxStatus(sceneId){
	    jQuery.ajax({
	        type: "POST",
	        dataType: 'json',
	        url: weixin_url,
	        data: {action: 'getScanState',sceneId: sceneId},
	        timeout: 5000, 
	        success: function (data) {
	            if (data.errCode == "0") {
	            	$(".weixin_login_msg_success").show();
	                $(".weixin_login_msg_error").hide();
	                $(".weixin_login_bottom").hide();
	                var res = data;
	               var referer = $('#referer').val();
	                window.location.href = 'http://www.shejiben.com/weixin/callback.php?referer=' + referer + '&sceneId=' + res.user.qid + '&nickName=' + res.user.nickname + '&headImgUrl=' + res.user.headimgurl + '&openId=' + res.user.openid + '&unionId=' + res.user.unionid;
	            }
	            if (data.code == '404') {
	                getCodeStatus = getCodeStatus + 1;
		            if (getCodeStatus > 39) {
		            	$(".weixin_login_msg_success").hide();
		                $(".weixin_login_msg_error").show();
		                $(".weixin_login_bottom").hide();
		            } 
		            else {
		                getmxStatus(sceneId);
		            }
	            }
	        },
	        error: function () {
	            getCodeStatus = getCodeStatus + 1;
	            if (getCodeStatus > 39) {
	            	$(".weixin_login_msg_success").hide();
	                $(".weixin_login_msg_error").show();
	                $(".weixin_login_bottom").hide();
	            } 
	            else {
	                getmxStatus(sceneId);
	            }     
	        }
	    });
	}*/
	//将二维码的id存入session
	/*function qrcodeSession(sceneId) {
	    $.ajax({
	        async: true,
	        type: "GET",
	        dataType: 'json',
	        url: "http://www.shejiben.com/account/login.php",
	        data: {action: 'addQrcodeSession', sceneId: sceneId},
	        success : function(){}
	    });
	}
	//刷新二维码
	jQuery('.refresh_code').click(function(){
		getCode();
	});*/
	seajs.use( [ 'http://www.shejiben.com/gb_js/md5.js' ], function() {

		var usernameObj = $('#username');
		var passwordObj = $('#password');
		var nameAndPassObj = $('#username, #password');
		var refererObj  = $('#referer');
		var httprefererObj  = $('#httpreferer');
		$(nameAndPassObj).each(function (index){
			$(this).blur(function (){
				setBorder($(this),0);
			});	
		});

		var defval='用户名/手机/邮箱';

		$('form').keydown(function (event){
			if (event.keyCode==13) 
			{
				 $('#smt').click();
			}
		});
	
		if(document.cookie.rememberUser == "rememberUser"){
				$("#username").val(document.cookie.username);
				$("#password").val(document.cookie.password);
				$("#rememberUser").attr("checked","checked");
		}
								
		$('#smt').click( function(){

			var username = usernameObj.val();
			var password = passwordObj.val();
			var referer  = refererObj.val();
			var httpreferer  = httprefererObj.val();

			if(!$.trim(username) || $.trim(username) == defval)
			{
				$('#error-content').html('请输入您的帐号');
				$('.inputText').css({'margin-top':'10px'});
				$('.tab_content_account').css({'margin-top':'10px'});
				error_oper('ok');
				setBorder(usernameObj,1);
				return false;
			}
			else if(!$.trim(password) || $.trim(password) == '密码')
			{
				$('#error-content2').html('请输入您的密码');
				$('.inputText').css({'margin-top':'10px'});
				error_oper('no');
				setBorder(passwordObj,1);
				return false;
			}
			else
			{
				//password = $.md5( $.trim(password).toLowerCase() );
				$('#smt').attr('disabled','disabled').val('登录中...');
				$.ajax({
					url:"/sjb/pc/login/login!login.action",
					type:'post',
					data:'username='+username+'&password='+password+'&referer='+referer+'&httpreferer='+httpreferer,
					dataType:'json',
					success:function(data){
						
						if (!data.success) {
							console.log(data)
							$('#error-content2').html(data.msg);
							$('.inputText').css({'margin-top':'10px'});
							error_oper('no');
							$('#smt').removeAttr('disabled').val('立即登录');
						}else{
							if($("#rememberUser").attr("checked") == "checked"){
								document.cookie.username=username;
								document.cookie.password=password;
								document.cookie.rememberUser="rememberUser";
								
							}
							if(data.memberType == 0){//业主
								location.href = "/sjb/pc/mb/index.action";
							}else if(data.memberType == 1){//设计师
								location.href = "/sjb/pc/ds/index.action";
							}else if(data.memberType == 2){
								location.href = "/sjb/pc/org/index.action";
							}//设计机构
							
							
						};
					},
					error:function(){
						
						alert(111111);
					}
				})
			}
		});
		function error_oper(n)
		{
			if(n == 'ok')
			{
				$('#error').css('display','block');
				
			}
			else
			{	
				$('#error').css('display','none');
			}
			if(n == 'no')
			{
				$('#error2').css('display','block');
			}
			else
			{	
				$('#error2').css('display','none');
			}
		}

		SJB.placeHolder();
	} )

	function setBorder(obj,type){
		type = type *1;
		switch(type){
			case 0:
			wrong = '1px solid #cbcbcb';
			break;
			
			case 1:
			wrong = '1px #f77071 solid';
			break;

			default:
			wrong = '1px solid #cbcbcb';
			break;
		}
		obj.css({'border':wrong});
	}
	window.login = module.exports = {
		//loginTab:loginTab
	};
});	