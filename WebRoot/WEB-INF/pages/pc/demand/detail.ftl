<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>设计单详情-百爪鱼</title>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css"/>
       <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>   
    <script type="text/javascript" src="${base}/resources/pc/js/loginValidate.js"></script>   
    
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
		    //申请接单
		    function applyOrder(){
		    	$.ajax({
		    		url:"${base}/pc/demand/demand!apply.action?id=${entity.id}",
		    		method:"get",
		    		dataType:"json",
		    		success:function(data){
		    			if(data.success){
		    				alert(data.msg);
		    			}else{
		    				alert(data.msg);
		    			}
		    		},
		    		error:function(){
		    			alert("请求出错");
		    		}
		    	});
		    }
		    
		   $(function(){
		    
		    	//apply_demand();
		    	//alert("111111");
		    });
		    
		    function apply_demand(){
		    	alert("111111");
		    }
        </script>
    </head>
    <body>
        <!--头部广告位-->
        <!--头部开始-->
        <div class="header">
            <div class="hea_top">
                <div class="hea_top_right">
                    <ul class="tp_node">
                        <li style="width:90px;" id="nav_login">
                            <span id="userName" class="name">
                                <a href="" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}" rel="1" hidefocus="">
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
                                    <em class="downAdrrow"></em>
                                </a>
                                <div class="caozuo" id="caozuo" style="display:none;" onmouseover="$('bg').rel=2;" onmouseout="$('bg').rel=1;">
                                    <div class="redArrow"></div>
                                    <ul class="cz">
                                        <li>
                                            <#if member.memberType==0>
                    		 <a href="${base}/pc/mb/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">个人中心<a>
                    	<#elseif member.memberType==1>
                    		<a href="${base}/pc/ds/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">个人中心</a>
                    	<#elseif member.memberType==2>
                    		<a href="${base}/pc/org/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">个人中心 </a>
                    	<#else>                    	         	
                    	</#if>
                                        </li>
                                        <li>
                                            <a href="/sjb/pc/designer/designer!personal.action" class="my_index_ad">我的主页</a>
                                        </li>
                                        <li>
                                            <a href="designer-works.html" class="bj">我的作品</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">账号设置</a>
                                        </li>
                                        <li>
                                            <a href="" class="tc">退出</a>
                                        </li>
                                    </ul>
                                </div>
                            </span>
                        </li>
                        <li class="po">|</li>
                        <!-- 申请定制设计 -->
                        <li class="dzsj"><a target="_blank">申请定制设计</a></li>
                        <li class="po">|</li>
                       
                        <li class="po">|</li>
                        <!--设计师中心 -->
                        <li class="cur" style="width:92px;">
                            <a href="javascript:;">设计师中心<span class="jt"></span></a>
                            <div class="sj_center" style="display:none;">
                                <ul>
                                    <li>
                                        <a href="${base}/pc/designer/designer!home.action">接单大厅</a>
                                    </li>
                                   
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 个人中心主导航-->
        <div class="sjs_nav">
            <div class="banner_cont">
                <div class="ban_cont_left">
                    <a href="${base}/pc/index.action"><div class="logo"></div></a>
                    <span>设计师中心</span>
                </div>
                <div class="ban_cont_right">
                    <ul>
                        <li>
                            <#if member.memberType==0>
                    		 <a href="${base}/pc/mb/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">个人中心<a>
                    	<#elseif member.memberType==1>
                    		<a href="${base}/pc/ds/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">个人中心</a>
                    	<#elseif member.memberType==2>
                    		<a href="${base}/pc/org/index.action" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}"
                  rel="1" hidefocus="">个人中心 </a>
                    	<#else>                    	         	
                    	</#if>
                        </li>
                        <li>
                            <a href="designer-index.html" target="_blank">我的主页</a>
                        </li>
                        <li class="cur">
                            <a href="${base}/pc/designer/designer!home.action">接单大厅</a>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </div>
        <!--头部结束-->
        <div class="dmato">
        </div>
        <div class="content_width" id="content">
            <div class="content_width ">
                <script type="text/javascript">
                    seajs.use(['newHeader', 'common'],
                    function(Header, common) {
                        $(document).ready(function() {
                            Header.init();
                            common.initHeader();
                        });
                    });
                </script>
                <link href="${base}/resources/pc/css/userCenter.css" rel="stylesheet" type="text/css"/>
                <div class="content order_lobby">
                    <div class="project_msg">
                        <div class="_msg_info">
                            <div style="margin: 25px 30px 0px 30px;overflow: hidden;border-bottom: 1px dotted #EDECED;">
                                <div class="proj_name">
                                    <h2 style="color: #333;font-family: 'Microsoft YaHei' ! important;font-size: 24px;font-weight: normal;">${entity.title!}</h2>
                                    <div style="color: #666;margin-top: 5px;margin-bottom: 5px;">
                                        
                                    </div>
                                </div>
                                <div class="btne apply_for" style="margin-top: 21px;">
                                <!--
                                <input type="button" onclick="applyOrder()" class="btn_click" id="btn_click" value="申请接单"/>
                                -->
                                </div>
                            </div>
                            <div class="proj_massages" style="margin-top:15px;padding-bottom: 20px;">
                                <div class="_massa">
                                    <div>
                                        <label>项目地点：</label>${entity.areaZone!}
                                    </div>
                                    <div>
                                        <label>需求风格：</label>${entity.projectType!}
                                    </div>
                                    <div>
                                        <label>项目规模：</label>
                                        <em>${entity.areaSqm}</em>m
                                        <sup>2<sup></sup></sup>
                                    </div>
                                    <div>
                                        <label>设计预算：</label>
                                        <em>${entity.budgetName!0}元</em>
                                    </div>
                                    <div><label>业主姓名：</label>${entity.nickname}</div>
                                </div>
                                <div class="btn apply_end"></div>
                            </div>
                            <div class="proj_devise">
                                <div style="margin-bottom: 20px;color: #333;">设计要求</div>
                                <div style="line-height: 24px;color: #666;">${entity.requirement!}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="dialog_bg" style="display: none;"></div>
        </div>
        <p class="clear"></p>
        <bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
        <div id="messagebox"></div>
        <script type="text/javascript">
            //短信提示使用(asilas添加) 
            var divTop, divLeft, divWidth, divHeight, docHeight, docWidth, objTimer, i = 0;
            //鼠标悬浮在用户头像或者名称上面时显示用户信息
        </script>
        <div id="small_window"></div>
        <div style="display: none" id="bd_statistics">
            <script type="text/javascript">
                seajs.use('common',
                function(SJB) {
                    SJB.initFooter();
                    SJB.updateNavigate();
                    SJB.placeHolder();
                    var noChange = $('#stopChangeNavi');
                    if (!noChange.length) {
                        $(document).scroll(function() {
                            SJB.updateNavigateOnScroll();
                        });
                    }
                });
            </script>
        </div>
        <p class="cl"></p>
		<div id="sjb_footer_new">
	      <div class="sjb_footer_new">
	        <div class="footer-list">
	          <p class="clear"></p>
	        </div>
	        <p class="clear"></p>
	        <div class="sjb-link">
	          <p class="our-links">
	           <a href="${base}/resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
	            <span class="link-devide">|</span>
	            <a href="${base}/resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
	            <span class="link-devide">|</span>
	            <a href="" target="_blank" rel="nofollow">意见建议</a>
	            <span class="link-devide">|</span>
	            <a href="" target="_blank" rel="nofollow">帮助中心</a>
	            <span class="link-devide">|</span>
	            <a href="" target="_blank" rel="nofollow">使用条款</a>
	          </p>
	          <p class="statement">免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系。</p>
	          <p class="sjs-icp">
	            ©2012 百爪鱼-定制化装修设计服务平台, All Rights Reserved. (
	            <a hidefocus="" href="" rel="nofollow">粤ICP备08125558号-2</a>
	            )
	          </p>
	          <div class="auth-icons">
	            <a href=""
	            target="_blank" rel="nofollow" title="" alt="">
	              <span class="gaj"></span>
	            </a>
	            <a href="" target="_blank" rel="nofollow">
	              <span class="gad"></span>
	            </a>
	            <p class="clear"></p>
	          </div>
	        </div>
	      </div>
	      <p class="cl"></p>
	    </div>
	    <form action="" method="post" target="frm_dealer" id="frm_dealer_form">
	      <input type="hidden" id="clickValId" name="key" value=""/>
	    </form>
	    <iframe frameborder="0" height="0" name="frm_dealer" id="clsIframe"></iframe>
    </body>
</html>