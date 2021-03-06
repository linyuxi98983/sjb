<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>接单大厅</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <#include "/WEB-INF/ftl/shop/pager.ftl"/>
    <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/pagination.css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>   
    <script type="text/javascript">
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    </script>
    <script src="${base}/resources/pc/js/sea.js" type="text/javascript"></script>
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
          'newHeader': '${base}/resources/pc/js/userCenter.js'
        },
        preload: ['jquery','jq','list', 'common'] //预加载jquery和main.js
      });
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
              <span style="display:none;">
                <span>nini</span>
                <span>消息</span>
              </span>
            </li>
            <li class="po">|</li>
            <!-- 申请定制设计 -->
            <li class="dzsj">
              <a href="${base}/pc/designer/designer!apply.action" target="_blank">申请定制设计</a>
            </li>
            <li class="po">|</li>
            <!--客服服务 -->
            
            <li class="po">|</li>
            <!--设计师中心 -->
            <li class="cur" style="width:92px;">
              <a href="javascript:;">
                设计师中心
                <span class="jt"></span>
              </a>
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
          <a href="${base}/pc/index.action">
            <div class="web-logo">
            </div>
          </a>
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
                                            <a href="/sjb/pc/designer/designer!personal.action" class="my_index_ad">我的主页</a>
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
          <div class="selec_ele">
            <div class="sele selec_city">
              <label>所在城市：</label>
              <div>
                <a href="" class="cur" style="margin-left: 15px;">不限</a>
                <a href="" class="" style="margin-left: 15px;">北京</a>
                <a href="" class="" style="margin-left: 15px;">上海</a>
                <a href="" class="" style="margin-left: 15px;"> 广州</a>
                <a href="" class="" style="margin-left: 15px;">深圳</a>
                <a href="" class="" style="margin-left: 15px;">南京</a>
                <a href="" class="" style="margin-left: 15px;">天津</a>
                <a href="" class="" style="margin-left: 15px;">杭州</a>
                <a href="" class="" style="margin-left: 15px;">武汉</a>
                <a href="" class="" style="margin-left: 15px;">成都</a>
                <a href="" class="" style="margin-left: 15px;">西安</a>
                <a href="" class="" style="margin-left: 15px;">福州</a>
                <a href="" class="" style="margin-left: 15px;">苏州</a>
                <a href="" class="" style="margin-left: 15px;">郑州</a>
                <a href="" class="" style="margin-left: 15px;">合肥</a>
                <a href="" class="" style="margin-left: 15px;">贵阳</a>
                <a href="" class="" style="margin-left: 15px;">宁波</a>
                <a href="" class="" style="margin-left: 15px;">长沙</a>
                <span style="display: inline-block;margin-top: 4px;margin-left: 19px;cursor: pointer;color: #215A91;" class="athCity">[其他城市]</span>
              </div>
            </div>
            <div class="sele selec_type">
              <label>电竞风格：</label>
              <div>
                <a href="" class="cur" style="margin-left: 15px;">不限</a>
                <a href="" class="" style="margin-left: 15px;">住宅空间</a>
                <a href="" class="" style="margin-left: 15px;">餐饮空间</a>
                <a href="" class="" style="margin-left: 15px;">办公空间</a>
                <a href="" class="" style="margin-left: 15px;">酒店空间</a>
                <a href="" class="" style="margin-left: 15px;">商业展示</a>
                <a href="" class="" style="margin-left: 15px;">娱乐空间</a>
                <a href="" class="" style="margin-left: 15px;">休闲场所</a>
                <a href="" class="" style="margin-left: 15px;">文化空间</a>
                <a href="" class="" style="margin-left: 15px;">医疗机构</a>
                <a href="" class="" style="margin-left: 15px;">售楼中心 </a>
                <a href="" class="" style="margin-left: 15px;">金融机构</a>
                <a href="" class="" style="margin-left: 15px;">运动场所</a>
                <a href="" class="" style="margin-left: 15px;">教育机构</a>
                <a href="" class="" style="margin-left: 15px;">其他</a>
              </div>
            </div>
            <div class="sele selec_area">
              <label>项目面积：</label>
              <div>
                <a href="" class="cur" style="margin-left: 15px;">不限</a>
                <a href="" class="" style="margin-left: 15px;">0-60平米</a>
                <a href="" class="" style="margin-left: 15px;">60-100平米</a>
                <a href="" class="" style="margin-left: 15px;">100-150平米</a>
                <a href="" class="" style="margin-left: 15px;">150-200平米</a>
                <a href="" class="" style="margin-left: 15px;">200以上</a>
              </div>
            </div>
            <div class="sele selec_budget">
              <label>设计预算：</label>
              <div>
                <a href="" class="cur" rel="nofollow" style="margin-left: 15px;">不限</a>
                <a href="" class="" rel="nofollow" style="margin-left: 15px;">3000以下</a>
                <a href="" class="" rel="nofollow" style="margin-left: 15px;">3000-6000元</a>
                <a href="" class="" rel="nofollow" style="margin-left: 15px;">6000-10000元</a>
                <a href="" class="" rel="nofollow" style="margin-left: 15px;">10000-50000元</a>
                <a href="" class="" rel="nofollow" style="margin-left: 15px;">50000-100000</a>
                <a href="" class="" rel="nofollow" style="margin-left: 15px;">100000元以上</a>
              </div>
            </div>
          </div>
          <div class="selec_sort">
            <div class="selec_s_">
              <a href="" class="cur">发布时间
                <span></span>
              </a>
              <a href="" class="">总面积
                <span></span>
              </a>
            </div>
           <!-- <div class="small_page">
              <a class="prev_page" rel="nofollow" href="">
                &lt;
              </a>
              <a href="javascript:vold();" style="font-family: e;">
                <span style="font-weight: bold;">1</span>
                <span style="color:#999;">/1305</span>
              </a>
              <a class="next_page" rel="nofollow" href="">&gt;</a>
            </div>-->
          </div>
          <div class="prod_list">
            <div class="list_">
              <input type="hidden" id="pids" value="68841,68020,68411,68391,68672,68860,68804,68858,68811,68412,68363,68798"/>
              
              
              <#list list as entity>
              		<div class="list_info">
	                <div class="_info">
	                  <div>
	                    <a href="${base}/pc/demand/demand!edit.action?id=${entity.id}" target="_blank">${entity.title!}</a>
	                    <span class="price">${entity.minAmt}-${entity.maxAmt}</span>
	                  </div>
	                  <div class="jc_info">
	                    <span style="padding-left:0;">${entity.areaName!}</span>
	                    <span>住宅空间</span>
	                    <span>${entity.areaSqm}m²</span>
	                    <span style="border-right:none;"><#if entity.pubilcDate??>${entity.pubilcDate?string("yyyy年MM月dd日")}</#if> </span>
	                  </div>
	                </div>
	                <div class="btne apply_index">
	                  <a href="${base}/pc/demand/demand!edit.action?id=${entity.id}" class="btn_unclick" target="_blank">查看详情</a>
	                </div>
	              </div>
              </#list>
              <div class="page">
          <div class="page_num">
          		<@page pager base + "/pc/demand/demand!list.action"/>
            	<input type="hidden" name="searchProperties.brand" value="${searchProperties.brand!}"/>
	            <input type="hidden" name="searchProperties.startprice" value="${searchProperties.startprice!}"/>
	            <input type="hidden" name="searchProperties.endprice" value="${searchProperties.endprice!}"/>
	            <input type="hidden" name="searchProperties.type" value="${searchProperties.type!}"/>
	            <input type="hidden" name="orderby" value="${searchProperties.orderby!}"/>
	            <input type="hidden" name="keyword" value="${searchProperties.name!}"/>       
          </div>
        </div>
        
            </div>
            <div class="prod_adver">
              <div>
                <a href="">
                  <img src="http://img.shejiben.com/my/popularize_center/Image_2.png"/>
                </a>
              </div>
              <br/>
              <div>
                <a href="">
                  <img src="http://img.shejiben.com/my/popularize_center/Image.png"/>
                </a>
              </div>
            </div>
          </div>
        </div>
        <input type="hidden" id="city_py" value=""/>
        <input type="hidden" id="space_py" value=""/>
        <input type="hidden" id="price_range" value="0"/>
        <input type="hidden" id="area_range" value="0"/>
      </div>
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
    <div class="none_f" id="goTop" style="display: block;">
      <a href="javascript:void(0);" onclick="" class="kflive800" lim_company="235802" lim_skill="3012"></a>
      <a rel="nofollow" href="" target="_blank" class="my_collection" id="my_collection"></a>
      <a rel="nofollow" href="" target="_blank" class="my_option"></a>
      <a href="javascript:void(0)" class="backTop" id="backTop" style="display: none;"></a>
      <div class="pop_code new_active" id="new_active" style="border:1px solid #e5e3e4;display:none;">
        <table cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td>
                <div class="chouJ"></div>
                <a class="chouJ_button" href="" rel="nofollow">抽奖</a>
              </td>
              <td>
                <div class="chouJ v1"></div>
                <a class="chouJ_button" href="" rel="nofollow">签到</a>
              </td>
            </tr>
            <tr>
              <td>
                <div class="chouJ v2"></div>
                <a class="chouJ_button" href="" rel="nofollow">赚币</a>
              </td>
              <td>
                <div class="chouJ v3"></div>
                <a class="chouJ_button" href="javascript:;" rel="nofollow" id="addF">收藏本站</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div style="display: none" id="bd_statistics">
      <script type="text/javascript">
        seajs.use('common',
        function(SJB) {
          SJB.initFooter();
          SJB.updateNavigate();
          SJB.placeHolder();
        });
      </script>
    </div>
    <p class="cl">
    </p>
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
    <iframe frameborder="0" height="0" name="frm_dealer" id="clsIframe">
    </iframe>
  </body>
</html>