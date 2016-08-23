// 刷新页面 回调
var refresh;

// 修改成为默认地址
function setDefault(id){
	$.ajax({
		url: Global.base + "/shop/order/address!save.action",
		type: "POST",
		data: {'entity.id':id,'entity.isDefault':1,'result':'json'},
		dataType: "json",
		cache: false,
		success: function(message) {
			if(message.success == true || message.success == 'true'){
				refresh();
			}
		}
	});
}
// 删除地址
function deleteAddr(id){
	if(confirm('是否删除？')){
		$.ajax({
			url: Global.base + "/shop/order/address!delete.action",
			type: "POST",
			data: {'id':id},
			dataType: "json",
			cache: false,
			success: function(message) {
				if(message.success == true || message.success == 'true'){
					refresh();
				}else{
					alert("该地址被使用过，不能删除！");
				}
			}
		});
	}
}

function modifyInfo(param){
	$('input[name="entity.id"]').val(param ? param.id : '');
	$('input[name="entity.linkman"]').val(param ? param.linkman : '');
	$('input[name="entity.phoneNo"]').val(param ? param.phoneNo : '');
	$('input[name="entity.sysSpAreaId"]').val(param ? param.sysSpAreaId : '').attr('treePath',param ? param.area.lcode : '');
	$('select[name="entity.ltSpStreetId"]').val(param ? param.ltSpStreetId : '');
	$('select[name="entity.ltSpStreetId"]').attr('selectValue',param ? param.ltSpStreetId : '');
	$('input[name="entity.address"]').val(param ? param.address : '');
	$('input[name="entity.isDefault"]:eq('+(param && param.isDefault == 1 ? 0 : 1)+')').attr("checked","checked");
	$('input[name="entity.areaFullName"]').val(param ? param.areaFullName : '');
}

function addAddr(){
	modifyInfo();
	bindArea();
	$("#addressinfo").jqmShow();
}

// 修改地址
function editAddr(id){
	$.ajax({
		url: Global.base + "/shop/order/address!edit.action",
		type: "POST",
		data: {'id':id,'result':'json'},
		dataType: "json",
		cache: false,
		success: function(message) {
			if(message.success == true || message.success == 'true'){
				modifyInfo(message.entity);
				loadStreet();
				
				$("#addressinfo").jqmShow();
				bindArea();
			}
		}
	});
}

function bindArea(){
	$('.lselect').each(function(){
		$this = $(this);
		var lselectType = $this.attr('lselectType');
		$this.lSelect({
			url: Global.base + "/shop/order/address!lselect.action?lselectType="+lselectType,
			change:function(select){
				$('select[name="entity.ltSpStreetId"]').attr('selectValue','');
				loadStreet(); 
			}
		});
	});
}
	
// 获取小区
function loadStreet(){
	var parentId = $('input[name="entity.sysSpAreaId"]').val();
	var $this = $('select[name="entity.ltSpStreetId"]');
	$this.find("option").remove();
	if(!parentId) return;
	
	$.ajax({
		url:Global.base + "/shop/order/address!lselect.action",
		type: "POST",
		data: {lselectType:'STREET_NODES',parentId:parentId},
		dataType: "json",
		cache: false,
		success: function(message) {
			if(message.success == true || message.success == 'true'){
				var list = message.json;
				$this.append('<option value="">请选择...</option>');
				for(var key in list){
					var selected = (key == $this.attr("selectValue") ? 'selected="selected"' : '');
					$this.append('<option value="'+key+'" '+selected+'>'+list[key]+'</option>');
				}
			}else{
				alert('获取小区失败!'+message.errorMsg);
			}
		}
	});
}
var validator;
function validateForm(){
	validator = $("#addressform").validate({
		rules: {
			'entity.linkman': {required:true,maxlength:20},
			'entity.phoneNo': {required:true,maxlength:20},
			'entity.sysSpAreaId': {required:true},
			'entity.address': {required:true,maxlength:128},
		},messages: {
			'entity.linkman': '请输入收货人',
			'entity.phoneNo': '请输入手机',
			'entity.sysSpAreaId': '请选择城市',
			'entity.address': '请输入地址'
		}
	});
}

function submitForm(){
	if(!validator.form()) return;
	var arr = [];
	$('select[name="sysSpAreaId_select"] option:selected,#ltSpStreetId option:selected').each(function(){
		$(this).val() && arr.push($(this).text());
	});
	$('input[name="entity.areaFullName"]').val(arr.join(" "));
	
	$.ajax({
		url: Global.base + "/shop/order/address!save.action",
		type: "POST",
		data: $("#addressform").serialize(),
		dataType: "json",
		cache: false,
		success: function(message) {
			if(message.success == true || message.success == 'true'){
				refresh();
			}
		}
	});
}

$().ready(function(){
	$("#addressinfo").jqm();
	validateForm();
});