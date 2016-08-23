<#include "/WEB-INF/ftl/mobile/url.ftl"/>
<ul>
	<#list list as goods>
	<li>
		<table>
       		<tbody>
       			<tr>
           			<td class="shop-img">
           				<a href="${url_goodsdetail!}?id=${goods.id!}">
                      		<p>
                      			<img class="auto-img" src="${goods.imagePath!}">
                         	</p>
                     	</a>
           			</td>
           			<td valign="top" class="shop-info">
           				<p>
            				<span>${goods.name!}</span>
           				</p>
	                    <p>本月销${goods.currentMonthSaleQty!}单
	                    	<span class="sale-num"><img src="${base}/resources/mobile/images/zan.png"><span>${goods.evaGcount!}</span></span>
	                    </p>
	                    <p>
	                       	<span>￥${goods.memberShowPrice!}</span><span class="shop-fav<#if (goods.favoriteId > 0)> on</#if>" objectId="${goods.id!}"></span>
	                    </p>
           			</td>
           		</tr>
           	</tbody>
       	</table> 
	</li>
	</#list>
	<#include "/WEB-INF/ftl/mobile/pager.ftl"/>
	<@page list/>
</ul>