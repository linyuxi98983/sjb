<!DOCTYPE html>
<html class="">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "消息中心"/>
        <link rel="apple-touch-icon-precomposed" href="">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="">
        <link rel="stylesheet" href="${base}/resources/mobile/css/userinfo.css"/>
	</head>
	<body style="background-color:#F0F0F0">
		<header class="header">
            <a class="back c_back" href="javascript:history.back();">返回</a>
            <div class="h_label">消息中心</div>
        </header>
       
        	
         <#if list?exists>
                    	<#list list as notice>
        <div style="" id="xqtz">
        		<div class="news-detail-time">${notice.startTime?string("yyyy-MM-dd HH:mm:ss")}</div>  
           	<div class="xqtz-detail-list">
				<div><span class="simple-title">${notice.title!}</span></div>
				<div class="simple-inform">${notice.detail!}</div>
           	</div>
                    	
        </div>
        	</#list>
        </#if>
   	</body>
</html>