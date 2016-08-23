(function() {
	// 页面加载所需函数
	$(function() {
		/* start: 调用slidesjs图片轮播插件 */
		$('#slides').slidesjs({
			width : 940,
			height : 528,
			navigation : false,
			play : {
				active : false,
				auto : true,
				interval : 4000,
				swap : true
			}
		});
	});
})();

$().ready(function(){
	function cal(ele) {
		var start = parseInt(ele.attr("start").replace(/,/g, ""));
		var end = parseInt(ele.attr("end").replace(/,/g, ""));
		var now = parseInt(ele.attr("now").replace(/,/g, ""));
		var timestamp;
		if(now < start){
			bindCountdown(ele, start);
		}else if (start < now && now < end) {
			ele.parents(".tips-container").hide();
			bindCountdown(ele, end);
		}else if (end < now){
			ele.parent().html("已结束");
		}
	}

	function bindCountdown(ele, timestamp) {
		ele.countdown({
			reload:false,
			timestamp : timestamp,
			callback : function(days, hours, minutes, seconds) {
				if (days == 0 && hours == 0 && minutes == 0 && seconds == 0) {
					!this.reload && (this.reload = true) && (window.location.href = window.location.href);
				}
			}
		});
	}
	
	$(".countdown").each(function() {
		var $this = $(this);
		cal($this);
	});
});