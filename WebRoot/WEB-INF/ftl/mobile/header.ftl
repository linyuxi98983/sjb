<#include "/WEB-INF/ftl/global/project.ftl"/>
<#include "/WEB-INF/ftl/mobile/footer.ftl"/>
<#include "/WEB-INF/ftl/mobile/url.ftl"/>
<#macro header title="" keywords="" description="">
<title><#if seo??>${seo.title!}<#elseif (title?length > 0)>${title!}<#else><@spring "global.project.shopname"/></#if></title>
<meta name="keywords" content='<#if seo??>${seo.keywords!}<#elseif (keywords?length > 0)>${keywords!}<#else><@spring "global.project.shopname"/></#if>'>
<meta name="description" content='<#if seo??>${seo.description!}<#elseif (description?length > 0)>${description!}<#else><@spring "global.project.shopname"/></#if>'>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta http-equiv="Cache-Control" content="must-revalidate,no-cache" />
<link rel="apple-touch-icon-precomposed" href="">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="">
<script type="text/javascript">
	var base = "${base!}";
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