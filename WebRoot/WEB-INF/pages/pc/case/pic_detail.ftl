<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>作品详情</title>
    <#include "/WEB-INF/ftl/pc/header.ftl"/>
    
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="mobile-agent" content=""/>
    <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/sjs_dwt_new.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/header_menu.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
  		var pathName = window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
  		
    </script>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.js"></script>
    <style type="text/css">
    	.layui-layer-title{
    		background-color:black;
    	}
    </style>
     <script type="text/javascript" src="${base}/resources/pc/js/util.js"></script>
    <script type="text/javascript" src="${base}/resources/pc/js/layer/layer.js"></script>
    <script type="text/javascript">var jq = jQuery.noConflict();</script>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.colorbox.min.js"></script>
    <script type="text/javascript" src="${base}/resources/pc/js/common.js"></script>
    <script type="text/javascript" src="${base}/resources/pc/js/myUserCenter.js"></script>
    <#include "/WEB-INF/ftl/pc/global.ftl"/>
    <script type="text/javascript">
    	
    	log_uid = ${memberId!0};
    	//alert(log_uid);
    	function askQuestion(id){
    		alert("12");
    	}
    	
    	function getMemberId(memberId){
    		return jq("#memberId").val();
    	}
    	function getDsMemberId(){
    		return jq("#ltSpMemberId").val();
    	}
    	function reloadFun(){
    		return '${base}/pc/case/case!detail.action?id=${entity.id}';
    	}
    </script>
  </head>
  <body>
    <div class="sjbNewTop" id="sjbNewTop">
      <div class="newTopBg">
        <div class="head1">
          <div class="hea_top_right">
            <ul class="tp_node">
              <li style="width:90px;" id="nav_login">
              <input type="hidden" id="memberId" value="${memberId!0}"/>
              <input type="hidden" id="ltSpMemberId" value="${entity.ltSpMemberId}"/>
              <input type="hidden" id="caseId" value="${entity.id}"/>
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
              <li class="dzsj">
                <a href="${base}/pc/designer/designer!apply.action" target="_blank" rel="nofollow">申请定制设计</a>
              </li>
              <li class="po">|</li>
              
              <li class="po">|</li>
              <li class="cur" style="width:92px;">
                <a href="javascript:;">设计师中心
                  <span class="jt"></span>
                </a>
                <div class="sj_center" style="display:none;">
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
      <div class="index_logo">
        <a href="" title=" ">
          <div class="web-logo"></div>
        </a>
        <div id="search_case">
          <form id="quicksearch" method="get" action=""
          onsubmit="return checkSearchForm()" target="_blank">
            <input type="hidden" name="searchType" value="" id="searchType" />
            <span id="search_span">
              <div id="search_title"></div>
              <em class="arrow"></em>
              <label id="s_zsj" style="display:none;"></label>
            </span>
            <input type="text" value="请输入搜索关键词" onfocus=""
            onblur="" class="key" name="q" id="search_val"/>
            <em class="icon_search"></em>
            <input type="submit" value="搜索" class="submit" />
          </form>
        </div>
      </div>
    </div>
    <p class="clear"></p>
    <div class="wrap wrap_top_menu">
      <div class="top_menu">
        <ul>
          <li>
            <a href="${base}/pc/index.action">首页</a>
          </li>
          <li>
            <a href="${base}/pc/case/case!list.action">设计案例</a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!list.action">网咖案例</a>
              <a href="case.html">电竞案例</a>
            </div>
          </li>
          <li>
           <a href="${base}/pc/case/case!pics.action">装修图库</a>
            <div class="inner_menu">
              <a href="${base}/pc/case/case!pics.action">网咖图库</a>
              <a href="${base}/pc/case/case!pics.action?type=1">电竞图库</a>
            </div>
          </li>
           <!--<li>
            <a href="">有问必答</a>
          </li>-->
          <li>
            <a href="${base}/pc/designer/designer!index.action">找设计师</a>
          </li>
         
         
        </ul>
      </div>
    </div>
    <div class="dmato"></div>
    <div class="content_width">
      <div class="content_width ">
      	<script type="text/javascript">
          blogcheck();
          greet_text();
          var token = "0";
          var appid = "0";
          var openid = "0";
          var token_weibo = "0";

          var searchType = "";
          var arr = new Array("1", "2", '10', '7', '9', '3');
          var urlArr = new Array({
            '1': [{
              0 : "",
              1 : "q",
              2 : "搜索图片的关键词，如：儿童房",
              3 : "找图片　　"
            }],
            '2': [{
              0 : "",
              1 : "q",
              2 : "搜索灵感图集",
              3 : "找图集"
            }],
            '10': [{
              0 : "",
              1 : "q",
              2 : "搜索案例",
              3 : "找案例"
            }],
            '7': [{
              0 : "",
              1 : "q",
              2 : "搜索设计师",
              3 : "找设计师"
            }]
          });

          jq(function() {
            searchFun(searchType);
            /**重置掉搜索下拉的宽度**/
           
            	jq("#search_span").hover(function() {
              resetSliderWidth();
            })

          });

          function resetSliderWidth() {
            var searchW = jq('#search_title').width();
            jq('#s_zsj').css("width", (searchW - 2) + 'px');
          }

          jQuery('.kflive800').bind('click',
          function() {
            window.open('http://dzt.twos.net.cn/LR/Chatpre.aspx?id=DZT58706561&lng=cn', '_blank', "height=450,width=630");
          })
        </script>
        <style type="text/css">
          /*内页是窄版*/ .index_logo,.top_menu{width:990px;} .index_logo #search_case{margin-left:
          100px !important;}
        </style>
        <p class="clear"></p>
        <div class="pageTag">
          	我的位置：
          <a href="">百爪鱼</a>
          	＞
          <#if entity.worksKind == 0>
         <a href="${base}/pc/case/case!list.action?type=0">网咖案例</a>
          <#else><a href="${base}/pc/case/case!list.action?type=1">电竞案例</a>
          </#if>
          <i></i>
          	＞${entity.title!}
          <p class="clear"></p>
        </div>
        <div class="photo_box_new" style="display:none;">
          <div class="reels_pic" onselectstart="return false;">
            <span class="pic" id="container_pic"></span>
            <span class="pic_list" style="display:none"></span>
            <div class="arrow arrow_left"></div>
            <div class="arrow arrow_right"></div>
            <div class="btn_all">
              <div class="btn_share">
                <span class="btn_name">分享</span>
                <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare share-bd">
                  <a class="bds_baidu"></a>
                  <a class="bds_qzone"></a>
                  <a class="bds_tqq"></a>
                  <a class="bds_tsina"></a>
                </div>
              </div>
              <div class="question">
                <em class="icon icon_question"></em>
                <a href="javascript:void(0);">提问(0)</a>
              </div>
              <div class="collection" data-src=''>
                <em class="icon icon_collection"></em>
                <a href="javascript:void(0);"> 收藏(0)</a>
              </div>
              <div class="download">
                <em class="icon icon_download"></em>
                <a href="javascript:void(0);">下载(0)</a>
              </div>
            </div>
          </div>
          <div class="reels_msg" id="lbAnchors">
            <div id="scroller" style="height: 466px;">
              <div id="scroll_up"></div>
              <div id="scroll_bar" style="display: block; top: 414px;"></div>
              <div id="scroll_down"></div>
            </div>
            <div id="shower">
              <div class="column_name">
                <em class="title"></em>
                <em class="icon_close"></em>
              </div>
              <div class="user_msg">
                <a href="#" class="head" id="user_head"></a>
                <div class="msg">
                  <span class="name">
                    <a href="#" id="user_name"></a>
                  </span>
                  <span class="location">
                    <em class="icon icon_location"></em>
                    <em id="address"></em>
                  </span>
                  <span class="price">
                    <em class="icon icon_price"></em>
                    <em id="price_datail"></em>
                  </span>
                </div>
                <div class="clear"></div>
              </div>
              <div class="user_reservation">
                <a href="javascript:void(0);" id="sjs_case_image" class="btn_reservation"></a>
                <span class="tel">
                  <em class="icon icon_tel"></em>
                  <em class="400_num"></em>
                </span>
              </div>
              <div class="questions" style="display:none;">
                <span class="title">
                  <em class="icon icon_question"></em>
                  <em class="name">该图的问答</em>
                </span>
              </div>
            </div>
          </div>
          <a href="" class="cur_url"></a>
        </div>
        <div style="display:none">
          <div id="getImageQuestion">
            <div class="addToCollectionFormError" style="display:none;">
              <div class="dialogStatus" id="" style="display:none;color:#f00;">
              </div>
            </div>
            <div class="otherDesignerWorkingOn">正在努力获取这张图片的问题，请稍等...</div>
          </div>
          <div id="addQuestionDialog">
            <div id="addQuestionDialog_0">
              <div class="addToCollectionFormError">
                <div class="dialogStatus" id="" style="display:none;color:#f00;"></div>
              </div>
              <div class="dialogCaption">您需要的答案可能已经存在：</div>
              <div class="existQuestions">
                <ul></ul>
              </div>
            </div>
            <div id="addQuestionDialog_1" style="display:none;">
              <div class="qTitle">提问
                <a id="closeQuestionBox" class="close2" href="javascript:;"></a>
              </div>
              <form id="addQuestion" name="addQuestion" action="javascript:;">
                <div class="addToCollectionFormError">
                  <div class="dialogStatus" id="" style="display:none;color:#f00;"></div>
                </div>
                <div>
                  <input type="text" name="questionTitle" id="questionTitle" placeholder="例如：多大的面积能装修成这样.预算多少"
                  onfocus=" this.style.border='1px solid #68a666';" onblur="this.style.border='1px solid #d8d8d8'"/>
                </div>
                <div>
                  <textarea id="questionContent" name="questionContent" rows="3" cols="40"
                  placeholder="对装修设计有疑惑，预算、网咖风格、风水、选材、施工，将你的问题提出来，让业内专家帮你解答，提问最好附上图片哦" onfocus="this.style.border='1px solid #68a666' "
                  onblur="this.style.border='1px solid #d8d8d8'">
                  </textarea>
                </div>
              </form>
            </div>
            <div id="addQuestionDialog_2">
            </div>
            <div class="dialogControls">
              <div class="collect_btn" style="float:left;margin:10px 0px 25px 0px;">
                <input value="提问" type="button" id="addToQuestion" class="delsubmit newsubmit"/>
                <p class="pmsg">5000位装修设计专家，三分钟内为您解答设计疑惑</p>
              </div>
              <p class="clear"></p>
            </div>
            <p class="clear"></p>
            <div class="dialogCaption" style="display:none;padding:0px 40px;">
              您需要的答案可能已经存在：
            </div>
            <div class="existQuestions newexistQuestions" style="height:120px;padding:0px 40px;">
              <ul></ul>
            </div>
            <p style="padding:0px 30px;">收到答案时，系统将发送邮件到您的注册邮箱</p>
          </div>
          <div id="submitQuestionOk">
            <div class="addToCollectionFormError">
              <div class="dialogStatus" id="" style="display:none;color:#f00;"></div>
            </div>
            <div class="otherDesignerWorkingOn">
              <a href="" class="lv succ_qu" target="_blank">点击查看我的提问</a>
            </div>
          </div>
          <div id="submitQuestionOk2">
            <div class="addToCollectionFormError">
              <div class="dialogStatus" id="" style="display:none;color:#f00;"></div>
            </div>
            <div class="otherDesignerWorkingOn">
              <a href="" class="lv">警告：您的文本中含有系统不允许的内容，被屏蔽.</a>
            </div>
          </div>
          <div id="noLoginSubmitQuestionOk">
            <div class="otherDesignerWorkingOn">
              提问成功：由于您未登录百爪鱼，无法接收专家们的回复。
            </div>
            <div class="noLoginToLogin">
              <a href=""></a>
            </div>
          </div>
        </div>
        <input type="hidden" id="blogUid" value="2090485" />
        <div class="caseInfo">
          <div class="caseDetail">
            <h4 class="caseTitle">${entity.title!}</h4>
            <div class="caseProperty">
              <span>参考造价：
                <em class="red">${entity.costAmt}万元</em>
              </span>
              <span class="del"> | </span>
              <span>网咖风格：美式</span>
              <span class="del">|</span>
              <span>空间：别墅设计</span>
              <span class="del">|</span>
              <span>面积：${entity.sqm}平米</span>
              <span class="del">|</span>
              <span>浏览数：${entity.browseCount}</span>
            </div>
            <div class="caseDescription">
              <div class="desTitle">
                <strong>案例简介</strong>
                Case description
              </div>
              <div class="desIcon"></div>
              　　		${entity.caseDescription!}
              </div>
            <div class="imgContent" id="imgContent">
              
              <#if entity.picList? exists>
					<#list entity.picList! as image>						
							<#if image.imagePath??>			
			                  
                  <img class="preview-box-x" data-id="2221417" src="${image.imagePath!}" style="width:100%"
                  alt="" onselectstart="return false" ondragstart="return false"
                  oncontextmenu="return false" />
                   	
					            			
					       </#if>									
					</#list>
			  </#if>							
            </div>
            <div class="otherCase">
              <h4>TA的其他作品</h4>
              
            </div>
          </div>
          <#if entity.hisDesigns??>
          <div id="otherCaseListDiv" style="display:none;">
                	<#list entity.hisDesigns as vo>
                		<img src="${vo.imagePath!}"  width="320" height="320" alt="" />
		                  
		               
         	</#list>
                	
              </div>   	
            </#if>
          <div class='image_comment' id='image_comment'>
            <p class='p_tlt'>
              所有评论&nbsp;(${entity.evaCount!0})
            </p>
            <ul>
              <li class='li_01' id='commentBox'>
                <a href='javascript:void(0)' target='_blank' class='com_a'>
                  <img src='http://img.shejiben.com/headphoto/noheadphoto.gif'/>
                </a>
                <div class='com_div'>
                  <label class='def_value'>说点什么吧！
                  </label>
                  <input class='input_text' id='comment_input' type='text' autocomplete='off'/>
                  <input class='sub_btn send_comment_btn send_comment_btn_post' value='提交' type='submit'/>
                </div>
                <div class='clear'></div>
              </li>
            </ul>
          </div>
        </div>
        
        
        <div class="authorInfo_new_outside">
          <div class="authorInfo_new">
         
          	  <div class="author_info">
              <a href="/sjs/2090485/" class="author_head">
                <img src="${entity.mb.imagePath!}"/>
              </a>
              <span class="author_name">
                <a href="/sjs/2090485/" class="name">${entity.mb.realName!}</a>
                <span class="icon_renzhen">
                  <em class="icon_qy" title="企业身份认证"></em>
                  <em class="icon_zm" title="行业知名设计师"></em>
                </span>
                <p class="city">
                  <#if entity.mb.area?exists>
                  ${entity.mb.area.parent.name!}
                  <a href="" target="_blank">${entity.mb.area.name!}</a>
                  </#if>
                </p>
              </span>
            </div>
            <div class="order_total">
              <ul>
                <li>
                  <em>2</em>
                  <label>预约</label>
                </li>
                <li>
                  <em>0</em>
                  <label>签单</label>
                </li>
                <li>
                  <em>
                    <a href="">0</a>
                  </em>
                  <label>评价</label>
                </li>
                <div class="clear"></div>
              </ul>
            </div>
            <div class="price">￥
              <em>${entity.mb.minDesignAmt!}</em>/ ㎡
            </div>
            <a class="btn reservation" id="sjs_case_r" href="javascript:void(0)" data-id="2090485">
             	预约咨询
            </a>
           
        </div>
      </div>
      <p class="clear"></p>
      <a href="javascript:;" class="topIcon" id="backToTopBtn"></a>
      <script>
        var whoid = 2090485; //作品对象ID
        var lid = 3062266; //作品ID
        var log_uid = 0; //当前用户ID
        var sc_number = 15; //收藏量
        var pl_number = 0; //评论量
        var truename = '111111111111111';
        var type = 1;
        var jq = jQuery.noConflict();
        var collectionName = "${entity.title!}";
        var collectionId = 152557;
        var currentPage = jscurrentPage = '0';
        var PageCount = '';
        var noimg = '';
        var keyword = '';
        var nb_image_page = 17;
        var items_count = 17;
        var arrayObj = [];
        var arrayRightObj = [];
        var userData = [];
        var city="";
         <#if entity.mb.area?exists>
                  city ='${entity.mb.area.parent.name!}&nbsp&nbsp;${entity.mb.area.name!}'
                  </#if>
        <#if entity.picList? exists>
					<#list entity.picList! as image>	
						var us={
				            "NICK": collectionName,
				            "indentityCN": "sjs",
				            "apply_status": "4",
				            "shen": "1111",
				            "city": city,
				            "goodlevel": "5",
				            "min_price": "120",
				            "max_price": "480",
				            "ident": "1",
				            "extensionnum": "",
				            "sHeadPhoto": "${entity.mb.imagePath!}",
				            "uploadtype": "0",
				            "id": "2221521",
				            "name": "",
				            "collectionComment": "",
				            "added_by": "2090485",
				            "width": "1100",
				            "height": "778",
				            "img_url": "${image.imagePath!}",
				            "img_url_s": "${image.imagePath!}"
				          }
				         userData.push(us);
					</#list>
		</#if>
		
        arrayObj[currentPage] = {
          "start": 0,
          "user": userData
        };
      </script>
      <script type="text/javascript" src="${base}/resources/pc/js/popup.js"></script>
      <script type="text/javascript" src="${base}/resources/pc/js/case_new.js"></script>
      <script type="text/javascript" src="${base}/resources/pc/js/photocasebox.js"></script>
    </div>
    
    <p class="clear"></p>
    <script type="text/javascript" src="${base}/resources/pc/js/lazyload.js"></script>
    <script type="text/javascript" src="${base}/resources/pc/js/blog_yuyue.js"></script>
    <script type="text/javascript">
      jQuery(document).ready(function() {
        jQuery("img").lazyload({
          effect: "fadeIn",
          failurelimit: 10,
          threshold: 200
        });

        jQuery(".pageTag").hover(function() {
          jQuery(this).find('ul').show();
        },
        function() {
          jQuery(this).find('ul').hide();
        });
      });
    </script>
    <!-- 这是4个博客top的css -->
    <div id="bd_statistics"></div>
    <div id="out_footer">
      <!-- 尾部开始 -->
      <p class="cl clear"></p>
      <div id="sjb_footer_new">
        <div class="sjb_footer_new">
          <p class="clear"></p>
          <div class="sjb-link">
            <p class="our-links">
              <a href="${base}/resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
              <span class="link-devide">|</span>
              <a href="${base}/resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
              <span class="link-devide">|</span>
              <a href="" target="_blank" rel="nofollow">意见建议</a>
              <span class="link-devide">|</span>
              <a href="" target="_blank" rel="nofollow">帮助中心
              </a>
              <span class="link-devide">|</span>
              <a href="" target="_blank" rel="nofollow">使用条款</a>
            </p>
            <p class="statement">
              免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系。
            </p>
            <p class="sjs-icp">
              ©2012 百爪鱼-定制化装修设计服务平台, All Rights Reserved. (
              <a hidefocus="" href="http://www.miitbeian.gov.cn" rel="nofollow">
                	粤ICP备08125558号-2
              </a>
              )
            </p>
            <div class="auth-icons">
              <a href="http://szcert.ebs.org.cn/d6c3aa01-b00f-4d32-aef4-70ad63021bab"
              target="_blank" rel="nofollow" title="深圳市市场监督管理局企业主体身份公示" alt="深圳市市场监督管理局企业主体身份公示">
                <span class="gaj">
                </span>
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
    </div>
    <!-- 结束 -->
    <div id="small_window"></div>
    <script type="text/javascript">
      var jq = jQuery.noConflict();
      
    </script>
    <div class="none_f" id="goTop" style="display: block;">
      <a href="javascript:void(0);" class="make_designer" id="make_designer" onclick="return blog.sendReserveMsg(2090485)"></a>
      <a href="" target="_blank" class="my_collection" id="my_collection"></a>
      <a href="javascript:void(0)" class="backTop" id="backTop" onclick="backToTop()" style="display:none;"></a>
      <div class="pop_code" id="pop_code" style="display:none;">
        <div class="code_con">
          <span>
            <img alt="加百爪鱼为微信好友" width="173" height="173" src="http://img.shejiben.com/front_new/bg/collect_wx.gif"/>
          </span>
          <b>
            加百爪鱼为微信好友
          </b>
        </div>
      </div>
    </div>
    <input type="hidden" value="${memberId!0}" id="memberId"/>
  </body>
</html>
<script>
  uicheck();
  if (whoid) glog(whoid);

</script>