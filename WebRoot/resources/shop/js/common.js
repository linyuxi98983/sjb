$(function(){
	$("li.all a").click(function(){
		var flg = $(this).hasClass("switch-off");
		if(flg){//��ʾ
			$("#sortList").show();
			$(this).removeClass("switch-off").addClass("switch-on");
		}else{//����
			$("#sortList").hide();
			$(this).removeClass("switch-on").addClass("switch-off");
		}
	});
 });