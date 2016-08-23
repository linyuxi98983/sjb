
<!DOCTYPE html>
<html class="p-clct-page">
    <head>
       <#include "/WEB-INF/ftl/mobile/header.ftl"/>
       <@header "我的收藏"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/common.css"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/collect.css"/>
    </head>
    <body>
        <@footer "我的收藏"/>
        <section class="content">
            <ul class="product-list">
            	<!-- freemark渲染,记得判断是否商品是否售罄 -->
               <#if list?exists>
               <#list list as fav>	
				 <li class="product-item">				 	
                    <a class="item-wrap" href="">
					<#if fav.imgPath??>					
                        <img class="p-img" src="${fav.imgPath!}" alt=""/>
		            <#else>
		            	<img class="p-img" src="${base}/resources/mobile/images/bg_pic.png" alt=""/>
		             </#if>
                        <div class="p-info">
                            <div class="p-name">${fav.name}</div>
                            <div class="p-detail">
                                <div class="p-price">&yen;${fav.showPrice}</div>
                                <!--<div class="p-avail part">区域购买</div>-->
                               
                                <span class="p-delete" onclick="pop_tips(this);return false;">删除</span>
                                <div class="mask">
						        </div>
						        <div class="confirm">
						            <p class="c-desc"></p>
						            <div class="btn-wrap">
						            	<input type="hidden" value="${fav.id}"/>
						                <button class="c-btn cancel" onclick="close_tips();">取消</button>
						                <button class="c-btn ok" onclick="ok_tips(this);">确定</button>
						            </div>
						        </div>
                            </div>
                        </div>
                    </a>
               	 </li>
				</#list>
                </#if>
              
            </ul>
        </section>
        
        <footer class="footer new">
            <section class="status-bar">
                <div class="actions-wrap">
                    <a class="nickname" href="${base}/resources/mobile/home.htm"></a>
                    <a href="javascript:logout()">退出</a>
                </div>
                <a class="top" href="javascript:scrollTo(0,0);">TOP</a>
            </section>
            <nav class="b-nav">
                <p>
                    <a href="" ontouchstart="">提建议</a>
                    <a href="" ontouchstart="">帮&nbsp;&nbsp;助</a>
                </p>
            </nav>
            <section class="copyright">
                <p>Copyright xg 2015 m.xingguang.com</p>
            </section>
        </footer>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script type="text/javascript">
        	$(function(){
        		//顶部隐藏菜单
	            $(".header .menu").click(function(b) {
	                $(this).hasClass("active") ? ($(this).removeClass("active"), $(".t-nav").removeClass("active")) : ($(this).addClass("active"), $(".t-nav").addClass("active"));
	                b.preventDefault();
	            });
        	});
        	function showConfirm(a) {
			    a && ($(".alert").hide(), $(".mask").show(), $(".confirm .c-desc").text(a), $(".confirm").show())
			}
			function hidePopups() {
			    clearTimeout(window.hideTimer);
			    $(".alert").hide();
			    $(".confirm").hide();
			    $(".mask").hide()
			}
			//删除收藏的商品
			function pop_tips() {
			    showConfirm("要删除收藏的商品吗？");			   
			}
			function close_tips() {
			    //hidePopups();
			}
			function ok_tips(o) {
			    //确定删除收藏
			     var favId =  $(o).parent().find("input").val();
			    
			     $.ajax({
            		type:'GET',
            		url:'${base}/mobile/member/favorite!delete.action',
            		dataType:'json',
            		data:{
                    	'entity.id':favId,
                    	"result":'json'
                    },
            		success:function(data){
            			if(data.success){
            				$(o).parent().parent().parent().parent().remove();
            			}
            		},
            		error:function(){
            			
            		}
            	});
			    //关闭确认遮罩
			    hidePopups();
			}
			//退出
			function logout(){
			
				window.location.href="${base}/mobile/login/login!clean.action"
			} 
        </script>
    </body>
</html>