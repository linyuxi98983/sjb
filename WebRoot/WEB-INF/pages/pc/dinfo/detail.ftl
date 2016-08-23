<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>百爪鱼--行业咨询</title>
<meta name="description" content=""/>
<#include "/WEB-INF/ftl/pc/header.ftl"/>
    <#include "/WEB-INF/ftl/pc/pager.ftl"/>
<link href="${base}/resources/pc/css${base}_hy.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/pc/css/header_menu.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/pagination.css"/>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>  
    <script type="text/javascript">
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    </script>
<script type="text/javascript" src="${base}/resources/pc/js/sea.js"></script>
 <script>var jq = jQuery.noConflict();</script>
<script type="text/javascript">
  	var pathName = window.document.location.pathname;
 	var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
</script>
<script type="text/javascript">
     seajs.config({
        alias : {
             'jquery': '${base}/resources/pc/js/jquery_module.js',
          'jq':'${base}/resources/pc/js/jquery.min.js',
          'list':'${base}/resources/pc/js/list.js',
          'plug':'${base}/resources/pc/js/plugin.js',
            'common': path+'/html/pc/js/main.js',
            'form': path+'/html/pc/js/module.form.js',
            'ui': path+'/html/pc/js/module.ui.js',
            'colorbox': path+'/html/pc/js/jquery.colorbox.min.js',
            'newHeader': path+'/html/pc/js/userCenter.js'
        },
        preload: ['jquery','jq','list', 'common'] //预加载jquery和main.js
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
             data: jq("#newsForm").serialize(),
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
    /*内页是窄版*/
    .index_logo,.top_menu{width:990px;}
    .index_logo #search_case{margin-left: 100px !important;}
</style>
<body style="position: relative;">
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
        <a href="${base}/pc/index.action" title="美国知名风险投资机构投资的设计交易平台 - 百爪鱼">
          <div class="web-logo"></div>
        </a>
        <div id="search_case">
          <form id="quicksearch" method="get" action="" target="_blank">
            <input type="hidden" name="searchType" value="7" id="searchType"/>
            <span id="search_span">
              <div id="search_title">找设计师</div>
              <em class="arrow"></em>
              <label id="s_zsj" style="display: none;">
	              <a class="search_tags clickToSearch" href="javascript:;" data-id="2">找图集</a>
	              <a class="search_tags clickToSearch" href="javascript:;" data-id="10">找案例</a>
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
          <li>
            <a href="${base}/pc/designer/designer!index.action">
              找设计师
            </a>
          </li>
          <li class="cur">
            <a href="${base}/pc/dinfo/dinfo!list.action">行业咨询</a>
          </li>
        </ul>
        <!--整站主导航 End-->
        <!--首页面包屑导航-->
        <!--首页面包屑导航 end-->
      </div>
    </div>
	<!--主导航-->
<div class="dmato"></div><div class="content_width" id="content">
<div class="content_width ">
<script type="text/javascript">
var token = "0";
var appid = "0";
var openid = "0";
var token_weibo = "0";
seajs.use(['newHeader','common'], function( Header,common) {
    $(document).ready(function() {
        Header.init();
        common.initHeader();
        $('#quicksearch .submit').click(function(){
          return common.checkSearchForm();
        });
    });
    var searchType = "";
    var arr=new Array("1","2",'10','7','9','3');
    var urlArr=new Array({'1':[{0:"http://www.shejiben.com/search.php",1:"q",2:"搜索图片的关键词，如：儿童房",3:"找图片　　"}],'2':[{0:"http://www.shejiben.com/search.php",1:"q",2:"搜索灵感图集",3:"找图集"}],'10':[{0:"http://www.shejiben.com/search.php",1:"q",2:"搜索案例",3:"找案例"}],'7':[{0:"http://www.shejiben.com/search.php",1:"q",2:"搜索设计师",3:"找设计师"}],'9':[{0:"http://www.shejiben.com/search.php",1:"q",2:"搜索问答",3:"找问答"}],'3':[{0:"http://www.shejiben.com/search.php",1:"q",2:"搜索模型",3:"找模型　"}]});
    common.searchFun(searchType, arr, urlArr);
    common.searchBannerEvent(arr, urlArr);
});
</script>
<style type="text/css">
/*内页是窄版*/
.index_logo,.top_menu{width:990px;}
.index_logo #search_case{margin-left: 100px !important;}
</style>
<link href="${base}/resources/pc/css/sj_style_new.css" rel="stylesheet" type="text/css"/>
<div class="clear"></div>
<div class="destoleft">
	<div class="descon">
		<ul>
			
				<li>
				<p class="ptitle"><span class="pspan"></span><label><strong><a href="http://www.shejiben.com/n2766.html">${entity.title!}</a></strong></label></p>
				<p class="dmsg">${entity.preview!}</p>
				<p class="content">${entity.html!}</p>
				</li>
				
			 
		</ul> 
	</div> 
	
</div>
<div class="destoright">
	<form action="#" id="newsForm" name="newsForm" method="post" class="sub_zb_form">
		<div class="input_form">
			<p class="input_form_header">申请定制设计</p>
			<p class="total">快速发布需求&nbsp;找到专属设计</p>
			<div class="box">
				<label class="default_value">您的称呼</label>
				<input class="input_txt" name="entity.nickname" id="nickname" type="text">
				<label class="msg"><em></em><p></p></label>
			</div>
			<div class="box">
				<label class="default_value">手机号码</label>
				<input class="input_txt" name="entity.phoneNo" id="phoneNo" type="text">
				<label class="msg"><em></em><p></p></label>
			</div>
			<div class="box box_l">
			  <input type="hidden" id="entity_area" name="entity.areaZone" name="entity_area" value=""/>
				<select class="select_l" name="User_Shen" id="User_Shen"><option value="">省/市</option><option value="安徽">安徽</option><option value="北京">北京</option><option value="重庆">重庆</option><option value="福建">福建</option><option value="广西">广西</option><option value="贵州">贵州</option><option value="广东">广东</option><option value="甘肃">甘肃</option><option value="海南">海南</option><option value="湖北">湖北</option><option value="黑龙江">黑龙江</option><option value="河南">河南</option><option value="河北">河北</option><option value="湖南">湖南</option><option value="江苏">江苏</option><option value="吉林">吉林</option><option value="江西">江西</option><option value="辽宁">辽宁</option><option value="内蒙古">内蒙古</option><option value="宁夏">宁夏</option><option value="澳门">澳门</option><option value="青海">青海</option><option value="四川">四川</option><option value="陕西">陕西</option><option value="上海">上海</option><option value="山东">山东</option><option value="山西">山西</option><option value="台湾">台湾</option><option value="天津">天津</option><option value="西藏">西藏</option><option value="香港">香港</option><option value="新疆">新疆</option><option value="云南">云南</option><option value="浙江">浙江</option></select>
				<label class="msg"><em></em><p></p></label>
			</div> 
			<div class="box box_r">   
				<select class="select_r" name="User_City" id="User_City"><option value="">市/地区</option></select>
				<label class="msg"><em></em><p></p></label>
				<input type="hidden" id="User_Town" name="User_Town" value="">
			</div>
			<div class="clear"></div>
			<div class="box">
				<input type="button" class="smbmit_btn" id="newsBtn" name="subs" value="立即提交"  onclick="clickFun()" >
			</div>
			<label id="erro_msg"><em></em><p></p></label>
		</div>
	</form>
</div>
	<script type="text/javascript">
	seajs.use('http://stc.shejiben.com/gb_js/zt/check_form.js?20160427');
	seajs.use(['common','http://stc.shejiben.com/gb_js/GlobalProvinces_module.js?20150911'],function(SJB,province){
	    province({
	        elems : ['#User_Shen' , '#User_City' ],
	        placeHolders: ['省/市', '市/地区']
	    });
	    SJB.subZbForm.init($('#newsBtn'),119);
	
	    $('#newsBtn').click(function() {   //资讯页
		    //百度统计函数
		    try{
		        _hmt && _hmt.push(['_trackEvent', 'newstj', 'newstj1', '7_3']);
		    }catch(e){
	
		    }
		}); 
	}); 
	</script>
</div>
</div>
	<p class="clear"></p>  
	<bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
	<div id="messagebox"></div>
		<script type="text/javascript">
		//短信提示使用(asilas添加) 
		var divTop,divLeft,divWidth,divHeight,docHeight,docWidth,objTimer,i = 0;
		//鼠标悬浮在用户头像或者名称上面时显示用户信息
		</script>
	<div id="small_window"></div>
		<script type="text/javascript">
		seajs.use( 'common', function( SJB ) {
			SJB.initFooter();
			SJB.updateNavigate();
			SJB.placeHolder();	
		    var noChange = $('#stopChangeNavi');
		    if ( !noChange.length ) {
		        $( document ).scroll( function() {
		            SJB.updateNavigateOnScroll();
		        } );
		    }
		} );
		</script>
	</div>
	<p class="cl"></p>
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
</body>
</html>