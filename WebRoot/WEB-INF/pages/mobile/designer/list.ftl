<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8" /> 
  <title>装修设计师</title> 
  <meta name="keywords" content="" /> 
  <meta name="description" content="" /> 
  <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1" /> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
  <meta name="format-detection" content="telephone=no, email=no" /> 
  <link href="${base}/resources/mobile/css/main.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/dsn.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/reset.css" rel="stylesheet" /> 
  <link href="${base}/resources/mobile/css/decorate-pics.css" rel="stylesheet" /> 
  <script type="text/javascript" src="${base}/resources/mobile/js/jquery-1.9.0.min.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/jquery.lazyload.min.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/dsn.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/GlobalProvinces.js"></script> 
  <script type="text/javascript">
    //城市类
    var gpm = new GlobalProvincesModule;
    gpm.def_province = ["省/市", ""];
    gpm.def_city1 = ["市/地区", ""];
    gpm.def_city2 = ["县/市", ""];
    gpm.initProvince(document.getElementById('sjsSheng'),"http://m.shejiben.com/zsj/");

    function searchByCity(thisclass){
      var city = $(thisclass).text();
      var s = city + '-' + $('#goodstyle').val() + '-' + $('#orderby').val() + '-' + $('#pages').val();
      $('#filters1').val(s);
      city1form.submit();
    }
    function searchByStyle(value){
      var s = $('#cityname').val() + '-' + value + '-' + $('#orderby').val() + '-' + $('#pages').val();
      $('#filters').val(s);
      cityform.submit();
    }
    function searchBySort(value){
      var s = $('#cityname').val() + '-' + $('#goodstyle').val() + '-' + value + '-' + $('#pages').val();
      $('#filters').val(s);
      cityform.submit();
    }
  </script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/scrollLoad.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/zepto.min.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/decorate.js"></script> 
  <script type="text/javascript" src="${base}/resources/mobile/js/login.js"></script>
 </head> 
 <body> 
  <header> 
   <div class="headerTop"> 
    <span onclick="location.href='${base}/mobile/index.action'" style="cursor:pointer;">百爪鱼</span> 
    <i>找设计师</i> 
    <em class="dsn-icon"><a href="search.html" class="sbtn"></a></em> 
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
  <div class="decorate_index find_designer"> 
   <div class="choice_type"> 
    <div class="this_city"> 
     <span>所在城市</span> 
    </div> 
    <div class="goodAt_type"> 
     <span>擅长空间</span> 
    </div> 
    <div class="oder_type end"> 
     <span>排序方式</span> 
    </div> 
   </div> 
   <div class="choice"> 
    <div class="now choice_city"> 
     <div class="province"> 
      <ul id="sjsSheng"> 
       <li><a href="">全部</a></li> 
      </ul> 
     </div> 
     <div class="city"> 
      <ul id="sjsCity"> 
       <li><a href="">北京</a></li>
       <li><a href="">上海</a></li>
       <li><a href="">广州</a></li>
       <li><a href="">深圳</a></li>
       <li><a href="">南京</a></li>
       <li><a href="">天津</a></li>
       <li><a href="">杭州</a></li>
       <li><a href="">武汉</a></li>
       <li><a href="">成都</a></li>
       <li><a href="">西安</a></li>
       <li><a href="">福州</a></li>
       <li><a href="">苏州</a></li>
       <li><a href="">郑州</a></li>
       <li><a href="">合肥</a></li>
       <li><a href="">贵阳</a></li>
       <li><a href="">宁波</a></li>
       <li><a href="">长沙</a></li> 
      </ul> 
     </div> 
    </div> 
    <input type="hidden" value="0" id="cityname" /> 
    <input type="hidden" value="0" id="goodstyle" /> 
    <input type="hidden" value="0" id="orderby" /> 
    <input type="hidden" value="1" id="pages" /> 
    <form action="" method="get" name="cityform"> 
     <input type="hidden" name="s" id="filters" /> 
    </form> 
    <form action="" method="get" name="city1form"> 
     <input type="hidden" name="s" id="filters1" /> 
    </form> 
    <div class="now choice_type"> 
     <a href="">擅长空间</a>
     <a href="">家居住宅</a>
     <a href="">别墅豪宅</a>
     <a href="">办公室</a>
     <a href="">酒店</a>
     <a href="">餐厅</a>
     <a href="">咖啡厅</a>
     <a href="">酒吧KTV</a>
     <a href="">商业展示</a>
     <a href="">医院</a>
     <a href="">幼儿园</a>
     <a href="">会所</a>
     <a href="">样板房</a>
     <a href="">售楼处</a>
     <a href="">文化空间</a>
     <a href="">运动空间</a> 
    </div> 
    <div class="now choice_order"> 
     <ul> 
      <li onclick="searchBySort(1)">综合排序</li> 
      <li onclick="searchBySort(2)">预约数优先</li> 
      <li onclick="searchBySort(3)">成交数优先</li> 
      <li onclick="searchBySort(4)">评价数优先</li> 
     </ul> 
    </div> 
   </div> 
   <div class="designer_list" id="user_content"> 
     <#if list ??>
          	<#list list as member>
          	 <a href="${base}/mobile/designer/designer!detail.action?id=${member.id}"> 
     <div class="designer"> 
      <div class="logo"> 
       <img src="${member.imagePath!}" alt="${member.nickname!}" width="100%" /> 
      </div> 
      <div class="info"> 
       <p> <span>${member.nickname!}</span> <em class="zhiming">F知名</em><em class="qy_vip">V认证</em> </p> 
        <#if member.area?exists>
                           <#if member.area.parent?exists>
		                  <p class="addr">${member.area.parent.name!} &nbsp;&nbsp;${member.area.name!}</p>
		                  </#if>
		                  </#if>
       <p>109预约&nbsp;&nbsp;&nbsp;2签单&nbsp;&nbsp;&nbsp;2评价</p> 
      </div> 
      <div class="price"> 
       <p class="numb">  ${member.minDesignAmt!0}</p>
       <p>元/m&sup2;</p> 
      </div> 
     </div> 
    </a> 
     		</#list>
     </#if>
   
   </div> 
   <section> 
    <ul class="pageCounts"> 
     <li><a href="javascript:void(0)" class="active">上一页</a></li>
     <li><a href="javascript:void(0)">1/10</a></li>
     <li><a href="" class="links">下一页</a></li> 
    </ul> 
   </section> 
  </div> 
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
 </body>
</html>