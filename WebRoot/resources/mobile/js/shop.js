/**
 * 公共收藏逻辑，未登陆将跳转到登陆页面
 * @param favCls 收藏图标样式
 * @param keepKind 0：商品 1：商铺
 * @param loginUrl 登陆url
 */
function favCommon(favCls,keepKind,loginUrl){
	$(favCls).click(function(){
		var $this = $(this);
		$.ajax({
			type: "GET",
			url: Global.base+"/mobile/member/favorite!" + ($this.hasClass("on") ? "delete":"save") + ".action",
			dataType: "json",
			data:{
				"entity.objectId":$this.attr("objectId"),
				"entity.keepKind":keepKind
			},
			success: function(message) {
				if(message.success){
					$this.hasClass("on") ? $this.removeClass("on") : $this.addClass("on");
				}
			},
			error:function(message){
				if(message.status == 200){
					window.location.href = loginUrl + "?currentUrl="+window.location.href;
				}
			}
		});
	});
}

/**
 * 获取商铺分类列表
 */
function getShopTypeList(appendCls,callback){
	$.ajax({
		url: Global.base + "/mobile/shop/shoptype!list.action",
		type: "POST",
		data:{},
		dataType: "html",
		cache: false,
		success: function(message) {
			$(appendCls).append(message);
			if(callback) callback();
		}
	});
}

/**
 * 获取商铺列表
 */
function getShopList(appendCls,callback){
	// 先清除列表
	$(appendCls).html('');
	
	var lat = $("input[name='lat']").val();
	var lng = $("input[name='lng']").val();
	var typeId = $(".all-type").attr("typeid");
	var order = $(".default-order").attr("order");
	console.log(typeId+","+order);
	m_loadMore.loadParams = {
			appendCls:appendCls,
			data:{lat:lat,lng:lng,typeId:typeId,order:order},
			url: Global.base + "/mobile/shop/shop!shoplist.action",
			callback:callback
	}
	m_loadMore.init();
}

/**
 * 获取商铺商品列表
 */
function getShopGoodsList(appendCls,callback){
	var shopId = $('input[name="id"]').val();
	m_loadMore.loadParams = {
			appendCls:appendCls,
			data:{result:"shop_goods_list",shopId:shopId},
			url: Global.url_goodslist,
			callback:callback
	}
	m_loadMore.init();
}

function bindLocation(){
	var lat =  $("input[name='lat']").val();
	var lng =  $("input[name='lng']").val();
	$(".location").click(function(){
		window.location.href =Global.base+"/mobile/shop/shop!map.action?lat="+lat+"&lng="+lng;
	});
}

/**
 * 加载当前经纬坐标
 */
function getCurrentPostion(callback){
	if($("input[name='lat']").val() && $("input[name='lng']").val()) return callback();
	var succ = getPosition(function(pos){
		if(pos){
			$("input[name='lat']").val(pos.lat);
			$("input[name='lng']").val(pos.lng);
		}
		callback();
	});
}

/**
 * nearby.ftl 初始化
 */
function nearbyInit(){
	// 加载商铺分类模块
	getShopTypeList(".nearby-type");
	// 加载列表模块
	getCurrentPostion(function(){
		getShopList(".nearby-list",function(){
			favCommon(".shop-fav",1,Global.url_login);
			bindLocation();
		});
	});
} 

/**
 * shoplist.ftl 初始化
 */
function shopListInit(){
	var typeId = $("input[name='typeId']").val();
	
	// 商铺列表
	getCurrentPostion(function(){
		getShopList(".nearby-list",function(){
			favCommon(".shop-fav",1,Global.url_login);
			bindLocation();
		},{typeId:typeId});
	});
	
	//下拉样式切换
	$("#option_detail ul a").mouseover(function(){
		$(this).closest("#option_detail ul").find("li").removeClass("on");
		$(this).find("li").addClass("on");
	}).mouseout(function(){
		$(this).find("li").removeClass("on");
	}).click(function(){
		var $this = $(this);
		
		// 处理选中项的显示和保存选中值
		$this.attr("typeid") && $(".all-type").attr("typeid",$this.attr("typeid")) && $("#subTypeSelected").html($this.find("li").html());
		$this.attr("order") && $(".default-order").attr("order",$this.attr("order")) && $("#orderSelected").html($this.find("li").html());
		
		// 刷新商铺列表
		getCurrentPostion(function(){
			getShopList(".nearby-list",function(){
				favCommon(".shop-fav",1,Global.url_login);
				bindLocation();
			});
		});
		
		// 隐藏选择框
		$(".mask").hide();
		document.getElementById("option_detail").style.visibility="hidden";
		$("#product_sort li.on").removeClass("on");
	});
	//全部菜系
	$(".all-type").click(function(){
		$(".subtype-option").show();
		$(".order-option").hide();
		$(this).closest("li").toggleClass("on");
		$(".default-order").closest("li").removeClass("on");
		if($(this).closest("li").hasClass("on")){
			$(".mask").show();
			document.getElementById("option_detail").style.visibility="visible";
		}else{
			$(".mask").hide();
			document.getElementById("option_detail").style.visibility="hidden";
		}
	});
	//默认排序
	$(".default-order").click(function(){
		$(".subtype-option").hide();
		$(".order-option").show();
		$(this).closest("li").toggleClass("on");
		$(".all-type").closest("li").removeClass("on");
		if($(this).closest("li").hasClass("on")){
			$(".mask").show();
			document.getElementById("option_detail").style.visibility="visible";
		}else{
			$(".mask").hide();
			document.getElementById("option_detail").style.visibility="hidden";
		}
	});
	//点击遮罩时候隐藏筛选下拉框
	$(".mask").click(function(){
		document.getElementById("option_detail").style.visibility="hidden";
		$(this).hide();
		$(".all-type,.default-order").closest("li").removeClass("on");
	});
}

/**
 * shop_goods_list.ftl 初始化
 */
function shopGoodsListInit(){
	getShopGoodsList(".shop-list",function(){
		favCommon(".shop-fav",0,Global.url_login);
		favCommon(".fav",1,Global.url_login);
	});
}