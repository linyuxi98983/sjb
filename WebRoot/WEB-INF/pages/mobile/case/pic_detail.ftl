<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8" /> 
  <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1" /> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
  <meta name="format-detection" content="telephone=no, email=no" /> 
  <title>装修效果图</title> 
  <meta name="keywords" content="" /> 
  <meta name="description" content="" /> 
  <link rel="stylesheet" href="${base}/resources/mobile/css/reset.css" /> 
  <link rel="stylesheet" href="${base}/resources/mobile/css/decorate-pics.css" /> 
  <link rel="stylesheet" href="${base}/resources/mobile/css/idangerous1.swiper.css" /> 
  <link rel="stylesheet" href="${base}/resources/mobile/css/viewimg.css" /> 
  <script type="text/javascript" src="${base}/resources/mobile/js/jquery-1.9.0.min.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/idangerous.swiper.min.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/decorate.js"></script> 
  <script src="${base}/resources/mobile/js/login.js"></script>
  <script>
    $(function(){
        $(".swiper-slide,.swiper-wrapper,.swiper-container").height($(window).height());
    })
    $(".swiper-slide img").on("click",function(){
       $(".botFloatBar,.pic_big").fadeToggle();
    });
    var mySwiper = new Swiper('.swiper-container',{
        pagination: '.pagination',
        loop:false,
        grabCursor: true,
        paginationClickable: true
    });
  </script> 
  
 </head> 
 <body> 
  <div class="pic_big"> 
   <div class="top"> 
    <div onclick="javascript:history.go(-1)"></div> 
    <h1>loft工业网咖风格房子装修</h1> 
   </div> 
  </div> 
  <div class="swiper-container"> 
   <div class="swiper-wrapper"> 
    <div class="swiper-slide">
     <img src="http://pic1.shejiben.com/case/2016/04/09/20160409152957-ab214365.jpg" alt="loft工业网咖风格房子装修" />
    </div> 
   </div> 
   <div class="swiper-wrapper"> 
    <div class="swiper-slide">
     <img src="http://pic1.shejiben.com/case/2016/04/09/20160409152957-ab214365.jpg" alt="loft工业网咖风格房子装修" />
    </div> 
   </div> 
   <div class="swiper-wrapper"> 
    <div class="swiper-slide">
     <img src="http://pic1.shejiben.com/case/2016/04/09/20160409152957-ab214365.jpg" alt="loft工业网咖风格房子装修" />
    </div> 
   </div> 
  </div> 
  <div class="botFloatBar"> 
   <div class="botFloatBar_yz"> 
    <a href="" class="zb"><em><img src="http://img.shejiben.com/wap/edit_white.png?20160426" /></em>申请设计</a> 
    <a href="javascript:void(0)" id="contact-designer"><em><img src="http://img.shejiben.com/wap/tel_400_white.png?20160426" /></em>电话咨询</a> 
   </div> 
  </div> 
  <div class="telphone"> 
   <div> 
    <h1>拔打电话</h1> 
    <span>4006808509<br />转 9999</span> 
    <p> <a href="javascript:void(0)" id="tel-cancel">取消</a><a href="tel:4006808509,9999">呼叫</a> </p> 
   </div> 
  </div> 
  <input type="hidden" id="page_value" pagename="case" value="works" /> 
 </body>
</html>