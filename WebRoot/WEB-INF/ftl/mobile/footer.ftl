<#macro footer title="" url="">
<#if (title?length > 0)>
<header class="header">
    <a href="<#if (url?length > 0)>${url!}<#else>javascript:history.back();</#if>" class="back"></a>
    <h1><em>${title!}</em></h1>
    <a href="javascript: void(0)" class="menu"></a>
    <nav class="t-nav">
        <#include "/WEB-INF/ftl/mobile/footer_menus.ftl"/>
    </nav>
</header>
<#else>
<footer class="total_result">
    <div>
    	 <nav class="t-nav active">
            <#include "/WEB-INF/ftl/mobile/footer_menus.ftl"/>
        </nav>
    </div>
</footer>
</#if>
</#macro>