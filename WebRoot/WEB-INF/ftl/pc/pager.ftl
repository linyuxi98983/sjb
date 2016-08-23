<!-- 分页条 -->
<#macro page pager url>
<form id="listForm" action="${url!}" method="post">
<div class="pageSizeMenu" style="display:none"></div>
<span id="pageTotal" style="display:none">${pager.pageCount!}</span>
<div class="pagination" pageNumber="${pager.pageNumber!}" 
	pageSize="${pager.pageSize!}"
	searchProperty="${pager.searchProperty!}"
	orderProperty="${pager.orderProperty!}"
	orderDirection="${pager.orderDirection!}"/>
</div>
</form>
</#macro>
