<!DOCTYPE html>
<html class="">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "积分历史"/>
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
		<@footer "积分历史"/>
        <!-- 头部结束 -->
        <section class="content">
        	<table style="width:100%">
        	<#list list as getpoint>
        		<tr>
        			<td style="width:80%;padding-left:5px;">
        				<em style="font-size:.75rem;">
        					${getpoint.description!} 
        				</em><br/> 
        				<em style="font-size:.55rem;color:#919191">
        					${getpoint.getTime!}</td>
        				</em>
        			</td>
        			<td style="width:20%;text-align:right;padding-right:5px">
        				<em style="color:red;">${getpoint.getPoint!}</em>
        			</td>
        		</tr>
        		<tr>
        			<td colspan="2">
        				<br/>
        				<hr style="height:1px;border:none;border-top:1px dashed #0066CC;"/>
        			</td>
        		</tr>
        	</#list>
        	</table>
        </section>
    </body>
</html>