$(document).ready(function (){});

//禁止空格输入
$('input[type="password"]').each(function (){
	$(this).keypress(function (e){

		var theEvent = window.event || e;
	    var code = theEvent.keyCode || theEvent.which;
	    if(code == 32){
	       return false;
	    }


	});
});
//默认的信息
function showMsg(obj,msg,error){
	var c = 'msg_info',display = 'block';

	switch(error){

		//正确消息
		case 1:
		c = 'msg_success';
		obj.html("<span></span>"+msg).removeClass("msg_info msg_error");
		break; 

		//错误消息
		case 2:
		c = 'msg_error'; 
		obj.html("<span></span>"+msg).removeClass("msg_info msg_success");
		break;

		//清空消息体
		case 3:
		c = 'msg_error'; 
		display = 'none'; //直接隐藏消息体
		break;

		//默认是普通消息
		case 0:
		default:
		c = 'msg_info';
		obj.html("<span></span>"+msg).removeClass("msg_info msg_success msg_error");
		break;
	}

	obj.html("<span></span>"+msg).addClass(c).css('display',display);
}
//设置状态
function setundisabled(obj,torf,value){

	try{
		obj.val(value);
		obj.html(value);
	}
	catch(e){
		
	}
	obj.attr('disabled',torf);
}

//倒计时 注意调用前先定义一个全局的时间变量timeout
//obj 时间数字的节点 url跳转地址 timeout 总时间全局的

function autoJump(obj,url,timeout){
	//自动跳转
	if(obj !== 'undefined'){
		Interval = setInterval(function (){
			obj.innerHTML = timeout;
			if(timeout<=1){
				clearInterval(Interval);
				window.location.href= url;
				return;
			}
				timeout --;
		},1000);
	}		
}

/**
	ajax 登录
**/
function ajaxLogin(){

}