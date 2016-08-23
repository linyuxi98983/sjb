<!DOCTYPE html>
<html>
    <head>
    	 <#include "/WEB-INF/ftl/shop/header.ftl"/>
		<@header "登录"/>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
        <meta http-equiv="X-UA-Compatible" content="IE=11; IE=10; IE=9; IE=8; IE=7; IE=EDGE">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta name="format-detection" content="telphone=no, email=no">
        <!-- 启用360浏览器的极速模式(webkit) -->
        <meta name="renderer" content="webkit">
        <!-- 避免IE使用兼容模式 -->
        <meta name="HandheldFriendly" content="true">
        <link rel="stylesheet" type="text/css" href="../../resources/shop/css/base.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/shop/css/common.css"/>
        <script type="text/javascript" src="../../resources/mobile/js/util.js"></script>
        <script type="text/javascript" src="../../resources/shop/js/jquery.js"></script>
        <script type="text/javascript" src="../../resources/shop/js/common.js"></script>
        <script>
        	function loginAction(){
        		if($("#username").val() == ""){
        			alert("用户名为空，请输入");
        			return;
        		}
        		if($("#password").val() == ""){
        			alert("密码为空，请输入");
        			return;
        		}
        		var url = "../../shop/login/login!login.action";
        		$.ajax({
					url: url,
					type: "POST",
					async:false,
					data:{
					"username":$("#username").val(),
					"password":$("#password").val()
					},
					dataType: "json",
					cache: false,
					success: function(data) {
						if(data.success){
							window.location.href="../../shop/member/home.action";
						}else{
							alert(data.msg);
						}
					}
				});
        	}
        </script>
    </head>
    <body class="common">
		<!-- 顶部栏 -->
		<div class="preheader clearfix">
             <div class="container">
                 <span class="pull-left">
                     您好Wind，欢迎来到<b> 城光荟</b>
                 </span>
                 <div class="pull-right">
                     <ul class="nav-pills">
                         <li><a href="">登录</a></li>
                         <li class="spacer">|</li>
                         <li><a href="" class="text ui-lightness">免费注册</a></li>
                         <li><a href="">会员中心</a></li>
                         <li class="spacer">|</li>
                         <li>
                         	<a href="">我的购物车</a>
                         </li>
                         <li class="spacer">|</li>
                         <li><a href="">我的收藏</a></li>
                         <li class="spacer"></li>
                     </ul>
                 </div> 
             </div>
        </div>
		<header class="header-wrap">
            <div class="header header-w">
                <div style="height:140px;overflow:hidden">
                	<h1 class="logo">
	                    <a href="/">
	                        <img src="../../resources/shop/images/header_logo.png" alt="城光荟" style="margin-top:12px">
	                    </a>
                	</h1>
                	<div class="search-wrap fl ld">
	                    <div class="search">
	                        <input class="search-txt" type="text" name="keyword" id="keyword" autocomplete="off" value="" placeholder="您需要什么？">
	                        <input class="search-btn" type="submit" value="搜 索" onclick="if($(&quot;input[name=keyword]&quot;).val()!=&quot;&quot;){window.location.href=&quot;/Search/seek/keyword/&quot;+$(&quot;input[name=keyword]&quot;).val();}">
	                    </div>
	                    <script type="text/javascript">
	                        $('#keyword').keydown(function(e) {
	                            var kw = $('#keyword').val();
	                            if (e.keyCode == 13) {
	                                if (kw != '') {
	                                    window.location.href = "/Search/seek/keyword/" + kw;
	                                    return false;
	                                }
	                            }
	                        });
	                    </script>
	                </div>
                </div>
                <div class="navbar navbar-inverse navbar-static-top">
	                <div class="navbar-inner">
	                    <div class="container">
	                        <div class="nav-collapse collapse">
	                            <ul class="navigation">
	                             
	                            	<li class="all"><a class="switch-off" href="javascript:void(0)">所有分类</a></li>
	                            	<li class="on"><a href="">首页</a></li>
	                                <li><a href="">限时抢购</a></li>
	                            	<!-- 分类下拉开始 -->
	                            	<div class="in-top-b">
	                        			<div class="top-nav">
			                            	<div class="sub-nav" id="sortList" style="display: none">
										        <ul>
										            <li class="menus1">
										                <div class="xl">
										                    <a href="" title="电器">电器</a>
										                </div>
										                <div class="dorpmenu sub-menu1">
										                    <div class="dorpmenubj">
										                        <!--子类内容-->
										                        <div class="dorpmenu-left">
										                            <dl>
										                                <dt><a href="">家庭家电</a></dt>
										                                <dd><a href="">电风扇</a></dd>
										                                <dd><a href="">空调</a></dd>
										                                <dd><a href="">洗衣机</a></dd>
										                            </dl>
										                            <dl>
										                                <dt><a href="">厨房家电</a></dt>
										                                <dd><a href="">电饭锅</a></dd>
										                                <dd><a href="">电磁炉</a></dd>
										                                <dd><a href="">电饭煲</a></dd>
										                            </dl>
										                            <dl>
										                                <dt><a href="">其他家电</a></dt>
										                                <dd><a href="">吹风筒</a></dd>
										                                <dd><a href="">电热毯</a></dd>
										                            </dl>
										                        </div>
										                       
										                    </div>
										                </div>
										            </li>
										            <li class="menus2">
										                <div class="xl">
										                    <a href="" title="零食">零食</a>
										                </div>
										                <div class="dorpmenu sub-menu2">
										                    <div class="dorpmenubj">
										                        <!--子类内容-->
										                        <div class="dorpmenu-left">
										                            <dl>
										                                <dt><a href="">儿童零食</a></dt>
										                                <dd><a href="">棒棒糖</a></dd>
										                                <dd><a href="">冰棍</a></dd>
										                                <dd><a href="">甜筒</a></dd>
										                            </dl>
										                            <dl>
										                                <dt><a href="">大人零食</a></dt>
										                                <dd><a href="">苹果</a></dd>
										                                <dd><a href="">水梨</a></dd>
										                                <dd><a href="">橡胶</a></dd>
										                            </dl>
										                            <dl>
										                                <dt><a href="">其他零食</a></dt>
										                                <dd><a href="">山楂片</a></dd>
										                                <dd><a href="">薯片</a></dd>
										                            </dl>
										                        </div>
										                    </div>
										                </div>
										            </li>
										        </ul>
										    </div>
			                        	</div>
			                    	</div>
	                            	<!-- 分类下拉结束 -->
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
       	</header>
       	
        <div class="w clearfix" style="width:990px">
            <div class="login-wrap">
                <div class="m-banner-1 fl">
                    <img src="http://img.xqkd.net/Uploads/banners/20141230/54a248769b4c0.png"
                    alt="登录页图片" />
                </div>
                <div class="fr">
                    <div class="m-form register-form m-form-block m-form-login">
                        
                            <fieldset>
                                <h3>
                                    登录
                                </h3>
                                <div class="formitm">
                                    <label class="lab">手机号码</label>
                                    <div class="ipt">
                                        <i class="ic-login-phone"></i>
                                        <input type="text" class="u-ipt" name="username" placeholder="请输入您的手机号码" value="" id="username"/>
                                        <p class="u-ipt-warn"></p>
                                        <span class="domain"></span>
                                    </div>
                                </div>
                                <div class="formitm">
                                    <label class="lab">密码</label>
                                    <div class="ipt">
                                        <i class="ic-login-password"></i>
                                        <input type="password" class="u-ipt" id="password" name="password" placeholder="请输入您的密码"/>
                                        <p class="u-ipt-warn"></p>
                                    </div>
                                </div>
                                <div class="formitm mt10" >
                                    <input type="button" class="btn btn-long" value="登&nbsp;&nbsp;录" onclick="loginAction()"/>
                                </div>
                                <div class="formitm tar">
                                    <a href="">忘记密码?</a>
                                    <a href="">注册</a>
                                </div>
                            </fieldset>
                        
                    </div>
                </div>
            </div>
        </div>   
        <footer class="footer">
            <div class="header-w">
                <div class="footer-line"></div>
                <div class="footer-links">
                    <ul>
                        <li class="frist-link">
                            <a href="" target="_blank">关于我们</a>
                        </li>
                        <li>
                            <a href="" target="_blank">售后服务</a>
                        </li>
                        <li>
                            <a href="" target="_blank">新手上路</a>
                        </li>
                    </ul>
                </div>
                <div class="footer-copyright">
                    Copyright© 城光荟 2014-2015， All Rights Reserved-
                </div>
                <a href="">
                    <img border="0" src="http://img.webscan.360.cn/status/pai/hash/21e7dcdf81353edef47d8376732d8fef/?size=74x27">
                </a>
            </div>
        </footer> 
    </body>
</html>