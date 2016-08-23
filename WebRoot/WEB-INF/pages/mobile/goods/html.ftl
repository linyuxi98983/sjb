<!DOCTYPE html>
<html class="">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header entity.description! entity.description! entity.description!/>
        <link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css"/>
        <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
    		$(function(){
        		//顶部隐藏菜单
	            $(".header .menu").click(function(b) {
	                $(this).hasClass("active") ? ($(this).removeClass("active"), $(".t-nav").removeClass("active")) : ($(this).addClass("active"), $(".t-nav").addClass("active"));
	                b.preventDefault();
	            });
        	});
        </script>
	</head>
	<body>
		<!-- 头部开始 -->
		<@footer entity.description/>
        <!-- 头部结束 -->
        <section class="content">
        	${entity.html!}
        </section>
    </body>
</html>