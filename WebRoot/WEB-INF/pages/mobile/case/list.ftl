<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8" /> 
  <title>装修案例</title> 
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
  <script src="${base}/resources/mobile/js/dsn.js"></script> 
  <script src="${base}/resources/mobile/js/login.js"></script> 
  <script type="text/javascript">
  	function logout(){
  		alert("logout");
  	}
  </script>
 </head> 
 <body> 
  <header> 
   <div class="headerTop"> 
    <span onclick="location.href=''">百爪鱼</span> 
    <i>设计案例</i> 
    <a href="#" class="dsn-icon" id="show-pop-menus"></a> 
   </div> 
  </header> 
  <div class="pop-menus"> 
   <a href="" class="login-info">设计师</a>
   <a href="javascript:void(0)" class="login-exit" onclick="logout()">[退出]</a>
   <h1>
     <a href="#" class="dsn-icon" id="hide-pop-menus"></a>
   </h1>
   <ul class="clearfix"> 
   	<li><a href="${base}/resources/mobile/index.html" class="dsn-icon"></a><span>首页</span></li> 
    <li><a href="${base}/resources/mobile/decorate/decorate-pics.html" class="dsn-icon"></a><span>装修图库</span></li> 
    <li><a href="${base}/resources/mobile/case/case.html" class="dsn-icon"></a><span>设计案例</span></li> 
    <li><a href="${base}/resources/mobile/designer/designer.html" class="dsn-icon"></a><span>找设计师</span></li> 
    <li><a href="" class="dsn-icon"></a><span>有问必答</span></li> 
    <li><a href="" class="dsn-icon"></a><span>设计资讯</span></li> 
    <li><a href="" class="dsn-icon"></a><span>设计师专访</span></li> 
    <li><a href="" class="dsn-icon"></a><span>提交需求</span></li> 
    <li><a href="" class="dsn-icon"></a><span>逛商城</span></li> 
    <li><a href="" class="dsn-icon"></a><span>模型下载</span></li> 
   </ul> 
  </div> 
  <section> 
   <ul class="top-menus clearfix"> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=家居'"> <a>家居</a> </li> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=酒店'"> <a>酒店</a> </li> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=办公'"> <a>办公</a> </li> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=商业'"> <a>商业</a> </li> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=文化'"> <a>文化</a> </li> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=购物'"> <a>购物</a> </li> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=医疗'"> <a>医疗</a> </li> 
    <li onclick="javascript:location.href='${base}/mobile/case/case!list.action?houseTypeOrSpaceType=样板房'"> <a>样板房</a> </li> 
   </ul> 
  </section> 
  <!--<section class="room-inner-case"> 
   <h1><a href=""> 案例解析</a></h1> 
   <ul> 
    <li> 
     <div class="swiper-container"> 
      <div class="swiper-wrapper"> 
       <div class="swiper-slide"> 
        <a href=""> <img class="lazy" src="http://pic.shejiben.com/jiexi/m_201604/cover_path_1531308.jpg?1461636113" alt="【第238期】欧风美雨——107平田园风样板房" /> </a> 
       </div> 
       <div class="swiper-slide"> 
        <a href=""> <img class="lazy" src="http://pic.shejiben.com/jiexi/m_201604/cover_path_1530431.jpg?1461635870" alt="【第237期】罗马假日——245㎡美式休闲三居" /> </a> 
       </div> 
       <div class="swiper-slide"> 
        <a href=""> <img class="lazy" src="http://pic.shejiben.com/jiexi/m_201604/cover_path_1527361.jpg?1461635829" alt="【第236期】春日下，棠墅——500㎡美式别墅" /> </a> 
       </div> 
       <div class="swiper-slide"> 
        <a href=""> <img class="lazy" src="http://pic.shejiben.com/jiexi/m_201604/cover_path_1524254.jpg?1461635880" alt="【235期】园里火锅——1380平米清爽餐厅设计" /> </a> 
       </div> 
       <div class="swiper-slide"> 
        <a href=""> <img class="lazy" src="http://pic.shejiben.com/jiexi/m_201604/cover_path_1525347.jpg?1461635909" alt="【第234期】鸢尾——330㎡休闲混搭美式别墅" /> </a> 
       </div> 
      </div> 
      <div class="pagination"></div> 
     </div> 
    </li> 
   </ul> 
  </section> -->
  <section class="room-inner-case"> 
   <h1><a href="">网咖案例</a></h1> 
   <ul> 
     <#if data.designWorks??>
          
          	<#list data.designWorks as ds>
                		<li>
                		<figure> 
      <a href="" class="noafter"> <img class="lazy" src="${ds.imagePath!}" data-original="${ds.imagePath!}" alt=""  style="height:230px;"/> </a>
      <figcaption>
       <a> 
        <hgroup> 
         <h1><a href="" class="noafter"><img class="lazy" src="${ds.mb.imagePath!}" data-original="${ds.mb.imagePath!}"/></a></h1> 
         <h2>${ds.title!}</h2> 
         <h3 class="clearfix"> <strong>设计师：${ds.member!}</strong> <span class="dsn-icon gally-icon-count">17</span> </h3> 
        </hgroup>
       </a> 
      </figcaption>  
     </figure> 
    </li> 
                	</#list>
      </#if> 
   </ul> 
  </section> 
  <input type="hidden" value="${data.type!}" name="type" id="type"/>
  <div class="decorate_index"> 
   <div class="hot_words"> 
    <div class="hot">
      热门搜索 
    </div> 
    <div class="words"> 
     <div>
      <a href="">接待室效果图</a>
     </div> 
     <div>
      <a href="酒店">酒店房间设计</a>
     </div> 
     <div>
      <a href="">旅店装修</a>
     </div> 
     <div>
      <a href="">哥特网咖风格</a>
     </div> 
     <div>
      <a href="">精装房</a>
     </div> 
     <div>
      <a href="">椅子</a>
     </div> 
     <div>
      <a href="">整体浴室</a>
     </div> 
     <div>
      <a href="">时尚装修</a>
     </div> 
     <div>
      <a href="">橱柜台面</a>
     </div> 
     <div>
      <a href="">酒吧卡座</a>
     </div> 
    </div> 
   </div> 
  </div> 
  <script src=""></script> 
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
  <style>
	.swiper-container {height: 200px;margin: 13px 10px 0 10px;padding-bottom: 0;}
	.content-slide {color: #fff;}
	.pagination {position: absolute;left: 0;text-align: center;bottom:10px;z-index: 311;width: 100%;}
	.swiper-pagination-switch {display: inline-block;width: 10px;height: 10px;border-radius: 10px;background: rgba(255,255,255,.5);margin: 0 5px;cursor: pointer;}
	.swiper-active-switch {background: #fff;}
	.swiper-slide{border-radius: 4px; overflow: hidden}
	.swiper-slide img{height:180px; width:100%;border-radius: 4px; }
  </style> 
  <input type="hidden" id="pagename" value="index" /> 
  <div class="tel_400"> 
   <a href="tel:4006808509,9999"> <span class="span-info">找设计师请拨打：</span> <i class="icon_tel_red"></i> <span class="span-tel">4006-808-509 转 9999</span></a> 
  </div> 
  <div class="bottombar"></div> 
  <div class="pg-ft">
      <ul class="terminal-nav">
        <li>
          <a class="active" href="javascript:void(0)">触屏版</a>
        </li>
        <li>
          <span class="i-sep"></span>
          <a href="${base}/resources/mobile/pc/index.action">电脑版</a>
          <span class="i-sep"></span>
        </li>
        <li>
          <a href="" rel="nofollow">
            关于我们
          </a>
        </li>
      </ul>
      <div class="company-info">
        @2014 百爪鱼 粤ICP备08125558号-2
      </div>
  </div>
  <div id="scrollButton" class="scrollButton"></div> 
 </body>
</html>