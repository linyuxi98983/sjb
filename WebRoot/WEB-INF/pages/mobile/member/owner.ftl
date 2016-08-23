<!DOCTYPE html>
<html class="">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "申请成为业主"/>
        <link rel="apple-touch-icon-precomposed" href="">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="">
        <link rel="stylesheet" href="${base}/resources/mobile/css/userinfo.css"/>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
         <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
         <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/mobiscroll.custom-2.6.2.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="${base}/resources/mobile/css/mobiscroll.custom-2.6.2.min.css">
        <style>
        .apply-btn-on {
    background-color: #F39800;
    color: white;
    font-size: .9rem;
    text-align: center;
    display: block;
    width: 94%;
    margin:0 auto;
    border-radius: .25rem;
    margin-top: 1.75rem;
    line-height: 3.25rem;
}
        
        </style>
        
        <script>
        
        function updateUserInfo(id){
	    		$("#pop_mask,#birthday-win").show();
	    			$("#photo-win").hide()
	    			$(".finish").hide();   		
	    	}
        	$(function(){
        		var opt = {  
			        theme: "android-ics light", 
			        display: 'modal', //显示方式  
			        lang: "zh",  
			        setText: '确定', //确认按钮名称
			        cancelText: "取消",  
			        dateFormat: 'yyyy-mm-dd', //返回结果格式化为年月格式  
			        dateOrder: 'yyyymmdd', //面板中日期排列格式
			        onBeforeShow: function (inst) {
					//	console.info( inst.settings.wheels);
			          }, 
			        headerText: function (valueText) { //自定义弹出框头部格式  
			        //	console.info(valueText);
			            array = valueText.split('-');  
			            return array[0] + "年" + array[1] + "月" + array[2] + "日";  
			        }  
			    };
			
			  $("#txtBirthday").mobiscroll().date(opt); 
        		$(".apply-btn-on").on("click",function(){
        			$.ajax({
						url: "${base}/mobile/member/owner!save.action",
						type: "POST",
						data: $("form").serialize(),
						dataType: "json",
						cache: false,
						success: function(message) {
						console.log(message.success=="true" || message.success==true)
							if(message.success){
								showError("成功申请为业主！");
								window.location.href = "${base}/mobile/member/home.action";
							}else{
								showError("申请失败！");
							}
						}
					});
        		});
        		
        		
        	});
        	
        	 $(function () {  
			var opt = {  
			        theme: "android-ics light", 
			        display: 'modal', //显示方式  
			        lang: "zh",  
			        setText: '确定', //确认按钮名称
			        cancelText: "取消",  
			        dateFormat: 'yyyy-mm-dd', //返回结果格式化为年月格式  
			        dateOrder: 'yyyymmdd', //面板中日期排列格式
			        onBeforeShow: function (inst) {
					//	console.info( inst.settings.wheels);
			          }, 
			        headerText: function (valueText) { //自定义弹出框头部格式  
			        //	console.info(valueText);
			            array = valueText.split('-');  
			            return array[0] + "年" + array[1] + "月" + array[2] + "日";  
			        }  
			    };
			
			  $("#txtBirthday").mobiscroll().date(opt); 
			
			});
        </script>
	</head>
	<body style="background-color:#fff">
		<div>
			<header class="header">
	            <a class="back c_back" href="javascript:history.back();">返回</a>
	            <div class="h_label">申请成为业主</div>
	        </header>
	        <div id="user-content" class="viewport">
	        	<form method="post">
	        		<section class="jump">
		        	<div class="arrow_con">业主姓名:<input type="text" placeholder="请输入业主姓名" name="entity.name" class="owner-info"/></div>
		        </section>
		        <section class="jump">
		        	<div class="arrow_con">联系方式 :<input type="text" placeholder="请输入联系方式" name="entity.phoneNo" class="owner-info"/></div>
		        </section>
		        <section class="jump">
		        	<div class="arrow_con">物业面积:<input type="text" placeholder="请输入物业面积" name="entity.areaSize" class="owner-info"/></div>
		        </section>
		        <section class="jump">
		        	<div class="arrow_con" onclick="updateUserInfo('birthday',this)">购置日期:<input id="txtBirthday" class="text" placeholder="请输入购置日期" readonly type="text" name="entity.purchaseDate" maxlength="10"/>
		        		
		        </section>
		        <section class="jump">
		        	<div class="arrow_con">物业地址:<input type="text" placeholder="请输入物业地址" name="entity.address" class="owner-info"/></div>
		        </section>
		        <sectio>
		        	<div class="arrow_con">物业简介:</div>
		        		<textarea rows="7" class="desc-content" name="entity.description"></textarea>
		        		<div class="left-word">还可输入<span>1000</span>字</div>
		        </section>
	        	</form>
		       <!-- <a class="apply-btn" href="#">登录</a>-->
		       <a class="apply-btn-on" href="#">提交申请</a>
            </div>
			<!-- 遮罩与浮动框 -->
			<section class="f_mask" id="pop_mask" style="display: none;"></section>
			
			<!-- 遮罩与浮动框 -->
			<div id="birthday-win" class="m_tips" style="display: none;">
				<div class="m_birthday">
					<div>日期控件</div>
					<div>按钮</div>
				</div>
			</div>
		</div>
    </body>
</html>