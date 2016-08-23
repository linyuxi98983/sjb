<#macro page list>
<div class="pager">
<input type="hidden" name="pageNumber" value="${pager.pageNumber!}"/>
<input type="hidden" name="pageSize" value="${pager.pageSize!}"/>
<input type="hidden" name="pageCount" value="${pager.pageCount!}"/>
<input type="hidden" name="curLength" value="${list?size!}"/>
<input type="hidden" name="orderProperty" value="${pager.orderProperty!}"/>
<input type="hidden" name="orderDirection" value="${pager.orderDirection!}"/>
</div>
</#macro>