

$().ready( function() {
	
	var $backButton = $("#backButton");
	
	if ($.tools != null) {
		var $tab = $("#tab");
		var $title = $("#inputForm :input[title], #inputForm label[title]");

		// Tab效果
		$tab.tabs("table.tabContent, div.tabContent", {
			tabs: "input"
		});
	
		// 带有iframe的tab隐藏保存按钮input
		$(".tab input").click(function(){
			var $btns = $(".input:not(.tabContent)");
			if($(".tabContent:visible").find(".iframe").length > 0){
				$btns.hide();
			}else{
				$btns.show();
			}
		});
		
		// 表单提示
		$title.tooltip({
			position: "center right",
			offset: [0, 4],
			effect: "fade"
		});
	}
	


	// 验证消息
	if($.validator != null) {
		$.extend($.validator.messages, {
		    required: message("admin.validate.required"),
			email: message("admin.validate.email"),
			url: message("admin.validate.url"),
			date: message("admin.validate.date"),
			dateISO: message("admin.validate.dateISO"),
			pointcard: message("admin.validate.pointcard"),
			number: message("admin.validate.number"),
			digits: message("admin.validate.digits"),
			minlength: $.validator.format(message("admin.validate.minlength")),
			maxlength: $.validator.format(message("admin.validate.maxlength")),
			rangelength: $.validator.format(message("admin.validate.rangelength")),
			min: $.validator.format(message("admin.validate.min")),
			max: $.validator.format(message("admin.validate.max")),
			range: $.validator.format(message("admin.validate.range")),
			accept: message("admin.validate.accept"),
			equalTo: message("admin.validate.equalTo"),
			remote: message("admin.validate.remote"),
			integer: message("admin.validate.integer"),
			positive: message("admin.validate.positive"),
			negative: message("admin.validate.negative"),
			decimal: message("admin.validate.decimal"),
			pattern: message("admin.validate.pattern"),
			extension: message("admin.validate.extension")
		});
		
		$.validator.setDefaults({
			errorClass: "fieldError",
			ignore: ".ignore",
			ignoreTitle: true,
			errorPlacement: function(error, element) {
				var fieldSet = element.closest("span.fieldSet");
				if (fieldSet.size() > 0) {
					error.appendTo(fieldSet);
				} else {
					error.insertAfter(element);
				}
			},
			submitHandler: function(form) {
				$(form).find(":submit").prop("disabled", true);
				form.submit();
			}
		});
	}
	
	validateForm();// 表单验证
	
	// 设置input提示语
	settip();
	
	if(typeof(UE) != "undefined"){
		$(".editor").each(function(){
			var editor = new UE.ui.Editor({initialFrameHeight:320,initialFrameWidth:1024});
			editor.render(this);
		});
	}
});

// input框默认提示语
function settip(){
	var inputs = $('input[type="text"],textarea');
	for(var i = 0;i<inputs.length;i++){
		var input = inputs[i];
		var tip = $(input).attr('tip');
		if(tip){
			if(input.value == "" || input.value == undefined){
				input.value = tip;
				$(input).css('color','#999999');
			}
			$(input).on('focus',function(){
				var tip = this.attributes['tip'].value;if(this.value==tip){this.value='';this.style.color='#000'}
			});
			$(input).on('blur',function(){
				var tip = this.attributes['tip'].value; if(!this.value){this.value=tip;this.style.color='#999'}
			});
		}
	}
}

//如获取web/commm/main.action 中的main
function getModuleName(){
	var href = window.location.href;
	return href.substring(href.lastIndexOf("!"),href.lastIndexOf("/")+1);
}

//表单验证
var validator;
function validateForm(){
	var $inputForm = $("#inputForm");
	if($inputForm.length == 0) 
		return;
	
	var fixlength = 2;
	
	var moduleName = getModuleName();
	
	if(moduleName == 'goods'){// 商品
		validator = $inputForm.validate({
				rules: {
					'entity.name': {required:true,maxlength:80},
					'entity.ltSpGoodsTypeId': {required:true},
					'entity.code': {maxlength:40},
					'entity.orderNo': {digits:true},
					'entity.unitName': {required:true,maxlength:20},
					'entity.unitRate': {required:true,number: true,toFix: fixlength},
					'entity.usePointLimit': {digits:true},
					'entity.useTicketLimit': {digits:true},
					'entity.virtualSaleQty': {digits:true},
					'entity.saleQty': {required:true,digits:true},
					'entity.onhandQty': {required:true,digits:true},
					'entity.occupyQty': {required:true,digits:true},
					'entity.saleOnhandQty': {required:true,digits:true},
					'entity.searchWord': {maxlength:100},
					'entity.showPrice': {required:true,number: true,toFix: fixlength},
					'entity.goodsSpec.price': {number: true,toFix: fixlength},
					'entity.goodsSpec.cprice': {number: true,toFix: fixlength},
					'entity.goodsSpec.onhandQty': {digits: true},
					'entity.goodsSpec.saleOnhandQty': {digits: true},
					'entity.goodsSpec.weight': {number: true,toFix: fixlength},
					'entity.goodsSpec.barcode': {maxlength:40},
					'entity.goodsSpec.level1price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level2price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level3price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level4price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level5price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level6price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level7price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level8price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level9price': {number: true,toFix: fixlength},
					'entity.goodsSpec.level10price': {number: true,toFix: fixlength}
				},messages: {}
		});
	}else if(moduleName == 'goodsspec'){// 货品
		validator = $inputForm.validate({
			rules: {
				'entity.price': {required:true,number:true,toFix:fixlength},
				'entity.cprice': {required:true,number:true,toFix:fixlength},
				'entity.level1price': {number: true,toFix: fixlength},
				'entity.level2price': {number: true,toFix: fixlength},
				'entity.level3price': {number: true,toFix: fixlength},
				'entity.level4price': {number: true,toFix: fixlength},
				'entity.level5price': {number: true,toFix: fixlength},
				'entity.level6price': {number: true,toFix: fixlength},
				'entity.level7price': {number: true,toFix: fixlength},
				'entity.level8price': {number: true,toFix: fixlength},
				'entity.level9price': {number: true,toFix: fixlength},
				'entity.level10price': {number: true,toFix: fixlength},
				'entity.onhandQty': {required:true,digits: true},
				'entity.occupyQty': {required:true,digits: true},
				'entity.saleOnhandQty': {required:true,digits: true},
				'entity.weight': {required:true,number: true,toFix: fixlength},
				'entity.barcode': {maxlength:40}
			},messages: {}
		});
	}else if(moduleName == 'goodstype'){// 商品分类
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.getPointRate': {required:true,number: true,toFix: fixlength},
				'entity.orderNo': {required:true,digits:true}
			},messages: {}
		});
	}else if(moduleName == 'specgroup' || moduleName == 'spec'){// 商品规格组&规格
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.orderNo': {digits:true}
			},messages: {}
		});
	}else if(moduleName == 'brand'){// 品牌
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.orderNo': {digits:true},
				'entity.url': {url:true,maxlength:200}
			},messages: {}
		});
	}else if(moduleName == 'member'){// 会员
		validator = $inputForm.validate({
			rules: {
				'entity.password': {maxlength:40},
				'entity.point': {required:true,digits:true},
				'entity.phoneNo': {required:true,maxlength:20,phone:true},
				'entity.email': {maxlength:60,email:true},
				'entity.nickname': {maxlength:60},
				'entity.realName': {maxlength:20},
				'entity.zfbaccount': {maxlength:40},
				'entity.wxaccount': {maxlength:40}
			},messages: {}
		});
	}else if(moduleName == 'shop'){// 商铺
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:100},
				'entity.ltSpShopTypeId': {required:true},
				'entity.linkman': {maxlength:20},
				'entity.phoneNo': {maxlength:20,phone:true},
				'entity.address': {maxlength:128},
				'entity.description': {maxlength:500},
				'entity.ltSpMemberId': {required:true},
				'entity.lng': {required:true,number:true},
				'entity.lat': {required:true,number:true}
			},messages: {}
		});
	}else if(moduleName == 'shoptype'){// 商铺分类
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40}
			},messages: {}
		});
	}else if(moduleName == 'activity'){// 活动
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.startDate': {required:true},
				'entity.endDate': {required:true},
				'entity.address': {maxlength:100}
			},messages: {}
		});
	}else if(moduleName == 'activitymember'){// 活动报名会员	
		validator = $inputForm.validate({
			rules: {
				'entity.signDate': {required:true},
				'entity.message': {required:true,maxlength:100}
			},messages: {}
		});
	}else if(moduleName == 'noticetype'){// 消息类型	
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.orderNo': {digits:true}
			},messages: {}
		});
	}else if(moduleName == 'noticemember'){// 消息通知会员	
		validator = $inputForm.validate({
			rules: {
				'entity.ltSpMemberId': {required:true}
			},messages: {}
		});
	}else if(moduleName == 'notice'){// 消息通知
		validator = $inputForm.validate({
			rules: {
				'entity.title': {required:true,maxlength:200},
				'entity.content': {maxlength:300},
				'entity.orderNo': {digits:true},
				'entity.startTime': {required:true},
				'entity.endTime': {required:true},
				'entity.noticeTypeId': {required:true}
			},messages: {}
		});
	}else if(moduleName == 'propertyowner'){// 业主
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.ltSpMemberId': {required:true},
				'entity.phoneNo': {required:true,maxlength:20},
				'entity.areaSize': {maxlength:20},
				'entity.address': {maxlength:100},
				'entity.description': {maxlength:200},
				'entity.reply': {maxlength:100}
			},messages: {}
		});
	}else if(moduleName == 'order'){// 订单
		validator = $inputForm.validate({
			rules: {
				'entity.logCompany': {maxlength:20},
				'entity.logisticsNo': {maxlength:20},
				'entity.memberMessage': {maxlength:100},
				'entity.merchantMessage': {maxlength:100},
				'entity.linkman': {required:true,maxlength:20},
				'entity.phoneNo': {required:true,maxlength:20},
				'entity.fullAddress': {maxlength:128}
			},messages: {}
		});
	}else if(moduleName == 'deliveryman'){// 送货员
		validator = $inputForm.validate({
			rules: {
				'entity.jobNo': {required:true,maxlength:20},
				'entity.name': {required:true,maxlength:40},
				'entity.phoneNo': {required:true,maxlength:20,phone:true}
			},messages: {}
		});
	}else if(moduleName == 'street'){// 街道小区
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:60},
				'entity.sysSpAreaId': {required:true},
				'entity.orderNo': {digits:true}
			},messages: {}
		});
	}else if(moduleName == 'ticket'){// 电商券
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.pushCount': {required:true,digits:true},
				'entity.limitCount': {required:true,digits:true},
				'entity.getCount': {required:true,digits:true},
				'entity.useStartTime': {required:true},
				'entity.useEndTime': {required:true},
				'entity.minAmt': {required:true,number:true},
				'entity.amt': {required:true,number:true},
				'entity.instructions': {maxlength:200},
				'entity.term': {required:true}
			},messages: {}
		});
	}else if(moduleName == 'promotion'){// 促销与团购
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.orderNo': {digits:true},
				'entity.startTime': {required:true},
				'entity.endTime': {required:true},
				'entity.limitQty': {required:true,digits:true},
			},messages: {}
		});
	}else if(moduleName == 'promotionprice'){// 优惠价
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,number:true},
			},messages: {}
		});
	}else if(moduleName == 'promotiongoods'){// 促销商品
		validator = $inputForm.validate({
			rules: {
				'entity.ltSpGoodsId': {required:true},
				'entity.showPrice': {required:true,number:true},
				'entity.orderNo': {digits:true},
				'entity.limitQty': {required:true,digits:true},
				'entity.allLimitQty': {required:true,digits:true},
				'entity.saleQty': {required:true,digits:true}
			},messages: {}
		});
	}else if(moduleName == 'ticketgoods'){// 券商品
		validator = $inputForm.validate({
			rules: {
				'entity.ltSpGoodsId': {required:true},
				'entity.orderNo': {digits:true}
			},messages: {}
		});
	}else if(moduleName == 'mhomepage'){// 手机主页板块
		validator = $inputForm.validate({
			rules: {
				'entity.title': {maxlength:200},
				'entity.orderNo': {digits:true},
				'entity.showGoodsCount': {digits:true},
				'entity.urls': {url:true,maxlength:300},
				'entity.showStartTime': {required:true},
				'entity.showEndTime': {required:true}
			},messages: {}
		});
	}else if(moduleName == 'mhomepagegoods' || moduleName == 'phomepagegoods'){// 手机主页板块商品&PC主页板块商品
		validator = $inputForm.validate({
			rules: {
				'entity.ltSpGoodsId': {required:true},
				'entity.orderNo': {digits:true},
			},messages: {}
		});
	}else if(moduleName == 'phomepage'){// PC主页板块
		validator = $inputForm.validate({
			rules: {
				'entity.title': {maxlength:200},
				'entity.height': {required:true,number:true},
				'entity.orderNo': {digits:true},
				'entity.urls': {url:true,maxlength:300},
			},messages: {}
		});
	}else if(moduleName == 'phomepagemenu'){// PC主页菜单
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:20},
				'entity.orderNo': {digits:true},
				'entity.url': {maxlength:300}
			},messages: {}
		});
	}else if(moduleName == 'seo'){// seo
		validator = $inputForm.validate({
			rules: {
				'entity.keywords': {required:true,maxlength:400},
				'entity.description': {required:true,maxlength:400},
				'entity.title': {required:true,maxlength:100},
				'entity.moduleName': {required:true,maxlength:50},
				'entity.remark': {required:true,maxlength:100},
			},messages: {}
		});
	}else if(moduleName == 'operator'){// 系统管理员
		validator = $inputForm.validate({
			rules: {
				'entity.name': {required:true,maxlength:40},
				'entity.loginName': {required:true,maxlength:40},
				'entity.password': {maxlength:40},
				'entity.department': {maxlength:20}
			},messages: {}
		});
	}
}

function tipbeforesubmit(validator){
	var inputs = $('input[type="text"],textarea');
	for(var i = 0;i<inputs.length;i++){
		var input = inputs[i];
		var tip = $(input).attr('tip');
		if(tip){
			if(input.value == tip){
				input.value = '';
			}
		}
	}
	
	if(!validator.form()){
		for(var i = 0;i<inputs.length;i++){
			var input = inputs[i];
			var tip = $(input).attr('tip');
			if(tip){
				if(input.value == ''){
					input.value = tip;
				}
			}
		}
		return false;
	}
	return true;
}