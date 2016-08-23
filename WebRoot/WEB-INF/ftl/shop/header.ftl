<#include "/WEB-INF/ftl/global/project.ftl"/>
<#include "/WEB-INF/ftl/shop/url.ftl"/>
<#include "/WEB-INF/ftl/shop/footer.ftl"/>
<#include "/WEB-INF/ftl/shop/pager.ftl"/>
<#macro header title="" keywords="" description="">
<title><#if seo??>${seo.title!}<#elseif (title?length > 0)>${title!}<#else><@spring "global.project.shopname"/></#if></title>
<meta name="keywords" content='<#if seo??>${seo.keywords!}<#elseif (keywords?length > 0)>${keywords!}<#else><@spring "global.project.shopname"/></#if>'>
<meta name="description" content='<#if seo??>${seo.description!}<#elseif (description?length > 0)>${description!}<#else><@spring "global.project.shopname"/></#if>'>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=11; IE=10; IE=9; IE=8; IE=7; IE=EDGE">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<script type="text/javascript">
	var Global = {
		"base":"${base!}",
		"url_goodsdetail":"${url_goodsdetail!}",
		"url_goodslist":"${url_goodslist!}",
		"url_goodstype":"${url_goodstype!}",
		"url_index":"${url_index!}",
		"url_surround":"${url_surround!}",
		"url_nearby":"${url_nearby!}",
		"url_shoplist":"${url_shoplist!}",
		"url_shopdetail":"${url_shopdetail!}",
		"url_cartlist":"${url_cartlist!}",
		"url_memberhome":"${url_memberhome!}",
		"url_login":"${url_login!}",
		"url_myfavorite":"${url_myfavorite!}",
		"url_orderlist":"${url_orderlist!}",
		"url_register":"${url_register!}"
	};
</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?8c014c40558ebe6689dc70f5767ae0fe";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</#macro>