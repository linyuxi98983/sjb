<!-- 单列列表-->
﻿<!DOCTYPE html>
<html class="search-page">
    <head>
        <head>
       <#include "/WEB-INF/ftl/mobile/header.ftl"/>
       <@header "商品"/>
        <link rel="stylesheet" href="${base}/resources/mobile/css/app.css"/>
        <script>
            var proxyAssets = "";
            var pageUrl = location.href;
            var searchUrl = pageUrl.slice(0, pageUrl.lastIndexOf("/") + 1);
        </script>
    </head>
    <body>
        <section class="_pre">
            <!-- 搜索框 -->
            <header id="head_search_box" dd_name="结果页头部">
                <div class="search_header">
                    <a href="javascript:history.back();" class="back search_back" id='search_back' dd_name="返回">
                    </a>
                    <div class="search">
                        <form id="search_form" dd_name="搜索部分" method="get" action='' target="_parent"
                        onsubmit="return false">
                            <div class="text_box" name="list_search_text_box" dd_name="搜索框" onclick="return 1;">
                                <input id="_keyword" name="key" type="text" placeholder="搜索你想要的"
                                class="text" value="" />
                            </div>
                            <input type="hidden" value="cf3019a62f8f808f1708ba8a170be371" name="sid">
                            <input type="submit" value="" class="submit" id="list_search_submit" dd_name="提交">
                        </form>
                    </div>
                   <a id="goods_list_type" class="goods_list_two"></a>
                </div>
            </header>
            <section id="suggest_box">
                <div class="search_list" style="display: none;"></div>
                <div class="shadow_box" style="display: none;"></div>
            </section>
            <div style="height:47px;" class="empty_div">
                &nbsp;
            </div>
            <section cite="0" dd_name="你是不是想找" id="hot_search" class="hot_search">
                <ul class="clearfix"></ul>
            </section>
            <!-- 排序 -->
            <section class="filtrate_term" id="product_sort" dd_name="商品排序">
                <ul>
                    <li class="on"><a name="list_sort_index">默认</a></li>
                    <li class=""><a name="list_sort_sales">销量</a></li>
                    <li class=""><a name="list_sort_score">好评</a></li>
                    <li class="">
                        <a name="list_sort_price">价格
                           
                        </a>
                    </li>
                    <li class=""><a class="filtrate list_sort_date" name="list_sort_date">筛选</a></li>
                </ul>
            </section>
            <!-- result -->
            <section class="goods_list" id="goods_list" name="goods_list" dd_name="商品列表">
                <input type="hidden" value="0" id="scrolltop" name="scrolltop" />
                <div class="clearfix">
                    <ul>
                       <!-- 一行一列商品 -->
                       <#if list?exists>
	                   <#list list as goods>
	                   		<li style="width:100%;border-bottom:1px solid #D7D7D7">
		                    	<table style="width:100%">
		                    		<tr>
		                    			<td valign=top style="width:35%">
		                    				<a href="${url_goodsdetail}?id=${goods.id}"
                                	name="product_item" dd_name="${goods.name}">
					                        	<p class="img">
					                        		<img class="img_lazy_xf" data-original="${goods.imagePath!}"  src="${base}/resources/mobile/images/bg_pic.png" alt="${goods.name}">
                                    			</p>
				                            </a>
		                    			</td>
		<td valign=top style="padding-left:5px" href="${url_goodsdetail!}?id=${goods.id!}">
			<a href="${url_goodsdetail}?id=${goods.id}"</a>
				<p class="name">${goods.name}</p>
				<p class="price">
					<span class="red">&yen;${goods.memberShowPrice!}</span>
					<#if goods.showPrice gt goods.memberShowPrice!>			
						<span class="origin-price">${goods.showPrice}</span>
						<a href="${url_goodsdetail!}?id=${goods.id!}">
							<span name="item-purchase" dd_name="抢购" class="span_qg"></span>
						</a>
					</#if> 
				</p>
				<#if goods.freeShipping == 1>			
					<p class="send_free">包邮
					<span class="span_gz"><img src="${base}/resources/mobile/images/zan.png"/></span>
				</#if>
		
													<p class="info">
														<!--span>销量 <#if goods.virtualSaleQty?? && goods.virtualSaleQty gt goods.saleQty>${goods.virtualSaleQty}<#else>${goods.saleQty}</#if></span-->
														<span><#if goods.saleOnhandQty == 0>无货<#elseif goods.saleOnhandQty == -1>有货<#else>有货</#if></span> 
														<!--span>好评率 ${goods.evaGrate}%</span-->
													</p>
		</td>
		                    		</tr>
		                    	</table>
		                    </li>
	                   </#list>
	                   </#if>
                	</ul>
                </div>
            </section>
            <section class="error_mm" style="display:none;">
                <span class="text" id="customer_load">
                   	 收藏中 ...
                </span>
            </section>
            <!-- 加载更多 -->
            <input type="hidden" id="curr_page" value="1"/>
            
            <section class="load">
                <img src="${base}/resources/mobile/images/loadingA.gif">
                <span>加载中</span>
            </section>
            <section class="fixed_box" name="my_tools" dd_name="我的工具">
                <a href="${base}/mobile/member/favorite!list.action"
                class="btn_sc" name="my_collect" dd_name="我的收藏">
                    <span></span>
                </a>
                <a href="javascript:;" class="btn_back" id="backtop" name="toTop" dd_name="返回顶部">
                    <span></span>
                </a>
            </section>
        </section>
        <section class="_next" style="display: none">
            <!-- 筛选 -->
            <header>
                <div class="new_header_2" id="filter_header" dd_name="筛选头部">
                    <a href="javascript:;" class="back" id="list_filter_back" dd_name="返回">
                        <span>返回</span>
                    </a>
                    <h2>筛选</h2>
                </div>
            </header>
            
            <section id="filter_content" dd_name="属性筛选列表">
                <div class="filtrate_category" att_id="address">
                    <a href="javascript:;" class="filtrate_category_a" id="filter_brand_nav" name="filter_brand_nav" dd_name="品牌">
                       	品牌<span class="up_down">展开<span>
                    </a>
                </div>
                <ul class="clearfix filtrate_address filtrate_list addr_item" id="filter_brand_list" dd_name="收货地列表" style="display: block; transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1); margin-top: 0px;">
                    
                </ul>
                <div class="filtrate_price" name="filter_price" dd_name="价格筛选" onclick="return 1;">
                   	 价格
                    <input type="number" id="lp" value="">
                    &sim;
                    <input type="number" id="hp" value="">
                   	 元
                </div>
                <ul class="filtrate_btn">
                    <li><a href="javascript:;" class="reset" id='clear_btn' dd_name="筛选清空">清空筛选条件</a></li>
                    <li><a href="javascript:;" class="submit" id='submit_btn' dd_name="筛选确定">确定</a></li>
                </ul>
            </section>
        </section>
        <section id="mix_search_div" dd_name="搜索浮层" style="display: none;">
            <header id="bd">
                <header class="con floatsearch">
                    <div id="component_1434612">
                    </div>
                    <section class="mix_new_header">
                        <a href="javascript:void(0)" class="mix_back"></a>
                        <form id="index_search_form" method="get" action="" target="_parent"
                        onsubmit="return mix_submit_search();">
                            <div class="search">
                                <div class="text_box">
                                	<input id="keyword" name="keyword" type="text" value="" placeholder="搜索你想要的"
                                    class="keyword text" onkeydown="this.style.color='#404040';" maxlength="70"
                                    autocomplete="off">
                                </div>
                                <span class="mix_submit"></span>
                                <a href="javascript:void(0)" class="clear_input" id="clear_input" style="display: block;"></a>
                                <input type="hidden" value="0" name="cid" id="cid">
                                <input type="hidden" value="0cc3ad2d4e611af5f2b7c0181b5d5dfa" name="sid">
                            </div>
                            <input type="submit" value="搜索" class="mix_filtrate">
                        </form>
                    </section>
                    <section class="mix_search_list"></section>
                    <section class="mix_recently_search">
                        <h3>搜索历史</h3>
                        <ul></ul>
                        <a href="javascript:void(0)" onclick="clearRecently()" class="clear_recently_search">
                            <img src="${base}/resources/mobile/images/delete_icon.png" alt="" width="15" height="15">
                            &nbsp;清空历史记录
                        </a>
                    </section>
                    <div class="spacer"></div>
                </header>
            </header>
        </section>      
        <input type="hidden" id="result_type" value="sub_single"></input>
        <input type="hidden" id="total_page" value="${pager.pageCount!}"/>
         <script src="${base}/resources/mobile/js/util.js"></script>
        <script src="${base}/resources/mobile/js/zepto.min.js"></script>
        <script src="${base}/resources/mobile/js/zepto.lazyload.min.js"></script>
        <script src="${base}/resources/mobile/js/common.min.js"></script>
        <script src="${base}/resources/mobile/js/search.min.js"></script>
        <script src="${base}/resources/mobile/js/mix_suggest.min.js"></script>
       
        <script src="${base}/resources/mobile/js/sub-category.js"></script>
        
    </body>

</html>