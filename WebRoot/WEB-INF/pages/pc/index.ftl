<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="position: relative;">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>百爪鱼-开网咖的第一站</title>
    <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css" />
    <link href="${base}/resources/pc/css/beyond_index.css" rel="stylesheet" type="text/css" />
    <link href="${base}/resources/pc/css/header_menu.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
     <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>    
    <script type="text/javascript" src="${base}/resources/mobile/js/util.js"></script>
     <script type="text/javascript" src="${base}/resources/pc/js/sea.js"></script>
    <link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    
	    if(/AppleWebKit.*Mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))){  
	     	window.location.href="${base}/mobile/index.action"
		}
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
  		seajs.use('${base}/resources/pc/js/index_new.js');
          seajs.use('common',
          function(SJB) {
            SJB.commonSubToolBar.init();
          });
          seajs.use('common', function(SJB) {
	        SJB.commonBottomZb.init();
	      });
    </script>
   <script src="${base}/resources/pc/js/sea.js" type="text/javascript"></script>
    <script type="text/javascript">
      seajs.config({
        alias: {
          'jquery': '${base}/resources/pc/js/jquery_module.js',
          //jquery version must be 1.7x
          'common': '${base}/resources/pc/js/main.js',
          'form': '${base}/resources/pc/js/module.form.js',
          'ui': '${base}/resources/pc/js/module.ui.js',
          'colorbox':'${base}/resources/pc/js/jquery.colorbox.min.js',
          'newHeader': '${base}/resources/pc/js/userCenter.js'
        },
        preload: ['jquery', 'common'] //预加载jquery和main.js
      });
    </script>
    <style type="text/css">.sjbNewTop{height: auto;}</style>
    <style type="text/css">
      /*首页是宽版*/ .sjbNewTop .newTopBg .head1{width:1180px;} .content_width_index{padding-top:
      0px !important;z-index: 100 !important;} html,body{background: #fff !important;}
    </style>
  </head>
  
  <body style="position: relative;">
    <div class="sjbNewTop" id="sjbNewTop">
      <div class="newTopBg">
        <div class="head1">
          <div class="hea_top_right">
            <ul class="tp_node">
              <li style="width:90px;" id="nav_login" class="">
                <span id="userName" class="name">
                 
                    <span class="nick">                   
                    <#if member ??>
                    	<#if member.memberType==0>
                    		 <a href="${base}/pc/mb/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">业主<a>
                    	<#elseif member.memberType==1>
                    		<a href="${base}/pc/ds/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">设计师</a>
                    	<#elseif member.memberType==2>
                    		<a href="${base}/pc/org/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">设计机构 </a>
                    	<#else>                    	         	
                    	</#if>
                    <#else>
                    <a href="${base}/pc/login/login.action">登录</a>&nbsp;&nbsp;<a href="${base}/pc/register/register.action">注册</a>   
                    </#if></span>
                    <em class="downAdrrow"></em>
                  
                  <div class="caozuo" id="caozuo" style="display: none;" onmouseover="$('bg').rel=2;" onmouseout="$('bg').rel=1;">
                    <div class="redArrow"></div>
                    <ul class="cz">
                      <li>
                        <a href="" class="my">个人中心</a>
                      </li>
                      <li>
                        <a href="" class="bj">
                          	我的收藏
                        </a>
                      </li>
                      <li>
                        <a href="" class="bj">
                          	我的问答
                        </a>
                      </li>
                      <li>
                        <a href="" class="jy">
                          	我的交易
                        </a>
                      </li>
                      <li>
                        <a href="" class="up">
                          	我的金币
                        </a>
                      </li>
                      <li>
                        <a href="" class="up">
                          	我的余额
                        </a>
                      </li>
                      <li>
                        <a href="" class="up">
                          	账号设置
                        </a>
                      </li>
                      <li>
                        <a href="" class="tc">
                          	退出
                        </a>
                      </li>
                    </ul>
                  </div>
                </span>
              </li>
              <li class="po" style="color: rgb(221, 221, 221);">|</li>
              <!-- 申请定制设计 -->
              <li class="dzsj">
                <a href="${base}/pc/designer/designer!apply.action" target="_blank" rel="nofollow">申请定制设计</a>
              </li>
              <li class="po" style="color: rgb(221, 221, 221);">|</li>
              <!--客服服务 -->
              <li class="cur" style="width:80px;">
             
              <li class="po" style="color: rgb(221, 221, 221);">|</li>
              <!--设计师中心 -->
              <li class="cur" style="width:92px;">
                <a href="javascript:;">
                	设计师中心
                  <span class="jt"></span>
                </a>
                <div class="sj_center" style="display: none;">
                  <ul>
                    <li>
                      <a href="${base}/pc/designer/designer!home.action" rel="nofollow">接单大厅</a>
                    </li>
                    
                  </ul>
                </div>
              </li>
            </ul>
          </div>
          <div id="newMessage" class="newMessage">
            <div class="closeNewMessage" id="closeNewMessage"></div>
            <div class="messageItem" id="messageItem"></div>
            <p class="clear"></p>
          </div>
        </div>
      </div>
      <!--头部搜索 及 主导航-->
      <div class="index_logo">
        <a href="" title="">
          <div class="web-logo"></div>
        </a>
        <div id="search_case">
          <form id="quicksearch" method="get" action="" target="_blank">
            <input type="hidden" name="searchType" value="1" id="searchType"/>
            <span id="search_span">
              <div id="search_title">找图片</div>
              <em class="arrow"></em>
              <label id="s_zsj" style="display: none;">
                <a class="search_tags clickToSearch" href="javascript:;" data-id="2">找图集</a>
                <a class="search_tags clickToSearch" href="javascript:;" data-id="10"> 找案例</a>
                <a class="search_tags clickToSearch" href="javascript:;" data-id="7">找设计师</a>
              </label>
            </span>
            <input type="text" value="请输入搜索关键词" class="key" name="q" id="search_val"/>
            <em class="icon_search"></em>
            <input type="submit" value="搜索" class="submit"/>
          </form>
        </div>
      </div>
      <!--头部搜索 及 主导航 end-->
    </div>
    <p class="clear"></p>
    <!--主导航-->
    <div class="wrap wrap_top_menu">
      <div class="top_menu">
        <!--整站主导航-->
        <ul>
          <li class="cur">
            <a href="" class="on onindex">首页</a>
          </li>
          <li>
            <a href="${base}/pc/case/case!list.action">设计案例</a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!list.action?type=0">网咖案例</a>
              <a href="${base}/pc/case/case!list.action?type=1">电竞案例</a>
            </div>
          </li>
          <li>
            <a href="${base}/pc/case/case!pics.action">装修图库</a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!pics.action?type=0">网咖图库</a>
              <a href="${base}/pc/case/case!pics.action?type=1">电竞图库</a>
            </div>
          </li>
          <li>
            <a href="${base}/pc/designer/designer!index.action">找设计师</a>
          </li>
          <li>
            <a href="${base}/pc/dinfo/dinfo!list.action">行业咨询</a>
          </li>
        </ul>
        <!--整站主导航 End-->
        <!--首页面包屑导航-->
        <div class="column_side">
          <div class="column column_outside">
            <div class="column_content content_outside">
              <div class="column_name">
                网咖设计
                <em></em>
              </div>
              <div class="column_list">
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=LOFT风" target="_blank" class="red">LOFT</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=现代简约" class="">现代简约</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=商业区" target="_blank" class="">商业区</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=高校区" class="red">高校区</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=竞技" target="_blank" class="">竞技</a>
                <a href=${base}/pc/case/case!list.action?houseTypeOrSpaceType=娱乐综合" class="">娱乐综合</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=地中海" target="_blank" class="">地中海</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=主题风格" target="_blank" class="red">主题风格</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=新中式" target="_blank" class="">新中式</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=酷炫混搭" target="_blank" class="red">酷炫混搭</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=后现代" target="_blank" class="">后现代</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=东南亚" target="_blank" class="">东南亚</a>
                <a href="#" target="_blank"></a>
                <div class="clear"></div>
              </div>
              <!--二级菜单-->
              <div class="column column_inner inner_01" style="display: none;">
                <div class="column_content column_content_cur">
                  <div class="column_name no_border">地段</div>
                  <div class="column_list">
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=商业区" class="" target="_blank">商业区</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=高校区" class="" target="_blank">高校区</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=工业区" class="" target="_blank">工业区</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=城中村" class="" target="_blank">城中村</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=老城区" class="" target="_blank">老城区</a>
                    <div class="clear"></div>
                  </div>
                </div>
                <div class="column_content">
                  <div class="column_name">网咖风格</div>
                  <div class="column_list">
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=LOFT风" class="" target="_blank">LOFT风</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=现代简约" class="" target="_blank">现代简约</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=恬淡田园" class="" target="_blank">恬淡田园</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=时尚混搭" class="" target="_blank">时尚混搭</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=竞技" class="" target="_blank">竞技</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=娱乐综合" class="" target="_blank">娱乐综合</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=地中海" class="" target="_blank">地中海</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=主题风格" class="" target="_blank">主题风格</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=新中式" class="" target="_blank">新中式</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=酷炫混搭" class="" target="_blank">酷炫混搭</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=后现代" class="" target="_blank">后现代</a>
                    <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=东南亚" class="" target="_blank">东南亚</a>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
              <!--二级菜单 End-->
            </div>
            <div class="column_content content_outside">
              <div class="column_name no_border">
                电竞设计
                <em></em>
              </div>
              <div class="column_list">
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=地中海" target="_blank" class="red">地中海</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=欧式" target="_blank" class="">欧式</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=恬淡田园" target="_blank" class="">恬淡田园</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=时尚混搭" target="_blank" class="red">时尚混搭</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=竞技" target="_blank" class="">竞技</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=美式古典" target="_blank" class="">美式古典</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=西部精致" target="_blank" class="">西部精致</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=新中式" target="_blank" class="">新中式</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=炫酷混搭" target="_blank" class="red">炫酷混搭</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=后现代" target="_blank" class="">后现代</a>
                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=乡村轻快" target="_blank" class="">乡村轻快</a>
                <div class="clear"></div>
              </div>
              <!--二级菜单-->
              <div class="column column_inner inner_02" style="display: none;">
                <div class="column_content">
                  <div class="column_name">需求风格</div>
                  <div class="column_list">
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=地中海" target="_blank" class="">地中海</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=欧式" target="_blank" class="">欧式</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=恬淡田园" target="_blank" class="">恬淡田园</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=时尚混搭" target="_blank" class="">时尚混搭</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=竞技" target="_blank" class="">竞技</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=美式古典" target="_blank" class="">美式古典</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=西部精致" target="_blank" class="">西部精致</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=新中式" target="_blank" class="">新中式</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=炫酷混搭" target="_blank" class="">炫酷混搭</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=后现代" target="_blank" class="">后现代</a>
	                <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=乡村轻快" target="_blank" class="">乡村轻快</a>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
              <!--二级菜单 End-->
            </div>
            <div class="column_content no_border content_outside">
              <div class="column_name">
                   室内设计师
                <em></em>
              </div>
              <div class="column_list">
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=北京" target="_blank" class="">北京</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=上海" target="_blank" class="red">上海</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=广州" target="_blank" class="">广州</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=深圳" target="_blank" class="red">深圳设计师</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=别墅" target="_blank" class="red">别墅</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=复式" target="_blank" class="">复式</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=样板" target="_blank" class="red">样板</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=网咖" target="_blank" class="red">网咖设计师</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=酒店" target="_blank" class="red">酒店</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=咖啡店" target="_blank" class="">咖啡店</a>
                <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=办公室" target="_blank" class="red">办公室设计师</a>
                <div class="clear"></div>
              </div>
              <div class="column column_inner inner_03" style="display: none;">
                <div class="column_content">
                  <div class="column_name no_border">所在城市</div>
                  <div class="column_list">
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=北京" class="" target="_blank">北京</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=上海" class="" target="_blank">上海</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=广州" class="" target="_blank">广州</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=深圳" class="" target="_blank">深圳</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=南京" class="" target="_blank">南京</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=天津" class="" target="_blank">天津</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=杭州" class="" target="_blank">杭州</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=武汉" class="" target="_blank">武汉</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=成都" class="" target="_blank">成都</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=西安" class="" target="_blank">西安</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=福州" class="" target="_blank">福州</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=苏州" class="" target="_blank">苏州</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=郑州" class="" target="_blank">郑州</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=合肥" class="" target="_blank">合肥</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=贵阳" class="" target="_blank">贵阳</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=宁波" class="" target="_blank">宁波</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=长沙" class="" target="_blank">长沙</a>
                    <div class="clear"></div>
                  </div>
                </div>
                <div class="column_content">
                  <div class="column_name">风格</div>
                  <div class="column_list">
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=地中海" class="" target="_blank">地中海</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=现代简约" class="" target="_blank">现代简约</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=恬淡田园" class="" target="_blank">恬淡田园</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=时尚混搭" class="" target="_blank">时尚混搭</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=竞技" class="" target="_blank">竞技</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=娱乐综合" class="" target="_blank">娱乐综合</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=地中海" class="" target="_blank">地中海</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=主题风格" class="" target="_blank">主题风格</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=新中式" class="" target="_blank">新中式</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=炫酷混搭" class="" target="_blank">炫酷混搭</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=后现代" class="" target="_blank">后现代</a>
                    <a href="${base}/pc/designer/designer!index.action?houseTypeOrSpaceType=东南亚" class="" target="_blank">东南亚</a>
                    <div class="clear">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--首页面包屑导航 end-->
      </div>
    </div>
    <!--主导航-->
    <div class="dmato"></div>
    <div class="content_width content_width_index" id="content">
      <div class=" ">
      	<!-- 案例搜索下拉框脚本 -->
        <script type="text/javascript">
          seajs.use(['newHeader', 'common'],
          function(Header, common) {
            $(document).ready(function() {
              Header.init();
              common.initHeader();
              $('#quicksearch').bind('submit',
              function() {
                return common.checkSearchForm();
              });
            });

            var searchType = "";
            var arr = new Array("1", "2", '10', '7');
            var urlArr = new Array({
              '1': [{
                0 : "${base}/pc/case/case!pics.action",
                1 : "keyword",
                2 : "搜索图片的关键词，如：儿童房",
                3 : "找图片　　"
              }],
              '2': [{
                0 : "${base}/pc/case/case!pics.action",
                1 : "keyword",
                2 : "搜索灵感图集",
                3 : "找图集"
              }],
              '10': [{
                0 : "${base}/pc/case/case!list.action",
                1 : "keyword",
                2 : "搜索案例",
                3 : "找案例"
              }],
              '7': [{
                0 : "${base}/pc/designer/designer!index.action",
                1 : "keyword",
                2 : "搜索设计师",
                3 : "找设计师"
              }]
            });
            common.searchFun(searchType, arr, urlArr);
            common.searchBannerEvent(arr, urlArr);
          });
        </script>
        <style>
          #content{margin-top: 0;} .swiper-container { height: 420px; } .slider_mark
          { width: auto; position: absolute; bottom: 15px !important; left: 50% !important;
          height: 15px; z-index: 100; margin-left: -50px; } .slider_mark li { width:
          10px; height: 10px; float: left; margin: 0 5px; background: #000; opacity:
          0.75; border-radius: 5px; cursor: pointer; } .slider_mark .swiper-pagination-bullet-active{
          background: #707070;}
        </style>
        <!--滚动图-->
        <!--sliderShow-->
        <div class="swiper-container" id="index_slider">
          <ul class="banner_slider swiper-wrapper" style="width: 8040px; height: 420px; transform: translate3d(-2680px, 0px, 0px); transition-duration: 0.3s;">
           
            <#list data.phomepage as phome>
				        	<#if (phome.moduleType == 0)>
					        	<#if phome.picList??>
					        	<#list phome.picList as pic>
					        	
					           <li class="swiper-slide swiper-slide-duplicate" style="width: 1340px; height: 420px; background: url(&quot;${pic.imagePath!}&quot;) 50% 50% no-repeat;">
              <a href="${pic.url!}" target="_blank" style="display:block;width:100%;height:420px;">
                &nbsp;
              </a>
            </li>
							    </#list>
							    </#if>
							</#if>
						    </#list>
           
           
          </ul>
          <ul class="slider_mark">
            <li class="swiper-pagination-switch"></li>
            <li class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></li>
            <li class="swiper-pagination-switch"></li>
            <li class="swiper-pagination-switch"></li>
          </ul>
        </div>
        <!--找设计师-->
        <div class="column_index search_designers" id="search_designers">
          <div class="column_name">
            <p>找设计机构</p>
            <label>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=北京" target="_blank">北京</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=上海" target="_blank">上海</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=广州" target="_blank">广州</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=深圳" target="_blank">深圳</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=苏州" target="_blank">苏州</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=杭州" target="_blank">杭州</a>
              <a href="${base}/pc/designer/designer!index.action" target="_blank">更多 &gt;</a>
            </label>
            <div class="clear">
            </div>
          </div>
          <div class="content_designers">
            <ul class="tab_name">
              <li class="des-tab-list cur">
                设计大咖
                <em></em>
              </li>
              <li class="des-tab-list">
                最新签单
                <em></em>
              </li>
              
              <li class="des-tab-list">
                行业大腕
                <em></em>
              </li>
            </ul>
            <div class="designers_detail">
              <!--设计大咖-->
              <div class="designers_list" id="designers_list_01" style="display: block;">
                <span class="prev"></span>
                <span class="next"></span>
                <span class="prev2" style="display:none;"></span>
                <span class="next2" style="display:none;"></span>
                <!--大图-->
                <div class="scroll_content swiper-container swiper-container_01" id="designers_list_scroll_01">
                  <ul class="designers_list_top swiper-wrapper" id="designers_list_scroll">
                   
                	<#list data.memberList as member>
				        	<li class="swiper-slide swiper-slide-visible" style="width: 204px; height: 184px;">
                      <a href="designer/designer!personal.action?id=${member.id!}" class="img" target="_blank">
                        <img class="lazy" data-original="${member.imagePath!}"
                        src="${member.imagePath!}" style="display: block;"/>
                      </a>
                      <div class="user_msg">
                        <a href="designer/designer!personal.action?id=${member.id!}" class="user_name" target="_blank">${member.nickname}</a>
                        <a href="designer/designer!personal.action?id=${member.id!}" class="user_company" target="_blank"></a>
                      </div>
                    </li>
				    </#list>
                   
                  </ul>
                </div>
                <!--大图End-->
                <!--小图-->
                <div class="scroll_content scroll_content-s swiper-container swiper-container-s01"
                id="designers_list_scroll_b1">
               
                  <ul class="designers_list_bottom swiper-wrapper" style="width: 5916px; height: 84px;">
                  <#list data.memberList as member>
                    <li class="swiper-slide">
                      <a href="designer/designer!personal.action?id=${member.id!}" class="img" target="_blank">
                        <img class="lazy" data-original="${member.imagePath!}"
                        src="${member.imagePath!}"/>
                      </a>
                      <a href="designer/designer!personal.action?id=${member.id!}" class="username" target="_blank">${member.nickname}</a>
                    </li>
                    </#list>
                  </ul>
                </div>
                <!--小图 End-->
              </div>
              <!--设计大咖 End-->
              <!--精英设计-->
              <div class="designers_list" id="designers_list_02" style="display:none;">
                <div class="scroll_content swiper-container swiper-container_02" id="designers_list_scroll_02">
                  <ul class="designers_list_top swiper-wrapper">
                    <li class="swiper-slide">
                      <a href="" class="img" target="_blank">
                        <img class="lazy" data-original="http://pic.shejiben.com/user/17/sjb_headphoto_1342217.jpg?1427266552"
                        src="http://img.shejiben.com/front_end/bg/grey.gif"/>
                      </a>
                      <div class="user_msg">
                        <a href="" class="user_name" target="_blank">陈海峰</a>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="scroll_content scroll_content-s swiper-container swiper-container-s02"
                id="designers_list_scroll_b2">
                  <ul class="designers_list_bottom swiper-wrapper">
                    <li class="swiper-slide">
                      <a href="" class="img" target="_blank">
                        <img class="lazy" data-original="http://pic.shejiben.com/user/44/sjb_headphoto_761944.jpg?1426327559"
                        src="http://img.shejiben.com/front_end/bg/grey.gif"/>
                      </a>
                      <a href="" class="username" target="_blank">何博彦/佛山..</a>
                    </li>
                  </ul>
                </div>
              </div>
              
              <div class="designers_list" id="designers_list_04" style="display:none;">
                <div class="scroll_content swiper-container swiper-container_04" id="designers_list_scroll_04">
                  <ul class="designers_list_top swiper-wrapper">
                     <#list data.hydwList as member>
                    <li class="swiper-slide">
                      <a href="designer/designer!personal.action?id=${member.id!}" class="img" target="_blank">
                        <img class="lazy" data-original="${member.imagePath!}"
                        src="${member.imagePath!}"/>
                      </a>
                      <a href="designer/designer!personal.action?id=${member.id!}" class="username" target="_blank">${member.nickname}</a>
                    </li>
                    </#list>
                  </ul>
                </div>
                <div class="scroll_content scroll_content-s swiper-container swiper-container-s04"
                id="designers_list_scroll_b4">
                  <ul class="designers_list_bottom swiper-wrapper">
                    <#list data.hydwList as member>
                    <li class="swiper-slide">
                      <a href="designer/designer!personal.action?id=${member.id!}" class="img" target="_blank">
                        <img class="lazy" data-original="${member.imagePath!}"
                        src="${member.imagePath!}"/>
                      </a>
                      <a href="designer/designer!personal.action?id=${member.id!}" class="username" target="_blank">${member.nickname}</a>
                    </li>
                    </#list>
                  </ul>
                </div>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>
        <!--设计案例-->
        <div class="column_index search_case">
          <div class="column_name">
            <p>设计案例</p>
            <label>
              <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=LOFT风格" target="_blank">LOFT风格</a>
              <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=现代简约" target="_blank">现代简约</a>
              <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=电竞馆" target="_blank">电竞馆</a>
              <a href="${base}/pc/case/case!list.action?houseTypeOrSpaceType=主题风格" target="_blank">主题风格</a>
              <a href="${base}/pc/case/case!list.action" target="_blank">更多 &gt;</a>
            </label>
            <div class="clear">
            </div>
          </div>
          <div class="index_case_list">
            <ul>
          		<#list data.designWorks as work>	
            		 <li>
                <a href="${base}/pc/case/case!detail.action?id=${work.id}" class="big_img" target="_blank">
                  <img src="${work.imagePath!}" style="opacity: 1;"/>
                </a>
                <a href="${base}/pc/case/case!detail.action?id=${work.id}" class="small_img" target="_blank">
                  <img src="${work.memberImagePath!}" style="opacity: 1;"/>
                </a>
                <a href="${base}/pc/case/case!detail.action?id=${work.id}" class="title" target="_blank">${work.title}</a>
                <span class="name">${work.member!}</span>
              </li>
            	</#list>
             
              <div class="clear"></div>
            </ul>
          </div>
        </div>
        <!--设计机构-->
        <div class="column_index search_company">
          <div class="column_name">
            <p>设计机构</p>
            <label>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=北京" target="_blank">北京</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=上海" target="_blank">上海</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=广州" target="_blank">广州</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=深圳" target="_blank">深圳</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=苏州" target="_blank">苏州</a>
              <a href="${base}/pc/designer/designer!index.action?searchByArea=杭州" target="_blank">杭州</a>
              <a href="${base}/pc/designer/designer!index.action" target="_blank">更多 &gt;</a>
            </label>
            <div class="clear"></div>
          </div>
          <div class="index_rank_img">
            
            <#if data.orgList?exists>
            	<#list data.orgList as org>
            	<div class="index_rank_img_1">
	              <a href="" target="_blank">
	                <img src="${org.imagePath!}" width="550" height="174"/>
	              </a>
	            </div>
	            </#list>
            </#if>
            <!--所有设计机构 End-->
            <script type="text/javascript">
            	$(function(){
            		var index_rank_img = $(".index_rank_img_1");
            		for(var i=0; i <index_rank_img.length;i++){
            			$(index_rank_img[i]).removeClass("index_rank_img_1");
            			$(index_rank_img[i]).addClass("index_rank_img_"+(i+1));
            		}            		
            	});
            </script>
          </div>
        </div>
        <!--网咖图库，电竞图库-->
        <div class="column_index search_pic" id="search_pic">
          <div class="column_name">
            <div class="column_name_l">
              <p class="cur">网咖图库</p>
              <p>电竞图库</p>
            </div>
            <div class="column_name_r">
              <label>
                <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=商业区" target="_blank">商业区</a>
                <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=LOFT风格" target="_blank">LOFT风格</a>
                <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=时尚混搭" target="_blank">时尚混搭</a>
                <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=娱乐综合体" target="_blank">娱乐综合体</a>
                <a href="${base}/pc/case/case!pics.action" target="_blank">更多 &gt;</a>
              </label>
              <label style="display:none;">
                 <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=商业区" target="_blank">商业区</a>
                <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=LOFT风格" target="_blank">LOFT风格</a>
                <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=时尚混搭" target="_blank">时尚混搭</a>
                <a href="${base}/pc/case/case!pics.action?houseTypeOrSpaceType=娱乐综合体" target="_blank">娱乐综合体</a>
                <a href="${base}/pc/case/case!pics.action" target="_blank">更多 &gt;</a>
              </label>
            </div>
            <div class="clear">
            </div>
          </div>
          <div class="pic_content">
          <#if data.jiazhuangWorks ?exists>
            <ul class="index_pic_list">
              
              
             <#list data.jiazhuangWorks as case>
              <li class="">
                <a href="${base}/pc/case/case!pic_detail.action?id=${case.id}" target="_blank" class="img">
                  <img class="lazy" src="${case.imagePath!}"
                  data-original="${case.imagePath!}"
                  style="display: block; opacity: 1;"/>
                </a>
                <a href="${base}/pc/case/case!pic_detail.action?id=${case.id}" target="_blank" class="title">${case.title!}</a>
              </li>
              </#list>
             
              <div class="clear"></div>
            </ul>
             </#if>
              <#if data.gongzhuangWorks ?exists>
            <ul class="index_pic_list" style="display:none;">
             
             <#list data.gongzhuangWorks as case>
             <li class="">
                <a href="${base}/pc/case/case!pic_detail.action?id=${case.id}" target="_blank" class="img">
                  <img class="lazy" src="${case.imagePath!}"
                  data-original="${case.imagePath!}"/>
                </a>
                <a href="${base}/pc/case/case!pic_detail.action?id=${case.id}" target="_blank" class="title">${case.title!}</a>
              </li>
              </#list>
              
              <div class="clear"></div>
            </ul>
            </#if>
          </div>
        </div>
        <!--原创出品
        <div class="column_index search_original">
          <div class="column_name">
            <p>原创出品</p>
            <label>
              <a href="case/case-detail.html" target="_blank">设计资讯</a>
              <a href="case/case-detail.html" target="_blank">空间谈</a>
              <a href="case/case-detail.html" target="_blank">名人访谈</a>
            </label>
            <div class="clear"></div>
          </div>
          <div class="index_original_list">
            <a class="column_name red" href="" target="_blank">
                        案例解析
            <em></em>
            </a>
            <div class="original_detail">
              <a href="case/case-detail.html" class="img" target="_blank">
                <img class="lazy" src="http://pic1.shejiben.com/hot_sjb/374_6219.jpg?1456967842"
                data-original="http://pic1.shejiben.com/hot_sjb/374_6219.jpg?1456967842"
                style="display: block; opacity: 1;"/>
              </a>
              <a href="case/case-detail.html" class="title" target="_blank">【第220期】沉静——86平米乡村美..</a>
            </div>
          </div>
          <div class="index_original_list">
            <a class="column_name green" href="" target="_blank">
              设计师专访
              <em></em>
            </a>
            <div class="original_detail">
              <a href="" class="img" target="_blank">
                <img class="lazy" src="http://pic.shejiben.com/hot_sjb/373_6223.jpg?1457055893"
                data-original="http://pic.shejiben.com/hot_sjb/373_6223.jpg?1457055893"
                style="display: block; opacity: 1;"/>
              </a>
              <a href="" class="title" target="_blank">何博彦:美感设计,缤纷色彩</a>
            </div>
          </div>
        </div>
        <div class="column_index bantonglan">
          <div class="sjs_index_bantonglan ">
            <a href="" target="_blank">
              <img class="lazy" src="http://pic1.shejiben.com/hot_sjb/390_6441.jpg?1456544432"
              data-original="http://pic1.shejiben.com/hot_sjb/390_6441.jpg?1456544432"
              style="display: block;"/>
            </a>
          </div>
          <div class="clear"></div>
        </div>
        -->
        <!--最新动态-->
        <div class="column_index search_news">
          <div class="column_name">
            <p>最新动态</p>
              <label>
              <a href="" target="_blank">更多 &gt;</a>
            </label>
            <div class="clear"></div>
          </div>
          <div class="index_news_list">
            <div class="news_info answer_list">
              <p class="column_name">行业资讯</p>
              <div class="column_new_content" id="showQuestionList">
                <div class="scroll_content" style="height: 3030px; margin-top: -404px;">
                  <div class="list">
                   
                   
                     <#list data.ltDnInfos as info>
	                    <div class="news_list">
	                      
	                      <div class="news_msg">
	                        <a href="${base}/pc/dinfo/dinfo!detail.action?id=${info.id}" target="_blank">${info.title}</a>
	                        <p class="answer">
	                          	${info.preview}
	                        </p>
	                        <p class="last_time">
	                         
	                        </p>
	                      </div>
	                    </div>
                    </#list>
                    
                  </div>
                </div>
              </div>
              <a class="check_more" href="${base}/pc/dinfo/dinfo!list.action" target="_blank">
                去看看行业资讯
                <em class="arrow">&gt;</em>
              </a>
            </div>
            <div class="news_info commit">
              <p class="column_name">
                大家都在发布需求
              </p>
              <div class="column_new_content" id="showDemandList">
                <div class="scroll_content" style="height: 3030px; margin-top: -404px;">
                  <div class="list">
                    <#list data.demandList as demand>
                    	
                    <div class="news_list">
                      <img src="<img src="${demand.imagePath!}"/>"/>
                      <div class="news_msg">
                        <span class="news_title">
                        ${demand.nickname}提交了设计需求
                        </span>
                        <p class="answer">
                          <em>${demand.areaName!}${demand.areaSqm}平住宅设计</em>
                        </p>
                        <p class="last_time">
                          2小时前
                        </p>
                      </div>
                    </div>
                    </#list>
                  </div>
                </div>
              </div>
              <a class="check_more" href="${base}/pc/designer/designer!apply.action" target="_blank">
                提交我的设计需求
                <em class="arrow">
                  &gt;
                </em>
              </a>
            </div>
            <div class="news_info order">
              <p class="column_name">
                大家都在预约设计师
             </p>
              <div class="column_new_content" id="showOrderList">
                <div class="scroll_content" style="height: 3030px; margin-top: -404px;">
                  <div class="list">
                    
                  
                   <#if data.demandList2??>
                    <#list data.demandList2 as demand>
                    <div class="list">
                    	<div class="news_list">
                    	<#if demand.imagePath??>
                      <img src="${demand.imagePath!}"/>
                      <#else>
                      
                      </#if>
                      <div class="news_msg">
                        <span class="news_title">
                          ${demand.nickname!}预约了
                          <a href="" target="_blank" style="display:inline-block">
                            ${demand.member!}
                          </a>
                          做设计
                        </span>
                        <p class="answer">
                          <em>
                           ${demand.areaZone!}
                          </em>
                          <em>
                            ${demand.budgetName!}
                          </em>
                          <em>
                            ${demand.areaSqm!}㎡
                          </em>
                        </p>
                        <p class="last_time">
                         ${demand.pubilcDate!}
                        </p>
                      </div>
                    </div>
                    </div>
                    </#list>
                    </#if>
                  
                  </div>
                </div>
              </div>
              <a class="check_more" href="${base}/pc/designer/designer!index.action" target="_blank">
                去找设计师
                <em class="arrow">
                  &gt;
                </em>
              </a>
            </div>
            <div class="clear"></div>
          </div>
        </div>
        <div>
          <div>
            <!--底部模版 闭合标签配对 End-->
            <script src="${base}/resources/pc/js/idangerous.swiper.min.js" type="text/javascript"></script>
            <script src="${base}/resources/pc/js/index_new.js" type="text/javascript"></script>
            <script type="text/javascript">
              seajs.use('index_new.js');
              seajs.use('common',
              function(SJB) {
                SJB.commonBottomZb.init();
              })
            </script>
          </div>
        </div>
        <p class="clear"></p>
        <bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
        <p class="cl"></p>
        <!--版权等-->
        <div class="wrap wrap_cppyright">
          <div class="cppyright_content">
            <div class="string clear"></div>
            <ul>
              <li>
                <a href="${base}/resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
              </li>
              <li>
                <a href="${base}/resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
              </li>
              <li>
                <a href="" rel="nofollow" target="_blank">意见建议</a>
              </li>
              <li>
                <a href="" rel="nofollow" target="_blank">帮助中心</a>
              </li>
              <li class="no_border">
                <a href="" rel="nofollow" target="_blank">使用条款</a>
              </li>
            </ul>
            <p class="statement">免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系。</p>
            <p class="bottom_bah">
              百爪鱼 COPYRIGHT © 2015-2016 广州揽冠信息科技有限公司 版权所有(
              <a hidefocus="" href="" rel="nofollow">粤ICP备16059512号</a>
              )
            </p>
            <div class="bottom_icon">
              <a href="" target="_blank" rel="nofollow" title="" alt="">
                <label class="icon_gongan"></label>
              </a>
              <a rel="nofollow" href="" target="_blank">
                <label class="icon_falv"></label>
              </a>
            </div>
          </div>
        </div>
        <!--版权等 End-->
        <div style="display:none;">
          <a href="" target="_blank">
            <img border="0" src="http://eiv.baidu.com/hmt/icon/21.gif" width="20" height="20"/>
          </a>
        </div>
      </div>
    </div>
    <a class="bottom_show_left" href="javascript:void(0)" style="left: -105px; display: none;"></a>
    <form action="" method="post" target="frm_dealer" id="frm_dealer_form">
      <input type="hidden" id="clickValId" name="key" value=""/>
    </form>
    <iframe frameborder="0" height="0" name="frm_dealer" id="clsIframe"></iframe>
  </body>
</html>