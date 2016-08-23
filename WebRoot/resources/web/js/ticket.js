$().ready(function(){
	
	function showPushKind(){
		if($("input[name='entity.pushKind']:checked").val() == 1){
			$(".memberTab").show();
		}else{
			$(".memberTab").hide();
		}
	}
	showPushKind();
	$('input[name="entity.pushKind"]').click(function(){
		if(!$('input[name="entity.id"]').val()){
			if(!tipbeforesubmit(validator)){
				$('input[name="entity.pushKind"]:eq(0)').attr("checked","checked");
				return;
			}
			if(confirm("手动发放需要先保存现金券，是否继续？")){
				$('input[name="result"]').val('edit');
				$("#inputForm").submit();
			}
			return;
		}
		
		showPushKind();
		if($("input[name='entity.pushKind']:checked").val() == 1) $(".memberTab").click(); 
	});
});