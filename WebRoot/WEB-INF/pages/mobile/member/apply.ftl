<!DOCTYPE html>
<html class="">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "活动报名"/>
        <link rel="apple-touch-icon-precomposed" href="">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="">
        <link rel="stylesheet" href="${base}/resources/mobile/css/userinfo.css"/>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
         <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
         <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
        <script>
        	
        	$(function(){
        		$(".apply-btn-on").on("click",function(){
        			$.ajax({
						url: "${base}/mobile/member/activity!save.action",
						type: "POST",
						data: $("form").serialize(),
						dataType: "json",
						cache: false,
						success: function(message) {
						console.log(message.success=="true" || message.success==true)
							if(message.success){
								showError("恭喜您，您已成功报名！");
								window.location.href = "${base}/mobile/member/home.action";
							}else{
								showError("报名失败！");
							}
						}
					});
        		});
        	});
        </script>
	</head>
	<body style="background-color:#fff">
		<div>
			<header class="header">
	            <a class="back c_back" href="javascript:history.back();">返回</a>
	            <div class="h_label">活动报名</div>
	        </header>
	        <form >
	        	<input name="entity.ltSpActivityId" type="hidden" value="${entity.id}"/>
	        	<div id="user-content" class="viewport">
	        	<section class="jump">
		        	<a href="javascript:void(0)" class="arrow_con">
		        		<div class="">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 :<input type="text" name="entity.name" placeholder="请输入姓名" class="owner-info"/></div>
		        	</a>
		        </section>
		        <section class="jump">
		        	<a href="javascript:void(0)" class="arrow_con">
		        		<div class="">联系方式 :<input type="text" placeholder="请输入联系方式" name="entity.phoneNo" class="owner-info"/></div>
		        	</a>
		        </section>
		        <section class="jump">
		        	<a href="javascript:void(0)" class="arrow_con">
		        		<div class="">参与人数 :<input type="text" placeholder="请输入参与人数" name="entity.manCount" class="owner-info"/></div>
		        	</a>
		        </section>
		        <sectio>
		        	<a href="javascript:void(0)" class="arrow_con">
		        		<div class="">留言:</div>
		        		<textarea rows="7" class="desc-content" name="entity.message"></textarea>
		        		<div class="left-word">还可输入<span>1000</span>字</div>
		        	</a>
		        </section>
		        <a class="apply-btn-on" href="#">提交</a>
            </div>
	        </form>
		</div>
    </body>
</html>