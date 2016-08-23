(function () {
	var data = {};
	if(window.location.href.indexOf("index") != -1){
		data.isIndex = 1;
	}
	// 加载头部
	$.ajax({
		url: Global.base + "/shop/banner.action",
		type: "POST",
		data:data,
		dataType: "html",
		cache: false,
		success: function(html) {
			var first = document.body.firstChild;//得到页面的第一个元素 
			$(html).insertBefore(first);//在得到的第一个元素之前插入 
			initKeyword();
			$(".loginout").click(function(){
				window.location.href = Global.base + "/shop/login/login!clean.action";
			});
			$(".menu_li").hover(function(){
				$(this).addClass("on");
			},function(){
				$(this).removeClass("on");
			})
		}
	});
	
	
})();
function initKeyword(){
	var keyword = $('input[name="keyword"]').val();
	if(keyword){
		$('#keyword').val(keyword);
	}
}