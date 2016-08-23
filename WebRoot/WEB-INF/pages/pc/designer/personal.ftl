<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="position: relative;">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>设计师个人空间</title>
    <meta name="description" content=""/>
    <meta name="mobile-agent" content=""/>
    <meta name="location" content=""/>
    <link rel="stylesheet" href="${base}/resources/pc/css/new_global.css"/>
    <link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/designer_opus.css"/>
    <style type="text/css">
      /*首页是宽版*/ .sjbNewTop .newTopBg .head1{width:1180px; !important} .content_width_index{padding-top:
      0px !important;z-index: 100 !important;} html,body{background: #fff !important;}
    </style>
     <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>   
    <script type="text/javascript" src="${base}/resources/pc/js/layer/layer.js"></script> 
      <script type="text/javascript" src="${base}/resources/pc/js/layer/common.js"></script> 
    
    <script type="text/javascript">
    	$(function(){
    		//alert(1111)
    		$("#sjsblog_yyzxxxxx").on("click",function(){
    			 if($("#memberId").val() != undefined &&　$("#memberId").val()!='' && $("#memberId").val() > 0){
		
			 layer.open({
				    type: 2,
				    //skin: 'layui-layer-lan',
				    title: '预约咨询',
				    fix: false,
				    shadeClose: true,
				    maxmin: true,
				    area: ['380px', '400px'],
				   	content:'${base}/resources/html/common/appointment.html'
				  });
		 
		 
			 
		 }else{
			 layer.open({
				    type: 2,
				    //skin: 'layui-layer-lan',
				    title: '登陆',
				    fix: false,
				    shadeClose: true,
				    maxmin: true,
				    area: ['380px', '400px'],
				   	content:'${base}/resources/html/common/pop_login.html'
				  });
		 }
	 
    		});
    	});
    	function getDsMemberId(){
    		//alert(jq("#ltSpMemberId").val());
    		return $("#ltSpMemberId").val();
    	}
    	function reloadFun(){
    		return '${base}/pc/designer/designer!personal.action?id=${entity.id}';
    	}
    </script>
    
    <link rel="stylesheet" href="http://www.shejiben.com/css/start/header_menu.css?201511102"/>
    <script type="text/javascript">
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    </script>
    <script src="${base}/resources/mobile/js/jquery-1.9.0.min.js"></script> 
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
          'colorbox':'${base}/resources/pc/js/jquery.colorbox.min.js',
          'newHeader': '${base}/resources/pc/js/userCenter.js'
        },
        preload: ['jquery','jq','list', 'common'] //预加载jquery和main.js
      });
      seajs.use('common',
      	function(SJB) {
        	SJB.commonSubToolBar.init();
      });
      seajs.use('${base}/resources/pc/js/designer_opus.js',
      function(designer) {
        $(function() {
          designer.init();
        });
      });
    </script>
  </head>
  
  <body style="position: relative;">
   <input type="hidden" id="memberId" value="${memberId!0}"/>
   <input type="hidden" id="ltSpMemberId" value=""/>
    <div id="cboxOverlay" style="display: none;"></div>
    <div id="colorbox" class="" style="padding-bottom: 32px; padding-right: 0px; display: none;">
      <div id="cboxWrapper">
        <div>
          <div id="cboxTopLeft" style="float: left;"></div>
          <div id="cboxTopCenter" style="float: left;"></div>
          <div id="cboxTopRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
          <div id="cboxMiddleLeft" style="float: left;"></div>
          <div id="cboxContent" style="float: left;">
            <div id="cboxLoadedContent" class="" style="width: 0px; height: 0px; overflow: hidden;"></div>
            <div id="cboxLoadingOverlay" class=""></div>
            <div id="cboxLoadingGraphic" class=""></div>
            <div id="cboxTitle" class=""></div>
            <div id="cboxCurrent" class=""></div>
            <div id="cboxNext" class=""></div>
            <div id="cboxPrevious" class=""></div>
            <div id="cboxSlideshow" class=""></div>
            <div id="cboxClose" class=""></div>
          </div>
          <div id="cboxMiddleRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
          <div id="cboxBottomLeft" style="float: left;"></div>
          <div id="cboxBottomCenter" style="float: left;"></div>
          <div id="cboxBottomRight" style="float: left;"></div>
        </div>
      </div>
      <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
    </div>
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
        </div>
      </div>
    </div>
    <script type="text/javascript">
      seajs.use(['newHeader', 'common'],
      function(Header, common) {
        $(document).ready(function() {
          Header.init();
          common.initHeader();
        });
      });
    </script>
    <div class="designer_header" style="background:url(http://pic.shejiben.com/hot_sjb/330_5265.jpg?1450076593?0.81822123230352) repeat scroll center center #fff;">
      <div class="font_bg">
        <p class="head_portrait">
          <span class="head_portrait_img">
            <img src="${entity.imagePath!}"/>
          </span>
          <em class="auth_icon icon_zm" title="行业知名设计师">
          </em>
          <em class="famous_icon icon_rz_qy" title="企业身份认证">
          </em>
        </p>
        <p class="desinger_name">
          ${entity.nickname}
        </p>
        <p class="company_name">
          有实力，就有空间。
        </p>
        <p class="company_addr">
          <span>
            <a href="" target="_blank">
              <#if entity.area?exists>
                  ${entity.area.parent.name!} ${entity.area.name!}
                  </#if>
            </a>
          </span>
        </p>
      <!--  <a href="javascript:void(0)" class="add_care" id="followBtn" rev="5541855"
        rel="0">
          <span class="care_icon">
          </span>
          <span class="care_font">
            关注
          </span>
        </a>-->
      </div>
    </div>
    <div class="designer_navs" style="position: absolute; top: 450px;">
      <div class="designer_nav">
        <ul class="designer_nav_ul">
          <li class="cur designer_nav_li">
            <a href="javascript:void(0)">
              设计作品
            </a>
          </li>
          
         <!--<li class="designer_nav_li">
            <a href="javascript:void(0)">
              业主评价
            </a>
          </li>
          <li class="designer_nav_li">
            <a href="javascript:void(0)">
              成交记录
            </a>
          </li>
          <li class="designer_nav_li">
            <a href="javascript:void(0)">
              关于TA
            </a>
          </li> <li class="more_li">
            <a href="javascript:void(0)" class="nav_more">更多</a>
            <div class="more_con">
              <a href="" target="_blank" class="more_con_a">
                TA的作品
              </a>
              <a href="" target="_blank" class="more_con_a">
                TA的博文
              </a>
              <a href="" rel="nofollow"
              target="_blank" class="more_con_a">
                TA的收藏
              </a>
            </div>
          </li>-->
        </ul>
        <div class="consult_box">
          <p class="consult_tlt">
            <span class="money_icon">
              ￥
            </span>
            <span class="price">
              ${entity.minDesignAmt!}
            </span>
            <span class="square">
              /㎡
            </span>
          </p>
          <div class="consult_con">
            <a href="javascript:void(0)" id="sjsblog_yyzxxxxx" class="consult" data-id="5541855">
              预约咨询(
              <em>
                ${entity.appointmentCount!0}
              </em>
              )
            </a>
            <div class="phone_box">
              <div class="notice">
                <p>
                  找设计师？一个电话搞定！
                </p>
                <span>
                </span>
              </div>
             <!-- <a href="javascript:void(0)" class="c_phone" style="text-align:center;">
                
                获取设计师信息
              </a>-->
            </div>
            <p class="assure">
              原创作品
            </p>
            <p class="assure">
              真实评价
            </p>
            <p class="assure assure_last">
              担保交易
            </p>
            <p class="clear">
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="popup_mask" style="display:none;">
    </div>
    <div class="popup_upload_head" style="display:none;">
    </div>
    <div class="deigner_body">
      <div class="deigner_mains">
        <div class="deigner_main">
          <div class="designer_opus">
            <div class="opus_nav">
              <a href="javascript:void(0)" class="cls_fication cls_on" data-type="case_all"
              data-count="22">全部&nbsp;(
                <em id="totalCase">${pager.pageCount}</em>)
              </a>
              <a href="" class="cls_fication" data-type="case_home"
              data-count="6">网咖&nbsp;(
                <em id="jiazhuang_case">
                <#assign x=0 />

     <#list entity.worksList as case>
     	<#if case.worksKind == 0>
     		<#assign x=x+1>
     	</#if>
     </#list>
             	${x}   </em>
                )
              </a>
              <a href="" class="cls_fication" data-type="case_work"
              data-count="16">电竞&nbsp;(<em id="gongzhuang_case">
                 <#assign y=0 />

     <#list entity.worksList as case>
     	<#if case.worksKind == 1>
     		<#assign y=y+1>
     	</#if>
     </#list>
             	${y}   </em>)
              </a>
              <div class="clear"></div>
            </div>
            <div class="tab_content">
              <ul class="opus_main case_page" id="caseListDiv">
               <#if entity.worksList?exists>
                      	<#list entity.worksList as case>
                <li class="firstCaseListDiv">
                  <div class="opus_head">
                    <a href="" target="_blank" class="opus_tlt">${case.title!}</a>
                    <div class="opus_label">
                      <span class="opus_p">
                        <em>${case.sqm}㎡</em>
                        |
                      </span>
                      <span class="opus_p">
                        <em>${case.picList?size}</em>
                        	图
                      </span>
                      <b class="opus_line">|</b>
                      <span class="opus_p">
                        <em>${case.browseCount!}</em>
                        	浏览
                      </span>
                      <p class="clear"></p>
                    </div>
                    <p class="clear"></p>
                  </div>
                  <p class="opus_content">
                   <!-- 设计公司：深圳曲高装饰设计工程有限公司 主创设计师：曲效辰 项目名称：莆田印象 项目地址：深圳宝安田寮 项目面积：800㎡ 项目网咖风格：中式
                    	主要用材：实木、灰麻石、灰条砖、彩绘、名间石雕-->
                    	${case.caseDescription!}
                  </p>
                  <a href="${base}/pc/case/case!detail.action?id=${case.id}" target="_blank" class="opus_img">
                    <span class="opus_span">
                     
                      <#if case.picList? exists>
						<#list case.picList! as image>		
							<#if (image_index?if_exists+1 <4)>			
							<img src="${image.imagePath!}" alt=""/>
							</#if>
                      	</#list>
                      </#if>
                    </span>
                  </a>
                </li>
                	</#list>
                      </#if>
              </ul>
            </div>
            <a id="loadMore"  target="_blank" class="more_opus">更多作品&nbsp;&gt;</a>

    <input type="hidden" id="recordCount" value="0"/>
   <input type="hidden" id="pageCount" value="1"/>
   <input type="hidden" id="readMore" value="0"/>
   <input type="hidden" id="currentPage" value="1"/>
   <script>
   		var pageNumber = 0;
   		var pageSize = 10;
   		$(function(){
   			$("#loadMore").bind("click",function(){ 
   				$(".firstCaseListDiv").remove();
   				pageNumber++;   				
   				$("#currentPage").val(pageNumber);
   				$.ajax({
   					type:"post",
   					url:"${base}/pc/case/case!loadMore.action",
   					data:{
   						pageNumber:pageNumber,
   						pageSize:pageSize,
   						type:"",
   						memberId:"${entity.id}",
   						result:"json"
   					},
   					dataType:"json",
   					success:function(data){
   						var pager = data.pager;
   						$("#recordCount").val(pager.pageCount);   						
   						var list = data.list;
   						
   						var gongzhuang_case = 0;
   						var jiazhuang_case = 0;
   						for(var i=0;i<list.length;i++){
   							var id = list[i].id;
   							var title = list[i].title;
   							var caseDescription = list[i].caseDescription;
   							var sqm = list[i].sqm;
   							var picCount = list[i].picList.length;
   							var browseCount = list[i].browseCount;
   							var picList=list[i].picList;
   							
   							if(list[i].worksKind==1){
   								gongzhuang_case ++;
   							}else{
   								jiazhuang_case++;
   							}
   							var picArr=[];
   							var imageSrcs = "";
   							
   							for(var k=0;k<list[i].picList.length;k++){
	   							if(k <3){
		   								imageSrcs +="<img src='"+picList[k].imagePath+"' alt=''/>";
		   						}
   							}
 							var loadMoreCase = "<li><div class='opus_head'><a href='${base}/pc/case/case!detail.action?id="+id+"' target='_blank' class='opus_tlt'>"+title+"</a><div class='opus_label'><span class='opus_p'><em>"+sqm+"㎡</em>|</span><span class='opus_p'><em>"+picCount+"</em>图</span><b class='opus_line'>|</b><span class='opus_p'><em>"+browseCount+"</em>浏览</span><p class='clear'></p></div><p class='clear'></p></div><p class='opus_content'>"+caseDescription+"</p><a href='${base}/pc/case/case!detail.action?id="+id+"' target='_blank' class='opus_img'><span class='opus_span'>"+imageSrcs+"</span></a> </li>"
   							
   							$("#caseListDiv").append(loadMoreCase);
   						}
   						if(pageNumber<=1){
   							$("#gongzhuang_case").text(parseInt(gongzhuang_case));
   						}
   						else{
   							var count = $("#gongzhuang_case").text();
   							$("#gongzhuang_case").text(parseInt(count)+gongzhuang_case);
   						}
   						
   						
   						if(pageNumber<=1){
   							$("#jiazhuang_case").text(parseInt(jiazhuang_case));
   						}
   						else{
   							var count = $("#jiazhuang_case").text();
   							$("#jiazhuang_case").text(parseInt(count)+jiazhuang_case);
   						}
   						$("#firstListDiv").remove();
   						
   						if($("#readMore").val()==0){
		   					$("#readMore").val(1);
		   					var recordCount = $("#pageCount").val();
			   				var pageCount = Math.ceil(pager.pageCount/pageSize);			   				
			   				$("#pageCount").val(pageCount);
		   				}
		   				
		   				if(pageNumber == $("#pageCount").val()){
		   					$("#loadMore").html("沒有更多記錄！");
		   					$("#loadMore").unbind("click");
		   				}
   					}
   				});
   			})
   		})
   </script>
   
   
          </div>
         
           
          
          <div class="deal_record">
            <p class="desc_tlt desc_tltle">
              成交记录&nbsp;(
              <em>0</em>
              )
            </p>
            <div class="no_record_other">暂无成交记录！</div>
          </div>
          <div class="about_he">
            <div class="about_he_head">
              <p class="desc_tlt">关于TA</p>
            </div>
            <div class="about_he_main">
              <div class="about_he_pic">
                <p class="about_he_img">
                  <img src="${entity.imagePath!}"/>
                </p>
                <p class="popularity">
                  <span class="popularity_fans">
                    <em class="total_num">24</em>
                    <em class="total_txt">粉丝</em>
                  </span>
                <span class="attention">
                    <em class="total_num">0</em>
                    <em class="total_txt">关注</em>
                  </span>
                </p>
                <p class="popularity">
                  <em class="total_num" id="popularily">${entity.browseCount}</em>
                  <em class="total_txt">人气</em>
                </p>
              </div>
              <div class="about_he_con">
                <p class="a_tlt">你好！我是
                  <span>${entity.nickname!}</span>
                </p>
                <div class="a_info">
                  <p class="a_info_txt no_con">
                    <span>设计经验：</span>
                                       ${entity.designExperience!}
                  </p>
                  <p class="a_info_txt no_con">
                    <span>擅长空间：</span>
                    ${entity.goodsAtSpace!}
                  </p>
                  <p class="a_info_txt no_con">
                    <span>所在地：</span>
                     <#if entity.area?exists>
                  ${entity.area.parent.name!}    ${entity.area.name!}
                  </#if>
                  </p>
                </div>
                <div class="intro_award">
                  <p class="intro_award_tlt">个人简介</p>
                  <p class="intro_award_con no_con">
                   ${entity.description!}
                  </p>
                </div>
                <div class="intro_award">
                  <p class="intro_award_tlt">
                    证书与奖励
                  </p>
                  <p class="intro_award_con">
                  	${entity.minDesignAmt!}
                  </p>
                </div>
              </div>
              <div class="clear"></div>
            </div>
            <p class="clear"></p>
          </div>
        </div>
      </div>
    </div>
    <!--底部模版 闭合标签配对-->
    <div>
      <div>
        <!--底部模版 闭合标签配对 End-->
      </div>
    </div>
    <p class="clear">
    </p>
    <bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
    <div id="messagebox"></div>
    <div id="small_window"></div>
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