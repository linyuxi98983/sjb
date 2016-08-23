<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>个人中心-设计机构</title>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <#include "/WEB-INF/ftl/pc/pager.ftl"/>
        <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/pc/css/my_style.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css"/>
        <script src="${base}/resources/pc/js/jquery.js" type="text/javascript"></script>
        <script src="${base}/resources/pc/js/list.js" type="text/javascript"></script>       
        <script type="text/javascript">var jq = jQuery.noConflict();</script>
        <script src="${base}/resources/pc/js/common.js" type="text/javascript"></script>
        
        <script type="text/javascript">
        
        	jq(function(){
        	
        		//alert('${member}');
        	});
        </script>
    </head>
    
    <body>
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
        <!--头部开始-->
        <div class="header">
            <div class="hea_top">
                <div class="hea_top_right">
                    <ul class="tp_node">
                        <li style="width:90px;" id="nav_login">
                            <span id="userName" class="name">
                                <a href="" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}" rel="1" hidefocus="">
                                    <span class="nick">设计机构</span><span> | <a href="${base}/pc/login/login!clean.action">退出</a></span>
                                    <em class="downAdrrow"></em>
                                </a>
                                <div class="caozuo" id="caozuo" style="display:none;" onmouseover="$('bg').rel=2;" onmouseout="$('bg').rel=1;">
                                    <div class="redArrow"></div>
                                    <ul class="cz " id="cz">
                                        <li>
                                            <a href="${base}/pc/org/index.action" class="my">个人中心</a>
                                        </li>
                                        <li>
                                            <a href="${base}/pc/designer/designer!personal.action" class="my_index_ad">我的主页</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">我的派单</a>
                                        </li>
                                        <li>
                                            <a href="" class="jy">我的交易</a>
                                        </li>
                                        <li>
                                            <a href="${base}/pc/org/case/case!list.action" class="bj">我的案例</a>
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
                        <!--设计机构 -->
                        <li class="cur" style="width:92px;">
                            <a>设计机构
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
                        <div class="logo"></div>
                    </a>
                    <span>设计机构</span>
                </div>
                <div class="ban_cont_right">
                    <ul>
                        <li class="cur">
                            <a href="${base}/pc/org/index.action">个人中心</a>
                        </li>
                        <li>
                            <a href="${base}/pc/designer/designer!personal.action" target="_blank">我的主页</a>
                        </li>
                        <li>
                            <a href="${base}/pc/designer/designer!home.action">
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
                    var token = "";
                    var appid = "";
                    var openid = "";
                    var token_weibo = "";
                </script>
                <div class="menu_bar">
                    <div class="menu_list menu_list_last">
                        <p>交易管理</p>
                        <ul>
                            <li>
                                <a href="${base}/pc/org/appointment/appointment!list.action" target="_parent">我收到的预约</a>
                            </li>
                            <li>
                                <a href="${base}/pc/org/demand/demand!list.action?state=1" target="_parent">我收到的派单</a>
                            </li>
                            <li>
                                <a href="${base}/pc/org/demand/demand!list.action?state=4" target="_parent">我的签单项目</a>
                            </li>
                        </ul>
                        <div class="string_1"></div>
                    </div>
                    <div class="menu_list">
                        <p>主页管理</p>
                        <ul>
                            <li>
                                <a href="${base}/pc/org/case/case!list.action" target="_parent">我的案例</a>
                            </li>
                        </ul>
                        <div class="string_1"></div>
                    </div>
                    <div class="menu_list">
                        <p>我的帐号</p>
                        <ul>
                            <li>
                                <a href="${base}/pc/org/info/info!edit.action" target="_parent">个人资料</a>
                            </li>
                            <li>
                                <a href="${base}/pc/org/info/info!toChangePwd.action">帐号设置</a>
                            </li>
                        </ul>
                    </div>
                    <p class="clear"></p>
                </div>
                <!--end side_menu-->
                <script src="${base}/resources/pc/js/myUserCenter.js" type="text/javascript"></script>
                <script type="text/javascript">
                    function tzzbxmtc_close() {
                        document.getElementById("zxgsht_tzzbxmtc").style.display = "none";
                        setCookies("to8to_zxgsht_tzzbxmtc", 1)
                    }

                    function setCookies(name, value) {
                        var Days = 30;
                        var exp = new Date();
                        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
                        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();

                        var strsec = getsec(time);
                        var exp = new Date();
                        exp.setTime(exp.getTime() + strsec * 1);
                        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
                    }

                    function clickDX(zid) {
                        var url = 'http://www.shejiben.com/pms.php?act=1&adds=9';
                        var oJsLoader = new jsLoader();
                        oJsLoader.onsuccess = function() {
                            editPhotoCat(url, '短消息', 680, 515);
                        }
                        oJsLoader.load('/gb_js/popup.js');
                        return false;
                    }
                </script>
                <link rel="stylesheet" href="${base}/resources/pc/css/designer_center.css"/>
                <div class="content">
                    <div class="user_msg">
                        <div class="msg_detail">
                            <dl>
                                <dd class="head">
                                    <a id="head_photo" href="" class="img_mark">
                                        修改头像
                                    </a>
                                    <img src="${entity.imagePath!}" style="width:70px;height:70px;" onerror="this.src='${entity.imagePath!}'"/>
                                </dd>
                                <dd class="msg">
                                    <span class="top">
                                        <p class="name">
                                            <label>
                                                <a href="" target="_blank">${entity.nickname!}</a>
                                            </label>
                                        </p>
                                    </span>
                                    <span class="clear">
                                    </span>
                                    <span class="mid">
                                        身份类型：设计机构
                                    </span>
                                    <span class="bottom">
                                        <label>账号绑定：</label>
                                        <ul class="light_icon">
                                            <li class="light_01">
                                                <div class="state state_01">
                                                    <div class="detail">
                                                        <p>你已绑定手机${entity.phoneNo}</p>
                                                        <a href="">管理</a>
                                                    </div>
                                                    <div class="border_bottom"></div>
                                                </div>
                                            </li>
                                            <li class="li_02">
                                                <div class="state state_02">
                                                    <div class="detail">
                                                        <p>你还未绑定邮箱</p>
                                                        <a href="">去绑定</a>
                                                    </div>
                                                    <div class="border_bottom"></div>
                                                </div>
                                            </li>
                                            <li class="li_03">
                                                <div class="state state_03">
                                                    <div class="detail">
                                                        <p>你还未绑定QQ号码</p>
                                                        <a href="">去绑定</a>
                                                    </div>
                                                    <div class="border_bottom"></div>
                                                </div>
                                            </li>
                                            <li class="li_04">
                                                <div class="state state_04">
                                                    <div class="detail">
                                                        <p>你还未绑定新浪微博</p>
                                                        <a href="">去绑定</a>
                                                    </div>
                                                    <div class="border_bottom"></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </span>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="notice">
                        <span>
                        </span>
                        <p>
                           
                                您收到的系统指派！
                           
                        </p>
                    </div>
                    <div style="background:#fff;height:300px;font:12px;">
                    <table>
                    <tr>
                    	<th>标题</th> 
                    </tr>
                  <#list demandList as demand>
                  	<div>
                  		<tr>
	                  		<td style="padding:5px;">
	                  			<a href="${base}/pc/org/demand/demand!list.action?state=1">系统指派${demand.phoneNo!}需求【${demand.title}】,请点击查看</a>
	                  		</td>
	                  		<td>
	                  			
	                  		</td>
                  		</tr>
                  	
                  	</div>
                  </#list>
                  </table>
                  </div>
	        </div>
	    </div>
	    <!--版权等 End-->
    </body>
</html>