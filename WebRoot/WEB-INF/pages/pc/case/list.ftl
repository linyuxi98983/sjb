<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设计案例</title>
    <meta name="description" content="" />
    <meta name="mobile-agent" content=""/>
    <#include "/WEB-INF/ftl/pc/header.ftl"/>
    <#include "/WEB-INF/ftl/pc/pager.ftl"/>
    <link type="text/css" rel="stylesheet" href="${base}/resources/pc/css/new_global.css"/>
    <link type="text/css" rel="stylesheet" href="${base}/resources/pc/css/works.css"/>
    <link type="text/css" rel="stylesheet" href="${base}/resources/pc/css/header_menu.css"/>
    <link type="text/css" rel="stylesheet" href="${base}/resources/pc/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/pagination.css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>   
    
    <script type="text/javascript">
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    </script>
    <script src="${base}/resources/pc/js/sea.js" type="text/javascript"></script>
      <script src="${base}/resources/pc/js/cache.js" type="text/javascript"></script>
     <script type="text/javascript">
      
      seajs.config({
        alias: {
          'jquery': '${base}/resources/pc/js/jquery_module.js',
          'jq':'${base}/resources/pc/js/jquery.min.js',
          //jquery version must be 1.7x
          'common': '${base}/resources/pc/js/main.js',
          'list':'${base}/resources/pc/js/list.js',
          'plug':'${base}/resources/pc/js/plugin.js',
          'form': '${base}/resources/pc/js/module.form.js',
          'ui': '${base}/resources/pc/js/module.ui.js',
          'colorbox':'${base}/resources/pc/js/jquery.colorbox.min.js',
          'newHeader': '${base}/resources/pc/js/userCenter.js'
        },
        preload: ['jquery','jq','list', 'common'] //预加载jquery和main.js
      });
   
		function selectFun(){
			
			$('#myForm').submit();
		}
		
      $(function(){     	
      	  
      	  if($("#styleId").val()!="" &&$("#styleId").val()　!= null){
      	  	$("#selectLsist_style a").each(function(){
      	  		if($(this).attr("id") == $("#styleId").val()){
      	  			$(this).addClass("onselect");
      	  		}else{
      	  			$(this).removeClass("onselect");
      	  		}
      	  	});
      	  }
      	  if($("#typeId").val()!="" &&$("#typeId").val()　!= null){
      	  	$("#selectLsist_houseType a").each(function(){
      	  		if($(this).attr("id") == $("#typeId").val()){
      	  			$(this).addClass("onselect");
      	  		}else{
      	  			$(this).removeClass("onselect");
      	  		}
      	  	});
      	  }
      	  if($("#priceId").val()!="" &&$("#priceId").val()　!= null){
      	  	$("#selectLsist_price a").each(function(){
      	  		if($(this).attr("id") == $("#priceId").val()){
      	  			$(this).addClass("onselect");
      	  		}else{
      	  			$(this).removeClass("onselect");
      	  		}
      	  	});
      	  }
      	  
      	  if($("#sqmId").val()!="" &&$("#sqmId").val()　!= null){
      	  	$("#selectLsist_sqm a").each(function(){
      	  		if($(this).attr("id") == $("#sqmId").val()){
      	  			$(this).addClass("onselect");
      	  		}else{
      	  			$(this).removeClass("onselect");
      	  		}
      	  	});
      	  }
      	  if($("#spaceTypeId").val()!="" &&$("#spaceTypeId").val()　!= null){
      	  	$("#selectLsist_spaceType a").each(function(){
      	  		if($(this).attr("id") == $("#spaceTypeId").val()){
      	  			$(this).addClass("onselect");
      	  		}else{
      	  			$(this).removeClass("onselect");
      	  		}
      	  	});
      	  }
      	  
      	  
	      $("#selectLsist_style a").click(function(){
	      	$(this).addClass("onselect").siblings().removeClass("onselect");
	      	var id = $(this).attr("id");
	      	$("#styleId").val(id);
	      	selectFun();
	      });
	      
	      $("#selectLsist_houseType a").click(function(){
	      	$(this).addClass("onselect").siblings().removeClass("onselect");
	      	var id = $(this).attr("id");
	      	$("#typeId").val(id);
	      	selectFun();
	      });
	       $("#selectLsist_spaceType a").click(function(){
	      	$(this).addClass("onselect").siblings().removeClass("onselect");
	      	var id = $(this).attr("id");
	      	$("#spaceTypeId").val(id);
	      	$("#type").val(1);
	      	selectFun();
	      });
	      
	      
	      $("#selectLsist_price a").click(function(){
	      	$(this).addClass("onselect").siblings().removeClass("onselect");
	      	var id = $(this).attr("id");
	      	$("#priceId").val(id);
	      	selectFun();
	      });
	      
	      $("#selectLsist_sqm a").click(function(){
	      	$(this).addClass("onselect").siblings().removeClass("onselect");
	      	var id = $(this).attr("id");
	      	$("#sqmId").val(id);
	      	selectFun();
	      });
	      
      });
    </script>
    <style type="text/css">
      /*内页是窄版*/ .index_logo,.top_menu{width:990px;} .index_logo #search_case{margin-left:
      100px !important;}
    </style>
  </head>
  <body>
    <div class="sjbNewTop" id="sjbNewTop">
      <div class="newTopBg">
      	<div class="head1">
          <div class="hea_top_right">
            <ul class="tp_node">
              <li style="width:90px;" id="nav_login" class="">
                <span id="userName" class="name">
                  <a href="" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">
                    <span class="nick">
                    	<#if member ??>
                    	<#if member.memberType==0>
                    		业主
                    	<#elseif member.memberType==1>
                    		设计师
                    	<#elseif member.memberType==2>
                    		设计机构        
                    	<#else>                    	         	
                    	</#if>
                    <#else>
                    <a href="${base}/pc/login/login.action">登录</a>&nbsp;&nbsp;<a href="${base}/pc/register/register.action">注册</a>   
                    </#if>
                    </span>
                    <em class="downAdrrow"></em>
                  </a>
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
        <a href="${base}/pc/index.action" title="">
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
            <input type="text" value="请输入搜索关键词" class="key" name="keyword" id="search_val"/>
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
          <li>
            <a href="${base}/pc/index.action">首页</a>
          </li>
          <li class="cur">
            <a href="">设计案例</a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!list.action?type=0">网咖案例</a>
              <a href="${base}/pc/case/case!list.action?type=1">电竞案例</a>
              
            </div>
          </li>
          <li>
            <a href="${base}/pc/case/case!pics.action">装修图库</a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!pics.action">网咖图库</a>
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
        <!--首页面包屑导航 end-->
      </div>
    </div>
    <!--主导航-->
    <div class="dmato"></div>
    <div class="content_width">
      <div class="content_width ">
      	<!-- 案例搜索下拉框脚本 -->
        <script type="text/javascript">
          var token = "0";
          var appid = "0";
          var openid = "0";
          var token_weibo = "0";
          seajs.use(['newHeader', 'common'],
          function(Header, common) {
            $(document).ready(function() {
              Header.init();
              common.initHeader();
              $('#quicksearch .submit').click(function() {
                return common.checkSearchForm();
              });
            });

            var searchType = "10";
            var arr = new Array("1", "2", '10', '7', '9', '3');
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
        <style type="text/css">
          /*内页是窄版*/ .index_logo,.top_menu{width:990px;} .index_logo #search_case{margin-left:
          100px !important;}
        </style>
        <!-- 2015.7.13修改的样式 -->
        <style type="text/css">
          /*改为宽版*/ .sjbNewTop .newTopBg .head1 , .index_logo, .top_menu{width:1180px;}
          .content_width_index{padding-top: 0px !important;z-index: 100 !important;}
          .content_width { width: 1180px;} .index_logo #search_case {margin-left:
          130px !important;} .ask_links{ width: 1180px;} .ask_links .itemModule .itemTips{
          width: 1065px;}
        </style>
        <p class="clear"></p>
        <div class="crumbs">
          <span>我的位置：</span>
          <span>
            <a href="${base}/pc/index.action">百爪鱼</a>
          </span>
          	＞
          <span>
          <#if data.type??>
          	<#if data.type == '0'> <a href="${base}/pc/case/case!list.action?type=1">网咖案例</a><#else> <a href="${base}/pc/case/case!list.action?type=2">电竞案例</a></#if>	
          </#if>
          
          </span>
        </div>
        <!-- 筛选框 -->
        <div class="fiterbox">
          <div class="fiterList">
            
            <#if data.type??>
            
            <#if data.type == '0'>
            <div class="fiterLine">
              <span class="title">网咖风格：</span>
              <div class="selectLsist" id="selectLsist_style">
                <a href="javascript:void(0)" class="onselect">
                  <span>全部</span>
                </a>
            	<#if data.styles??>
                	<#list  data.styles as vo>
                		<a  class="" id="${vo.id}" >
		                  <span>${vo.name}</span>
		                </a>
                	</#list>
                </#if>                
              </div>
            </div>
            <div class="fiterLine">
              <span class="title">地段：</span>
              <div class="selectLsist" id="selectLsist_houseType">
                <a href="javascript:void(0)" class="onselect">
                  <span>全部</span>
                </a>
               <#if data.houseTypes??>
                	<#list  data.houseTypes as vo>
                		<a  class="" id="${vo.id}" >
		                  <span>${vo.name}</span>
		                </a>
                	</#list>
                </#if>
              </div>
            </div>
            <#else>
            <div class="fiterLine">
              <span class="title">风格：</span>
              <div class="selectLsist" id="selectLsist_spaceType">
                <a href="javascript:void(0)" class="onselect">
                  <span>全部</span>
                </a>
               <#if data.spaceTypes??>
                	<#list  data.spaceTypes as vo>
                		<a  class="" id="${vo.id}" >
		                  <span>${vo.name}</span>
		                </a>
                	</#list>
                </#if>
              </div>
            </div>
            </#if>
            </#if>
            
            
            <div class="fiterLine">
              <span class="title">造价：</span>
              <div class="selectLsist" id="selectLsist_price">
                <a href="javascript:void(0)" class="onselect">
                  <span>全部</span>
                </a>
                <#if data.budgets??>
                	<#list  data.budgets as vo>
                		<a  class="" id="${vo.id}" >
		                  <span>${vo.name}</span>
		                </a>
                	</#list>
                </#if>
              </div>
            </div>
            <div class="fiterLine">
              <span class="title">面积：</span>
              <div class="selectLsist" id="selectLsist_sqm">
                <a href="javascript:void(0)" class="onselect">
                  <span>全部</span>
                </a>
               <#if data.areaMeasures??>
                	<#list  data.areaMeasures as vo>
                		<a  class="" id="${vo.id}" >
		                  <span>${vo.name}</span>
		                </a>
                	</#list>
                </#if>
              </div>
            </div>
          </div>
        </div>
        <!-- 筛选框 END -->
        <!-- 列表 -->
        <div class="caseImageList">
          
          <#if data.designWorks??>
          
          	<#list data.designWorks as ds>
          		<div class="caseList">
		            <a href="${base}/pc/case/case!detail.action?id=${ds.id}" target="_blank" alt="">
		              <img src="${ds.imagePath!}"
		              alt="" width="282" height="282" />
		            </a>
		            <div class="caseIntroduce">
		              <a href="case-detail.html" target="_blank" alt="">
		                <p class="caseTitle">${ds.title!}</p>
		              </a>
		              <p class="caseProperty">
		                <span class="caseSpace">二居</span>
		                <span class="delimiter">|</span>
		                <span class="caseStyle">
		                <#if data.styles? exists>
		                	<#list data.styles as style>
		                		<#if style.id = ds.ltDnRenovationStyleId!>
		                			${style.name!}
		                		</#if>
		                	</#list>
		                </#if>
		                </span>
		                <span class="delimiter">|</span>
		                <span class="caseArea">${ds.sqm}平米</span>
		                <span class="delimiter">|</span>
		                                造价：
		                <span class="casePrice">${ds.costAmt}万元</span>
		              </p>
		            </div>
		            <div class="delimiter_s">
		            </div>
		            <div class="caseAuthor">
		              <div class="authorHeadPhoto float_l">
		                <img src="${ds.mb.imagePath!}" alt="" width="22" height="22" />
		              </div>
		              <div class="authorNick float_l">
		              <a href="${base}/pc/designer/designer!personal.action?id=${ds.mb.id}">
		              	<#if ds.mb.memberType==1>
		              		设计师：
		              	<#else>
		              		设计机构：
		              	</#if>
		              	${ds.member!} </a>
		              </div>
		              <p class="clear">
		              </p>
		            </div>
		          </div>
		       
          	</#list>
          	<#else>
          	<div>没有相应记录！</div>
          </#if>
          <p class="clear"></p>
        </div>
        <div class="page">
          <div class="page_num">
          		<@page pager base + "/pc/case/case!list.action"/>
            	<input type="hidden" name="searchProperties.brand" value="${searchProperties.brand!}"/>
	            <input type="hidden" name="searchProperties.startprice" value="${searchProperties.startprice!}"/>
	            <input type="hidden" name="searchProperties.endprice" value="${searchProperties.endprice!}"/>
	            <input type="hidden" name="searchProperties.type" value="${searchProperties.type!}"/>
	            <input type="hidden" name="orderby" value="${searchProperties.orderby!}"/>
	            <input type="hidden" name="keyword" value="${searchProperties.name!}"/>       
          </div>
        </div>
        
       
        <!-- 列表 END -->
        <script type="text/javascript">
          seajs.use('${base}/resources/pc/js/case.js');
          seajs.use('common',
           function(SJB) {
             SJB.commonSubToolBar.init();
           })
           seajs.use('common', function(SJB) {
	       // SJB.commonBottomZb.init();
	      });
           function nextPage(next){
        		if(next) $.pageSkip(next);
        	}
        </script>
      </div>
    </div>
    <!--底部模版 闭合标签配对-->
    <!--底部模版 闭合标签配对 End-->
    <p class="clear"></p>
    <bgsound src="" autostart=true loop=2 id='bgmusic'></bgsound>
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
            ©2012shejiben.com,All Rights Reserved.(<a hidefocus="" href="" rel="nofollow"> 粤ICP备0812558号-2</a>)
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
      	

      <form id="myForm" action="${base}/pc/case/case!list.action" method="post">
      	 <input type="hidden" name="styleId" id="styleId" value="${styleId!}"/>
      	 <input type="hidden" name="typeId" id="typeId" value="${typeId!}"/>
      	 <input type="hidden" name="priceId" id="priceId" value="${priceId!}"/>
      	 <input type="hidden" name="sqmId" id="sqmId" value="${sqmId!}"/>
      	  <input type="hidden" name="spaceTypeId" id="spaceTypeId" value="${spaceTypeId!}"/>
      	  <input type="hidden" name="type" id="type" value="0"/>
      </form>
      <!--版权等 End-->
  </body>
</html>