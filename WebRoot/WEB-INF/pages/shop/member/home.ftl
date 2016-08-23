<!DOCTYPE html>
<html>
	<head>
		<#include "/WEB-INF/ftl/shop/header.ftl"/>
        <@header "我的" + springUtil.getMessage("global.project.shopname")/>
        <link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/member.css"/>
        <link rel="stylesheet" type="text/css" href="${base}/resources/shop/css/common.css"/>
        <script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
        <script type="text/javascript" src="${base}/resources/shop/js/jquery.lazyload.min.js"></script>
        <script type="text/javascript" src="${base}/resources/shop/js/jquery.slides.min.js"></script>
        <script type="text/javascript" src="${base}/resources/shop/js/index.js"></script>
        <script type="text/javascript" src="${base}/resources/shop/js/banner.js"></script>
        <script type"text/javascript">
    		var map = {
    			myorder:Global.base + "/shop/order/order!list.action?type=myorder",// 我的订单
    			notpayorder:Global.base + "/shop/order/order!list.action?type=notpayorder",// 未付款订单
    			notsendorder:Global.base + "/shop/order/order!list.action?type=notsendorder",// 未发货订单
    			memberinfo:Global.base + "/shop/member/member!edit.action",// 个人信息
    			favorite:Global.base + "/shop/member/favorite!list.action",// 我的收藏
    			address:Global.base + "/shop/order/address.action",// 地址管理
    			reset:Global.base + "/shop/member/member!reset.action",// 密码设置
    		};
    		
        	function getRightContent(a){
        		var type = $('input[name="type"]').val() || 'memberinfo';
        		
        		
        		var url = map[type];
        		$.ajax({
					url: url,
					type: "POST",
					async:false,
					data:{},
					dataType: "html",
					cache: false,
					success: function(html) {
						$("#right").append(html);
						if(a) $(a).removeClass("disabled");
					}
				});
        	}
        	function detailFun(id){
        		var url = Global.base + "/shop/order/order!detail.action?id="+id;
        		$.ajax({
					url: url,
					type: "POST",
					async:false,
					data:{},
					dataType: "html",
					cache: false,
					success: function(html) {
						$("#right").html(html);
						$(".m-left-side").css("padding-top","48px");
						$(".m-left-side").css("border","0px");
					}
				});
        	};
        	$().ready(function(){
		        getRightContent();
		        
		        $(".m-menu li a:not(disabled)").click(function(){
		        	$("#right").html('');
		        	$(this).addClass("disabled");
		        	var type = $(this).attr("_type");
		        	type && $('input[name="type"]').val(type);
		        	getRightContent(this);
		        	$(".m-left-side").css("padding-top","0px");
		        	return false;
		        });
        	});
        </script>
	</head>
	<body>
		<div class="m-main-content w user-center-order">
			<div id="right"></div>
		    <!-- 左边导航 -->
		    <div class="m-left-side">
		        <div class="m-head">
		                <div class="m-top-line"></div>
		                <div class="m-top-info">
	                        <div class="m-pic-1"><img src="<#if (entity?? && entity.imagePath??)>${entity.imagePath!}<#else>${base}/resources/mobile/images/bg_pic.png</#if>"></div>
	                        <div class="m-user">
	                                <span class="u-username nickName">${entity.phoneNo!}</span>
	                                <span class="u-username nickName">积分：${entity.point!}</span>
	                                <span class="u-user-action"><a class="f-link-red loginout" href="javascript:;">退出</a></span>
	                        </div>
		                </div>
		        </div>
		        <div class="m-menu">
		        	<input type="hidden" name="type" value="${type!}"/>
	                <ul>
                        <li class="u-sub-title"><a href="javascript:void(0);">我的订单</a></li>
                        <li><a href="javascript:void(0);" _type="myorder">全部订单</a></li>
                        <li><a href="javascript:void(0);" _type="notpayorder">待付款订单</a></li>
                        <li><a href="javascript:void(0);" _type="notsendorder">待发货订单</a></li>
                        <li class="u-sub-title"><a href="javascript:void(0);">账户与安全</a></li>
                        <li><a href="javascript:void(0);" _type="memberinfo">个人信息</a></li>
                        <li><a href="javascript:void(0);" _type="favorite">我的收藏</a></li>
                        <li><a href="javascript:void(0);" _type="address">址址管理</a></li>
                        <!--<li><a href="javascript:void(0);" _type="reset">密码设置</a></li>-->
	                </ul>
		        </div>
			</div>
		</div>
		<@footer isRight=false/>
	</body>
</html>