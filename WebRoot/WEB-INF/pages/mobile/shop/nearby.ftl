<!DOCTYPE html>
<html class="">
    <head>
    	<#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "附近-触屏版"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/nearby.css"/>
	    <script src="${base}/resources/mobile/js/zepto.min.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/shop.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/search.js" type="text/javascript"></script>
	    <script type="text/javascript">
	    	$().ready(function(){
	    		nearbyInit();
	    	});
	    </script>
	</head>
	<body style="">
		<div>
			<header class="header" style="">
	            <a class="back c_back" href="${url_index!}" style="color:#464646;background-image:url(${base}/resources/mobile/images/c_back_btn.png);">返回</a>
	            <div class="h_label">附近</div>
	            <a href="javascript: void(0)" class="menu"></a>
	        </header>
	        <div class="viewport">
	        	<input type="hidden" id="curr_page" value="1"/>
	        	<input type="hidden" name="lat"/>
	        	<input type="hidden" name="lng"/>
                <section class="_pre">
                	<div class="nearby-type"></div>
                	<div class="block nearby-list"></div>
                </section>
                <section class="load">
	                <img src="${base}/resources/mobile/images/loadingA.gif">
	                <span>加载中</span>
	            </section>
            </div>
 			<#if !Session["apptype"]?exists><@footer/></#if> 
		</div>
    </body>
</html>