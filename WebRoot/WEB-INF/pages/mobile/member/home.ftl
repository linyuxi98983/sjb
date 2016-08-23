<!DOCTYPE html>
<html class="mdd-page">
   <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "我的" + SpringUtil.getMessage('global.project.shopname')/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/common.css" />
        <link rel="stylesheet" href="${base}/resources/mobile/css/home.css" />
    </head>
    <body>
        <@footer "我的" + SpringUtil.getMessage('global.project.shopname')/>
        <section class="content">
            <header class="user-info">
                <section class="user-basic">
                   <#if mobile_loginer ? exists>
                   	 <#if entity.imagePath? exists>
                  		 <img class="user-avatar" src="${entity.imagePath!}" onclick="userInfo();"/>
                  	 <#else>
                   	 	<img class="user-avatar" src="${base}/resources/mobile/images/user/user-image.png" alt="用户"  onclick="userInfo();"/>
                   	 </#if>
	            	
                	<div class="user-name">${entity.nickname!}</div>
                	<!--<div class="member-badge">普通会员</div>-->
		        <#else>
		       		 <div class="actions-wrap unlogged">
		                     <div class="actions-wrap">
                    <a href="${url_login}">登录</a>
                    <a href="${base}/resources/mobile/user/register.htm">注册</a>
                </div>	
		                </div>			
	            </#if>
                </section>
               <section class="user-stat" style="margin-top:20px;">
                    <a id="product_collect_number" href="${base}/mobile/member/getpoint!list.action">
	                    <em>${entity.point!0}</em>
	                       积分
	                </a>
	                <a id="shop_collect_number" href="${base}/mobile/order/ticket!list.action">
	                    <em>${ticketCount!}</em>
	                       现金券
	                </a>
	                <a id="shop_collect_number" href="${base}/mobile/member/activity!list.action">
	                    <em>&nbsp;</em>
	                       活动
	                </a>
                </section>
            </header>
            <section class="f-section">
                <a class="slide-link" href="${base}/mobile/order/order!list.action">
                    <img src="${base}/resources/mobile/images/myorder.png"/>
                       我的订单
                </a>
                <a class="slide-link" href="${base}/mobile/member/ticket.action">
                    <img src="${base}/resources/mobile/images/myshare.png"/>
                       领取优惠券
                </a>
                <a class="slide-link" href="${base}/mobile/member/favorite!list.action">
                    <img src="${base}/resources/mobile/images/mycollection.png"/>
                       我的收藏
                </a>
            </section>
            <section class="f-section">
                <a class="slide-link" href="#" onclick="applyOwer()">
                    <img src="${base}/resources/mobile/images/applyowner.png"/>
                       申请成为业主
                </a>
                <!--<a class="slide-link" href="">
                    <img src="${base}/resources/mobile/images/applyshop.png"/>
                       申请成为商铺
                </a>-->
            </section>
            <section class="f-section">
                <a class="slide-link" href="${base}/mobile/order/address.action">
                    <img src="${base}/resources/mobile/images/addressmgr.png"/>
                       收货地址管理
                </a>
            </section>
            <section class="f-section">
                <a class="slide-link"  href="tel://${tel!}">
                    <img src="${base}/resources/mobile/images/viplevel.png"/>
                       电话联系客服
                </a>
            </section>
            <section class="f-section">
                <a class="slide-link" href="">
                    <img src="${base}/resources/mobile/images/setting.png"/>
                       设置
                </a>
            </section>
        </section>
        <footer class="footer">
            <section class="status-bar">
	            <#if mobile_loginer ? exists>
	            	 <div class="actions-wrap logged" style="display: black;">
		                    <a class="nickname" href=""></a>
		                    <a id="loginout" href="#">退出</a>
		                </div>
		        <#else>
		       		 <div class="actions-wrap unlogged">
		                     <div class="actions-wrap">
                    <a href="${url_login}">登录</a>
                    <a href="${base}/resources/mobile/user/register.htm">注册</a>
                </div>	
		                </div>			
	            </#if>
	                
	               
	                <a class="top" href="#top">TOP</a>
	            </section>
	            <nav class="b-nav">
	                <p>
	                    <a href="" ontouchstart="">提建议</a>
	                    <a href="" ontouchstart="">帮&nbsp;&nbsp;助</a>
	                </p>
	            </nav>
	            <section class="copyright">
	                <p><@spring "global.project.copyright"/></p>
	            </section>	
        </footer>
         <script src="${base}/resources/mobile/js/zepto.min.js"></script>
         <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
                $(".header .menu").click(function(e) {
                    if ($(this).hasClass("active")) {
                        $(this).removeClass("active");
                        $(".t-nav").removeClass("active");
                    } else {
                        $(this).addClass("active");
                        $(".t-nav").addClass("active");
                    }
                    e.preventDefault();
                });
                
                $("#loginout").click(function(){
                	$.ajax({
						url: "${base}/mobile/login/login!clean.action",
						type: "POST",
						data: {
							"result":"json"
						},
						dataType: "json",
						cache: false,
						success: function(message) {
							if(message.success == true || message.success == 'true'){
								window.location.href = "${url_login}";												
							}else{
								showError(message.msg);
							}
						}
					});
                });
                
            });
            function userInfo(){
                	window.location.href = "${base}/mobile/member/member!edit.action";
                }
                
             function applyOwer(){
             	$.ajax({
						url: "${base}/mobile/member/owner!validation.action",
						type: "POST",
						data: {
							"result":"json"
						},
						dataType: "json",
						cache: false,
						success: function(message) {
							if(message.success == true || message.success == 'true'){
								window.location.href = "${base}/mobile/member/owner.action";												
							}else{
								showError("您已经申请成功 ！");								
							}
						}
					});
             }
        </script>
    </body>
</html>