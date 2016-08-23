<script type="text/javascript">
	jq().ready( function() {
			<#if loginer ??>
				log_uid= ${loginer.id!0}
		    <#else>
		    </#if>
		    <#if entity??>
		     	objectId = ${entity.id!''};
		     	evaKind = 101;
		    </#if>
    	});
</script> 