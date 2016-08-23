<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <#include "/WEB-INF/ftl/pc/header.ftl"/>
    <title>帐号管理中心—会员帐号登陆注册中心</title>
    <link href="${base}/resources/pc/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.min.js"></script>   
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.cookie.js"></script>  
    <script type="text/javascript">
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    </script>
    <script src="${base}/resources/pc/js/sea.js" type="text/javascript"></script>
    <script type="text/javascript">

      seajs.config({
        alias: {
          'jquery': '${base}/resources/pc/js/jquery_module.js',
          //jquery version must be 1.7x
          'common': '${base}/resources/pc/js/main.js',
          'form': '${base}/resources/pc/js/module.form.js',
          'ui': '${base}/resources/pc/js/module.ui.js',
          'jq':'${base}/resources/pc/js/jquery.min.js',
          'cookie':'${base}/resources/pc/js/jquery.cookie.js',
          'colorbox': '${base}/resources/pc/js/jquery.colorbox.min.js'
        },
        preload: ['jquery','jq','cookie', 'common'] //预加载jquery和main.js
      });
      
      
    </script>
    <style>
      .meg-error{width: 250px;height: 27px;border: 1px solid #faafaf;margin-top:
      10px;background-color: #ffeded !important;border-radius: 3px;display:none;}
      .meg-error span{width: 14px; height: 14px;background:url(http://img.shejiben.com/front_new/bg/login_conf.gif)
      no-repeat -114px -51px;display: block;float: left;margin: 6px 5px;} .meg-error
      p{margin-top: 0px;font-size: 12px;line-height: 27px;}
    </style>
  </head>
  
  <body>
    <div class="header">
      <div class="header_login">
        <a href="${base}/pc/index.action">
          <div class="web-logo header-logo"></div>
        </a>
        <div class="header-text">欢迎登录</div>
      </div>
    </div>
    <div class="center">
      <div class="center_login">
        <div class="center_content">
          <div class="center_photo"></div>
          <div class="center_form">
            <div class="tab_name">
              <ul>
                <li class="">帐号登录</li>
              </ul>
            </div>
            <div class="login_wrap">
              <div class="tab_content tab_content_weixin" style="display: none;">
                <!-- 微信二维码 -->
                <div class="weixin_login_code">
                  <span class="icon_code">
                    <img src="https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGQ7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2lYVTZmeGJsTUFaSmVZbldwVnR3AAIEfIoVVwMELAEAAA=="/>
                    <em class="icon_logo"></em>
                  </span>
                </div>
                <!-- 登录帮助 -->
                <div class="weixin_login_bottom">
                  <span class="tishi">微信扫码 快速登录</span>
                  <div class="help">
                    <a href="javascript:void(0);">使用帮助</a>
                    <!-- 微信登录使用帮助 -->
                    <div class="weixin_login_help">
                      <img src="http://img.shejiben.com/front_new/account/weixin_login_help.jpg"/>
                    </div>
                  </div>
                </div>
                <!-- 错误提示 -->
                <div class="weixin_login_msg weixin_login_msg_error" style="display:none;">
                  <em class="icon icon_error"></em>
                  <span class="status">
                    <p>二维码失效</p>
                    	请点击
                    <a href="javascript:void(0);" class="refresh_code">刷新二维码</a>
                  </span>
                </div>
                <!-- 成功提示 -->
                <div class="weixin_login_msg weixin_login_msg_success" style="display:none;">
                  <em class="icon icon_success"></em>
                  <span class="status">
                    <p>扫描成功</p>
                    	请在手机上确认登录
                  </span>
                </div>
              </div>
              <div class="tab_content tab_content_account" style="">
                <form action="#" method="post" autocomplete="off">
                  <input type="text" style="display:none;"/>
                  <input type="password" style="display:none;"/>
                  <ul>
                    <li>
                      <input type="text" name="username" id="username" class="inputText" placeholder="请输入手机" autocomplete="off"/>
                    </li>
                    <li>
                      <div class="meg-error" id="error">
                        <span></span>
                        <p class="error-content" id="error-content">请输入帐号和密码</p>
                      </div>
                    </li>
                    <li>
                      <input type="password" name="password" id="password" class="inputText" placeholder="请输入您的密码" autocomplete="off"/>
                    </li>
                    <li>
                      <div class="meg-error" id="error2">
                        <span></span>
                        <p class="error-content" id="error-content2">请输入帐号和密码</p>
                      </div>
                    </li>
                    <li class="input-pass">
                      <input type="checkbox" id="rememberUser" checked=""/>
                      <label>下次自动登录</label>
                      <a href="${base}/pc/register/register.action" target="_blank">未注册？</a>
                    </li>
                  </ul>
                  <input type="button" class="btn submit_button" id="smt" value=" 立即登录"/>
                  <input type="hidden" name="referer" id="referer" value=""/>
                  <input type="hidden" name="httpreferer" id="httpreferer" value=""/>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      seajs.use('${base}/resources/pc/js/login.js');      
    </script>
    <div id="small_window"></div>
    <p class="cl"></p>
    <div id="sjb_footer_new">
      <div class="sjb_footer_new">
        <div class="sjb-link">
          <p class="our-links">
            <a href="resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
            <span class="link-devide">|</span>
             <a href="resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
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
            <a href="" target="_blank" rel="nofollow" title="" alt="">
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
    <form action="" method="post" target="frm_dealer" id="frm_dealer_form">
      <input type="hidden" id="clickValId" name="key" value=""/>
    </form>
    <iframe frameborder="0" height="0" name="frm_dealer" id="clsIframe"></iframe>
  </body>
</html>