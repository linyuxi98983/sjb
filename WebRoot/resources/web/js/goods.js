/**
 * 商品后台管理脚本
 */
var goodsSpecDialog;
$().ready(function() {

	// 启用或隐藏多规格相关组件
	function hideOrShowSpec(){
		var val = $('input[name="entity.useSpec"]:checked').val();
		if(val == 1){// 启用多规格
			$(".tr_spec").show();
			$(".tr_notspec").hide();
		}else{// 不启用多规格
			$(".tr_spec").hide();
			$(".tr_notspec").show();
			
			for(var i=1;i<=5;i++){
				$("#ltSpSpecGroupId"+i).val('');
				$("#spec"+i).val('');
				$("#spec"+i+"_text").val('');
			}
		}
	}
	hideOrShowSpec();
	// 多规格
	$('input[name="entity.useSpec"]').click(function(){
		var goodsId = $('input[name="entity.id"]').val();
		var $this = $(this);
		var trs = goodsId ? $("#goodsSpecIframe").contents().find("#listTable tbody tr:gt(0)") :
			$("#listTable tbody tr:gt(0)");
		var goodsSpecTab = $("input[name='goodsSpecTab']");
		if(trs.length > 0){
			if(!confirm('将删除所有货品，是否继续？')){
				$('input[name="entity.useSpec"]:eq(0)').attr("checked","checked");
				return false;
			}
		}
		goodsSpecTab.hide();
		if(!goodsId){
			trs.remove();
		}else{
			$.ajax({
				url: "web/goodsspec/goodsspec!deleteByGoodsId.action",
				type: "POST",
				data: {goodsId:goodsId},
				dataType: "json",
				cache: false,
				success: function(message) {
					if(message.success){
						freshGoodsSpecIframe();
					}else{
						alert('删除货品失败！'+message.errorMsg);
					}
				}
			});
		}
		hideOrShowSpec();
	});
});

function saveform(){
	if(!tipbeforesubmit(validator)) return;
	
	var $id = $("input[name='entity.id']");
	if(!$id.length || !$id.val()){// 添加
		if($("input[name='entity.useSpec']:checked").val() == 1){// 使用多规格
			var json = getSpecListJson();
			if(!json.length){
				alert('请先生成货品！');
				return;
			}
			$("#goodsSpecListJson").val(JSON.stringify(json));
		}
	}
	$("#inputForm").submit();
}

// 分类切换
function typeChange(select){
	var $select = $(select);
	var level = $select.attr("level");
	if(level == 2){
		var typeId = $select.find("option:selected").val();
		loadParam(typeId);
	}else{
		$(".chooseTypeTipDiv").show();
		$("#params tbody").html('');
	}
}

// 加载参数
function loadParam(typeId){
	if(!typeId) return;
	$.ajax({
		url: "web/goodstype/goodstype!edit.action",
		type: "POST",
		data: {id:typeId,result:"json"},
		dataType: "json",
		cache: false,
		success: function(message) {
			if(message.entity){
				var paramHints = message.entity.paramHints || '';
				var paramNames = message.entity.paramNames || '';
				var paramValues = $('input[name="paramValues"]').val() || '';
				if(paramNames){
					$("#params tbody").html('');
					$(".chooseTypeTipDiv").hide();
					var nameArr = paramNames.split("\r\n");
					var hintsArr = paramHints.split("\r\n");
					var valuesArr = paramValues.split(",");
					for(var i=0;i<nameArr.length;i++){
						var name = '';
						var hint = '';
						var value = '';
						if(nameArr.length > i){
							name = nameArr[i];
						}
						if(hintsArr.length > i){
							hint = hintsArr[i];
						}
						if(valuesArr.length > i){
							value = $.trim(valuesArr[i]);
						}
						$("#params tbody").append('<tr><th>'+name+'：</th><td><input type="text" class="text" name="entity.paramValues" tip="'+hint+'" value="'+value+'"/></td></tr>');
					}
					settip();
				}else{
					$(".chooseTypeTipDiv").show();
				}
			}else{
				alert('获取分类参数数据失败！'+message.errorMsg);
			}
		}
	});
}

var specvalues = [];

function getSpecValue(vs,j,str){
	var spec = vs[j];
	var str_bak = str;
	if(spec){
		var specArr = spec.split(",");
		for(var i=0;i<specArr.length;i++){
			if(str) 
				str += ',' + specArr[i]; 
			else 
				str = specArr[i];
			if(vs.length > j && vs[j+1]){
				getSpecValue(vs,j+1,str);
			}else{
				specvalues.push(str);
			}
			str = str_bak;
		}
	}
}
// 生成货品
function createGoodsSpec(t){
	if(!confirm("系统将根据您选择的商品规格自动生成货品，是否继续？")){
		return false;
	}
	
	var isChoose = false;
	var vs = [];
	for(var i=0;i<5;i++){
		var spec = $("#spec"+(i+1)+"_text").val();
		vs.push(spec);
		if(spec) isChoose = true;
	}
	if(!isChoose){
		alert('请选择至少一组规格！');
		return false;
	}
	$("input[name='goodsSpecTab']").show().click();
	specvalues = [];
	getSpecValue(vs,0,'');
	
	var goodsId = $('input[name="entity.id"]').val();
	if(!goodsId){// 保存
		for(var i=0;i<specvalues.length;i++){
			addSpecTr({spec:specvalues[i],price:0.0,cprice:0.0,onhandQty:0,weight:0.0,closed:0});
		}
	}else{
	}
}

// 刷新货品列表
function freshGoodsSpecIframe(){
	$("#goodsSpecIframe").src = $("#goodsSpecIframe").src;
}

// 获取货品列表json
function getSpecListJson(){
	var trs = $("#listTable tbody tr:gt(0)");
	var json = [];
	for(var i=0;i<trs.length;i++){
		var tr = $(trs[i]);
		var obj = {};
		obj.spec = tr.find(".spec").html();
		obj.price = tr.find('input[name="price"]').val();
		obj.cprice = tr.find('input[name="cprice"]').val();
		obj.onhandQty = tr.find('input[name="onhandQty"]').val();
		obj.weight = tr.find('input[name="weight"]').val();
		obj.closed = 0;
		json.push(obj);
	}
	return json;
}

// 增加列表
function addSpecTr(o){
	var $tbody = $("#listTable tbody");
	var spec = o.spec;
	var price = o.price || 0.0;
	var cprice = o.cprice || 0.0;
	var onhandQty = o.onhandQty || 0;
	var saleOnhandQty = o.saleOnhandQty || 0;
	var weight = o.weight || 0.0;
	var closed = o.closed?'否':'是';
	var tr = '<tr>'
		+'<td><input type="checkbox" name="ids"></td>'
		+'<td class="spec">'+spec+'</td>'
		+'<td><input type="text" name="price" value="'+price+'"/></td>'
		+'<td><input type="text" name="cprice" value="'+cprice+'"/></td>'
		+'<td><input type="text" name="onhandQty" value="'+onhandQty+'"/></td>'
		+'<td><input type="text" name="weight" value="'+weight+'"/></td>'
		+'<td>'+closed+'</td>'
		+'</tr>';
	$tbody.append(tr);
}

// 打开货品添加框
function openGoodsSpecDialog(){
	goodsSpecDialog.jqmShow();
	return false;
}

// 删除选中行 
function deleteChooseRow(){
	var $checkedIds = $("#listTable input[name='ids']:enabled:checked");
	for(var i=0;i<$checkedIds.length;i++){
		$($checkedIds[i]).parent().parent().remove();
	}
}

// 删除非选中行
function deleteNotChooseRow(){
	var $checkedIds = $("#listTable input[name='ids']:enabled").not(":checked");
	for(var i=0;i<$checkedIds.length;i++){
		$($checkedIds[i]).parent().parent().remove();
	}
}

// 规格组选择
function onselectgroup(index){
	var next = index + 1;
	if(next > 5) return;
	$("#ltSpSpecGroupId"+next).removeAttr("disabled");
	$("#spec"+next+"_text").removeAttr("disabled");
	$("#spec"+next+"_select").removeAttr("disabled");
	$("#spec"+next+"_clean").removeAttr("disabled");
}