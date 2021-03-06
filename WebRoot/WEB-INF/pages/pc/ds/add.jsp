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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>上传作品 - 百爪鱼</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
     	<%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
        <link href="<%=basePath%>resources/pc/css/global.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath%>resources/pc/css/my_style.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath%>resources/pc/css/uploadify.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath%>resources/pc/css/userCenter.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath%>resources/pc/css/common.css" rel="stylesheet" type="text/css" />      
      
        <script type="text/javascript" src="<%=basePath%>resources/pc/js/common.js"></script>
       
        <script type="text/javascript">
	    	$(function() {
	    		// 初始化图片列表
	    		var $imageList = $("#imageList");
	    		$imageList.lImageList({
	    			data:[]
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
                                            <a href="designer-home.html" class="my">个人中心</a>
                                        </li>
                                        <li>
                                            <a href="designer-personal.html" class="my_index_ad">我的主页</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">我的派单</a>
                                        </li>
                                        <li>
                                            <a href="" class="jy">我的交易</a>
                                        </li>
                                        <li>
                                            <a href="designer-works.html" class="bj">我的作品</a>
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
                        
                        
                        <!--设计师中心 -->
                        <li class="cur" style="width:92px;">
                            <a >设计师中心
                                <span class="jt"></span>
                            </a>
                            <div class="sj_center" style="display:none;">
                                <ul>
                                    <li>
                                        <a href="order-home.html">接单大厅</a>
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
                    <a href="<%=basePath%>pc/index.action">
                        <div class="logo"></div>
                    </a>
                    <span>设计师中心</span>
                </div>
                <div class="ban_cont_right">
                    <ul>
                        <li class="cur">
                            <a href="designer-home.html">个人中心</a>
                        </li>
                        <li>
                            <a href="designer-index.html" target="_blank">我的主页</a>
                        </li>
                        <li>
                            <a href="order-home.html">
                                接单大厅
                            </a>
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
                <script src="<%=basePath%>/resources/pc/js/myUserCenter.js" type="text/javascript"></script>
                <!--内容开始 -->
                <form id="uploadForm" enctype="multipart/form-data" method="post" action="" class="properties">
                    <input type="hidden" value="6059221" id="cookieUid"/>
                    <input type="hidden" id="indentity" value="1" />
                    <input type="hidden" id="create_type" value="create-cate" />
                    <input type="hidden" name="imageid" class="imageid" value="" />
                    <input type="hidden" name="type" class="type" value="1" />
                    <div class="content">
                        <div class="product_upload">
                            <div class="tel">作品上传</div>
                            <div class="upload_info">
                                <div class="prod_name">
                                    <label>作品名称：</label>
                                    <input type="text" id="cate-name" class="cate-name" value="" />
                                </div>
                                <div class="prod_type">
                                    <label>作品分类：</label>
                                    <select name='kind' id='kind'>
                                        <option value='0' selected='selected'>选择分类</option>
                                        <option value='1'>住宅空间</option>
                                        <option value='2'>公共空间</option>
                                    </select>
                                    <select name="subkind" id="subkind">
                                        <option value="0">选择分类</option>
                                    </select>
                                    <select name="subsubkind" id="subsubkind">
                                        <option value="0">选择分类</option>
                                    </select>
                                    <select name='style' id='style'>
                                        <option value='-1' selected='selected'>选择网咖风格</option>
                                        <option value='0'>混搭网咖风格</option>
                                        <option value='2'>欧式网咖风格</option>
                                        <option value='4'>中式网咖风格</option>
                                        <option value='6'>新古典网咖风格</option>
                                        <option value='8'>东南亚网咖风格</option>
                                        <option value='9'>美式网咖风格</option>
                                        <option value='11'>田园网咖风格</option>
                                        <option value='12'>地中海网咖风格</option>
                                        <option value='15'>现代网咖风格</option>
                                        <option value='16'>简约网咖风格</option>
                                        <option value='17'>日式网咖风格</option>
                                        <option value='18'>宜家网咖风格</option>
                                        <option value='19'>北欧网咖风格</option>
                                        <option value='20'>简欧网咖风格</option>
                                        <option value='21'>LOFT网咖风格</option>
                                    </select>
                                </div>
                                <div class="prod_info">
                                    <label>项目信息：</label>
                                    <input type="text" placeholder="请填写项目面积" id="pro-area" maxlength="9" name="area"/>
                                    <em class="_01"> m²</em>
                                    <input type="text" placeholder="请填写项目造价（选填）" id="pro-price" maxlength="9" name="price" />
                                    <em class="_02">万元</em>
                                </div>
                                <div class="prod_desc">
                                    <label>作品描述：</label>
                                    <textarea id="cate-des" name="category_description"></textarea>
                                </div>
                                <div class="pict_upload">
                                    <label>上传图片：</label>
                                    <div id="uploadify"></div>
                                    <span class="chioces">按住ctrl键选择多张图片，单张图片10M以内。</span>
                                    <div id="newfileQueue" style="display:none;height:auto;background:#fff;"></div>
                                    <!--文件进度条容器-->
                                </div>
                                <DIV>
                                <tr>
				
					商品图片:
				<input type="hidden" id="imageList"/>
                                </DIV>
                                <div class="orig_promise">
                                    <label>原创承诺：</label>
                                    <input type="checkbox" id="cate-agree" />
                                    <span>我保证所上传的作品是由我自己创作，并非剽窃抄袭他人的作品，拥有自主的知识产权，</span>
                                    <p>如有侵权，我将承担一切版权纠纷责任。</p>
                                </div>
                                <div class="btne product_btn">
                                    <input type="button" class="btn_click" id="start_up" value="开始上传" />
                                    <input type="submit" name="submit_upload" style="display:none"/>
                                </div>
                            </div>
                        </div>
                        <div class="product_other">
                            <div class="get_gold">
                                <label>传作品赚金币</label>
                                <p>1、1000px宽以上高清实景或效果原创案例，有机会被
                                    <em>推荐到网站首页</em>
                                </p>
                                <p>2、原创案例被推荐，奖励
                                    <em>5</em>金币/张，无上限
                                </p>
                                <p>
                                    3、原创案例被下载奖励
                                    <em>1</em>
                                    金币，无上限
                                </p>
                            </div>
                            <div class="upload_tpl">
                                <label>
                                    请勿上传
                                </label>
                                <p>
                                    有广告性质的水印
                                </p>
                                <p>
                                    低质量的图片
                                </p>
                                <p>
                                    900像素的图片
                                </p>
                                <p>
                                    PDF、TIFF或EPS文件格式
                                </p>
                            </div>
                            <div class="sync" style="display:none">
                                <label>
                                    同步
                                </label>
                                <input type="checkbox" id="bindQQ" style="display:none" />
                                <input type="checkbox" id="bindSina" style="display:none" />
                            </div>
                        </div>
                    </div>
                </form>
                <!--内容结束 -->
                <script type="text/javascript" src="<%=basePath%>/resources/pc/js/uploadifyLang_en.js"></script>
                <script type="text/javascript" src="<%=basePath%>/resources/pc/js/jquery.uploadify.v3.0.0.min.js"></script>
                <script type="text/javascript" src="<%=basePath%>/resources/pc/js/upload.js"></script>
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
    </body>
</html>
<div class="dialog_bg"></div>
<!--遮罩层 -->
<!--上传作品提示 -->
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