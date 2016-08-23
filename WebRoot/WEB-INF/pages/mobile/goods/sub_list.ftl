<#include "/WEB-INF/ftl/mobile/url.ftl"/>
<!-- 缩略图列表-->
﻿﻿<#if list?exists>
<#list list as goods>
<li>
<div>
<a href="/mobile/goods/goods!detail.action?id=${goods.id}"
name="product_item" dd_name="${goods.name}">
<p class="img">
<img class="img_lazy_xf" data-original="${goods.imagePath!}"  src="${base}/resources/mobile/images/bg_pic.png" alt="${goods.name}">
</p>
<p class="name">${goods.name}</p>
</a>
<p class="price">
<span class="red">&yen;${goods.memberShowPrice!}</span>
<#if goods.showPrice gt goods.memberShowPrice!>			
	<span class="origin-price">${goods.showPrice}</span>
<a href="${url_goodsdetail!}?id=${goods.id!}">
	<span name="item-purchase" dd_name="抢购" class="span_qg"></span>
</a>
</#if>
<#if goods.freeShipping == 1>			
	<p class="send_free">包邮
	<span class="span_gz"><img src="${base}/resources/mobile/images/zan.png"/></span>
</#if>
</p>
<p class="info">
<!--span>销量 <#if goods.virtualSaleQty?? && goods.virtualSaleQty gt goods.saleQty>${goods.virtualSaleQty}<#else>${goods.saleQty}</#if></span-->
<span><#if goods.saleOnhandQty == 0>无货<#elseif goods.saleOnhandQty == -1>有货<#else>有货</#if></span>
<!--span>好评率 ${goods.evaGrate}%</span-->
</p>
</div>
</li>
</#list>
</#if>
<input type="hidden" id="total_page" value="${pager.pageCount!}"/>