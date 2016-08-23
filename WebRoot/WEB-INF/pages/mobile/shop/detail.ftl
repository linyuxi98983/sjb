<!DOCTYPE html>
<html class="">
    <head>
        <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "商铺详情页面"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/common.css"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/product.css"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/shop-detail.css"/>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/underscore.min.js"></script>
        <script src="${base}/resources/mobile/js/iscroll5.min.js"></script>
        <script src="${base}/resources/mobile/js/fastclick.min.js"></script>
        <script src="${base}/resources/mobile/js/common.min.js"></script>
        <script src="${base}/resources/mobile/js/shop-detail.js"></script>
        <script src="${base}/resources/mobile/js/shop.js"></script>
        <script src="${base}/resources/mobile/js/search.js" type="text/javascript"></script>
        <script type="text/javascript">
	    	$().ready(function(){
				shopGoodsListInit();
	    	});
	    </script>
    </head>
    <body class="defwidth">
    	<input type="hidden" id="curr_page" value="1"/>
    	<input type="hidden" name="id" value="${id!}"/>
    	<@footer title="商铺详情"/>
        <!-- 轮播开始 -->
        <div id="bigpic">
            <div id="cell">
                <section class="turn">
                    <section id="slider">
                        <ul class="top-slider" style="width:${(entity.picList?size)*100}%;">
                            <#if (entity.picList?exists && entity.picList?size > 0)>
                            <#list entity.picList as pic>
                           	<li style="width:${100/entity.picList?size}%">
                                <a href="${pic.url!}">
                                    <img src="${pic.imagePath!}">
                                </a>
                            </li>
                            </#list>
                            </#if>
                        </ul>
                        <div class="dot">
                            <ul>
                            	<#if (entity.picList?exists && entity.picList?size > 0)>
                                <#list entity.picList as pic>
                                <li class="<#if 0 == pic_index>on</#if>"></li>
                                </#list>
                                </#if>
                            </ul>
                        </div>
                    </section>
                </section>
            </div>
        </div>
        <!-- 轮播结束 -->
        <!-- 详情区域开始 -->
        <section class="detail">
            <div class="left">
                <b>${entity.name!}</b>
            </div>
            <div class="right">
                <ul>
                	<li class="call"><a>联系客服</a></li>
                    <li class="fav" objectId="${entity.id!}"><a>收藏</a></li>
                </ul>
            </div>
            <article>${entity.address!}</article>
        </section>
        <!-- 详情区域结束 -->
        <section class="option">
        	<nav class="review_nav">
                <ul class="clearfix">
                    <li id="shop-list" class="on">
                        <a href="javascript:void(0)"><span>商品</span></a>
                    </li>
                    <li id="shop-desc" class="">
                        <a href="javascript:void(0)"><span>简介</span></a>
                    </li>
                </ul>
            </nav>
            <!-- 商店 -->
            <div class="shop-list"></div>
            <section class="load">
                <img src="${base}/resources/mobile/images/loadingA.gif">
                <span>加载中</span>
            </section>
           	<!-- 简介 -->
           	<div class="shop-desc">
       			${entity.details!}
           	</div>
		</section>
        <footer class="footer new">
            <section class="status-bar">
                <div class="actions-wrap">
                    <a href="${url_login!}">登录</a>
                    <a href="${url_register!}">注册</a>
                </div>
                <a class="top" href="javascript:scrollTo(0,0);">TOP</a>
            </section>
            <nav class="b-nav">
                <p>
                    <a href="" ontouchstart="">提建议</a>
                    <a href="" ontouchstart="">帮&nbsp;&nbsp;助</a>
                </p>
            </nav>
            <section class="copyright"><p><@spring "global.project.copyright"/></p></section>
        </footer>
    </body>
</html>