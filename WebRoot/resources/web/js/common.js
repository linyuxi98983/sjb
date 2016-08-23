

var jshop = {
	base: "/",
	locale: "zh_CN"
};

var setting = {
	priceScale: "2",
	priceRoundType: "roundHalfUp",
	currencySign: "￥",
	currencyUnit: "元",
	uploadImageExtension: "jpg,jpeg,bmp,gif,png",
	uploadFlashExtension: "swf,flv",
	uploadMediaExtension: "swf,flv,mp3,wav,avi,rm,rmvb",
	uploadFileExtension: "zip,rar,7z,doc,docx,xls,xlsx,ppt,pptx"
};

var messages = {
	"admin.message.success": "操作成功",
	"admin.message.error": "操作错误",
	"admin.dialog.ok": "确&nbsp;&nbsp;定",
	"admin.dialog.cancel": "取&nbsp;&nbsp;消",
	"admin.dialog.deleteConfirm": "您确定要删除吗？",
	"admin.dialog.clearConfirm": "您确定要清空吗？",
	"admin.browser.title": "选择文件",
	"admin.browser.upload": "本地上传",
	"admin.browser.parent": "上级目录",
	"admin.browser.orderType": "排序方式",
	"admin.browser.name": "名称",
	"admin.browser.size": "大小",
	"admin.browser.type": "类型",
	"admin.browser.select": "选择文件",
	"admin.upload.sizeInvalid": "上传文件大小超出限制",
	"admin.upload.typeInvalid": "上传文件格式不正确",
	"admin.upload.invalid": "上传文件格式或大小不正确",
	"admin.validate.required": "必填",
	"admin.validate.email": "E-mail格式错误",
	"admin.validate.url": "网址格式错误",
	"admin.validate.date": "日期格式错误",
	"admin.validate.dateISO": "日期格式错误",
	"admin.validate.pointcard": "信用卡格式错误",
	"admin.validate.number": "只允许输入数字",
	"admin.validate.digits": "只允许输入零或正整数",
	"admin.validate.minlength": "长度不允许小于{0}",
	"admin.validate.maxlength": "长度不允许大于{0}",
	"admin.validate.rangelength": "长度必须在{0}-{1}之间",
	"admin.validate.min": "不允许小于{0}",
	"admin.validate.max": "不允许大于{0}",
	"admin.validate.range": "必须在{0}-{1}之间",
	"admin.validate.accept": "输入后缀错误",
	"admin.validate.equalTo": "两次输入不一致",
	"admin.validate.remote": "输入错误",
	"admin.validate.integer": "只允许输入整数",
	"admin.validate.positive": "只允许输入正数",
	"admin.validate.negative": "只允许输入负数",
	"admin.validate.decimal": "数值超出了允许范围",
	"admin.validate.pattern": "格式错误",
	"admin.validate.extension": "文件格式错误"
};

// 添加Cookie
function addCookie(name, value, options) {
	if (arguments.length > 1 && name != null) {
		if (options == null) {
			options = {};
		}
		if (value == null) {
			options.expires = -1;
		}
		if (typeof options.expires == "number") {
			var time = options.expires;
			var expires = options.expires = new Date();
			expires.setTime(expires.getTime() + time * 1000);
		}
		document.cookie = encodeURIComponent(String(name)) + "=" + encodeURIComponent(String(value)) + (options.expires ? "; expires=" + options.expires.toUTCString() : "") + (options.path ? "; path=" + options.path : "") + (options.domain ? "; domain=" + options.domain : ""), (options.secure ? "; secure" : "");
	}
}

// 获取Cookie
function getCookie(name) {
	if (name != null) {
		var value = new RegExp("(?:^|; )" + encodeURIComponent(String(name)) + "=([^;]*)").exec(document.cookie);
		return value ? decodeURIComponent(value[1]) : null;
	}
}

// 移除Cookie
function removeCookie(name, options) {
	addCookie(name, null, options);
}

// 货币格式化
function currency(value, showSign, showUnit) {
	if (value != null) {
		var price;
		if (setting.priceRoundType == "roundHalfUp") {
			price = (Math.round(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
		} else if (setting.priceRoundType == "roundUp") {
			price = (Math.ceil(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
		} else {
			price = (Math.floor(value * Math.pow(10, setting.priceScale)) / Math.pow(10, setting.priceScale)).toFixed(setting.priceScale);
		}
		if (showSign) {
			price = setting.currencySign + price;
		}
		if (showUnit) {
			price += setting.currencyUnit;
		}
		return price;
	}
}

// 多语言
function message(code) {
	if (code != null) {
		var content = messages[code] != null ? messages[code] : code;
		if (arguments.length == 1) {
			return content;
		} else {
			if ($.isArray(arguments[1])) {
				$.each(arguments[1], function(i, n) {
					content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
				});
				return content;
			} else {
				$.each(Array.prototype.slice.apply(arguments).slice(1), function(i, n) {
					content = content.replace(new RegExp("\\{" + i + "\\}", "g"), n);
				});
				return content;
			}
		}
	}
} 

(function($) {

	var zIndex = 100;
	
	// 消息框
	var $message;
	var messageTimer;
	$.message = function() {
		var message = {};
		if ($.isPlainObject(arguments[0])) {
			message = arguments[0];
		} else if (typeof arguments[0] === "string" && typeof arguments[1] === "string") {
			message.type = arguments[0];
			message.content = arguments[1];
		} else {
			return false;
		}
		
		if (message.type == null || message.content == null) {
			return false;
		}
		
		if ($message == null) {
			$message = $('<div class="xxMessage"><div class="messageContent message' + message.type + 'Icon"><\/div><\/div>');
			if (!window.XMLHttpRequest) {
				$message.append('<iframe class="messageIframe"><\/iframe>');
			}
			$message.appendTo("body");
		}
		
		$message.children("div").removeClass("messagewarnIcon messageerrorIcon messagesuccessIcon").addClass("message" + message.type + "Icon").html(message.content);
		$message.css({"margin-left": - parseInt($message.outerWidth() / 2), "z-index": zIndex ++}).show();
		
		clearTimeout(messageTimer);
		messageTimer = setTimeout(function() {
			$message.hide();
		}, 3000);
		return $message;
	}

	// 对话框
	$.dialog = function(options) {
		var settings = {
			width: 320,
			height: "auto",
			modal: true,
			ok: message("admin.dialog.ok"),
			cancel: message("admin.dialog.cancel"),
			onShow: null,
			onClose: null,
			onOk: null,
			onCancel: null
		};
		$.extend(settings, options);
		
		if (settings.content == null) {
			return false;
		}
		
		var $dialog = $('<div class="xxDialog"><\/div>');
		var $dialogTitle;
		var $dialogClose = $('<div class="dialogClose"><\/div>').appendTo($dialog);
		var $dialogContent;
		var $dialogBottom;
		var $dialogOk;
		var $dialogCancel;
		var $dialogOverlay;
		if (settings.title != null) {
			$dialogTitle = $('<div class="dialogTitle"><\/div>').appendTo($dialog);
		}
		if (settings.type != null) {
			$dialogContent = $('<div class="dialogContent dialog' + settings.type + 'Icon"><\/div>').appendTo($dialog);
		} else {
			$dialogContent = $('<div class="dialogContent"><\/div>').appendTo($dialog);
		}
		if (settings.ok != null || settings.cancel != null) {
			$dialogBottom = $('<div class="dialogBottom"><\/div>').appendTo($dialog);
		}
		if (settings.ok != null) {
			$dialogOk = $('<input type="button" class="button" value="' + settings.ok + '" \/>').appendTo($dialogBottom);
		}
		if (settings.cancel != null) {
			$dialogCancel = $('<input type="button" class="button" value="' + settings.cancel + '" \/>').appendTo($dialogBottom);
		}
		if (!window.XMLHttpRequest) {
			$dialog.append('<iframe class="dialogIframe"><\/iframe>');
		}
		$dialog.appendTo("body");
		if (settings.modal) {
			$dialogOverlay = $('<div class="dialogOverlay"><\/div>').insertAfter($dialog);
		}
		
		var dialogX;
		var dialogY;
		if (settings.title != null) {
			$dialogTitle.text(settings.title);
		}
		$dialogContent.html(settings.content);
		$dialog.css({"width": settings.width, "height": settings.height, "margin-left": - parseInt(settings.width / 2), "z-index": zIndex ++});
		dialogShow();
		
		if ($dialogTitle != null) {
			$dialogTitle.mousedown(function(event) {
				$dialog.css({"z-index": zIndex ++});
				var offset = $(this).offset();
				if (!window.XMLHttpRequest) {
					dialogX = event.clientX - offset.left;
					dialogY = event.clientY - offset.top;
				} else {
					dialogX = event.pageX - offset.left;
					dialogY = event.pageY - offset.top;
				}
				$("body").bind("mousemove", function(event) {
					$dialog.css({"top": event.clientY - dialogY, "left": event.clientX - dialogX, "margin": 0});
				});
				return false;
			}).mouseup(function() {
				$("body").unbind("mousemove");
				return false;
			});
		}
		
		if ($dialogClose != null) {
			$dialogClose.click(function() {
				dialogClose();
				return false;
			});
		}
		
		if ($dialogOk != null) {
			$dialogOk.click(function() {
				if (settings.onOk && typeof settings.onOk == "function") {
					if (settings.onOk($dialog) != false) {
						dialogClose();
					}
				} else {
					dialogClose();
				}
				return false;
			});
		}
		
		if ($dialogCancel != null) {
			$dialogCancel.click(function() {
				if (settings.onCancel && typeof settings.onCancel == "function") {
					if (settings.onCancel($dialog) != false) {
						dialogClose();
					}
				} else {
					dialogClose();
				}
				return false;
			});
		}
		
		function dialogShow() {
			if (settings.onShow && typeof settings.onShow == "function") {
				if (settings.onShow($dialog) != false) {
					$dialog.show();
					$dialogOverlay.show();
				}
			} else {
				$dialog.show();
				$dialogOverlay.show();
			}
		}
		function dialogClose() {
			if (settings.onClose && typeof settings.onClose == "function") {
				if (settings.onClose($dialog) != false) {
					$dialogOverlay.remove();
					$dialog.remove();
				}
			} else {
				$dialogOverlay.remove();
				$dialog.remove();
			}
		}
		return $dialog;
	}

	// 文件浏览
	$.fn.extend({
		browser: function(options) {
			var settings = {
				type: "image",
				title: message("admin.browser.title"),
				isUpload: true,
				browserUrl: jshop.base + "/admin/file/browser.jhtml",
				uploadUrl: "web/product/product!uploadImage.action",
				callback: null
			};
			$.extend(settings, options);
			
			var token = getCookie("token");
			var cache = new Array();
			return this.each(function() {
				var browserFrameId = "browserFrame" + (new Date()).valueOf() + Math.floor(Math.random() * 1000000);
				var $browserButton = $(this);
				$browserButton.click(function() {
					var $browser = $('<div class="xxBrowser"><\/div>');
					var $browserBar = $('<div class="browserBar"><\/div>').appendTo($browser);
					var $browserFrame;
					var $browserForm;
					var $browserUploadButton;
					var $browserUploadInput;
					var $browserParentButton;
					var $browserOrderType;
					var $browserLoadingIcon;
					var $browserList;
					if (settings.isUpload) {
						$browserFrame = $('<iframe id="' + browserFrameId + '" name="' + browserFrameId + '" style="display: none;"><\/iframe>').appendTo($browserBar);
						$browserForm = $('<form action="' + settings.uploadUrl + '" method="post" encType="multipart/form-data" target="' + browserFrameId + '"><input type="hidden" name="token" value="' + token + '" \/><input type="hidden" name="fileType" value="' + settings.type + '" \/><\/form>').appendTo($browserBar);
						$browserUploadButton = $('<a href="javascript:;" class="browserUploadButton button">' + message("admin.browser.upload") + '<\/a>').appendTo($browserForm);
						$browserUploadInput = $('<input type="file" name="file" \/>').appendTo($browserUploadButton);
					}
					$browserParentButton = $('<a href="javascript:;" class="button">' + message("admin.browser.parent") + '<\/a>').appendTo($browserBar);
					$browserBar.append(message("admin.browser.orderType") + ": ");
					$browserOrderType = $('<select name="orderType" class="browserOrderType"><option value="name">' + message("admin.browser.name") + '<\/option><option value="size">' + message("admin.browser.size") + '<\/option><option value="type">' + message("admin.browser.type") + '<\/option><\/select>').appendTo($browserBar);
					$browserLoadingIcon = $('<span class="loadingIcon" style="display: none;">&nbsp;<\/span>').appendTo($browserBar);
					$browserList = $('<div class="browserList"><\/div>').appendTo($browser);
	
					var $dialog = $.dialog({
						title: settings.title,
						content: $browser,
						width: 470,
						modal: true,
						ok: null,
						cancel: null
					});
					
					browserList("/");
					
					function browserList(path) {
						var key = settings.type + "_" + path + "_" + $browserOrderType.val();
						if (cache[key] == null) {
							$.ajax({
								url: settings.browserUrl,
								type: "GET",
								data: {fileType: settings.type, orderType: $browserOrderType.val(), path: path},
								dataType: "json",
								cache: false,
								beforeSend: function() {
									$browserLoadingIcon.show();
								},
								success: function(data) {
									createBrowserList(path, data);
									cache[key] = data;
								},
								complete: function() {
									$browserLoadingIcon.hide();
								}
							});
						} else {
							createBrowserList(path, cache[key]);
						}
					}
					
					function createBrowserList(path, data) {
						var browserListHtml = "";
						$.each(data, function(i, fileInfo) {
							var iconUrl;
							var title;
							if (fileInfo.isDirectory) {
								iconUrl = jshop.base + "/resources/admin/images/folder_icon.gif";
								title = fileInfo.name;
							} else if (new RegExp("^\\S.*\\.(jpg|jpeg|bmp|gif|png)$", "i").test(fileInfo.name)) {
								iconUrl = fileInfo.url;
								title = fileInfo.name + " (" + Math.ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified).toLocaleString() + ")";
							} else {
								iconUrl = jshop.base + "/resources/admin/images/file_icon.gif";
								title = fileInfo.name + " (" + Math.ceil(fileInfo.size / 1024) + "KB, " + new Date(fileInfo.lastModified).toLocaleString() + ")";
							}
							browserListHtml += '<div class="browserItem"><img src="' + iconUrl + '" title="' + title + '" url="' + fileInfo.url + '" isDirectory="' + fileInfo.isDirectory + '" \/><div>' + fileInfo.name + '<\/div><\/div>';
						});
						$browserList.html(browserListHtml);
						
						$browserList.find("img").bind("click", function() {
							var $this = $(this);
							var isDirectory = $this.attr("isDirectory");
							if (isDirectory == "true") {
								var name = $this.next().text();
								browserList(path + name + "/");
							} else {
								var url = $this.attr("url");
								if (settings.input != null) {
									settings.input.val(url);
								} else {
									$browserButton.prev(":text").val(url);
								}
								if (settings.callback != null && typeof settings.callback == "function") {
									settings.callback(url);
								}
								$dialog.next(".dialogOverlay").andSelf().remove();
							}
						});
						
						if (path == "/") {
							$browserParentButton.unbind("click");
						} else {
							var parentPath = path.substr(0, path.replace(/\/$/, "").lastIndexOf("/") + 1);
							$browserParentButton.unbind("click").bind("click", function() {
								browserList(parentPath);
							});
						}
						$browserOrderType.unbind("change").bind("change", function() {
							browserList(path);
						});
					}
					
					$browserUploadInput.change(function() {
						var allowedUploadExtensions;
						if (settings.type == "flash") {
							allowedUploadExtensions = setting.uploadFlashExtension;
						} else if (settings.type == "media") {
							allowedUploadExtensions = setting.uploadMediaExtension;
						} else if (settings.type == "file") {
							allowedUploadExtensions = setting.uploadFileExtension;
						} else {
							allowedUploadExtensions = setting.uploadImageExtension;
						}
						if ($.trim(allowedUploadExtensions) == "" || !new RegExp("^\\S.*\\.(" + allowedUploadExtensions.replace(/,/g, "|") + ")$", "i").test($browserUploadInput.val())) {
							$.message("warn", message("admin.upload.typeInvalid"));
							return false;
						}
						$browserLoadingIcon.show();
						$browserForm.submit();
					});
					
					$browserFrame.load(function() {
						var text;
						var io = document.getElementById(browserFrameId);
						if(io.contentWindow) {
							text = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML : null;
						} else if(io.contentDocument) {
							text = io.contentDocument.document.body ? io.contentDocument.document.body.innerHTML : null;
						}
						if ($.trim(text) != "") {
							$browserLoadingIcon.hide();
							var data = $.parseJSON(text);
							if (data.url != null) {
								if (settings.input != null) {
									settings.input.val(data.url);
								} else {
									$browserButton.prev(":text").val(data.url);
								}
								if (settings.callback != null && typeof settings.callback == "function") {
									settings.callback(data.url);
								}
								cache = new Array();
								$dialog.next(".dialogOverlay").andSelf().remove();
							} else {
								$.message(data);
							}
						}
					});
					
				});
			});
		}
	});

	// 令牌
	$(document).ajaxSend(function(event, request, settings) {
		if (!settings.crossDomain && settings.type != null && settings.type.toLowerCase() == "post") {
			var token = getCookie("token");
			if (token != null) {
				request.setRequestHeader("token", token);
			}
		}
	});
	
	$(document).ajaxComplete(function(event, request, settings) {
		var loginStatus = request.getResponseHeader("loginStatus");
		var tokenStatus = request.getResponseHeader("tokenStatus");
		
		if (loginStatus == "accessDenied") {
			$.message("warn", "登录超时，请重新登录");
			window.setTimeout(function() {
				window.location.reload(true);
			}, 2000);
		} else if (tokenStatus == "accessDenied") {
			var token = getCookie("token");
			if (token != null) {
				$.extend(settings, {
					global: false,
					headers: {token: token}
				});
				$.ajax(settings);
			}
		}

	});

})(jQuery);

// 令牌
$().ready(function() {
	
	$("form").submit(function() {
		var $this = $(this);
		if ($this.attr("method") != null && $this.attr("method").toLowerCase() == "post" && $this.find("input[name='token']").size() == 0) {
			var token = getCookie("token");
			if (token != null) {
				$this.append('<input type="hidden" name="token" value="' + token + '" \/>');
			}
		}
	});

	initControl();
});

function createDialog(o){
	var title = o.title || '';
	var content = o.content || '';
	var save = o.callback;
	var id = o.id || '';
	var style = o.style || "width:500px";
	var editDialog = $('#'+id);
	if(editDialog.length){
		if(content)
			editDialog.find('.dialog_cent').html(content);
		return editDialog;
	}
	editDialog = $('<div class="jqmWindow jqmdialog editDialog" id=\''+id+'\' style="'+style+'">'
			+'<div class="dialog_tt">'+title+'<a href="#" class="jqmClose"></a></div>'
			+'<div class="dialog_cent">'+content+'</div>'
			+'<div class="dialog_foot">'
				+ (save ? '<a href="javascript:;" class="button save">保存</a>' : '')
			+'</div>'
		+'</div>');
	$('body').append(editDialog);
	if(save){
		editDialog.find('.save').click(function(){
			save(editDialog);
		});
	}
	editDialog.jqm();
	return editDialog;
}

var FILTER_SELECT_TYPE = {
		'goods':'GOODS',// 选择商品
		'spec':'SPEC',// 选择规格
		'brand':'BRAND',//品牌
		'shop':'SHOP',//商铺
		'member':'MEMBER',//会员
		'promotion':'PROMOTION',// 促销
		'deliveryman':'DELIVERYMAN',// 送货员
};

function createFilterDialog(param){
	var editDialog;
	var filterType = param.filterType;
	var isMulti = param.isMulti == 'true' ? true : false;
	var id = param.id || '';
	var editDialog = $('#'+id+'_dialog');
	if(editDialog.length) {
		editDialog.remove();
		//editDialog.jqmShow(); 
		//return editDialog;
	}
	var $input = $('#'+id);
	var o;
	var data = {filterType:filterType};
	if(filterType == FILTER_SELECT_TYPE.goods){
		o = {id:id+'_dialog',title:'选择商品',name:'id,name',desc:'id,商品'};
	}else if(filterType == FILTER_SELECT_TYPE.spec){
		var groupId = $('#'+param.groupId+' option:selected').val();
		if(!groupId){
			alert('请先选择规格组！');
			return false;
		}
		data.groupId = groupId;
		o = {id:id+'_dialog',title:'请选择规格',name:'id,name',desc:'id,规格'};
	}else if(filterType == FILTER_SELECT_TYPE.brand){
		o = {id:id+'_dialog',title:'请选择品牌',name:'id,name',desc:'id,品牌'};
	}else if(filterType == FILTER_SELECT_TYPE.shop){
		o = {id:id+'_dialog',title:'请选择商铺',name:'id,name',desc:'id,商铺'};
	}else if(filterType == FILTER_SELECT_TYPE.member){
		o = {id:id+'_dialog',title:'请选择会员',name:'id,name,phoneNo',desc:'id,名称,账号'};
	}else if(filterType == FILTER_SELECT_TYPE.promotion){
		o = {id:id+'_dialog',title:'请选择促销与团购',name:'id,name,promotionType',desc:'id,名称,类型'};
	}else if(filterType == FILTER_SELECT_TYPE.deliveryman){
		o = {id:id+'_dialog',title:'请选择送货员',name:'id,name,jobNoe',desc:'id,姓名,工号'};
	}
	var nameArr = o.name.split(',');
	var descArr = o.desc.split(',');
	
	o.callback = function(dialog){
		var list = [];
		var ids = [];
		var texts = [];
		var selector = $('.filterContent').find('input[name="selector"]:checked').each(function(){
			var obj = {};
			var id = $(this).val();
			$(this).parent().parent().find('td').each(function(index){
				if(index == 0){
					obj[nameArr[index]] = id;
					ids.push(id);
				}else{
					obj[nameArr[index]] = $(this).text();
					texts.push($(this).text());
				}
			});
			list.push(obj);
		});
		if(param.callback){
			param.callback(list,dialog,ids.join(','),texts.join(','));
		}else{
			dialog.jqmHide();
		}
	};
	
	$.ajax({
		url:"web/common/control!filterList.action",
		type: "POST",
		data: data,
		dataType: "json",
		cache: false,
		async: false,
		success: function(message) {
			if(message.success == true || message.success == 'true'){
				o.content = '<div class="filterContent">';
				o.content += '<div>筛选：<input name="filterName" /></div>';
				o.content += '<table><thead><tr><th class="selectorTd"></th>';
				for(var i=1;i<descArr.length;i++){
					o.content += '<th>'+descArr[i]+'</th>';
				}
				o.content += '</tr></thead><tbody>';
				
				var list = message.list;
				for(var i=0;i<list.length;i++){
					o.content += '<tr>';
					for(var j=0;j<nameArr.length;j++){
						if(j == 0){
							o.content += '<td><input name="selector" type="'+(isMulti?'checkbox':'radio')+'" value="'+list[i][j]+'"/></td>';
						}else{
							o.content += '<td>'+(list[i][j] || '')+'</td>';
						}
					}
					o.content += '</tr>';
				}
				o.content += '</tbody></table></div>';
				editDialog = createDialog(o);
				
				$('.filterContent').find('input[name="filterName"]').keyup(function(){
					if($(this).val()){
						$(".filterContent tbody tr")
						.hide()
						.filter(":contains('"+( $(this).val() )+"')")
						.show();
					}else{
						$(".filterContent tr")
						.show();
					}
				}).keyup();
				
				editDialog.jqmShow();
			}else{
				alert('更新失败!'+message.errorMsg);
			}
		}
	});
}

function copyUrlDialog(url){
	createDialog({id:'copyDialog',title:'复制链接',content:'<input style="width:400px" value="'+url+'"/>'}).jqmShow();
}

function createSelect(o){
	var $this = $(o);
	var selectType = $this.attr("selectType");
	var value = $this.attr("selectvalue");
	var value_path = $this.attr("value_path");
	var extendParam = eval('('+$this.attr("extendParam")+')') || {};
	var data = $.extend({},{selectType:selectType},extendParam);
	$.ajax({
		url:"pc/common/control!select.action",
		type: "POST",
		data: data,
		dataType: "json",
		cache: false,
		success: function(message) {
			if(message.success == true || message.success == 'true'){
				var list = message.list;
				$this.append('<option value="">--请选择--</option>');
				for(var i=0;i<list.length;i++){
					var v = list[i][0];
					var n = list[i][1];
					if(value_path == 'name'){
						v = n;
					}
					var selected = (v == value || n == value) ? 'selected="selected"' : '';
					$this.append('<option value="'+v+'" '+selected+'>'+n+'</option>');
				}
			}else{
				alert('更新失败!'+message.errorMsg);
			}
		}
	});
}

function initControl(){
	$('.select').each(function(){
		createSelect(this);
	});
	
	$('.lselect').each(function(){
		$this = $(this);
		var lselectType = $this.attr('lselectType');
		$this.lSelect({
			url: "pc/common/control!lselect.action?lselectType="+lselectType,
			change:$this.attr("change")
		});
	});
	
	$('.filterList').each(function(){
		$this = $(this);
		var value_path = $this.attr('value_path');
		var text_path = $this.attr('text_path');
		var filterType = $this.attr('filterType');
		var groupId = $this.attr('groupId') ? $this.attr('groupId') : '';
		var disabled = $this.attr('disabled');
		var onselect = $this.attr('onselect');
		var tip = $this.attr('tip');
		tip = tip ? 'tip="'+tip+'"' : '';
		var name = $this.attr('id');
		var text_name = $this.attr('text_name') || name;
		var text_value = $this.attr('text_value') || '';
		var isMulti = $this.attr('isMulti');
		var $text = $('<input type="text" class="text" id="'+name+'_text" name="'+text_name+'" value="'+text_value+'" readonly="readonly" '+tip+' '+disabled+'/>');
		var	$select = $('<input id="'+name+'_select" class="jqModal" type="button" value="选择" '+disabled+'/>');
		var $clean = $('<input id="'+name+'_clean" type="button" value="清空" '+disabled+'/>');
		$text.insertBefore(this);
		$select.insertBefore(this);
		$clean.insertBefore(this);
		
		// 选择
		$select.click(function(){
			createFilterDialog({id:name+'_dialog',filterType:filterType
				,isMulti:isMulti
				,groupId : groupId 
				,callback:function(list,dialog,ids,texts){
					if(list.length == 0){
						alert('请选择至少一条记录');
						return;
					}
					document.getElementById(name).value = isMulti?ids:list[0][value_path];
					document.getElementById(name+'_text').value = isMulti?texts:list[0][text_path];
					$text[0].style.color = '#000';
					if(onselect) (typeof(window[onselect]) == "function")?eval(window[onselect](document.getElementById(name).value,document.getElementById(name+'_text').value)):eval(onselect);
					dialog.jqmHide();
					dialog.remove();
				}
			});
		});
		
		// 清空
		$clean.click(function(){
			document.getElementById(name).value = '';
			document.getElementById(name+'_text').value = '';
		});
	});
	
	(function($) {
		$.fn.extend({
			picCount:5,
			lImageList: function(options) {
				var settings = {
					data:[]
				};
				$.extend(settings, options);
				
				return this.each(function() {
					var entity = "entity";
					var saveOrderNos = function(){
						var orderNos = $("input[name='orderNo']");
						var no = [];
						for(var i=0;i<orderNos.length;i++){
							var orderNo = $(orderNos[i]);
							var pid = orderNo.attr("pid");	
							no.push(pid+"_"+orderNo.val());
						}
						$("#orderNos").val(no.join(","));
					}
					
					this.addpic = function(){
						var length = $("input[type='file']").length;
						if(length + $('.imgtable img').length >= this.picCount){
							alert('最多只能上传'+this.picCount+'张图片！');
							return;
						}
						$("#pic").append('<tr><td><input type="file" name="'+entity+'.imageFiles"><a href="#" onclick="$(this).parent().parent().remove();return false;">删除</td></tr>');
					};
					
					this.delpic = function(o,id){
						var deleteImageIds = $('#deleteImageIds');
						var v = deleteImageIds.val();
						if(v) v += ',';
						v += id;
						deleteImageIds.val(v);
						$(o).parents('table:first').html('<tr><td></td></tr>');
						
						saveOrderNos();
					};
					
					var data = options.data;
					var content = '<input type="hidden" id="deleteImageIds" name="'+entity+'.deleteImageIds"/><input type="hidden" id="orderNos" name="'+entity+'.orderNos" value=""/>'
					+'<table>'
					+	'<tr>';
					for(var i=0;i<data.length;i++){
						content += '<td>'
							+	'<table class="imgtable">'
							+		'<tr>'
							+			'<td>'
							+				'<img src="'+data[i].imagePath+'" style="width:170px;height:120px"/>'
							+			'</td>'
							+		'</tr>'
							+		'<tr>'
							+			'<td>'
							+				'序号：'
							+				'<input type="text" name="orderNo" pid="'+data[i].id+'" style="width:50px" value="'+data[i].orderNo+'">'
							+				'&nbsp;&nbsp;&nbsp;&nbsp;'
							+				'<a href="#" onclick="document.getElementById(\''+this.id+'\').delpic(this,'+data[i].id+'); return false;">删除</a>'
							+				'</td>'
							+				'</tr>'
							+	'</table>'
							+'</td>';
							if((i+1)%3==0){//每行三个
								content+='</tr><tr>';
							}
					}
					content +='</tr>';
					content +=	'<tr>'
					+		'<td colspan="6">'
					+			'<table id="pic">'
					+				'<tr>'
					+					'<td>'
					+						'<input type="button" value="添加图片" onclick="document.getElementById(\''+this.id+'\').addpic(); return false;"/>'
					+					'</td>'
					+				'</tr>'
					+			'</table>'
					+		'</td>'
					+	'</tr>'
					+'</table>';
					$(this).after(content);
					
					var i = this.picCount - $('.imgtable').length;
					while((--i) >= 0){
						$('#imgtr').append('<td><table class="imgtable"><tr><td></tr></td></table></td>');
					}
					
					saveOrderNos();
					$("input[name='orderNo']").blur(function(){
						saveOrderNos();
					});
				});
			}
		});
	})(jQuery);
}
