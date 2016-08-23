<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>帐号管理中心—会员帐号登录中心</title>
    <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
    	.msg_grey{
    		border:1px solid rgb(104,166,102);
    	}
    	.msg_red{
    		border:1px solid rgb(247,112,113);
    	}
    </style>
    <script>
      var indentity = 0;
      var regmode = 0;
      var request_url = "";
      var url = '';
      var third = false;
    </script>
    <script src="${base}/resources/pc/js/jquery.js" type="text/javascript"></script>
    <script src="${base}/resources/pc/js/comm.js" type="text/javascript"></script>
    <script src="${base}/resources/pc/js/md5.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$(function(){
    		
    		$("#phoneNo").focus(function(){
    			phoneCheck();
    			$("#phoneNo").removeClass("msg_red").addClass("msg_grey");
    		}).blur(function(){
    			phoneCheck();
    			$("#phoneNo").removeClass("msg_grey").addClass("msg_red");
    		});
    		
    		$(".submit_button_yz").click(function(){
    			
    			if(flag){
    			
    			}else{
    				return;
    			}
    		});
    	});
    	function phoneCheck(){
    		var obj = $("#mobile_msg");
			var msgClass="msg_info";
			var msg="";
			var phone = $("#phoneNo").val();
			if(phone=="undefined"||phone==""||phone==null){
				msg="请填写您的手机号，注册成功后用于登陆和找回密码。";
				msgClass="msg_info";
				$("#phoneNo").removeClass("msg_red").addClass("msg_grey");
				obj.removeClass("msg_red").addClass("msg_grey").removeClass("msg_error").addClass("msg_info");
				obj.html(msg);
			}else if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){
				msg="请填写正确的中国大陆11位手机号码。";
				msgClass="msg_error";
				$("#phoneNo").removeClass("msg_grey").addClass("msg_red");
				obj.removeClass("msg_grey").addClass("msg_red").removeClass("msg_info").addClass("msg_error");
				obj.html(msg);
			}
			msg="<span></span>"+msg;
			if(msg!="<span></span>"){
				$("#getmobilecode").show();
			}else{
				$("#getmobilecode").hide();
			}
			//obj.html(msg);
    	}
    	//立即注册按钮
    	function register(){
    		var flag = true;
    		var msg = "";
    		var index=0;
			if($("#phoneNo").val() == ""){
				index++;
				msg+=index+". 手机号码不能为空\n";
				flag = false;
			}
			if($("#password").val() == ""){
				index++;
				msg+=index+". 密码不能为空\n";
				flag = false;
			}
			if($("#captcha").val() == ""){
				index++;
				msg+=index+". 验证码不能为空\n";
				flag = false;
			}
			var memberType = $("#memberType").val();
			if(memberType==-1){
				index++;
				msg+=index+". 身份类型不能为空\n";
				flag = false;
			}
			if(memberType==0){//业主
				if($("#yz_nickname input").val()==""){
					index++;
					msg+=index+". 昵称不能为空\n";
					flag = false;
				}
			}else if(memberType==1){//设计师
				if($("#sjs_nickname input").val()==""){
					index++;
					msg+=index+". 真实姓名不能为空\n";
					flag = false;
				}
			}else if(memberType==2){//机构
				if($("#jg_nickname input").val()==""){
					index++;
					msg+=index+". 机构名称不能为空\n";
					flag = false;
				}
			}
    		if(!flag){//验证不通过
    			msg="由于以下原因：\n"+msg+"无法注册!";
    			alert(msg);
    			return false;
    		}else{
    			$.ajax({
   					type:"post",
   					url:"${base}/pc/register/register!save.action?captchaId=${captchaId}",
   					data:$("#myForm").serialize(),
   					dataType:"json",
   					success:function(data){
   						if(data.success){
   							alert("注册成功！");
   							window.location.href="${base}/pc/login/login.action";
   						}else{
   							alert(data.msg);
   						}
   					},
   					error:function(){
   						alert("error");
   					}
   				});
    		}
    	}
    </script>
  </head>
  
  <body>
    <div class="header">
      <div class="header_login">
        <a href="${base}/pc/index.action">
          <div class="web-logo header-logo"></div>
        </a>
        <div class="header-text">欢迎注册</div>
      </div>
    </div>
    <div class="center">
      <div class="center_register">
        <!--第三方注册完善资料-->
        <!--普通注册-->
        <div class="register_yz">
          <p>已有帐号？<a href="${base}/pc/login/login.action" class="yzlogin"> 直接登录</a></p>
          <ul>
            <li>注册</li>
          </ul>
        </div>
        <p class="clear"></p>
        <!--还没有帐户-->
        <!--注册 Begin-->
        <div class="register_from">
          <form action="${base}/pc/register/register!save.action?captchaId=${captchaId}" method="post" id="myForm"  autocomplete="off">
            <!--手机注册-->
            <div class="box box_1">
              <label class="item" style="width:100px;">手机号码：</label>
              <input class="new_txt" type="text" value="" id="phoneNo" name="entity.phoneNo" autocomplete="off">
              <div class="messge" id="mobile_msg"></div>
            </div>
            <div class="box box_2">
             <div>
             	<label class="item"  style="width:100px;">验 证 码：</label>
             <input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" style="height: 32px;">
             <img id="captchaImage" class="captchaImage" src="${base}/captcha.cpg?captchaId=${captchaId}" title="点击更换验证码" style="position: relative;top: -32px;height:32px;left: 175px;">
             </div>
             <script type="text/javascript">
             	
             	$(function(){
             		$("#sjs_nickname").hide();
				$("#jg_nickname").hide();
             		var $captchaImage = $("#captchaImage");
					// 更换验证码
					$captchaImage.click( function() {
						$captchaImage.attr("src", "${base}/captcha.cpg?captchaId=<%=captchaId%>&timestamp=" + (new Date()).valueOf());
					});
					
					var new_txt_select = $(".new_txt_select");
					
					new_txt_select.change(function(){
						if($(this).val()==0){
							$("#yz_nickname").show();
							$("#sjs_nickname").hide();
							$("#jg_nickname").hide();
						}
						if($(this).val()==1){
							$("#yz_nickname").hide();
							$("#sjs_nickname").show();
							$("#jg_nickname").hide();
						}
						
						if($(this).val()==2){
							$("#yz_nickname").hide();
							$("#sjs_nickname").hide();
							$("#jg_nickname").show();
						}
						
					});
             	});
             </script>
              <div class="auth_code">
                <label>
                  <img src="" width="93" height="24" id="passport" class="passport" onclick="">
                  <span class="clickCode">
                    <a href="javascript:void(0)" onclick="">换一张</a>
                  </span>
                </label>
                <label>
                  <input type="text" value="" class="authCodeText" id="txt_mathcode" name="txt_mathcode">
                  <input type="button" class="autoCodeButton" value="确认" id="btn_mathcode">
                </label>
                <em class="arrow_front"></em>
                <em class="arrow_background"></em>
              </div>
            </div>
            <div class="box box_3">
              <label class="item"  style="width:100px;">登录密码：</label>
              <input class="new_txt" type="password" name="entity.password" autocomplete="off" id="password">
              <div class="messge"></div>
            </div>
            <!--业主/设计师/机构注册-->
            <div class="box box_5">
              <label class="item" style="width:100px;">身份类型：</label>
              <select class="new_txt_select" name="entity.memberType" id="memberType" style="border: 1px solid rgb(203, 203, 203);">
                <option value="-1">请选择身份类型</option>
                <option value="0">业主</option>
                <option value="1">设计师</option>
                <option value="2">设计机构</option>
              </select>
              <div class="messge msg_error" style="display: none;">
                <span></span>
              </div>
            </div>
            <div class="box box_4"  id="yz_nickname">
              <label class="item" style="width:100px;">昵称：</label>
              <input class="new_txt" type="text" value="" name="entity.nickname"  indentity="true"
              autocomplete="off" style="border: 1px solid rgb(203, 203, 203);">
              <div class="messge msg_error" style="display: none;">
                <span>
                </span>
              </div>
            </div>
            <div class="box box_4"  id="sjs_nickname">
              <label class="item" style="width:100px;">真实姓名：</label>
                <input class="new_txt" type="text" value="" name="entity.nickname"  indentity="true"
              autocomplete="off" style="border: 1px solid rgb(203, 203, 203);">
              <div class="messge msg_error" style="display: none;">
                <span>
                </span>
              </div>
            </div>
            <div class="box box_4"  id="jg_nickname">
              <label class="item" style="width:100px;">机构名称：</label>
                <input class="new_txt" type="text" value="" name="entity.nickname" indentity="true"
              autocomplete="off" style="border: 1px solid rgb(203, 203, 203);">
              <div class="messge msg_error" style="display: none;">
                <span>
                </span>
              </div>
            </div>
            <div>
              <div class="register_bottom_text">
                <input type="checkbox" name="agree" checked="checked">
                <p>我已阅读并同意<a href="" target="_blank">《网服务协议》</a></p>
                <div class="messge"></div>
              </div>
              <p class="clear"></p>
              <div>
                <input type="hidden" value="0" name="regindentity">
                <input type="button" onclick="register()" class="submit_button_yz" value="立即注册">
              </div>
            </div>
          </form>
        </div>
        <!--注册 End-->
      </div>
    </div>
    
    <div id="small_window">
    </div>
    <p class="cl"></p>
    <div id="sjb_footer_new">
      <div class="sjb_footer_new">
        <div class="sjb-link">
          <p class="our-links"><a href="${base}/resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
                
            <span class="link-devide">|</span>
            <a href="${base}/resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
            <span class="link-devide">|</span>
            <a href="" target="_blank" rel="nofollow">意见建议</a>
            <span class="link-devide">|</span>
            <a href="" target="_blank" rel="nofollow">帮助中心</a>
            <span class="link-devide">|</span>
            <a href="" target="_blank" rel="nofollow">使用条款</a>
          </p>
          <p class="statement">免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系。</p>
          <p class="sjs-icp">
            ©2012 百爪鱼-定制化装修设计服务平台, All Rights Reserved. (
            <a hidefocus="" href="" rel="nofollow">粤ICP备08125558号-2</a>
            )
          </p>
          <div class="auth-icons">
            <a href="" target="_blank" rel="nofollow" title="" alt="">
              <span class="gaj">
              </span>
            </a>
            <a href="" target="_blank" rel="nofollow">
              <span class="gad"></span>
            </a>
            <p class="clear"></p>
          </div>
        </div>
      </div>
      <p class="cl"></p>
    </div>
    <form action="" method="post" target="frm_dealer" id="frm_dealer_form">
      <input type="hidden" id="clickValId" name="key" value="">
    </form>
    <iframe frameborder="0" height="0" name="frm_dealer" id="clsIframe">
    </iframe>
  </body>
</html>