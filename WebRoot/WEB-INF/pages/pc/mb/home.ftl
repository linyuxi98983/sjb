<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>个人中心-业主</title>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/pc/css/my_style.css" rel="stylesheet" type="text/css"/>
        <link href="${base}/resources/pc/css/common.css" rel="stylesheet" type="text/css"/>
        <script src="${base}/resources/pc/js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript">var jq = jQuery.noConflict();</script>
        <script src="${base}/resources/pc/js/common.js" type="text/javascript"></script>
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
                                    <span class="nick">业主</span>
                                    <em class="downAdrrow"></em>
                                </a>
                                <div class="caozuo" id="caozuo" style="display:none;" onmouseover="$('bg').rel=2;" onmouseout="$('bg').rel=1;">
                                    <div class="redArrow"></div>
                                    <ul class="cz " id="cz">
                                        <li>
                                            <a href="pc/mb/index.action" class="my">个人中心</a>
                                        </li>
                                        <li>
                                            <a href="" class="my_index_ad">我的主页</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">我的派单</a>
                                        </li>
                                        <li>
                                            <a href="" class="jy">我的交易</a>
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
                            <a href="${base}/pc/designer/designer!apply.action" target="_blank">申请定制设计</a>
                        </li>
                        <li class="po">
                            |
                        </li>
                        <!--客服服务 -->
                        
                        <!--业主中心 -->
                       
                        <li class="po">
                            |
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
                    <span>业主中心</span>
                </div>
                <div class="ban_cont_right">
                    <ul>
                        <li class="cur">
                            <a href="${base}/pc/mb/index.action">个人中心</a>
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
        <div class="content_width" id="content" style="height:500px;">
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
                                <a href="${base}/pc/mb/appointment/appointment!list.action" target="_parent">我的预约咨询</a>
                            </li>
                            <li>
                                <a href="${base}/pc/mb/demand/demand!list.action?state=0" target="_parent">我发布的需求</a>
                            </li>
                            <li>
                                <a href="${base}/pc/mb/demand/demand!list.action?state=4" target="_parent">我的签单项目</a>
                            </li>
                        </ul>
                        <div class="string_1"></div>
                    </div>
                  
                    <div class="menu_list">
                        <p>我的帐号</p>
                        <ul>
                            <li>
                                <a href="${base}/pc/mb/info/info!edit.action" target="_parent">个人资料</a>
                            </li>
                            <li>
                                <a href="${base}/pc/mb/info/info!toChangePwd.action">帐号设置</a>
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
                                        身份类型：业主
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
                            <a href="" target="_blank">
                                
                            </a>
                        </p>
                    </div>
                    <div class="new_list">
                       <!-- <div class="title">
                            <p>等待你回答</p>
                            <a href="" target="_blank">查看更多 &gt;</a>
                        </div>
                        <ul>
                            <li>
                                <span>
                                    2小时前
                                </span>
                                <a href="" target="_blank">儿童房用哪个卧室好一点</a>
                            </li>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    木地板应该怎么挑选？北方适不适合？环保吗？
                                </a>
                            </li>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    简约网咖风格的木门有哪些品牌，价位一般在多少钱？
                                </a>
                            </li>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    厨房推拉门一般用什么材质的，价位一般在多少钱？
                                </a>
                            </li>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    金属烤漆门板 20石英石台面 百隆的五金 18柜体！价位大致
                                </a>
                            </li>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    请问下砖墙の效果怎么做的啊？
                                </a>
                            </li>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    墙砖开裂是因为质量差，还是由于留缝小了
                                </a>
                            </li>
                            <li>
                                <span>
                                    5小时前
                                </span>
                                <a href="" target="_blank">
                                    这样的工业风墙面怎么做出来
                                </a>
                            </li>
                        </ul>-->
                    </div>
                    <div class="new_list right">
                        <!--<div class="title">
                            <p>
                                最新设计项目
                            </p>
                            <a href="" target="_blank">
                                查看更多 &gt;
                            </a>
                        </div>
                        <ul>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    上海金山区98平住宅设计
                                </a>
                            </li>
                            <li>
                                <span>
                                    4小时前
                                </span>
                                <a href="" target="_blank">
                                    河南南阳800平托管机构效果图设计
                                </a>
                            </li>
                            <li>
                                <span>
                                    5小时前
                                </span>
                                <a href="" target="_blank">
                                    上海金山区98平住宅设计
                                </a>
                            </li>
                            <li>
                                <span>
                                    5小时前
                                </span>
                                <a href="" target="_blank">
                                    云南昆明87平住宅设计
                                </a>
                            </li>
                            <li>
                                <span>
                                    6小时前
                                </span>
                                <a href="" target="_blank">
                                    四川成都230平服装店设计
                                </a>
                            </li>
                            <li>
                                <span>
                                    6小时前
                                </span>
                                <a href="" target="_blank">
                                    广东深圳福田区70平进口商品展厅设计
                                </a>
                            </li>
                            <li>
                                <span>
                                    8小时前
                                </span>
                                <a href="" target="_blank">
                                    北京通州区150平美甲店设计
                                </a>
                            </li>
                            <li>
                                <span>
                                    10小时前
                                </span>
                                <a href="" target="_blank">
                                    四川成都167平精装房软装设计
                                </a>
                            </li>
                        </ul>-->
                    </div>
                </div>
                <div class="clear"></div>
                <script src="${base}/resources/pc/js/jquery.colorbox.min.js" type="text/javascript"></script>
            </div>
        </div>
        <p class="clear"></p>
        <bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
        <div id="messagebox"></div>
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