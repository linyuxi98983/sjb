<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="position: relative;">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>设计师首页</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="mobile-agent" content=""/>
    <#include "/WEB-INF/ftl/pc/pager.ftl"/>
    <link href="${base}/resources/pc/css/new_global.css" rel="stylesheet" style="text/css"/>
    <link href="${base}/resources/pc/css/designer.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/header_menu.css" rel="stylesheet"/>
    <link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css"/>
     <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>   
    <script type="text/javascript" src="${base}/resources/pc/js/layer/layer.js"></script>   
    <script type="text/javascript">
    	$(function(){
    		//alert(1111)
    		
    	});
    	function getDsMemberId(){
    		//alert(jq("#ltSpMemberId").val());
    		return jq("#ltSpMemberId").val();
    	}
    	function reloadFun(){
    		return '${base}/pc/designer/designer!index.action';
    	}
    </script>
    <script type="text/javascript" src="${base}/resources/pc/js/common.js"></script>   
    <link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/pagination.css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    
    <script type="text/javascript">
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    </script>
    <script src="${base}/resources/pc/js/sea.js" type="text/javascript"></script>
    <script>var jq = jQuery.noConflict();</script>
    <script type="text/javascript">
      seajs.config({
        alias: {
          'jquery': '${base}/resources/pc/js/jquery_module.js',
          'list':'${base}/resources/pc/js/list.js',
          //jquery version must be 1.7x
          'common': '${base}/resources/pc/js/main.js',
          'form': '${base}/resources/pc/js/module.form.js',
          'ui': '${base}/resources/pc/js/module.ui.js',
          'colorbox': '${base}/resources/pc/js/jquery.colorbox.min.js',
          'newHeader': '${base}/resources/pc/js/userCenter.js'
        },
        preload: ['jquery','list', 'common'] //预加载jquery和main.js
      });
		  seajs.use('${base}/resources/pc/js/check_form.js');
	    seajs.use('common',
	    function(SJB) {
	      //SJB.commonBottomZb.init();
	    });
	    seajs.use(['${base}/resources/pc/js/GlobalProvinces_module.js', '${base}/resources/pc/js/zsj.js'],
	    function(province, zsj) {
	      province({
	        elems: ['#User_Shen', '#User_City'],
	        placeHolders: ['省/市', '市/地区']
	      });
	    });
	    seajs.use('common',
	    function(SJB) {
	      SJB.placeHolder();
	      SJB.commonSubToolBar.init();
	    });
	    
	    	
	      	
	    function clickFun(){
	    	var nickname = jq("#nickname").val();
	    	if(nickname == ""){
	    		alert("昵称不能为空！");
	    		return;
	    	}
	    	var phoneNo = jq("#phoneNo").val();
	    	if(phoneNo == ""){
	    		alert("手机号不能为空！");
	    		return;
	    	}
	    	var reg = /^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
	    	if(!reg.test(phoneNo)){
	    		alert("必须输入11位数号码");
	    		return;
	    	}
	    	var User_Shen = jq("#User_Shen").val();
	      	var User_City = jq("#User_City").val();
	      	if(User_Shen == "" || User_City == ""){
	      		alert("省市/地区不能为空！");
	    		return;
	      	}
	      	jq("#entity_area").val(User_Shen + " " + User_City);
	    	jq.ajax({
             type: "POST",
             url: "${base}/pc/demand/demand!save.action?result=json",
             data: jq("#zsjForm").serialize(),
             dataType: "json",
             success: function(data){
             	if(data.success){
             		alert("需求提交成功");
             	}
             }
             
        });
	    }
    </script>
    <style type="text/css">
      /*内页是窄版*/ .index_logo,.top_menu{width:990px;} .index_logo #search_case{margin-left:
      100px !important;}
    </style>
  </head>
  <body style="position: relative;">
  <input type="hidden" id="memberId" value="${memberId!0}"/>
   <input type="hidden" id="ltSpMemberId" value=""/>
    <div class="sjbNewTop" id="sjbNewTop">
      <div class="newTopBg">
        <div class="head1">
          <div class="hea_top_right">
            <ul class="tp_node">
              <li style="width:90px;" id="nav_login" class="">
                <span id="userName" class="name">
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
                    </#if>
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
        <a href="" title="美国知名风险投资机构投资的设计交易平台 - 百爪鱼">
          <div class="web-logo"></div>
        </a>
        <div id="search_case">
          <form id="quicksearch" method="get" action="" target="_blank">
            <input type="hidden" name="searchType" value="7" id="searchType"/>
            <span id="search_span">
              <div id="search_title">
                找设计师
              </div>
              <em class="arrow">
              </em>
              <label id="s_zsj" style="display:none;">
                <a class="search_tags clickToSearch" href="javascript:;" data-id="1">找图片</a>
                <a class="search_tags clickToSearch" href="javascript:;" data-id="2">找图集</a>
                <a class="search_tags clickToSearch" href="javascript:;" data-id="10">找案例</a>
                <a class="search_tags clickToSearch" href="javascript:;" data-id="9">找问答</a>
                <a class="search_tags clickToSearch" href="javascript:;" data-id="3">找模型</a>
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
    <p class="clear">
    </p>
    <!--主导航-->
    <div class="wrap wrap_top_menu">
      <div class="top_menu">
        <!--整站主导航-->
        <ul>
          <li>
            <a href="${base}/pc/index.action">
              首页
            </a>
          </li>
          <li>
            <a href="${base}/pc/case/case!list.action">
              设计案例
            </a>
            <div class="inner_menu">
             <a href="${base}/pc/case/case!list.action">网咖案例</a>
              <a href="${base}/pc/case/case!list.action?type=1">电竞案例</a>
              
            </div>
          </li>
          <li>
            <a href="${base}/pc/case/case!pics.action">
              装修图库
            </a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!pics.action">网咖图库</a>
              <a href="${base}/pc/case/case!pics.action?type=1">电竞图库</a>
             
            </div>
          </li>
           <!--<li>
            <a href="">有问必答</a>
          </li>-->
          <li class="cur">
            <a href="${base}/pc/designer/designer!index.action">
              找设计师
            </a>
          </li>
        
        </ul>
        <!--整站主导航 End-->
        <!--首页面包屑导航-->
        <!--首页面包屑导航 end-->
      </div>
    </div>
    <!--主导航-->
    <div class="dmato">
    </div>
    <div class="content_width">
      <div class="content_width ">
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
        <style type="text/css">
          /*改为宽版*/ .sjbNewTop .newTopBg .head1 , .index_logo, .top_menu{width:1180px;}
          .content_width_index{padding-top: 0px !important;z-index: 100 !important;}
          .content_width { width: 1180px; margin:0 auto;} .index_logo #search_case
          {margin-left: 130px !important;} /*.ask_links{ width: 1180px;} .ask_links
          .itemModule .itemTips{ width: 1065px;}*/
        </style>
        <p class="clear"></p>
        <div class="crumbs">
          <span>
            我的位置：
          </span>
          <span>
            <a href="">
              百爪鱼
            </a>
          </span>
          	＞
          <span>
            <a href="${base}/pc/designer/designer!index.action">
              找设计师
            </a>
          </span>
          <span>
          </span>
        </div>
        <!-- 左栏 -->
        <div class="column_left">          <!-- 设计师列表 -->
          <div class="designer-box">
          
            <div class="designer-list">
              <div class="user-detail-box">
                <div class="user-headphoto">
                  <a href="${base}/pc/designer/designer!personal.action?id=" target="_blank">
                   
                   
                  </a>
                </div>
                <div class="user-detail">
                  <!-- 左边的列表 -->
                  <div class="user-detail_left">
                    <div>
                      <a href="" target="_blank">
                        <span class="user-name"></span>
                      </a>
                      <span class="medal fam" title="行业知名设计师"></span>
                      <span class="medal vip" title="个人身份认证"></span>
                      <p class="clear">
                      </p>
                    </div>
                    <p class="p-line">
                      <span class="user-position">
                        所在城市
                        <em>
                           
                        </em>
                      </span>
                      <span class="pic-num">
                        作品
                        <em>
                        </em>
                      </span>
                    </p>
                    <p class="p-line">
                      <span>
                        擅长空间
                        <em>
                        </em>
                      </span>
                    </p>
                    <div class="user-nums">
                      <div class="num-box">
                        <span>
                          预约数
                        </span>
                        <span class="high-light-num">
                        </span>
                      </div>
                    </div>
                  </div>
              </div>
             </div>
          <#if list ??>
          	<#list list as info>
          		<div class="designer-box">
          
            <div class="designer-list">
              <div class="user-detail-box">
                <div class="user-headphoto">
                  <a href="${base}/pc/designer/designer!personal.action?id=${info.id}" target="_blank">
                   
                    width="118" height="118" alt="${info.title!}"/>
                  </a>
                </div>
                <div class="user-detail">
                  <!-- 左边的列表 -->
                  <div class="user-detail_left">
                    <div>
                      <a href="" target="_blank">
                        <span class="user-name">${info.title!}</span>
                      </a>
                      <span class="medal fam" title="行业知名设计师"></span>
                      <span class="medal vip" title="个人身份认证"></span>
                      <p class="clear">
                      </p>
                    </div>
                  
                  </div>
                  
              </div>
            <!-- 右边的列表 -->
            </div>
              
          </div>
          	</#list>
          	<#else>
          	
          	
          </#if>
          <!-- 设计师列表 END -->
           <div class="page">
          <div class="page_num">
          		<@page pager base + "/pc/designer/designer!index.action"/>
            	<input type="hidden" name="searchProperties.brand" value="${searchProperties.brand!}"/>
	            <input type="hidden" name="searchProperties.startprice" value="${searchProperties.startprice!}"/>
	            <input type="hidden" name="searchProperties.endprice" value="${searchProperties.endprice!}"/>
	            <input type="hidden" name="searchProperties.type" value="${searchProperties.type!}"/>
	            <input type="hidden" name="orderby" value="${searchProperties.orderby!}"/>
	            <input type="hidden" name="keyword" value="${searchProperties.name!}"/>       
          </div>
        </div>
        </div>
        <!-- 左栏 END -->
        <!-- 右栏 START -->
        <div class="column_right">
          <!-- 找设计师 上百爪鱼 -->
          <div class="doubt">
           
            <!-- <div class="chain">
            <a href="#" class="change">如何在线交易？</a>
            </div> -->
            <!-- 申请设计列表 -->
            <form action="#" id="zsjForm" name="zsjForm" method="post" style="top: 15px;">
              <div class="input_form">
                <p class="input_form_header">
                  申请定制设计
                </p>
                <div class="total">
                  <span>
                    快速发布需求
                  </span>
                  <span>
                    找到专属设计
                  </span>
                </div>
                <div class="box">
                  <label class="default_value">
                    您的称呼
                  </label>
                  <input class="input_txt" name="entity.nickname" id="nickname" type="text"/>
                  <label class="msg">
                    <em>
                    </em>
                    <p>
                    </p>
                  </label>
                </div>
                <div class="box">
                  <label class="default_value">
                    手机号码
                  </label>
                  <input class="input_txt" name="entity.phoneNo" id="phoneNo" type="text"/>
                  <label class="msg">
                    <em>
                    </em>
                    <p>
                    </p>
                  </label>
                </div>
                <div class="box box_l">
                  <select class="select_l" name="User_Shen" id="User_Shen">
                    <option value="">
                      省/市
                    </option>
                    <option value="安徽">
                      安徽
                    </option>
                    <option value="北京">
                      北京
                    </option>
                    <option value="重庆">
                      重庆
                    </option>
                    <option value="福建">
                      福建
                    </option>
                    <option value="广西">
                      广西
                    </option>
                    <option value="贵州">
                      贵州
                    </option>
                    <option value="广东">
                      广东
                    </option>
                    <option value="甘肃">
                      甘肃
                    </option>
                    <option value="海南">
                      海南
                    </option>
                    <option value="湖北">
                      湖北
                    </option>
                    <option value="黑龙江">
                      黑龙江
                    </option>
                    <option value="河南">
                      河南
                    </option>
                    <option value="河北">
                      河北
                    </option>
                    <option value="湖南">
                      湖南
                    </option>
                    <option value="江苏">
                      江苏
                    </option>
                    <option value="吉林">
                      吉林
                    </option>
                    <option value="江西">
                      江西
                    </option>
                    <option value="辽宁">
                      辽宁
                    </option>
                    <option value="内蒙古">
                      内蒙古
                    </option>
                    <option value="宁夏">
                      宁夏
                    </option>
                    <option value="澳门">
                      澳门
                    </option>
                    <option value="青海">
                      青海
                    </option>
                    <option value="四川">
                      四川
                    </option>
                    <option value="陕西">
                      陕西
                    </option>
                    <option value="上海">
                      上海
                    </option>
                    <option value="山东">
                      山东
                    </option>
                    <option value="山西">
                      山西
                    </option>
                    <option value="台湾">
                      台湾
                    </option>
                    <option value="天津">
                      天津
                    </option>
                    <option value="西藏">
                      西藏
                    </option>
                    <option value="香港">
                      香港
                    </option>
                    <option value="新疆">
                      新疆
                    </option>
                    <option value="云南">
                      云南
                    </option>
                    <option value="浙江">
                      浙江
                    </option>
                  </select>
                  <label class="msg">
                    <em>
                    </em>
                    <p>
                    </p>
                  </label>
                </div>
                <div class="box box_r">
                  <select class="select_r" name="User_City" id="User_City">
                    <option value="">
                      市/地区
                    </option>
                  </select>
                  <label class="msg">
                    <em>
                    </em>
                    <p>
                    </p>
                  </label>
                  <input type="hidden" id="entity_area" name="entity.areaZone" name="entity_area" value=""/>
                </div>
                <div class="clear">
                </div>
                
                <div class="box">
                  <input type="button" class="smbmit_btn" id="zsjBtnbbbb" onclick="clickFun()" name="subs" value="立即提交"/>
                </div>
              </div>
            </form>
          </div>
          <!-- 图片 遇见 -->
          
         <!-- 设计师专访 
          <div class="clear">
          </div>
          <div class="talk">
            <div class="talk_header">
              <span>
                设计师专访
              </span>
              <div class="mark">
                <ul class="points" id="pointer-2">
                  <li id="1" class="">
                  </li>
                  <li id="2" class="on">
                  </li>
                  <li id="3" class="">
                  </li>
                </ul>
              </div>
            </div>
            <div class="talk_slider">
              <div class="content-wrap" id="container-wrap-2">
                <div class="container-box" id="container-box-2" style="width: 1320px;">
                  <ul id="slider-wrap-2" class="slider-wrap" style="width: 660px;">
                    <li id="img1">
                      <a href="http://www.shejiben.com/zt/z201.html" target="_blank">
                        <img src="http://pic1.shejiben.com/hot_sjb/428_7658.jpg?1460187627" width="220" height="240"/>
                        <span class="icon pic_fixed">
                          <span class="word">
                            第
                            <em>
                              199
                            </em>
                            期
                          </span>
                        </span>
                      </a>
                      <p class="introduce">
                        <b>
                          傅晓
                          <em>
                            :
                          </em>
                        </b>
                        傅晓：让更多的人享受更好的设计服务
                      </p>
                    </li>
                    <li id="img2">
                      <a href="" target="_blank">
                        <img src="http://pic.shejiben.com/hot_sjb/428_7660.jpg?1460104070" width="220" height="240"/>
                        <span class="icon pic_fixed">
                          <span class="word">
                            第
                            <em>
                              198
                            </em>
                            期
                          </span>
                        </span>
                      </a>
                      <p class="introduce">
                        <b>
                          周子航
                          <em>
                            :
                          </em>
                        </b>
                        分享设计，乐谈生活
                      </p>
                    </li>
                    <li id="img3">
                      <a href="" target="_blank">
                        <img src="http://pic1.shejiben.com/hot_sjb/428_7661.jpg?1460363031" width="220" height="240"/>
                        <span class="icon pic_fixed">
                          <span class="word">
                            第
                            <em>
                              200
                            </em>
                            期
                          </span>
                        </span>
                      </a>
                      <p class="introduce">
                        <b>
                          丁云
                          <em>
                            :
                          </em>
                        </b>
                        从使用者的角度做设计
                      </p>
                    </li>
                  </ul>
                  <ul class="slider-wrap" style="width: 660px;">
                    <li id="img1">
                      <a href="" target="_blank">
                        <img src="http://pic1.shejiben.com/hot_sjb/428_7658.jpg?1460187627" width="220" height="240"/>
                        <span class="icon pic_fixed">
                          <span class="word">
                            第
                            <em>
                              199
                            </em>
                            期
                          </span>
                        </span>
                      </a>
                      <p class="introduce">
                        <b>
                          傅晓
                          <em>
                            :
                          </em>
                        </b>
                        傅晓：让更多的人享受更好的设计服务
                      </p>
                    </li>
                    <li id="img2">
                      <a href="" target="_blank">
                        <img src="http://pic.shejiben.com/hot_sjb/428_7660.jpg?1460104070" width="220" height="240"/>
                        <span class="icon pic_fixed">
                          <span class="word">
                            第
                            <em>
                              198
                            </em>
                            期
                          </span>
                        </span>
                      </a>
                      <p class="introduce">
                        <b>
                          周子航
                          <em>
                            :
                          </em>
                        </b>
                        分享设计，乐谈生活
                      </p>
                    </li>
                    <li id="img3">
                      <a href="" target="_blank">
                        <img src="http://pic1.shejiben.com/hot_sjb/428_7661.jpg?1460363031" width="220" height="240"/>
                        <span class="icon pic_fixed">
                          <span class="word">
                            第
                            <em>
                              200
                            </em>
                            期
                          </span>
                        </span>
                      </a>
                      <p class="introduce">
                        <b>
                          丁云
                          <em>
                            :
                          </em>
                        </b>
                        从使用者的角度做设计
                      </p>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="chain">
              <a href="http://www.shejiben.com/zt/" target="_blank">
                查看全部&gt;
              </a>
            </div>
          </div>
        </div>
        -->
        <!-- 右栏 END -->
        <div class="showMeDiv">
          <div id="showMe">
            大牌设计师入驻百爪鱼请咨询QQ &nbsp;
            <img style="CURSOR: pointer; vertical-align:middle;display:inline-block;padding-bottom:3px;"
            onclick="javascript:window.open('tencent://message/?uin=2880630894&amp;Site=百爪鱼&amp;Menu=yes', '_blank', 'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"
            border="0" src="http://im.bizapp.qq.com:8000/zx_qq.gif"/>
            &nbsp;
            <img style="CURSOR: pointer; vertical-align:middle;display:inline-block;padding-bottom:3px;"
            onclick="javascript:window.open('tencent://message/?uin=2880630580&amp;Site=百爪鱼&amp;Menu=yes', '_blank', 'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"
            border="0" src="http://im.bizapp.qq.com:8000/zx_qq.gif"/>
          </div>
        </div>
        <!--底部模版 闭合标签配对-->
        <!--底部模版 闭合标签配对 End-->
      </div>
    </div>
    <p class="clear"></p>
    <bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
    <div id="messagebox"></div>
    <div id="small_window"></div>
    <div style="display: none" id="bd_statistics"></div>
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
            ©2012shejiben.com,All Rights Reserved.(
            <a hidefocus="" href="" rel="nofollow">粤ICP备0812558号-2</a>
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
    <a class="bottom_show_left" href="javascript:void(0)" style="display: none;"></a>
    <form action="" method="post" target="frm_dealer" id="frm_dealer_form">
      <input type="hidden" id="clickValId" name="key" value=""/>
    </form>
    <iframe frameborder="0" height="0" name="frm_dealer" id="clsIframe"></iframe>
  </body>

</html>