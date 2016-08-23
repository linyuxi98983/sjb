/*
	common javascript
	add by wind 20151115 
*/
//提示框显示,默认停留一秒消失,a为提示的内容
var showError = function(a,time,callback) {
	//添加提示框html代码
	msgWindowHtml();
    a = a.replace(/\\n/g, "<br/>");
    $("#error-pop-msg").html(a);
    $("#error-pop").show();
    $("#fullScreen_mask").show();
    setTimeout(function() {
        $("#error-pop").hide();
        $("#fullScreen_mask").hide();
        if(callback){
        	callback();
        }
    },(time || 1000));
}

var msgWindowHtml = function(){
	//先删除页面存在的提示框html代码
	$("#fullScreen_mask").remove();
	$("#error-pop").remove();
	var msg = '<div class="fullScreen full_swipe" id="fullScreen_mask" style="height: 100%; display: none;"></div>';
	msg += '<div class="fullScreen autohide noBg" id="error-pop" style="display: none; height: 100% !important;">';
	msg += '<div class="pt_d" onclick="hideAlarmWin()"><div class="pt_note"><p id="error-pop-msg"></p></div></div></div>';
	$("body").append(msg);
}

//点击提示框时关闭提示框
function hideAlarmWin(){
	$("#fullScreen_mask").remove();
	$("#error-pop").remove();
}

var queryUrlParam = function(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}

var getRound = function(num){	
	return num.toFixed(2);
}

/**
 * 获取当前所在位置的经纬度（手机）
 * @returns
 */
var getPosition = function(callback){
	if (navigator.geolocation){
	    navigator.geolocation.getCurrentPosition(function(position){
	    	callback({"lat":position.coords.latitude,"lng":position.coords.longitude});	
	    });
	    return true;
	}else{
		if(console) console.log("该浏览器不支持获取地理位置。");
	}
}