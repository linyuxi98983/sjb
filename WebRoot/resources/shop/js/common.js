$(function(){
	$("li.all a").click(function(){
		var flg = $(this).hasClass("switch-off");
		if(flg){//ÏÔÊ¾
			$("#sortList").show();
			$(this).removeClass("switch-off").addClass("switch-on");
		}else{//Òþ²Ø
			$("#sortList").hide();
			$(this).removeClass("switch-on").addClass("switch-off");
		}
	});
 });