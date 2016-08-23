<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图库例子</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="mobile-agent" content=""/>
    <#include "/WEB-INF/ftl/shop/pager.ftl"/>
    <link href="${base}/resources/pc/css/new_global.css" rel="stylesheet" type="text/css" />
    <link href="${base}/resources/pc/css/works.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/header_menu.css" rel="stylesheet"/>
    <link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/pagination.css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/js/layer/skin/layer.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>  
     <script type="text/javascript" src="${base}/resources/pc/js/layer/layer.js"></script>  
     <style type="text/css">
     	.box1 { 
		/*非IE的主流浏览器识别的垂直居中的方法*/ 
		display: table-cell; 
		vertical-align:middle; 
		/*设置水平居中*/ 
		text-align:center; 
		/* 针对IE的Hack */ 
		*display: block; 
		*font-size: 175px;/*约为高度的0.873，200*0.873 约为175*/ 
		*font-family:Arial;/*防止非utf-8引起的hack失效问题，如gbk编码*/ 
		width:1000px; 
		height:800px; 
		} 
		.box1 img { 
		/*设置图片垂直居中*/ 
		vertical-align:middle; 
		} 
     </style>
     <script type="text/javascript">
     	
     	$(function(){

		/**$(".new_li").each(function(){
		     		$(this).on("click",function(){
		     			var content = "<div class='box1'><img width=600,height=500, src='"+this.id+"'></img></div>";
		     			layer.open({
						    type: 1,
						    //skin: 'layui-layer-lan',
						    title: '图库',
						    fix: false,
						    shadeClose: true,
						    maxmin: true,
						    area: ['1000px', '600px'],
						    content: content,
						    end: function(){
						      layer.tips('试试相册模块？', '#photosDemo', {tips: 1})
						    }
						  });
		     		})
     		});
		  
     	});**/




     	
     </script>
     
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
      
		seajs.use(['common','${base}/resources/pc/js/GlobalProvinces_module.js', '${base}/resources/pc/js/works.js'],function(SJB,province,zsj){
		   // SJB.commonBottomZb.init();
		    province({
		        elems : ['#User_Shen' , '#User_City' ],
		        placeHolders: ['省/市', '市/地区']
		    });
		    province({
		        elems : ['#User_Shen_bottom' , '#User_City_bottom' ],
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
                    <span class="nick"><#if member ??>
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
                    </#if></span>
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
          <li>
            <a href="${base}/pc/index.action">首页</a>
          </li>
          <li >
            <a href="${base}/pc/case/case!list.action">设计案例</a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!list.action">网咖案例</a>
              <a href="${base}/pc/case/case!list.action?type=1">电竞案例</a>
            </div>
          </li>
          <li class="cur">
            <a href="">装修图库</a>
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
        <!-- 2015.7.14修改的样式 -->
        <style type="text/css">
          /*改为宽版*/ .sjbNewTop .newTopBg .head1 , .index_logo, .top_menu{width:1180px;}
          .content_width_index{padding-top: 0px !important;z-index: 100 !important;}
          .index_logo #search_case {margin-left: 130px !important;} .content_width
          { width: 1180px;}
        </style>
        <div id="content">
          <div class="clear"></div>
          <div id="menubar-left">
          
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
                  <input class="input_txt" name="entity.nickname" id="nickname" type="text" placeholder="您的称呼"/>
                  <label class="msg">
                    <em>
                    </em>
                    <p>
                    </p>
                  </label>
                </div>
                <div class="box">
                  <input class="input_txt" name="entity.phoneNo" id="phoneNo" type="text" placeholder="手机号码"/>
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
          <div class="works_right_new">
            <div class="works_new_top">
              <h1> 集合全国332个城市的装修图库,尽在百爪鱼。</h1>
              <p class="case_see_type">
               <!-- <label class="float_l" style="padding-top:5px;">
                  <a href="" class="img-size radius-l on" rel="nofollow">小图
                  </a>
                  <a href="" class="img-size" rel="nofollow">中图</a>
                  <a href="" class="img-size" rel="nofollow">大图</a>
                  <a href="javascript:;" title="幻灯片放映" rel="nofollow" class="img-size preview-box-one radius-r">
                    <span class="slide"></span>
                  </a>
                </label>
               -->
              </p>
              <p class="clear"></p>
            </div>
            <div class="works_list">
              <div id="case_list" class="newcasebox">
                <div class="case_list case_list_m new_case_list_m">
                  <ul>
                    
                    <#if data.designWorks??>
          
          	<#list data.designWorks as ds> 
          						<li class="new_li" id="${ds.imagePath!}">
					  <label class="label_img_254" data-src="${ds.imagePath!}"
					  data-id="2234688">
					    <div class="gradual" style="display: none;">
					      <a>
					        <div class="thumb_name">美式风地下室设计装修</div>
					      </a>
					    </div>
					    <a  class="preview-box" data-id="2234688" href="${base}/pc/case/case!pic_detail.action?id=${ds.id}">
					      <img src="${ds.imagePath!}"
					      title="" data="${ds.imagePath!}&amp;ajaxload=true&amp;i=1"
					      alt=""/>
					    </a>
					    <span class="wrap1"></span>
					  </label>
					  <p class="clear"></p>
					  <p class="sjsInfo">
					    <span class="headphoto float_l">
					    <#if ds.mb ??>
					    	<img src="${ds.mb.imagePath!}"
					      alt="" width="22" height="22"/>
					    </#if>
					      
					    </span>
					    <span class="unick float_l">
					      <span>
					        <em class="case_labal">分享者：</em>
					        <a itemdata="650330" href="" class="sjsname">${ds.member!}</a>
					      </span>
					    </span>
					  </p>
					  <p class="clear"></p>
					  <p></p>
					</li>
	</#list>
          </#if>
                    
                  </ul>
                </div>
                <p class="clear"></p>
              </div>
              <div class="page">
          <div class="page_num">
          		<@page pager base + "/pc/case/case!pics.action"/>
            	<input type="hidden" name="searchProperties.brand" value="${searchProperties.brand!}"/>
	            <input type="hidden" name="searchProperties.startprice" value="${searchProperties.startprice!}"/>
	            <input type="hidden" name="searchProperties.endprice" value="${searchProperties.endprice!}"/>
	            <input type="hidden" name="searchProperties.type" value="${searchProperties.type!}"/>
	            <input type="hidden" name="orderby" value="${searchProperties.orderby!}"/>
	            <input type="hidden" name="keyword" value="${searchProperties.name!}"/>       
          </div>
        </div>
            </div>
            <p class="clear"></p>
          </div>
        </div>
        <script type="text/javascript">
          document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
          var comment = "";
          var items_count = '5000';
          var currentPage = jscurrentPage = '0';
          var collectionId = '';
          var nb_image_page = '48';
          var userid = '';
          var noimg = '';
          var keyword = '';
          var time = '1460269130';
          var arrayObj = new Array();
          var arrayRightObj = new Array();
          if (parseInt(items_count) > 0) {
            arrayObj[currentPage] = {
              "start": 0,
              "user": [{
                "id": "2234688",
                "name": "\u7f8e\u5f0f\u98ce\u5730\u4e0b\u5ba4\u8bbe\u8ba1\u88c5\u4fee",
                "collectionComment": "",
                "added_by": "650330",
                "rank": 1,
                "indentityCN": "yz",
                "NICK": "\u65bd\u5609\u8d50",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/30\/headphoto_650330.jpg?1378092555",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/04\/07\/20160407172146-e57ba8e9.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/07\/20160407172146-e57ba8e9-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/04\/07\/20160407172146-e57ba8e9-me.jpg",
                "height": "969",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2234384",
                "name": "LOFT\u98ce\u683c\u5367\u5ba4\u7a97\u6237\u88c5\u4fee\u56fe\u7247",
                "collectionComment": "",
                "added_by": "650398",
                "rank": 2,
                "indentityCN": "yz",
                "NICK": "\u5c39\u5947\u5e0c",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/149.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/07\/20160407162547-ebbd2af9.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/07\/20160407162547-ebbd2af9-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/07\/20160407162547-ebbd2af9-me.jpg",
                "height": "531",
                "width": "800",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2234377",
                "name": "LOFT\u98ce\u683c\u536b\u751f\u95f4\u9694\u65ad\u88c5\u4fee\u56fe\u7247",
                "collectionComment": "",
                "added_by": "650398",
                "rank": 3,
                "indentityCN": "yz",
                "NICK": "\u5c39\u5947\u5e0c",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/149.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/07\/20160407162541-303bb586.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/07\/20160407162541-303bb586-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/07\/20160407162541-303bb586-me.jpg",
                "height": "531",
                "width": "800",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2233048",
                "name": "\u73b0\u4ee3\u5730\u4e2d\u6d77\u978b\u67dc\u8bbe\u8ba1",
                "collectionComment": "\u88c5\u9970\u67dc\u4e0a\u7b80\u7ea6\u7684\u73b0\u4ee3\u88c5\u9970\u54c1\u548c\u5899\u9762\u7684\u6302\u753b\uff0c\u4e3a\u623f\u95f4\u589e\u6dfb\u4e86\u827a\u672f\u6c14\u606f\uff1b\u51e0\u7c07\u8774\u8776\u5170\u4eff\u4f5b\u6d0b\u6ea2\u7740\u82b1\u9999\u5473\uff0c\u5c31\u8fde\u6c99\u53d1\u4e0a\u7684\u9e1f\u513f\u4e5f\u5f00\u59cb\u8e81\u52a8\u8d77\u6765\uff0c\u4f3c\u4e4e\u5728\u6b4c\u5531\u7740\u81ea\u7136\u7684\u7f8e\u597d\uff01",
                "added_by": "556085",
                "rank": 4,
                "indentityCN": "sjs",
                "NICK": "\u5362\u5c0f\u521a",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/85\/headphoto_556085.jpg?1378092261",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/06\/20160406154311-aea6c31e.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/06\/20160406154311-aea6c31e-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/06\/20160406154311-aea6c31e-me.jpg",
                "height": "731",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "4",
                "min_price": "60",
                "max_price": "200",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u6210\u90fd",
                "shen": "\u56db\u5ddd"
              },
              {
                "id": "2232090",
                "name": "\u6b27\u5f0f\u7384\u5173\u5bb6\u88c5\u8bbe\u8ba1",
                "collectionComment": "",
                "added_by": "650229",
                "rank": 5,
                "indentityCN": "yz",
                "NICK": "\u5c0f\u601d",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/29\/headphoto_650229.jpg?1403343540",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/05\/20160405164409-f2b7a5a4.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/05\/20160405164409-f2b7a5a4-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/05\/20160405164409-f2b7a5a4-me.jpg",
                "height": "1024",
                "width": "683",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2232057",
                "name": "\u7f8e\u5f0f\u53e4\u6734\u9152\u7a96\u8bbe\u8ba1\u88c5\u4fee",
                "collectionComment": "",
                "added_by": "650232",
                "rank": 6,
                "indentityCN": "yz",
                "NICK": "\u84dd\u5929&amp;\u767d\u4e91",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/32\/headphoto_650232.jpg?1403344168",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/05\/20160405164232-84c2e1e7.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/05\/20160405164232-84c2e1e7-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/05\/20160405164232-84c2e1e7-me.jpg",
                "height": "660",
                "width": "990",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2232038",
                "name": "\u7f8e\u5f0f\u82b1\u56ed\u8bbe\u8ba1\u88c5\u4fee",
                "collectionComment": "",
                "added_by": "650233",
                "rank": 7,
                "indentityCN": "yz",
                "NICK": "\u660e\u5e74\u4eca\u65e5",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/33\/headphoto_650233.jpg?1403344669",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/05\/20160405164104-20d67b7d.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/05\/20160405164104-20d67b7d-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/05\/20160405164104-20d67b7d-me.jpg",
                "height": "760",
                "width": "1000",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2231987",
                "name": "\u7b80\u6b27\u98ce\u683c\u5730\u4e0b\u5ba4\u8bbe\u8ba1\u88c5\u4fee",
                "collectionComment": "",
                "added_by": "650239",
                "rank": 8,
                "indentityCN": "yz",
                "NICK": "\u6211\u662f\u571f\u8c6a",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/39\/headphoto_650239.jpg?1403345692",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/04\/05\/20160405163617-b86c4dcb.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/05\/20160405163617-b86c4dcb-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/04\/05\/20160405163617-b86c4dcb-me.jpg",
                "height": "576",
                "width": "990",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2231029",
                "name": "\u73b0\u4ee3\u7b80\u7ea6\u53a8\u623f\u8bbe\u8ba1\u56fe",
                "collectionComment": "",
                "added_by": "2843629",
                "rank": 9,
                "indentityCN": "sjs",
                "NICK": "\u4e00\u7c73\u5bb6\u5c45",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/29\/sjb_headphoto_2843629.jpg?1429687154",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/05\/20160405100453-7c144323.jpg",
                "img_url_s": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/05\/20160405100453-7c144323-th.jpg",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/05\/20160405100453-7c144323-me.jpg",
                "height": "1100",
                "width": "728",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "1",
                "min_price": "40",
                "max_price": "150",
                "ident": "1",
                "uploadtype": "0",
                "city": "\u5e38\u5dde",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2231023",
                "name": "\u73b0\u4ee3\u65f6\u5c1a\u69bb\u69bb\u7c73\u8bbe\u8ba1",
                "collectionComment": "",
                "added_by": "2843629",
                "rank": 10,
                "indentityCN": "sjs",
                "NICK": "\u4e00\u7c73\u5bb6\u5c45",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/29\/sjb_headphoto_2843629.jpg?1429687154",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/05\/20160405100447-4d36929b.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/05\/20160405100447-4d36929b-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/05\/20160405100447-4d36929b-me.jpg",
                "height": "1100",
                "width": "713",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "1",
                "min_price": "40",
                "max_price": "150",
                "ident": "1",
                "uploadtype": "0",
                "city": "\u5e38\u5dde",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2227693",
                "name": "\u7f8e\u5f0f\u98ce\u60c5\u82b1\u56ed\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650327",
                "rank": 11,
                "indentityCN": "yz",
                "NICK": "\u8bb8\u534e\u6e05",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/27\/headphoto_650327.jpg?1378092448",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/31\/20160331173250-eae6d4b3.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/31\/20160331173250-eae6d4b3-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/31\/20160331173250-eae6d4b3-me.jpg",
                "height": "733",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2227660",
                "name": "\u4e1c\u5357\u4e9a\u98ce\u60c5\u53a8\u623f\u5bb6\u88c5\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650324",
                "rank": 12,
                "indentityCN": "yz",
                "NICK": "\u6731\u534e\u8f89",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/24\/headphoto_650324.jpg?1378092238",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/31\/20160331173057-960ee8a8.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/31\/20160331173057-960ee8a8-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/31\/20160331173057-960ee8a8-me.jpg",
                "height": "660",
                "width": "990",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2226122",
                "name": "\u6b27\u5f0f\u697c\u68af\u8bbe\u8ba1 \u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650242",
                "rank": 13,
                "indentityCN": "yz",
                "NICK": "\u5085\u5f18\u6587",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/143.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/30\/20160330170915-09f84bda.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/30\/20160330170915-09f84bda-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/30\/20160330170915-09f84bda-me.jpg",
                "height": "990",
                "width": "660",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2226121",
                "name": "\u4e2d\u5f0f\u539f\u6728\u98ce\u683c\u697c\u68af\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650242",
                "rank": 14,
                "indentityCN": "yz",
                "NICK": "\u5085\u5f18\u6587",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/143.jpg",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/30\/20160330170914-253bc49c.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/30\/20160330170914-253bc49c-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/30\/20160330170914-253bc49c-me.jpg",
                "height": "1100",
                "width": "730",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2226103",
                "name": "\u73b0\u4ee3\u65f6\u5c1a\u7a97\u53f0\u8bbe\u8ba1 \u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650243",
                "rank": 15,
                "indentityCN": "yz",
                "NICK": "\u9f50\u5f18\u65b0",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/43\/headphoto_650243.jpg?1403344089",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/30\/20160330170749-0a09d935.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/30\/20160330170749-0a09d935-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/30\/20160330170749-0a09d935-me.jpg",
                "height": "1100",
                "width": "799",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2226102",
                "name": "\u4e2d\u5f0f\u53e4\u6728\u7a97\u53f0\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650243",
                "rank": 16,
                "indentityCN": "yz",
                "NICK": "\u9f50\u5f18\u65b0",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/43\/headphoto_650243.jpg?1403344089",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/30\/20160330170747-4bb6fd64.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/30\/20160330170747-4bb6fd64-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/30\/20160330170747-4bb6fd64-me.jpg",
                "height": "733",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2226026",
                "name": "\u539f\u6728\u98ce\u683c\u8bbe\u8ba1\u8fc7\u9053\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650247",
                "rank": 17,
                "indentityCN": "yz",
                "NICK": "\u6ca1\u94b1\u88c5\u4fee\u623f",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/47\/headphoto_650247.jpg?1403344947",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/30\/20160330170259-1856109c.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/30\/20160330170259-1856109c-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/30\/20160330170259-1856109c-me.jpg",
                "height": "1100",
                "width": "894",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2226025",
                "name": "\u73b0\u4ee3\u98ce\u683c\u8fc7\u9053\u8bbe\u8ba1 \u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650247",
                "rank": 18,
                "indentityCN": "yz",
                "NICK": "\u6ca1\u94b1\u88c5\u4fee\u623f",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/47\/headphoto_650247.jpg?1403344947",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/30\/20160330170258-764ed429.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/30\/20160330170258-764ed429-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/30\/20160330170258-764ed429-me.jpg",
                "height": "733",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2225898",
                "name": "\u73b0\u4ee3\u7b80\u7ea6\u4e66\u623f \u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650248",
                "rank": 19,
                "indentityCN": "yz",
                "NICK": "\u535c\u76ca\u7cd6\u679c",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/48\/headphoto_650248.jpg?1403345132",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/30\/20160330162801-3053a2fb.jpg",
                "img_url_s": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/30\/20160330162801-3053a2fb-th.jpg",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/30\/20160330162801-3053a2fb-me.jpg",
                "height": "741",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2225897",
                "name": "\u73b0\u4ee3\u65f6\u5c1a\u98ce\u683c\u4e66\u623f\u6548\u679c\u56fe\u5927\u5168",
                "collectionComment": "",
                "added_by": "650248",
                "rank": 20,
                "indentityCN": "yz",
                "NICK": "\u535c\u76ca\u7cd6\u679c",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/48\/headphoto_650248.jpg?1403345132",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/30\/20160330162759-171e04e2.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/30\/20160330162759-171e04e2-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/30\/20160330162759-171e04e2-me.jpg",
                "height": "837",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2224708",
                "name": "\u6df7\u642d\u98ce\u683c\u53a8\u623f\u8bbe\u8ba1 \u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "2170387",
                "rank": 21,
                "indentityCN": "sjs",
                "NICK": "\u9673\u525b",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/87\/sjb_headphoto_2170387.jpg?1423982497",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/29\/20160329230841-97d3e3e0.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/29\/20160329230841-97d3e3e0-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/29\/20160329230841-97d3e3e0-me.jpg",
                "height": "1100",
                "width": "733",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "4",
                "min_price": "200",
                "max_price": "400",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u6e29\u5dde",
                "shen": "\u6d59\u6c5f"
              },
              {
                "id": "2224471",
                "name": "\u6df7\u642d\u4f11\u95f2\u533a \u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "2090485",
                "rank": 22,
                "indentityCN": "sjs",
                "NICK": "\u5c1a\u5c42\u88c5\u9970\u5317\u4eac\u6709\u9650\u516c\u53f8",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/85\/sjb_headphoto_2090485.jpg?1458283140",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/29\/20160329174553-5cf0d382.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/29\/20160329174553-5cf0d382-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/29\/20160329174553-5cf0d382-me.jpg",
                "height": "976",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": "5",
                "apply_status": "4",
                "min_price": "120",
                "max_price": "480",
                "ident": "1",
                "uploadtype": "0",
                "city": "\u5317\u4eac",
                "shen": "\u5317\u4eac"
              },
              {
                "id": "2224112",
                "name": "\u7f8e\u5f0f\u53e4\u96c5\u536b\u6d74\u8bbe\u8ba1\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "886377",
                "rank": 23,
                "indentityCN": "sjs",
                "NICK": "\u5468\u6653\u5b89",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/77\/sjb_headphoto_886377.jpg?1457773119",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/29\/20160329134247-04e60a0f.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/29\/20160329134247-04e60a0f-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/29\/20160329134247-04e60a0f-me.jpg",
                "height": "1100",
                "width": "729",
                "extensionnum": "9999",
                "goodlevel": "5",
                "apply_status": "4",
                "min_price": "100",
                "max_price": "300",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u82cf\u5dde",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2223116",
                "name": "\u73b0\u4ee3\u4e2d\u5f0f\u539f\u6728\u8bbe\u8ba1\u9910\u5385\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "617218",
                "rank": 24,
                "indentityCN": "sjs",
                "NICK": "\u5c3a\u5b50\u8bbe\u8ba1\u56e2\u961f",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/18\/sjb_headphoto_617218.jpg?1436780738",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/28\/20160328153156-d126bed5.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/28\/20160328153156-d126bed5-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/28\/20160328153156-d126bed5-me.jpg",
                "height": "1100",
                "width": "734",
                "extensionnum": "9999",
                "goodlevel": "4",
                "apply_status": "4",
                "min_price": "300",
                "max_price": "800",
                "ident": "1",
                "uploadtype": "0",
                "city": "\u6df1\u5733",
                "shen": "\u5e7f\u4e1c"
              },
              {
                "id": "2222599",
                "name": "\u4e2d\u5f0f\u65f6\u5c1a\u5ba2\u5385",
                "collectionComment": "",
                "added_by": "650236",
                "rank": 25,
                "indentityCN": "yz",
                "NICK": "\u5b59\u5c0f\u96c5",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/36\/headphoto_650236.jpg?1403345244",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/28\/20160328101516-e2990aba.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/28\/20160328101516-e2990aba-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/28\/20160328101516-e2990aba-me.jpg",
                "height": "667",
                "width": "1000",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2222576",
                "name": "\u4e2d\u5f0f\u53e4\u5178\u8bbe\u8ba1\u5ba2\u5385",
                "collectionComment": "",
                "added_by": "650237",
                "rank": 26,
                "indentityCN": "yz",
                "NICK": "\u9f99\u54e5",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/37\/headphoto_650237.jpg?1403345398",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/28\/20160328101341-f73549f1.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/28\/20160328101341-f73549f1-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/28\/20160328101341-f73549f1-me.jpg",
                "height": "685",
                "width": "1024",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2222262",
                "name": "\u7f8e\u5f0f\u98ce\u683c\u9910\u5385\u8bbe\u8ba1\u6548\u679c\u56fe\u5957",
                "collectionComment": "",
                "added_by": "2090485",
                "rank": 27,
                "indentityCN": "sjs",
                "NICK": "\u5c1a\u5c42\u88c5\u9970\u5317\u4eac\u6709\u9650\u516c\u53f8",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/85\/sjb_headphoto_2090485.jpg?1458283140",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/27\/20160327161855-5aba2bf9.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/27\/20160327161855-5aba2bf9-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/27\/20160327161855-5aba2bf9-me.jpg",
                "height": "1100",
                "width": "733",
                "extensionnum": "9999",
                "goodlevel": "5",
                "apply_status": "4",
                "min_price": "120",
                "max_price": "480",
                "ident": "1",
                "uploadtype": "0",
                "city": "\u5317\u4eac",
                "shen": "\u5317\u4eac"
              },
              {
                "id": "2222250",
                "name": "\u7f8e\u5f0f\u53e4\u97f5\u8bbe\u8ba1\u5367\u5ba4\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "2090485",
                "rank": 28,
                "indentityCN": "sjs",
                "NICK": "\u5c1a\u5c42\u88c5\u9970\u5317\u4eac\u6709\u9650\u516c\u53f8",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/85\/sjb_headphoto_2090485.jpg?1458283140",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/27\/20160327160431-32ef7a13.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/27\/20160327160431-32ef7a13-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/27\/20160327160431-32ef7a13-me.jpg",
                "height": "733",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": "5",
                "apply_status": "4",
                "min_price": "120",
                "max_price": "480",
                "ident": "1",
                "uploadtype": "0",
                "city": "\u5317\u4eac",
                "shen": "\u5317\u4eac"
              },
              {
                "id": "2222224",
                "name": "\u7f8e\u5f0f\u7c89\u7ea2\u4f73\u4eba\u8bbe\u8ba1\u513f\u7ae5\u623f\u6548\u679c\u56fe",
                "collectionComment": "\u5357\u4eac\u522b\u5885\u88c5\u4fee",
                "added_by": "594482",
                "rank": 29,
                "indentityCN": "sjs",
                "NICK": "DoLong\u8bbe\u8ba1",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/82\/headphoto_594482.jpg?1378092309",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/27\/20160327155127-043d8c44.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/27\/20160327155127-043d8c44-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/27\/20160327155127-043d8c44-me.jpg",
                "height": "693",
                "width": "1000",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "1",
                "min_price": "80",
                "max_price": "500",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u5357\u4eac",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2222222",
                "name": "\u7f8e\u5f0f\u6e05\u96c5\u8bbe\u8ba1\u5367\u5ba4\u6548\u679c\u56fe",
                "collectionComment": "\u5357\u4eac\u522b\u5885\u88c5\u4fee",
                "added_by": "594482",
                "rank": 30,
                "indentityCN": "sjs",
                "NICK": "DoLong\u8bbe\u8ba1",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/82\/headphoto_594482.jpg?1378092309",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/27\/20160327155125-023680d4.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/27\/20160327155125-023680d4-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/27\/20160327155125-023680d4-me.jpg",
                "height": "649",
                "width": "1000",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "1",
                "min_price": "80",
                "max_price": "500",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u5357\u4eac",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2222215",
                "name": "\u7f8e\u5f0f\u6e05\u96c5\u8bbe\u8ba1\u5ba2\u5385\u6548\u679c\u56fe",
                "collectionComment": "\u5357\u4eac\u522b\u5885\u88c5\u4fee",
                "added_by": "594482",
                "rank": 31,
                "indentityCN": "sjs",
                "NICK": "DoLong\u8bbe\u8ba1",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/82\/headphoto_594482.jpg?1378092309",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/27\/20160327155117-394171ec.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/27\/20160327155117-394171ec-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/27\/20160327155117-394171ec-me.jpg",
                "height": "671",
                "width": "1000",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "1",
                "min_price": "80",
                "max_price": "500",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u5357\u4eac",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2222091",
                "name": "\u7f8e\u5f0f\u53e4\u97f5\u8bbe\u8ba1\u5ba2\u5385\u7535\u89c6\u80cc\u666f\u5899\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "5712993",
                "rank": 32,
                "indentityCN": "sjs",
                "NICK": "\u4f1a\u7b51\u7a7a\u95f4\u8bbe\u8ba1",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/93\/sjb_headphoto_5712993.jpg?1457076823",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/27\/20160327133924-4c6580d3.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/27\/20160327133924-4c6580d3-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/27\/20160327133924-4c6580d3-me.jpg",
                "height": "600",
                "width": "900",
                "extensionnum": "9999",
                "goodlevel": "0",
                "apply_status": "4",
                "min_price": "100",
                "max_price": "180",
                "ident": "1",
                "uploadtype": "0",
                "city": "\u5357\u4eac",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2221482",
                "name": "\u73b0\u4ee3\u6d01\u51c0\u8bbe\u8ba1\u513f\u7ae5\u623f\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650246",
                "rank": 33,
                "indentityCN": "yz",
                "NICK": "\u4e1a\u4f59\u91d1\u8bbe\u8ba1",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/46\/headphoto_650246.jpg?1403344795",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/03\/26\/20160326171954-f0730b5a.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/26\/20160326171954-f0730b5a-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/03\/26\/20160326171954-f0730b5a-me.jpg",
                "height": "660",
                "width": "990",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "\u5e02\/\u5730\u533a",
                "shen": "\u7701\/\u5e02",
                "oid": "0"
              },
              {
                "id": "2221146",
                "name": "500\u33a1\u6df7\u642d\u98ce\u536b\u751f\u95f4\u88c5\u4fee\u56fe\u7247",
                "collectionComment": "",
                "added_by": "5688060",
                "rank": 34,
                "indentityCN": "sjs",
                "NICK": "\u9e3f\u9e44\u8bbe\u8ba1",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/60\/sjb_headphoto_5688060.jpg?1452913496",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/26\/20160326145204-3e218583.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/26\/20160326145204-3e218583-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/26\/20160326145204-3e218583-me.jpg",
                "height": "1100",
                "width": "751",
                "extensionnum": "9999",
                "goodlevel": "5",
                "apply_status": "4",
                "min_price": "50",
                "max_price": "300",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u5e38\u5dde",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2221120",
                "name": "500\u33a1\u6df7\u642d\u98ce\u4f11\u95f2\u533a\u8bbe\u8ba1\u6b23\u8d4f",
                "collectionComment": "",
                "added_by": "5688060",
                "rank": 35,
                "indentityCN": "sjs",
                "NICK": "\u9e3f\u9e44\u8bbe\u8ba1",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/60\/sjb_headphoto_5688060.jpg?1452913496",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/03\/26\/20160326145002-1fc8b620.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/03\/26\/20160326145002-1fc8b620-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/03\/26\/20160326145002-1fc8b620-me.jpg",
                "height": "1100",
                "width": "842",
                "extensionnum": "9999",
                "goodlevel": "5",
                "apply_status": "4",
                "min_price": "50",
                "max_price": "300",
                "ident": "0",
                "uploadtype": "0",
                "city": "\u5e38\u5dde",
                "shen": "\u6c5f\u82cf"
              },
              {
                "id": "2238303",
                "name": "loft\u98ce\u683c\u8863\u5e3d\u95f4\u8bbe\u8ba1\u88c5\u4fee",
                "collectionComment": "",
                "added_by": "650398",
                "rank": 36,
                "indentityCN": "yz",
                "NICK": "\u5c39\u5947\u5e0c",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/149.jpg",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/04\/09\/20160409153031-afcec55e.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/09\/20160409153031-afcec55e-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/04\/09\/20160409153031-afcec55e-me.jpg",
                "height": "1100",
                "width": "779",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2238257",
                "name": "\u7b80\u7ea6loft\u9633\u53f0\u88c5\u4fee\u8bbe\u8ba1\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650398",
                "rank": 37,
                "indentityCN": "yz",
                "NICK": "\u5c39\u5947\u5e0c",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/149.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/09\/20160409152948-1390d2b9.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/09\/20160409152948-1390d2b9-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/09\/20160409152948-1390d2b9-me.jpg",
                "height": "761",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2237570",
                "name": "\u7b80\u7ea6\u513f\u7ae5\u623f\u88c5\u4fee\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650511",
                "rank": 38,
                "indentityCN": "yz",
                "NICK": "\u4fde\u741b\u745e",
                "sHeadPhoto": "http:\/\/img.shejiben.com\/headphoto\/112.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/09\/20160409104340-3d7055da.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/09\/20160409104340-3d7055da-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/09\/20160409104340-3d7055da-me.jpg",
                "height": "595",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2237496",
                "name": "\u73b0\u4ee3\u5427\u53f0\u88c5\u4fee\u56fe\u96c6",
                "collectionComment": "",
                "added_by": "650511",
                "rank": 39,
                "indentityCN": "yz",
                "NICK": "\u4fde\u741b\u745e",
                "sHeadPhoto": "http:\/\/img.shejiben.com\/headphoto\/112.jpg",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/04\/09\/20160409103806-4da09c0d.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/09\/20160409103806-4da09c0d-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/04\/09\/20160409103806-4da09c0d-me.jpg",
                "height": "610",
                "width": "900",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2237495",
                "name": "\u5730\u4e2d\u6d77\u98ce\u5427\u53f0\u88c5\u4fee\u56fe\u96c6",
                "collectionComment": "",
                "added_by": "650511",
                "rank": 40,
                "indentityCN": "yz",
                "NICK": "\u4fde\u741b\u745e",
                "sHeadPhoto": "http:\/\/img.shejiben.com\/headphoto\/112.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/09\/20160409103805-c7015684.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/09\/20160409103805-c7015684-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/09\/20160409103805-c7015684-me.jpg",
                "height": "745",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2237208",
                "name": "loft\u98ce\u683c\u4e66\u67b6\u88c5\u4fee\u8bbe\u8ba1\u56fe\u7247",
                "collectionComment": "",
                "added_by": "650916",
                "rank": 41,
                "indentityCN": "yz",
                "NICK": "\u5b54\u840d\u97f5",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/16\/headphoto_650916.jpg?1401068991",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/08\/20160408185341-00b0bdab.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408185341-00b0bdab-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/08\/20160408185341-00b0bdab-me.jpg",
                "height": "1100",
                "width": "779",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2237203",
                "name": "loft\u9694\u65ad\u8bbe\u8ba1\u6548\u679c\u56fe",
                "collectionComment": "",
                "added_by": "650916",
                "rank": 42,
                "indentityCN": "yz",
                "NICK": "\u5b54\u840d\u97f5",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/16\/headphoto_650916.jpg?1401068991",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/08\/20160408185337-cabe8902.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408185337-cabe8902-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/08\/20160408185337-cabe8902-me.jpg",
                "height": "669",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2237202",
                "name": "\u7b80\u7ea6loft\u5de5\u4e1a\u98ce\u683c\u9694\u65ad\u8bbe\u8ba1",
                "collectionComment": "",
                "added_by": "650913",
                "rank": 43,
                "indentityCN": "yz",
                "NICK": "\u5415\u5e73\u96c5",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/13\/headphoto_650913.jpg?1401068940",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/04\/08\/20160408185336-f98acf20.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408185336-f98acf20-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/04\/08\/20160408185336-f98acf20-me.jpg",
                "height": "669",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2237109",
                "name": "loft\u9732\u53f0\u88c5\u4fee\u56fe\u7247",
                "collectionComment": "",
                "added_by": "650398",
                "rank": 44,
                "indentityCN": "yz",
                "NICK": "\u5c39\u5947\u5e0c",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/149.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/08\/20160408185215-4104e38a.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408185215-4104e38a-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/08\/20160408185215-4104e38a-me.jpg",
                "height": "733",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2236181",
                "name": "LOFT\u98ce\u683c\u80cc\u666f\u5899\u88c5\u4fee\u56fe\u7247\u5927\u5168",
                "collectionComment": "",
                "added_by": "650398",
                "rank": 45,
                "indentityCN": "yz",
                "NICK": "\u5c39\u5947\u5e0c",
                "sHeadPhoto": "http:\/\/www.shejiben.com\/img\/headphoto\/149.jpg",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/08\/20160408113647-07506b37.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408113647-07506b37-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/08\/20160408113647-07506b37-me.jpg",
                "height": "650",
                "width": "975",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2236166",
                "name": "loft\u98ce\u683c\u80cc\u666f\u5899\u88c5\u4fee\u56fe\u7247\u6b23\u8d4f",
                "collectionComment": "",
                "added_by": "650929",
                "rank": 46,
                "indentityCN": "yz",
                "NICK": "\u6c34\u73ca\u73ca",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/29\/headphoto_650929.jpg?1401330640",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/08\/20160408113632-1d21644b.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408113632-1d21644b-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/08\/20160408113632-1d21644b-me.jpg",
                "height": "1100",
                "width": "733",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2236099",
                "name": "loft\u540a\u9876\u8bbe\u8ba1",
                "collectionComment": "",
                "added_by": "650921",
                "rank": 47,
                "indentityCN": "yz",
                "NICK": "\u9b4f\u4e09\u59d7",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/21\/headphoto_650921.jpg?1401068659",
                "img_url": "http:\/\/pic.shejiben.com\/case\/2016\/04\/08\/20160408113523-d8bf8da0.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408113523-d8bf8da0-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic.shejiben.com\/i\/upload\/2016\/04\/08\/20160408113523-d8bf8da0-me.jpg",
                "height": "733",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              },
              {
                "id": "2236084",
                "name": "loft\u5bb6\u5c45\u540a\u9876\u88c5\u4fee",
                "collectionComment": "",
                "added_by": "650922",
                "rank": 48,
                "indentityCN": "yz",
                "NICK": "\u9676\u4e09\u8bd7",
                "sHeadPhoto": "http:\/\/pic.shejiben.com\/user\/22\/headphoto_650922.jpg?1401068857",
                "img_url": "http:\/\/pic1.shejiben.com\/case\/2016\/04\/08\/20160408113509-d32cbd16.jpg",
                "img_url_s": "http:\/\/www.shejiben.com\/piwigo\/i.php?\/upload\/2016\/04\/08\/20160408113509-d32cbd16-th.jpg&ajaxload=true&i=1",
                "img_url_show": "http:\/\/pic1.shejiben.com\/i\/upload\/2016\/04\/08\/20160408113509-d32cbd16-me.jpg",
                "height": "825",
                "width": "1100",
                "extensionnum": "9999",
                "goodlevel": null,
                "apply_status": null,
                "min_price": null,
                "max_price": null,
                "ident": null,
                "uploadtype": "1",
                "city": "",
                "shen": "",
                "oid": "0"
              }]
            };
          }
          var requireUrl = window.location.href;
        </script>
        <script type="text/javascript">
          seajs.use('${base}/resources/pc/js/photocase_new.js');
          seajs.use('common', function(SJB) {
	        //SJB.commonBottomZb.init();
	      });
        </script>
      </div>
    </div>
    <p class="clear">
    </p>
    <bgsound src="" autostart=true loop=2 id='bgmusic'>
      <div id='messagebox'></div>
      <div id="small_window">
      </div>
      <div style="display: none" id="bd_statistics">
        <script type="text/javascript">
          seajs.use('common',
           function(SJB) {
             SJB.commonSubToolBar.init();
           })
        </script>
      </div>
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
      <!--版权等 End-->
  </body>

</html>