<!DOCTYPE html>
<html class="">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "完善资料"/>
        <link rel="apple-touch-icon-precomposed" href="">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="">
        <link rel="stylesheet" href="${base}/resources/mobile/css/userinfo.css"/>
	    <script src="${base}/resources/mobile/js/zepto.min.js" type="text/javascript"></script>
	      <script src="${base}/resources/mobile/js/jquery.min.js" type="text/javascript"></script>
        <script src="${base}/resources/mobile/js/jquery.cookie.js" type="text/javascript"></script>
         <link href="${base}/resources/mobile/css/warn-tip.css" rel="stylesheet" type="text/css"/>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/mobiscroll.custom-2.6.2.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="${base}/resources/mobile/css/mobiscroll.custom-2.6.2.min.css">
	    <script type="text/javascript">
	       var currentPage = "";
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
	    	
	    	$(function(){
	    		$(".finish").click(function(){
	    			$("form").submit();
	    		});
	    	});
	    	function updateUserInfo(id){
	    		currentPage = id;	    		
	    		if("userImage"==id){//头像
	    			$("#cameraInput").click();
	    		}else if("birthday-win"==id){
	    			$("#pop_mask,#birthday-win").show();
	    			$("#photo-win").hide()
	    			$(".finish").hide();
	    		}else{javascript:void(0)
	    			$("#user-content").hide();
	    			$("#"+id).show();
	    			$(".finish").hide();
	    		}	    		
	    	}
	    	function goBack(){
	    		if(currentPage == ""){
	    			history.go(-1);
	    		}else{
	    			$("#user-content").show();
	    			$("#"+currentPage).hide();
	    			if(currentPage != "sex"){
	    				$("#"+currentPage+"Text").text($("#"+currentPage).find("input").val());
	    			}
	    			$(".finish").show();
	    		}
	    	}
	    	function selectSex(o){
	    		$("#sex").children().each(function(){
	    			$(this).find("span").css("color","#787878");
	    		});
	    		
	    		$(o).find("span").css("color","#F39800");
	    		$("#sex").find("input").val($(o).find("span").attr("id"));
	    		$("#sexText").text($(o).find("span").text());
	    	}
	    	function reset(o){
	    		$("#pop_mask").hide(); 
	    		$(o).parent().parent().hide();
	    	}
	    	
	    	
	    	
	    	
			function myFiles(o){
				var tar = o,
				files = tar.files,
				fNum = files.length,
				URL = window.URL || window.webkitURL;
				if(!files[0])return;
				
				for(var i=0;i<fNum;i++){
					if(files[i].type.search(/image/)>=0){
						var blob = URL.createObjectURL(files[i]);
						$("#j_thumb").attr("src",blob);
					}
				}
			}
	    </script>
	</head>
	<body style="">
		<div>
			<header class="header">
	            <a class="back c_back" href="javascript:goBack();">返回</a>
	            <div class="h_label">完善资料</div>
	            <a href="javascript:void(0)" class="finish">完成</a>
	        </header>
	        <div id="user-content" class="viewport">
	        	<section class="jump">
		        	<a href="javascript:void(0)" onclick="updateUserInfo('userImage',this)" class="arrow_con">
		        		<div class="arrow user-image">头像<span class="info-detail">
		        		<#if entity.imagePath? exists>
		                  		 <img class="info-img" src="${entity.imagePath!}" id="j_thumb"/>
		                  	 <#else>
		                   	 	<img class="info-img" src="${base}/resources/mobile/images/user/user-image.png" alt="用户"  id="j_thumb"/>
		                   	 </#if>
		        		</span>
		        		</div>
		        	</a>
		        </section>
	        	<section class="jump">
		        	<a href="javascript:void(0)" onclick="updateUserInfo('trueName',this)" class="arrow_con">
		        		<div class="arrow">姓名<span class="info-detail" id="trueNameText">${entity.realName!}</span></div>
		        	</a>
		        </section>
		        <section class="jump">
		        	<a href="javascript:void(0)" onclick="updateUserInfo('nickName',this)" class="arrow_con">
		        		<div class="arrow">昵称<span class="info-detail" id="nickNameText">${entity.nickname!}</span></div>
		        	</a>
		        </section>
		        <section class="jump">
		        	<a href="javascript:void(0)" onclick="updateUserInfo('sex',this)" class="arrow_con">
		        		<div class="arrow">性别<span class="info-detail" id="sexText">
		        		<#if entity.sex ? exists>
		        			<#if entity.sex == 0>
		        				<@spring 'global.sex.man'/>
		        			<#else>
		        				<@spring 'global.sex.woman'/>
		        			</#if>
		        		</#if>
		        		</span>
		        		</div>
		        	</a>
		        </section>
		        <section class="jump">
		        	<a href="javascript:void(0)" onclick="updateUserInfo('birthday',this)" class="arrow_con">
		        		<div class="arrow">
		        			<div class="arrow">生日<span class="info-detail" id="birthdayText">
		        				<#if entity.birthday?exists>
		        					${entity.birthday?string("yyyy-MM-dd")}
		        				</#if>
		        			</span></div>
		        		</div>
		        	</a>
		        </section>
		        <section class="jump">
		        	<a href="javascript:void(0)" onclick="updateUserInfo('mail',this)" class="arrow_con">
		        		<div class="arrow">邮箱<span class="info-detail" id="mailText">${entity.email!}</span></div>
		        	</a>
		        </section>
            </div>
			<!-- 资料修改 -->
			<form action="${base}/mobile/member/member!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
				<div id="update-tab" class="viewport">
					<section id="trueName" class="jump" style="display:none">
						<a href="javascript:void(0)" class="arrow_con">
			        		<input class="text" type="text" value="${entity.realName!}" name="entity.realName" maxlength="20"/>
			        	</a>
			        </section>
			        <section id="nickName" class="jump" style="display:none">
			        	<a href="javascript:void(0)" class="arrow_con">
			        		<input class="text" type="text" value="${entity.nickname!}" name="entity.nickname" maxlength="20"/>
			        	</a>
			        </section>
			        <section id="sex" class="jump" style="display:none">
			        	<a onclick="selectSex(this);" class="arrow_con" id="man">
			        		<span id="0" style="color:#F39800"><@spring 'global.sex.man'/></span>
			        	</a>
			        	<div style="border-bottom: 1px solid #ccc;"></div>
			        	<a onclick="selectSex(this);" class="arrow_con" id="woman">
			        		<span id="1"><@spring 'global.sex.woman'/></span>
			        	</a>
			        	<input type="hidden" value="${entity.sex!}" name="entity.sex"/>
			        </section>
			        <section id="birthday" class="jump" style="display:none">
			        	<a href="javascript:void(0)" class="arrow_con">
			        	 	<#if entity.birthday?exists>
			        	 		<input class="text" id= "txtBirthday" readonly type="text" name="entity.birthday" value="${entity.birthday?string("yyyy-MM-dd")}" maxlength="10"/>
			        	 	<#else>
			        	 		<input class="text" id= "txtBirthday" readonly type="text" name="entity.birthday" value="" maxlength="10"/>		        			
			        		</#if>		        		
			        	</a>
			        </section>
			        <section id="mail" class="jump" style="display:none">
			        	<a href="javascript:void(0)" class="arrow_con">
			        		<input class="text" type="text" value="${entity.email!}" name="entity.email" maxlength="40"/>
			        	</a>
			        </section>
				</div>
				<div style="display:none;" id="cameraInput_div">
					<input class="text" type="hidden" value="${entity.id!}" name="entity.id" maxlength="20"/>
					<input type="hidden" name="entity.otSpPictureId" value="${entity.otSpPictureId!}"/>
			<input type="file" capture="camera" name="entity.image" accept="image/*" id="cameraInput" name="cameraInput" style="dispaly:none;" onchange="myFiles(this);"/>
			    </div>    	
			</form>
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