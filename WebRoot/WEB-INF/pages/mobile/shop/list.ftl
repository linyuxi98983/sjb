<!DOCTYPE html>
<html class="">
    <head>
    	<#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "附近-触屏版"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/nearby.css"/>
	    <script src="${base}/resources/mobile/js/zepto.min.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/zepto.lazyload.min.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/common.min.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/shop.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/search.js" type="text/javascript"></script>
	    <script type="text/javascript">
	    	$().ready(function(){
	    		shopListInit();
	    	});
	    </script>
	</head>
	<body scroll="yes">
		<input type="hidden" id="curr_page" value="1"/>
    	<input type="hidden" name="typeId" value="${typeId!}"/>
    	<input type="hidden" name="lat"/>
    	<input type="hidden" name="lng"/>
		<div class="_pre">
			<header class="header">
	            <a class="back c_back" href="${url_nearby!}" style="color:#464646;background-image:url(${base}/resources/mobile/images/c_back_btn.png);">返回</a>
	            <div class="h_label">附近</div>
	            <a href="javascript: void(0)" class="menu"></a>
	        </header>
	        <section class="filtrate_term" id="product_sort" dd_name="商品排序">
                <ul>
                    <li class="">
                        <a href="javascript:void(0)" class="all-type" typeid="${typeId!}"><span id="subTypeSelected"><#if parent??>${parent.name!}<#else>全部</#if></span>
                            <span class="arrow_down"></span>
                        </a>
                    </li>
                    <li class="">
                        <a href="javascript:void(0)" class="default-order" order="regtime"><span id="orderSelected">默认排序</span>
                            <span class="arrow_down"></span>
                        </a>
                    </li>
                </ul>
            </section>
            <section class="nearby-option" id="nearby-option">
            	<div id="option_detail" class="option_detail">
                	<ul class="subtype-option">
                		<a href="javascript:void(0)" typeid="${typeId!}"><li class="on"><#if parent??>${parent.name!}<#else>全部</#if></li></a>
                		<#list subTypeList as sub>
                		<a href="javascript:void(0)" typeid="${sub.id!}"><li>${sub.name!}</li></a>
                		</#list>
                	</ul>
                	<ul class="order-option">
                		<a href="javascript:void(0)" order="regtime"><li class="on">默认排序</li></a>
                		<a href="javascript:void(0)" order="distance"><li>离我最近</li></a>
                		<a href="javascript:void(0)" order="evaGcount"><li>好评优先</li></a>
                		<a href="javascript:void(0)" order="KeepCount"><li>人气最高</li></a>
                	</ul>
	            </div>
            </section>
            <!-- 遮罩开始 -->
	        <section class="mask"></section>
	        <!-- 遮罩结束 -->
	        <div class="viewport">
                <section>
                	<div class="block nearby-list nearby-detail-list" style="overflow:auto;"></div>
                </section>
                <section class="load">
	                <img src="${base}/resources/mobile/images/loadingA.gif">
	                <span>加载中</span>
	            </section>
            </div>
	        <@footer/>
		</div>
    </body>
</html>