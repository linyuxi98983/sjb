<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8" /> 
  <title>设计师个人主页</title> 
  <meta name="keywords" content="" /> 
  <meta name="description" content="" /> 
  <link rel="canonical" href="http://www.shejiben.com/sjs/1466490/" /> 
  <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1" /> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
  <meta name="format-detection" content="telephone=no, email=no" /> 
  <meta name="location" content=" province=北京;city=北京;coord=116.39564503788,39.92998577808 " /> 
  <link href="${base}/resources/mobile/css/main.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/dsn.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/reset.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/decorate-pics.css" rel="stylesheet" /> 
  <script src="${base}/resources/mobile/js/jquery-1.9.0.min.js"></script> 
  <script src="${base}/resources/mobile/js/jquery.lazyload.min.js"></script> 
  <script src="${base}/resources/mobile/js/dsn.js"></script> 
  <script src="${base}/resources/mobile/js/login.js"></script> 
 </head> 
 <body> 
  <header> 
   <div class="headerTop"> 
    <span onclick="location.href='${base}/mobile/index.action'" style="cursor:pointer;">百爪鱼</span> 
    <i>王凤波</i> 
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
    <li><a href="designer.html" class="dsn-icon"></a><span>找设计师</span></li> 
    <li><a href="" class="dsn-icon"></a><span>有问必答</span></li> 
    <li><a href="" class="dsn-icon"></a><span>设计资讯</span></li> 
    <li><a href="" class="dsn-icon"></a><span>设计师专访</span></li> 
    <li><a href="" class="dsn-icon"></a><span>提交需求</span></li> 
    <li><a href="" class="dsn-icon"></a><span>逛商城</span></li> 
    <li><a href="" class="dsn-icon"></a><span>模型下载</span></li> 
   </ul> 
  </div> 
  <div class="decorate_index appraise_info designer_index"> 
   <div class="banner"> 
    <div class="sharePic">
     <img src="http://img.shejiben.com/wap/new_wap/bann.png" alt="${entity.nickname!}" />
    </div> 
    <img src="http://img.shejiben.com/wap/new_wap/bann.png" alt="" height="100%" width="100%" /> 
    <div class="bk"> 
     <div class="logo"> 
      <img src="${entity.imagePath!}" alt="${entity.nickname!}" /> 
      <p class="zhiming">F知名</p>
      <p class="vip end">V认证</p> 
     </div> 
     <div class="name">
      <a href=""> ${entity.nickname}</a>
     </div> 
     <div class="addr">
       <#if entity.area?exists>
                <#if entity.area.parent?exists>  ${entity.area.parent.name!}&nbsp;&nbsp;</#if> ${entity.area.name!}
                  </#if>
     </div> 
     <div class="order"> 
      <div class="appoint">
       预约 134
      </div> 
      <div class="primiss">
       签单 0
      </div> 
      <div class="appraise">
       评价 0
      </div> 
     </div> 
    </div> 
   </div> 
   <div class="content"> 
    <div class="charge">
      设计收费: 
     <em>  ${entity.minDesignAmt!}</em>元/m&sup2; 
    </div> 
    <div class="int_raise"> 
     <div class="int start"> 
      <a href=""><img src="http://img.shejiben.com/wap/new_wap/apprise.png" width="30px" />在线预约</a> 
     </div> 
     <div class="raise"> 
      <a href="javascript:void(0)" id="contact-designer"><img src="http://img.shejiben.com/wap/new_wap/raise.png" width="30px" />电话咨询</a> 
     </div> 
    </div> 
    <div class="business"> 
     <a href="">
      <div class="tab">
       业主评价&nbsp;&nbsp;(0) 
       <span></span>
      </div>
      </a> 
    </div> 
    <div class="desig_exmple"> 
     <a href="">
      <div class="tab">
       设计案例&nbsp;&nbsp;(87) 
       <span></span>
      </div>
     </a> 
     <#if entity.worksList ??>
     	<#list entity.worksList as case>
     		<a href="${base}/mobile/case/case!detail.action?id=${case.id}"> 
      <div class="exmp"> 
       <img class="lazy" src="${case.imagePath!}" alt="${case.title!}" /> 
       <div class="msg"> 
        <div class="tit">
         ${case.title!}
        </div> 
        <div class="numb"> 
         <strong>${case.costAmt!0}万元/${case.sqm!0}平米/样板间设计/地中海</strong> 
         <span><img src="http://img.shejiben.com/wap/new_wap/pi.png" width="16" />17 <img src="http://img.shejiben.com/wap/new_wap/yj.png" width="16" />19691</span> 
        </div> 
       </div> 
      </div> 
     </a> 
     	</#list>
     </#if>
     
    </div> 
    <div class="designer_blong"> 
     <a href="">
      <div class="tab">
       设计博文&nbsp;&nbsp;(0) 
       <span></span>
      </div>
     </a> 
    </div> 
   </div> 
  </div> 
  <div class="telphone"> 
   <div> 
    <h1>拔打电话</h1> 
    <span>4006808509<br />转 9999</span> 
    <p> <a href="javascript:void(0)" id="tel-cancel">取消</a><a href="tel:4006808509,9999">呼叫</a> </p> 
   </div> 
  </div> 
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
          <a href="${base}/resources/mobile/${base}/resources/mobile/pc/index.action">电脑版</a>
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
  <input type="hidden" id="page_value" pagename="index" value="sjs"/> 
 </body>
</html>