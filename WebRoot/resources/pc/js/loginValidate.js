$(function(){
	
	
	
});

function index_home(){
	$.ajax({
		
		url:"/sjb/pc/login/login!validateLogin.action",
		method:"get",
		dataType:"json",
		success:function(data){
			if(data.success){
				if(data.memberType == 0){//业主
					location.href = "/sjb/pc/mb/index.action";
				}else if(data.memberType == 1){//设计师
					location.href = "/sjb/pc/ds/index.action";
				}else if(data.memberType == 2){
					location.href = "/sjb/pc/org/index.action";
				}//设计机构
			}else{
				location.href = "/sjb/pc/login/login.action";
			}
		},
		error:function(){
			alert("请求出错！");
		}
	});
	
}