<!DOCTYPE html>
<!--券领取 -->
<html lang="en">
    <head>
         <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "领券中心"/>
        <link href="${base}/resources/mobile/css/common.css" rel="stylesheet" type="text/css">
        <link href="${base}/resources/mobile/css/coupon.css" rel="stylesheet" type="text/css">
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
         <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
         <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/mobiscroll.custom-2.6.2.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="${base}/resources/mobile/css/mobiscroll.custom-2.6.2.min.css">
    </head>
    
    <body class="defwidth">
         <!-- 头部开始 -->
        <@footer "领券中心"/>
        <!-- 头部结束 -->
         <!-- 内容开始 -->
        <section class="coupon_list lists">
            <ul id="useful_tab">
                <#if voList?exists>
           		<#list voList as vo>           		
           		<#if vo.ticketKind == 0>
           		
           		 <li>
           		    <a href="#" class="arrow_con">
                    	
                    	<input type="hidden" class="ltSptICKETiD" name="entity.ltSpTicketId" value="${vo.lt_SpTicketID}">                    	
                 
                        <span class="wrap clearfix ticket_red">
                        	<dl class="coupon_content">
                        		<dt>￥${vo.amt!0}</dt>
                                <dt>${vo.ticketKindName!}</dt>
                        	</dl>
                        	<dl class="coupon_info">
                                <div><span>${vo.minDescription!}</div>
                                <div class="deadline">${vo.period!}</div>
                            </dl>
                        </span>
                    </a>
                </li>
                <#else>
                <li>
                   <a href="#" class="arrow_con">
                   <input type="hidden" class="ltSptICKETiD" name="entity.ltSpTicketId" value="${vo.lt_SpTicketID}">  
                 
                        <span class="wrap clearfix ticket_green">
                        	<dl class="coupon_content">
                        		<dt>￥${vo.amt!0}</dt>
                                <dt>${vo.ticketKindName!}</dt>
                        	</dl>
                        	<dl class="coupon_info">
                                <div><span>${vo.minDescription!}</div>
                                <div class="deadline">${vo.period!}</div>
                            </dl>
                        </span>
                    </a>
                </li>
                </#if>
            </#list>
                </#if>
               
            </ul>
        </section>
        <script type="text/javascript">
        	$(function(){
        		$("#useful_tab  li a").click(function(){
        			
        			$.ajax({
						url: "${base}/mobile/member/ticket!save.action",
						type: "get",
						data:{
							"entity.ltSpTicketId":$(this).find("input").val()
						},
						dataType: "json",
						cache: false,
						success: function(message) {
							if(message.success == "true" || message.success == true){
								showError(message.msg);
							}else{
								showError(message.errorMsg);
							}
						}
					});
				
        			
        		});
        		//顶部隐藏菜单
	            $(".header .menu").click(function(b) {
	                $(this).hasClass("active") ? ($(this).removeClass("active"), $(".t-nav").removeClass("active")) : ($(this).addClass("active"), $(".t-nav").addClass("active"));
	                b.preventDefault();
	            });
        	});
        </script>
    </body>
</html>