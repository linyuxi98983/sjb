test
${id!'123'}
<#if id??>
	123
</#if>

${json!}

${goods.id!}

<#if goods.id1?exists>
	exists
<#else>
	not exists	
</#if>

<#if map?exists>
    <#list map?keys as key> 
       <tr>
               <td>${key}</td>
               <td>${map.get(key)}</td>
       </tr>
    </#list>
</#if>

${request}
${session}
${application}