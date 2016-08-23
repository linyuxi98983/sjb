/**
 * 手机主页板块后台管理脚本
 */
$().ready(function() {
	
	// 选择类型	
	function showModuleType(moduleType){
		$(".moduleType").hide();
		$(".moduleType"+moduleType).show();
	}
	
	// 获取选中类型
	function getModuleType(){
		var val = $('input[name="entity.moduleType"]:checked').val();
		return val;
	}
	
	// 初始化类型
	showModuleType(getModuleType());
	
	// 点击类型事件
	$('input[name="entity.moduleType"]').click(function(){
		var $id = $('input[name="entity.id"]');
		var val = getModuleType();
		showModuleType(val);
		if(!$id.length || !$id.val()){
			if(val == 3){// 商品列表
				if(confirm("添加商品列表需要先保存商品，是否继续？")){
					saveform();
				}
			}
		}
	});
});

function saveform(){
	if(!tipbeforesubmit(validator)) return;
	$("#inputForm").submit();
}