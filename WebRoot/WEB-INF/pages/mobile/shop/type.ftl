<#include "/WEB-INF/ftl/mobile/url.ftl"/>
<#if list??>
<table>
	<#list 0..1 as i>
	<tr>
		<#list 0..3 as j>
		<#assign index = i*3+j/>
		<td>
			<#if (list?size > index)>
			<div><a href="${url_shoplist!}?typeId=${list[index].id!}"><img src="${list[index].imagePath!}"/></a></div>
			<div>${list[index].name!}</div>
			</#if>
		</td>
		</#list>
	</tr>
	</#list>
</table>
</#if>