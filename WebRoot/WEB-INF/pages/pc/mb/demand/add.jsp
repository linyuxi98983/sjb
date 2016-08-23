<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>需求添加</title>
   <link href="resources/web/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/web/datePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<link href="resources/web/css/jqModal.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/web/js/jquery.js"></script>
<script type="text/javascript" src="resources/pc/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="resources/web/js/jquery.tools.js"></script>
<script type="text/javascript" src="resources/web/js/jquery.validate.js"></script>
<script type="text/javascript" src="resources/web/js/jquery.jqDnR.js"></script>
<script type="text/javascript" src="resources/web/js/jqModal.js"></script>
<script type="text/javascript" src="resources/web/js/common.js"></script>
<script type="text/javascript" src="resources/web/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="resources/web/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="resources/web/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="resources/web/js/list.js"></script>
<script type="text/javascript" src="resources/web/js/input.js"></script>

    <script type="text/javascript" src="resources/web/js/goods.js"></script>
    <link href="resources/pc/css/global.css" rel="stylesheet" type="text/css" />
        <link href="resources/pc/css/my_style.css" rel="stylesheet" type="text/css" />
        <link href="resources/pc/css/uploadify.css" rel="stylesheet" type="text/css" />
        <link href="resources/pc/css/userCenter.css" rel="stylesheet" type="text/css" />
        <link href="resources/pc/css/common.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
        	.button_css{
        		width:100px;
        		height:30px;
        	}
        </style>
	<script type="text/javascript">
	$().ready(function() {
		// 初始化图片列表
		var $imageList = $("#imageList");
		$imageList.lImageList({
			data:[]
		});
		$("input[type=button]").addClass("button_css");
		
		
		$("#worksKind_radio").find("input[type=radio]").each(function(){
			$(this).on("change",function(o,v){
				if($(this).val()==1){
					$("#DESIGN_STYLE_SELECT").show();
					$("#HOUSE_TYPE_SELECT").hide();
				}else{
					$("#HOUSE_TYPE_SELECT").show();
					$("#DESIGN_STYLE_SELECT").hide();
				}
				
			});
			if($(this).prop("checked")){
				if($(this).val()==1){
					$("#DESIGN_STYLE_SELECT").show();
					$("#HOUSE_TYPE_SELECT").hide();
				}else{
					$("#HOUSE_TYPE_SELECT").show();
					$("#DESIGN_STYLE_SELECT").hide();
				}
			}
		})
		
		$("#start_up").on("click",function(){
			$("#inputForm").submit();
		});
	});
	</script>
  </head>
  
<body>
	<!--头部开始-->
        <div class="header">
            <div class="hea_top">
                <div class="hea_top_right">
                    <ul class="tp_node">
                        <li style="width:90px;" id="nav_login">
                            <span id="userName" class="name">
                                <a href="" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}" rel="1" hidefocus="">
                                    <span class="nick">设计师</span>
                                    <em class="downAdrrow"></em>
                                </a>
                                <div class="caozuo" id="caozuo" style="display:none;" onmouseover="$('bg').rel=2;" onmouseout="$('bg').rel=1;">
                                    <div class="redArrow"></div>
                                    <ul class="cz " id="cz">
                                        <li>
                                            <a href="pc/ds/index.action" class="my">个人中心</a>
                                        </li>
                                        <li>
                                            <a href="pc/designer/designer!personal.action" class="my_index_ad">我的主页</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">我的派单</a>
                                        </li>
                                        <li>
                                            <a href="" class="jy">我的交易</a>
                                        </li>
                                        <li>
                                            <a href="entityer-works.html" class="bj">我的案例</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">我的金币</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">我的余额</a>
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
                        <li class="po">
                            |
                        </li>
                        <!-- 申请定制设计 -->
                        <li class="dzsj">
                            <a href="" target="_blank">申请定制设计</a>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div>
        <!-- 个人中心主导航-->
        <div class="sjs_nav">
            <div class="banner_cont">
                <div class="ban_cont_left">
                    <a href="<%=basePath%>pc/index.action">
                        <div class="logo"></div>
                    </a>
                    <span>设计师中心</span>
                </div>
                <div class="ban_cont_right">
                    <ul>
                        <li class="cur">
                            <a href="pc/mb/index.action">个人中心</a>
                        </li>
                      
                    </ul>
                </div>
            </div>
        </div>
        <!--头部结束-->
        <div class="dmato"></div>
        <div class="content_width" id="content">
            <div class="content_width ">
                <script type="text/javascript">
                    blogcheck();
                    greet_text();
                    var token = "0";
                    var appid = "0";
                    var openid = "0";
                    var token_weibo = "0";
                </script>
                <!--内容开始 -->
                <form id="inputForm" action="pc/mb/demand/demand!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="发布需求" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			
			<tr>
				<th>
					称呼:
				</th>
				<td>
					<input type="text" name="entity.nickname" class="text"  value="<s:property value="entity.nickname"/>">
				</td>
			</tr>
			
			<tr>
				<th>
					手机号码:
				</th>
				<td>
					<input type="text" name="entity.phoneNo" class="text"  value="<s:property value="entity.phoneNo"/>">
				</td>
			</tr>			
			<tr>
				<th>
					<span class="required"></span>地区:
				</th>
				<td>
					<input type="hidden" class="lselect" lselectType="AREA_NODES" id="sysSpAreaId" name="entity.sysSpAreaId" value="<s:property value="entity.sysSpAreaId"/>"/>
				</td>
			</tr>
			<tr>
				<th>
					需求风格:
				</th>
			<td>
					<select class="select" value_path="name" name="entity.projectType" selectType="PROJECT_TYPE" selectvalue="<s:property value="entity.projectType"/>"></select>
				</td>
			</tr>	
			<tr>
				<th>
					项目面积:
				</th>
				<td>
					<input type="text" name="entity.areaSqm" class="text"  value="<s:property value="entity.areaSqm"/>">
				</td>
			</tr>	
			<tr>
				<th>
					设计预算:
				</th>
				<td>
					<input type="text" name="entity.budgetName" class="text"  value="<s:property value="entity.budgetName"/>">
				</td>
			</tr>	
			<tr>
				<th>
					预算最小值:
				</th>
				<td>
					<input type="text" name="entity.minAmt" class="text"  value="<s:property value="entity.minAmt"/>">
				</td>
			</tr>	
			<tr>
				<th>
					预算最大值:
				</th>
				<td>
					<input type="text" name="entity.maxAmt" class="text"  value="<s:property value="entity.maxAmt"/>">
				</td>
			</tr>	
			<tr>
				<th>
					指定设计师或机构:
				</th>
				<td>
					<select class="select" name="memberId" value_path="nickname" selectType="MEMBER" selectvalue="memberId" readonly="readonly"></select>
				</td>
			</tr>	
		</tbody></table>
		<table class="input">
			<tbody><tr>
				<th>&nbsp;
					
				</th>
				<td>
					<input type="submit" class="button" value="确 定">
					<input type="button" class="button" value="返 回" onclick="history.back(); return false;">
				</td>
			</tr>
		</tbody></table>
	</form>
                <!--内容结束 -->
            </div>
        </div>
        <p class="clear"></p>
        <bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
        <div id='messagebox'></div>
        <script type="text/javascript">
            //短信提示使用(asilas添加) 
            var divTop, divLeft, divWidth, divHeight, docHeight, docWidth, objTimer, i = 0;
            //鼠标悬浮在用户头像或者名称上面时显示用户信息
            showUserInfo();
        </script>
        <div id="small_window"></div>
        <div class="none_f" id="goTop" style="display: block;">
            <a href="" rel="nofollow" target="_blank" class="my_collection" id="my_collection"></a>
            <a href="" rel="nofollow" target="_blank" class="my_option"></a>
            <a href="javascript:void(0)" class="backTop" id="backTop" onclick="backToTop()" style="display:none;"></a>
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
	                             <a class="chouJ_button" href="javascript:;" onclick="" rel="nofollow">收藏本站</a>
	                         </td>
	                     </tr>
	                 </tbody>
	             </table>
	        </div>
        </div>
        <div style="display: none" id="bd_statistics">
            <script type="text/javascript">
                var Ttime = 0;
                checkCookie();
                var cookie_price = getCookie('to8to_cookie_price_sjs');
                //区分个人中心：个人中心不用弹广告
                var sjs_url = window.location.href;
                var sjs_url_num = sjs_url.indexOf('?');
                if (sjs_url_num == -1) {
                    popup_sjs = sjs_url;
                } else {
                    popup_sjs = sjs_url.substr(0, sjs_url_num);
                }

                if (typeof jQuery === 'function' && to8to_ind == 'sjs' && !cookie_price && popup_sjs.indexOf('http://www.shejiben.com/my') == -1) {
                }

                function AddFavorite(sURL, sTitle) {
                    addfavorite(sURL, sTitle);
                }

                $('make_jb').onmouseover = function() {
                    clearTimeout(Ttime);
                    $("new_active").style.display = ''; //光标经过
                }

                $('make_jb').onmouseout = function() {
                    Ttime = setTimeout(closeActive, 100);
                };

                $('new_active').onmouseover = function() {
                    clearTimeout(Ttime);
                    $('new_active').onmouseout = function() {
                        Ttime = setTimeout(closeActive, 100);
                    }
                }

                function closeActive() {
                    $("new_active").style.display = 'none';
                }
            </script>
    	</div>
        <p class="cl"></p>
	    <!--版权等-->
	    <div class="wrap wrap_cppyright">
	      <div class="cppyright_content">
	        <div class="string clear"></div>
	        <ul>
	           <li>
                <a href="resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
              </li>
              <li>
                <a href="resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
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
	        <p class="statement">免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其案例情形，请及时与本站联系。</p>
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
    </body>
</html>
<div class="dialog_bg"></div>
<!--遮罩层 -->
<!--上传案例提示 -->
<div class="qd_suc upload_product_tpl">
    <div class="title">
        <label>
            上传失败提示
        </label>
        <span class="close">
        </span>
    </div>
    <div class="cont">
        <div id="noticeMes">
        </div>
        <div class="btne">
            <input type="button" class="btn_click" onclick="closeNoticeBox()" value="确定"/>
        </div>
    </div>
</div>
</body>
</html>
