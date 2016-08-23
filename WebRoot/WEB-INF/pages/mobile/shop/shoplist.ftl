<#include "/WEB-INF/ftl/mobile/url.ftl"/>
<#if (list?size > 0)>
<ul>
	<#list list as shop>
	<li>
		<table>
    		<tr>
    			<td class="shop-img">
    				<a href="${url_shopdetail!}?id=${shop.id!}">
                    	<p>
                    		<img class="auto-img" src="${shop.imagePath!}">
                    	</p>
                    </a>
    			</td>
    			<td valign=top class="shop-info">
    				<p>
        				<span>${shop.name!}</span>
        				<span class="addr-img">
        				<a class="location" href="javascript:void(0);">
        					<img src="${base}/resources/mobile/images/addressmgr.png"/><span>${shop.distanceStr!}</span></span>
    					</a>
    				</p>
                    <p>本月销${shop.currentMonthSaleQty!}单
                    	<span class="sale-num"><img src="${base}/resources/mobile/images/zan.png"/><span>${shop.evaGcount!}</span></span>
                    </p>
                    <p>
                     	<span>${shop.description!}</span><span class="shop-fav <#if (shop.favoriteId > 0)>on</#if>" objectId=${shop.id!}></span>
                    </p>
    			</td>
    		</tr>
    	</table> 
	</li>
	</#list>
	<#include "/WEB-INF/ftl/mobile/pager.ftl"/>
	<@page list/>
</ul>
</#if>