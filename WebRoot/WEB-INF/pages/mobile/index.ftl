<!DOCTYPE html>
<html>
 <head> 
  <#include "/WEB-INF/ftl/mobile/header.ftl"/>
  <meta charset="utf-8" /> 
  <title>首页</title> 
  <meta name="keywords" content="" /> 
  <meta name="description" content="" /> 
  <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1" /> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
  <meta name="format-detection" content="telephone=no, email=no" /> 
  <link href="${base}/resources/mobile/css/main.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/dsn.css" rel="stylesheet" /> 
  <script src="${base}/resources/mobile/js/jquery-1.9.0.min.js"></script> 
  <script src="${base}/resources/mobile/js/jquery.lazyload.min.js"></script> 
  
  <script type="text/javascript">
  	function clickFun(){
       
       	
	    	var nickname = $("#zxd-name").val();
	    	if(nickname == ""){
	    		alert("昵称不能为空！");
	    		return;
	    	}
	    	var phoneNo = $("#zxd-tel").val();
	    	if(phoneNo == ""){
	    		alert("手机号不能为空！");
	    		return;
	    	}
	    	var reg = /^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
	    	if(!reg.test(phoneNo)){
	    		alert("必须输入11位数号码");
	    		return;
	    	}
	    	var User_Shen = $("#User_Shen").val();
	      	var User_City = $("#User_City").val();
	      	if(User_Shen == "" || User_City == ""){
	      		alert("省市/地区不能为空！");
	    		return;
	      	}
	      	
	      	  $('#zxd-form-submit_xxxx').attr('disabled','disabled').val('提交中..');
            
	    	$.ajax({
             type: "POST",
             url: "${base}/pc/demand/demand!save.action?result=json",
             data: {
             	"entity.nickname":$("#zxd-name").val(),
            	 "entity.phoneNo":$("#zxd-tel").val(),
            	 "entity.zoneArea":User_Shen + " " + User_City
             },
             dataType: "json",
             success: function(data){
             	if(data.success){
             		alert("需求提交成功");
             		$("#zb_form").reset();
             		$('#zxd-form-submit_xxxx').removeAttr('disabled').val('提交');
             	}else{
             		alert("需求提交失败");
             		$("#zb_form").reset();
             		$('#zxd-form-submit_xxxx').removeAttr('disabled').val('提交');
             	}
             }
             
        });
	    }
	    
	    $(function(){
	    	$("#zxd-form-submit_xxxx").on("click",function(){
	    		 clickFun();
	    	})
	    });
  </script>
  <script src="${base}/resources/mobile/js/dsn.js"></script> 
  <link href="${base}/resources/mobile/css/idangerous.swiper.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/index.css" rel="stylesheet" /> 
 </head> 
 <body> 
  <header> 
   <div class="headerTop"> 
    <span onclick="location.href=''">百爪鱼</span> 
    <i></i> 
    <a href="#" class="dsn-icon" id="show-pop-menus"></a> 
   </div> 
  </header> 
  <div class="pop-menus"> 
   <h1><a href="#" class="dsn-icon" id="hide-pop-menus"></a></h1> 
   <ul class="clearfix"> 
    <li><a href="index.html" class="dsn-icon"></a><span>首页</span></li> 
    <li><a href="${base}/mobile/case/case!pics.action" class="dsn-icon"></a><span>装修图库</span></li> 
    <li><a href="${base}/mobile/case/case!list.action" class="dsn-icon"></a><span>设计案例</span></li> 
    <li><a href="${base}/mobile/designer/designer!list.action" class="dsn-icon"></a><span>找设计师</span></li> 
   
   </ul> 
  </div> 
  <section> 
   <figure> 
   
    <div class="swiper-container"> 
     <div class="swiper-wrapper"> 
      <#list data.phomepage as phome>
				        	<#if (phome.moduleType == 1)>
					        	<#if phome.picList??>
					        	<#list phome.picList as pic>
					        	<div class="swiper-slide"> 
       <a href=""><img src="${pic.imagePath!}" /></a> 
      </div> 
					          
							    </#list>
							    </#if>
							</#if>
						    </#list> 
     </div> 
     <div class="pagination"></div> 
    </div> 
   </figure> 
   </figure> 
  </section> 
  <section> 
   <ul class="nav-link clearfix tag_index"> 
    <li><a href="${base}/mobile/case/case!pics.action" class="dsn-icon gally-icon"></a><h1>装修图库</h1></li> 
    <li><a href="${base}/mobile/case/case!list.action" class="dsn-icon design-case-icon"></a><h1>设计案例</h1></li> 
    <li><a href="${base}/mobile/designer/designer!list.action" class="dsn-icon find-designer-icon"></a><h1>找设计师</h1></li> 
   </ul> 
  </section> 
  <section class="zbformBox"> 
   <div class="zbformhead"> 
    <p>申请定制设计</p> 
    <div>
     已有
     <label>119,554</label>位业主申请
    </div> 
   </div> 
   <form name="zbform" action="" method="post" id="zb_form"> 
    <input type="hidden" id="referer" value="" /> 
    <div class="user-frame"> 
     <input id="zxd-name" type="text" placeholder="您的称呼" /> 
    </div> 
    <div class="user-frame"> 
     <input id="zxd-tel" type="tel" name="mobile" pattern="1[3|4|5|7|8|][0-9]{9}" placeholder="手机号码" /> 
    </div> 
    <div class="select-city clearfix"> 
     <div id="select-province" class="provincePos"> 
      <select name="User_Shen" id="User_Shen" onchange="changeProvince('User_Shen','User_City','User_Town');"></select> 
     </div> 
     <div id="select-city" class="cityPos"> 
      <select name="User_City" id="User_City"></select> 
     </div> 
     <input type="hidden" id="User_Town" name="User_Town" value="" /> 
    </div> 
  
    
    <input type="button" class="submitBtn" id="zxd-form-submit_xxxx" value="立即提交" /> 
   </form> 
  </section> 
  <section class="hot-recommend"> 
   <h1>热门设计师推荐</h1> 
   <div id="desingerlist"> 
    <ul class="clearfix"> 
    <#list data.memberList as member>
				        	<li> 
      <figure> 
       <a href=""><img src="${member.imagePath!}" /></a> 
       <figcaption>${member.nickname}</figcaption> 
      </figure> 
    </li> 
	</#list>
    </ul> 
   </div> 
   <div id="designerCompany"> 
    <ul class="clearfix"></ul> 
   </div> 
  </section> 
  <section> 
   <ul class="gally-case clearfix"> 
    <li><h1><a href="">图库专题</a></h1><p><a href=""><img src="http://img.shejiben.com/wap/new_wap/dsn_22.png" /></a></p></li> 
    <li> <h1><a href="">案例解析</a></h1><p><a href=""><img src="http://img.shejiben.com/wap/new_wap/dsn_25.png" /></a></p></li> 
   </ul> 
  </section> 
  <section class="room-inner-case"> 
   <h1> 室内设计案例 <p><a href="${base}/mobile/case/case!list.action?type=0">网咖</a> <a href="${base}/mobile/case/case!list.action?type=1">电竞</a> </p> </h1> 
   <ul id="designWorksList"> 
    <#list data.designWorks as work>	
    <li id="firstListDiv"> 
     <figure> 
      <a href=""><img class="lazy" src="${work.imagePath!}" data-original="${work.imagePath!}" alt="${work.title}" /> </a>
      <figcaption>
       <a> 
        <hgroup> 
         <h1><a href="http://m.shejiben.com/sjs/594981/" class="noafter"><img src="${work.memberImagePath!}" /></a></h1> 
         <h2>${work.title}</h2> 
         <h3 class="clearfix"><strong>设计师：${work.member!}</strong><span class="dsn-icon gally-icon-count">20</span></h3> 
        </hgroup></a> 
      </figcaption>  
     </figure> </li> 
     </#list>   
   </ul> 
   <a class="lookmore" id="loadMore" style="cursor:pointer">查看更多<span></span></a> 
   <input type="hidden" id="recordCount" value="0"/>
   <input type="hidden" id="pageCount" value="1"/>
   <input type="hidden" id="readMore" value="0"/>
   <input type="hidden" id="currentPage" value="1"/>
   <script>
   		var pageNumber = 0;
   		var pageSize = 10;
   		$(function(){
   			$("#loadMore").bind("click",function(){ 
   			
   				pageNumber++;   				
   				$("#currentPage").val(pageNumber);
   				
   				
   				$.ajax({
   					type:"post",
   					url:"${base}/mobile/case/case!loadMore.action",
   					data:{
   						pageNumber:pageNumber,
   						pageSize:pageSize,
   						result:"json"
   					},
   					dataType:"json",
   					success:function(data){
   						var pager = data.pager;
   						$("#recordCount").val(pager.pageCount);   						
   						var list = data.list;
   						var html = "";
   						
   						for(var i=0;i<list.length;i++){
   							var memberImagePath = list[i].memberImagePath;
   							var member = list[i].member;
   							var imagePath = list[i].imagePath;
   							console.log(imagePath);
   							var title = list[i].title;
   							html += '<li><figure><a href=""><img class="lazy" src="'+imagePath+'" data-original="'+imagePath+'" alt="list[i].title" />'+
   						 '</a><figcaption><a> <hgroup> <h1><a href="http://m.shejiben.com/sjs/594981/" class="noafter"><img src="'+memberImagePath+'" /></a></h1> <h2>'+title+'</h2> <h3 class="clearfix">'+
   						 '<strong>设计师：'+member+'</strong><span class="dsn-icon gally-icon-count">20</span></h3> </hgroup></a> </figcaption>  </figure> </li> '   ;
   						}
   						$("#firstListDiv").remove();
   						$("#designWorksList").append(html);
   						
   						if($("#readMore").val()==0){
		   					$("#readMore").val(1);
		   					var recordCount = $("#pageCount").val();
			   				var pageCount = Math.ceil(pager.pageCount/pageSize);			   				
			   				$("#pageCount").val(pageCount);
		   				}
		   				
		   				if(pageNumber == $("#pageCount").val()){
		   					$("#loadMore").html("沒有更多記錄！");
		   					$("#loadMore").unbind("click");
		   				}
   					}
   				});
   			})
   		})
   </script>
  </section> 
  <section> 
   <div class="answerQuestions"> 
    <h1>有问必答 <span><a href="">设计疑惑 | </a><a href="http://m.shejiben.com/ask/zhuangxiuqianhou/">装修前后 | </a><a href="http://m.shejiben.com/ask/tupianwenti/">图片问题 </a></span></h1> 
    <ul> 
     <li><a href=""><h2>请问过道的砖是多大的呢</h2><h3>图片问题丨1天以前<span>5回应</span></h3></a></li> 
     <li><a href=""><h2>这墙是什么颜色？怎么调？</h2><h3>图片问题丨2天以前 <span>6回应</span></h3></a></li> 
     <li><a href=""><h2>背景墙材质</h2><h3>图片问题丨2天以前<span>7回应</span></h3></a></li> 
    </ul> 
    <a href="" class="lookmore paddTop6 ">查看更多<span></span></a> 
   </div> 
  </section> 
  <section> 
   <div class="clickeffect"> 
   <!-- <h1>装修图库</h1> 
    <ol> 
     <li class="clearfix"> 
     	<a href="javascript:void(0)">网咖<br />空间</a> 
     	<a href="">客厅</a> 
     	<a href="">卧室</a> 
     	<a href="">餐厅</a> 
     	<a href="">厨房</a> 
     	<a href="">卫生间</a> 
     	<a href="">阳台</a> 
     	<a href="">书房</a> 
     	<a href="">玄关</a> 
     	<a href="">过道</a> 
     	<a href="">儿童房</a> 
     	<a href="">衣帽间</a> 
     	<a href="">花园</a> 
     	<a href="">休闲区</a> 
     	<a href="">地台</a> 
     	<a href="">窗台</a> 
     	<a href="">楼梯</a> 
     	<a href="">吧台</a> 
     	<a href="">酒窖</a> 
     	<a href="">壁炉</a> 
     	<a href="">地下室</a> 
     	<a href="">视听室</a> 
     	<a href="">阁楼</a> 
     </li> 
    </ol> 
    <ol> 
     <li class="clearfix"> 
	     <a href="javascript:void(0)">网咖<br />网咖风格</a> 
	     <a href="">混搭</a> 
	     <a href="">欧式</a> 
	     <a href="">中式</a> 
	     <a href="">新古典</a> 
	     <a href="">东南亚</a> 
	     <a href="">美式</a> 
	     <a href="">田园</a> 
	     <a href="">地中海</a> 
	     <a href="">现代</a> 
     </li> 
    </ol> 
    <ol> 
     <li class="clearfix"> 
	     <a href="javascript:void(0)">电竞<br />空间</a> 
	     <a href="">酒店空间</a> 
	     <a href="">购物空间</a> 
	     <a href="">文化空间</a> 
	     <a href="">商业展示</a> 
	     <a href="">医疗机构</a> 
	     <a href="">办公空间</a> 
	     <a href="">餐饮空间</a> 
	     <a href="">娱乐空间</a> 
	     <a href="">休闲场所</a> 
	     <a href="">售楼中心</a> 
	     <a href="">金融机构</a> 
	     <a href="">运动场所</a> 
	     <a href="">教育机构</a> 
     </li> 
    </ol> -->
   </div> 
  </section> 
  <script src="${base}/resources/mobile/js/idangerous.swiper.min.js"></script> 
  <script src="${base}/resources/mobile/js/GlobalProvinces.js" type="text/javascript"></script> 
  <script type="text/javascript">
    var gpm = new GlobalProvincesModule;
    gpm.def_province = ["省/市", ""];
    gpm.def_city1 = ["市/地区", ""];
    gpm.def_city2 = ["县/市", ""];
    gpm.initProvince(document.getElementById('User_Shen'));
    gpm.initCity1(document.getElementById('User_City'), gpm.getSelValue(document.getElementById('User_Shen')));
  </script> 
  <script src="${base}/resources/mobile/js/zb_post.js"></script> 
    <script>  
	    var mySwiper = new Swiper('.swiper-container',{
	        pagination: '.pagination',
	        loop:false,
	        grabCursor: true,
	        paginationClickable: true
	    })
	    $(function(){
	       var imgheight = document.body.clientWidth * 160 / 300;
	       $(".swiper-container,.swiper-wrapper,.swiper-slide,.swiper-slide img").height(imgheight)
	       $(window).on("resize",function(){
	          var imgheight = document.body.clientWidth * 160 / 300;
	          $(".swiper-container,.swiper-wrapper,.swiper-slide,.swiper-slide img").height(imgheight)
	       })
	    }) 
	</script> 
    <input type="hidden" id="pagename" value="index" /> 
    <div class="tel_400"> 
     <a href="tel:4006808509,9999"> 
   	 <span class="span-info">找设计师请拨打：</span> 
   	 <i class="icon_tel_red"></i> 
   	 <span class="span-tel">4006-808-509 转 9999</span>
    </a> 
   </div> 
   <div class="bottombar"></div> 
   <div class="pg-ft"> 
    <ul class="terminal-nav"> 
     <li><a class="active" href="javascript:void(0)">触屏版</a></li> 
     <li><span class="i-sep"></span><a href="http://www.shejiben.com/">电脑版</a><span class="i-sep"></span></li> 
     <li> <a href="${base}/resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
<span class="i-sep"></span></li> 
     <li><a href="" rel="nofollow">客户端下载</a></li> 
    </ul> 
   <div class="company-info">@2014 百爪鱼 粤ICP备08125558号-2</div> 
  </div> 
  <div id="scrollButton" class="scrollButton"></div> 
  <input type="hidden" id="page_value" pagename="index" value="index" /> 
  <script src="js/login.js"></script> 
 </body>
</html>