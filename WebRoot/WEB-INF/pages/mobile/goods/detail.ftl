<!DOCTYPE html>
<html class="">
	<head>
		<#include "/WEB-INF/ftl/mobile/header.ftl"/>
		<@header "商品详情"/>
		<link rel="stylesheet" href="${base}/resources/mobile/css/common.css" />
		<link rel="stylesheet" href="${base}/resources/mobile/css/product.css" />
         <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
	</head>
	<body class="defwidth">
		<@footer "商品详情"/>
		<!-- 轮播开始 -->
		<div id="bigpic">
			<div id="cell">
				<section class="turn">
					<section id="slider">
						<ul class="top-slider" style="width: 400%;">
							<#if entity.picList? exists>
							<#list entity.picList! as image>
							<li style="width: 25%">
							<#if image.imagePath??>					
		                        <a> <img src="${image.imagePath!}"  alt=""> </a>
				            <#else>
				            	<a><img src="${base}/resources/mobile/images/bg_pic.png"/></a>
				            </#if>
							</li>
							</#list>
							</#if>
						</ul>
						<div class="dot">
							<ul>
<#if entity.picList? exists>
								<#if entity.picList?size gt 1> <#list entity.picList as image>
								<li></li>
								</#list> </#if>
								</#if>
							</ul>
						</div>
					</section>
				</section>
			</div>
		</div>
		<!-- 轮播结束 -->

		<!-- 详情区域开始 -->
		<section class="detail">
			<div class="left">
				<b>
					￥<span id="main_price">	
						<#if entity.useSpec == 0>			
							${entity.goodsSpec.memberPrice!}							
						<#else>
							${entity.memberShowPrice!}
						</#if>
					</span> 
					
					<#if entity.useSpec == 0>			
						<#if entity.showPrice gt entity.goodsSpec.memberPrice!>			
							<span class="origin-price">￥${entity.showPrice}</span>
						</#if>
					<#else>
						<#if entity.showPrice gt entity.memberShowPrice!>			
							<span class="origin-price">￥${entity.showPrice}</span>
						</#if>
					</#if>
					

				</b>
				<aside>
					<span class="red"><@spring 'global.project.shopname'/></span>
				</aside>
			</div>
			<div class="right">
				<ul>
					<li class="call">
						<a href="tel://${tel!}">联系客服</a>
					</li>
					<li class="fav">
						<a>收藏</a>
					</li>
				</ul>
			</div>
			<article>
				<span id="goodsName">${entity.name!}</span> 
				<span id="saleOnhandQty">
					<em id="kuchunVal">
						<#if entity.saleOnhandQty gt 0>有货<#else>无货</#if>
					</em>
				</span>
				<!--span> 销量${entity.saleQty}</span--> 
				<input type="hidden" value="${entity.saleEndTime!}" id="saleEndTime"/>
				<input type="hidden" value="${entity.ltSpGoodsTypeId}" name="entity.ltSpGoodsTypeId" id="ltSpGoodsTypeId" />
			</article>
		</section>

		<!-- 详情区域结束 -->
		<!-- 规格参数开始-->
		<section class="option">
			<a id="pro_specification" class="arrow_con title">
				<div class="arrow_d">
					规格参数
				</div> </a>
			<div id="pro_specification_detail" class="option_detail"
				style="position: static; visibility: visible; overflow: hidden; height: auto; display: block;">

				<table style="width: 100%">
					<tr >
						<td id="paramValues_goods" style="width: 30%; font-size: .6rem; color: #4d525d; padding-left: 10px">
							<input type="hidden" name="paramValues" value="${entity.paramValues!}">
						</td>
					</tr>

				</table>
				
			
			</div>
		</section>
		<!-- 规格参数结束 -->
		<!-- 选项开始 -->
			<!-- framemark渲染 -->
			<#if entity.useSpec == 1>
			<section class="option">
			<a class="arrow_con title">
				<div id="pro_option" class="arrow_d">
					选择
					<span class="color">
					<#if entity.specList?exists>
						<#list entity.specList as vo>
							${vo.groupName}
						</#list>
					</#if>
					</span>
				</div>
			</a>
			<div id="option_detail" class="option_detail">
				<section class="title">
					<a class="back">返回</a>
					<a class="close"></a>
				</section>
				<dl class="thumbnail">
					<dt>					
						<#if entity.imagePath??>					
		                        <img id="suolue_img" src="${entity.imagePath!}"  alt="" />
				            <#else>
				            	<img id="suolue_img" src="${base}/resources/mobile/images/bg_pic.png"/>
				            </#if>
					</dt>
					<dd>
						<span class="con"> <span class="price">¥ <i
								id="color_size_price" class="J_change_price"
								data-price-range="59.9">${entity.showPrice}</i> </span> <span
							class="select">请选择</span> <#list entity.specList as vo> <span
							class="color">${vo.groupName}</span> <!--<#list vo.list as svo>
						        		${svo}
						        	</#list>--></#list> </span>
					</dd>
				</dl>
				<div>
				<#if entity.specList?exists>
					<#list entity.specList as vo>
					<h3 class="color_name">
						${vo.groupName}
					</h3>
					<ul class="color_options"><#list vo.list as svo><li class="spec">${svo}</li></#list>
					</ul>
					</#list>
				</#if>
				</div>
			</div>
		
		</section>
		<#else>
			<!--<section class="quantity">
				<div>
					<ul>
						不启用规格${entity.goodsSpec}
					</ul>
				</div>
			</section>-->
		</#if>
		<!-- 选项结束 -->

		<!-- 数量开始 -->
		<section class="quantity">
			<h4>
				数量：
			</h4>
			<div class="number_con">
				<span class="minus"> - </span>
				<div class="input">
					<input id="buy_num" type="text" value="1" />
				</div>
				<span class="plus on"> + </span>
			</div>
		</section>
		<!-- 数量结束 -->
		<!-- 图文详情开始 -->
		<section class="jump">
			<a id='detail_link' href="${base}/mobile/goods/goods!content.action?id=${entity.id}"
				class="arrow_con">
				<div class="arrow">
					<h4>
						图文详情
					</h4>
				</div> </a>
		</section>
		<!-- 图文详情结束 -->
		<!-- 商品评论开始 
		<section class="jump">
			<a href="${base}/mobile/eva/eva!list.action?result=list&searchProperties['id']=${entity.id}"
				class="arrow_con">
				<div class="arrow">
					<h4>
						商品评论（3241）
					</h4>
				</div> </a>
		</section>
		商品评论结束 -->
		<!-- 购物车开始 -->
		<section class="shopping_cart">
			<div class="btn_con">
				<input type="hidden" id="goods_id" value="${entity.id}"></input>
				<input type="hidden" id="isUseSpec" value="${entity.useSpec}"/>
							<input type="hidden" id="useSpecSize" value="${entity.specList?size}"/>
				<button class='add' dd_name='加入购物车'>
					加入购物车
				</button>
				<button class='buy J_buy' dd_name='直接购买'>
					立即购买
				</button>
			</div>
			<a href="${url_cartlist}" class="cart" dd_name='查看购物车'>
				<span>购物车 <i style="display: none;"></i> </span> </a>
		</section>
		<!-- 购物车结束 -->
		<!-- loading开始 -->
		<section class="loading"></section>
		<!-- loading结束 -->

		<!-- 遮罩开始 -->
		<section class="mask"></section>
		<!-- 遮罩结束 -->

		<footer class="footer new">
			<section class="status-bar">
				<#if mobile_loginer ? exists>
				<div class="actions-wrap">
					<a href="#" id="loginout">退出</a>
				</div>
				<#else>
				<div class="actions-wrap">
					<a href="${url_login}">登录</a>
					<a href="${base}/mobile/register/register!add.action">注册</a>
				</div>
				</#if>
				<a class="top" href="javascript:scrollTo(0,0);">TOP</a>
			</section>
			<nav class="b-nav">
				<p>
					<a href="" ontouchstart="">提建议</a>
					<a href="" ontouchstart="">帮&nbsp;&nbsp;助</a>
				</p>
			</nav>
			<section class="copyright">
				<p>
					Copyright xg 2015 m.xg.com
				</p>
			</section>
		</footer>
		<!-- 购物车占位开始 -->
		<section class="space"></section>
		<!-- 购物车占位结束 -->
		<script src="${base}/resources/mobile/js/zepto.min.js"
			type="text/javascript"></script>
		<script src="${base}/resources/mobile/js/underscore.min.js"
			type="text/javascript"></script>
		<script src="${base}/resources/mobile/js/iscroll5.min.js"
			type="text/javascript"></script>
		<script src="${base}/resources/mobile/js/fastclick.min.js"
			type="text/javascript"></script>
		<script src="${base}/resources/mobile/js/common.min.js"
			type="text/javascript"></script>
			 <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        
			<script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
		<script src="${base}/resources/mobile/js/product.min.js"
			type="text/javascript"></script>
			
          <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
		<script type="text/javascript">
			Zepto.specJson = ${entity.goodsSpecListJson};	 
			var paramValues = $('input[name="paramValues"]').val() || '';
						/******************************************/
						var typeId = $("#ltSpGoodsTypeId").val();
						
						if(typeId != null && typeId > 0){
						
						$.ajax({
							url: base+"/mobile/goodstype/goodstype!edit.action",
							type: "POST",
							data: {id:typeId,result:"json"},
							dataType: "json",
							cache: false,
							success: function(message) {
								if(message.entity){
									var paramHints = message.entity.paramHints || '';
									var paramNames = message.entity.paramNames || '';
									var paramValues = $('input[name="paramValues"]').val() || '';
									if(paramNames){
										$("#params tbody").html('');
										$(".chooseTypeTipDiv").hide();
												var nameArr = paramNames.split("\r\n");
												var hintsArr = paramHints.split("\r\n");
												var valuesArr = paramValues.split(",");
												for(var i=0;i<nameArr.length;i++){
													var name = '';
													var hint = '';
													var value = '';
													if(nameArr.length > i){
														name = nameArr[i];
													}
													if(hintsArr.length > i){
														hint = hintsArr[i];
													}
													if(valuesArr.length > i){
														value = $.trim(valuesArr[i]);
													}
											$("#paramValues_goods").append('<tr><th>'+name+'：</th><td><div class="text" name="entity.paramValues" tip="'+hint+'">'+value+'</div></td></tr>');
											//$("#params tbody").append('<tr><th>'+name+'：</th><td><input type="text" class="text" name="entity.paramValues" tip="'+hint+'" value="'+value+'"/></td></tr>');
										}
									
									}else{
										$(".chooseTypeTipDiv").show();
									}
								}else{
									alert('获取分类参数数据失败！'+message.errorMsg);
								}
							}
						});}
						/******************************************/
							/*var valuesArr = paramValues.split(",");
							for(var i=0;i<valuesArr.length;i++){
								
								var value = '';
								
								if(valuesArr.length > i){
									value = $.trim(valuesArr[i]);
								}
								var k = new change(i+1 + "");
								$("#paramValues_goods").append("<div style='width: 100%; font-size: .6rem; color: #4d525d;'>参数" +k.pri_ary()+":"+ value + "<div><br/>");
							}*/
	
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
		</script>
	</body>
</html>