<!DOCTYPE html>
<html class="">
    <head>
        
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "活动列表"/>
        <link rel="apple-touch-icon-precomposed" href="">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="">
        <link rel="stylesheet" href="${base}/resources/mobile/css/userinfo.css"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/util.css"/>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
         <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
         <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
	    <style>
	    	.linde{
	    		width:100%;
	    		height:1px;
	    		background:gray;
	    		margin-top:5px;
	    		margin-bottom:5px;
	    	}
	    </style>
        <script>
        	function applyFun(id){
        		$.ajax({
						url: "${base}/mobile/member/activity!validation.action?id="+id,
						type: "POST",
						dataType: "json",
						cache: false,
						success: function(message) {
						
							if(message.success){
								window.location.href = "${base}/mobile/member/member!apply.action?id="+id;
							}else{
								showError("您已经报过名了！<div class='linde'></div><div style='color:#F39800;'>朕知道了</div>");
							}
						}
					});
        	}
        	
        	$(function(){
        		$(".list-activity").on("click",function(){
        			window.location.href = "${base}/mobile/activity/activity!detail.action?id="+$(this).parent().attr("id");
        		});
        	});
        	
        </script>
	</head>
		<body style="background-color:#F0F0F0">
		<header class="header" style="background:#F39800;">
            <a class="back c_back" href="javascript:history.back();">返回</a>
            <div class="h_label" style="background:#F39800">活动列表</div>
        </header>
        <div>	<div style="background-color:#FFF;padding:10px;">
	           	<#if list?exists>
                 <#list list as vo>
                   
	           		<table>
	           		<tr id="${vo.id}">
	           			<td><div style="margin-top:">
	           			
	           			<td class="list-activity" ><divclass="img-content"><#if vo.imagePath?exists> 
	           			<img class="img-icon" src="${vo.imagePath!}"/>
	           			<#else>
	           			<img class="activity-icon" src="${base}/resources/mobile/images/bg_pic.png"/>
	           			</#if>
	           			</div></td>
	           			<td class="activity-detail list-activity">
	           				<div><span class="activity-title">${vo.name!}</span></div>
	           				<div>时间：${vo.startDate?string("yyyy-MM-dd")}至${vo.endDate?string("yyyy-MM-dd")}</div>	           				
	           				<div>地点：${vo.address!}</div>
	           				<div><span class="left-span">已有${vo.manCount}人报名</span></div>
	           			</td>
	           			<td class="activity-detail"><div></div><div></div><div></div><div></div><div><span class="right-span" onclick="applyFun('${vo.id}')">立即报名</span></div></td>
	           		</tr>
	           	</table>
	           </#list>
	        </#if>
           	</div>
        </div>
   	</body>
</html>