// JavaScript Document

var mobileObj = $("input[name='mobile']"); //手机号
var mobileCodeObj = $("input[name='mobileCode']");//手机验证码
var getMobileCodeObj = $('#getmobilecode'); //获取手机验证码
var submitLoginObj = $('#submitLogin'); //第三方登录按钮
var loginUserNameObj = $("input[name='username']");//登录用户的用户名
var passWordObj = $("input[name='password']");//密码
var userNameObj = $("input[name='nick']"); //真实姓名
var emailObj = $("input[name='email']"); //邮箱
var emailCodeObj = $("input[name='emailCode']");//邮箱验证码
var getEmailCodeObj = $('#getemailcode'); //获取邮箱验证码
var agreeObj = $("input[name='agree']");//协议
var indentObj = $(":radio[name='ident']");//选择身份类别(单选类型的)
var selectIndentObj = $("select[name='ident']");//选择身份类别(下拉类型的)
var submitRegisterObj = $(".submit_button_yz");//注册按钮
var codevalue = getMobileCodeObj.html();//手机验证码发送按钮默认内容
var emailcodevalue = getEmailCodeObj.html();//邮箱验证码发送按钮默认内容
var mathCodeObj = $("input[name='txt_mathcode']");//安全验证码

var times = 100;
var interval=null;//定时器

//手机验证
mobileObj.focus(
	function (){
		var infoMsg = "请填写您的手机号，注册成功后用于登录和找回密码。";
		showMsg($(this).nextAll(".messge"),infoMsg,0);
		setBorder($(this),3);
	}
).blur(
	function (){
		setBorder($(this),0);
		if ( check_phone($(this)) ){
			isUserAgin( 'http://www.shejiben.com/account/register.php', 'act=checkmobile&mobile='+$(this).val(), $(this).nextAll('.messge') );
		}
	}	
);

//手机验证码验证
mobileCodeObj.focus(
	function (){
		var infoMsg = "请填写验证码";
		showMsg($(this).nextAll(".messge"),infoMsg,3);
		setBorder($(this),3);
	}
).blur( 
	function (){
		setBorder($(this),0);
		check_mobileCode($(this));
	} 
);

//邮箱验证码验证
emailCodeObj.focus(
	function (){
		var infoMsg = "请填写验证码";
		showMsg($(this).nextAll(".messge"),infoMsg,3);
		setBorder($(this),3);
	}
).blur( 
	function (){
		setBorder($(this),0);
		check_mobileCode($(this));
	} 
);

getMobileCodeObj.hover(
    function (){
        $(this).css({'background':'#ccc'});
    },function (){
        $(this).css({'background':'#eee'});
    }
)
getEmailCodeObj.hover(
    function (){
        $(this).css({'background':'#ccc'});
    },function (){
        $(this).css({'background':'#eee'});
    }
)
//用户密码验证
passWordObj.focus(
	function (){
		var infoMsg = "6-16个字符，支持数字、字母及常用符号，不允许有空格。";
		if(third){
			showMsg($(this).nextAll(".messge"),infoMsg,3);
		}else{
			showMsg($(this).nextAll(".messge"),infoMsg,0);
		}
		setBorder($(this),3);
	}
).blur( 
	function (){
		var infoMsg = "6-16个字符，支持数字、字母及常用符号，不允许有空格。";
		setBorder($(this),0);
		if(third){
			showMsg($(this).nextAll(".messge"),infoMsg,3);
		}else{
			check_passwd($(this));
		}		
	} 
);

//用户名验证
userNameObj.focus(
	function (){
		var infoMsg = "4-14个字符，支持中文、英文、数字、“-”、“_”，不允许有空格。";
			switch(parseInt(selectIndentObj.val())){
				case 0:
					infoMsg = '请填写真实姓名';
				break;

				case 1:
					infoMsg = '请填写机构名称';
				break;

				case 2:
				case -1:
					infoMsg = '请填写昵称';
				break;

			}
		
		showMsg($(this).nextAll(".messge"),infoMsg,0);
		setBorder($(this),3);
	}
).blur( 
	function (){
		setBorder($(this),0);
		
		check_name($(this));
	}
);

selectIndentObj.blur(function (){
	setBorder($(this),0);
} );

//邮箱验证码验证
emailObj.focus(
	function (){
		var infoMsg = "请填写您的邮箱，注册成功后用于登录和找回密码。";
		showMsg($(this).nextAll(".messge"),infoMsg,0);
		setBorder($(this),3);
	}
).blur( 
	function (){
		setBorder($(this),0);
		if( check_mail($(this)) ){
			isUserAgin( 'http://www.shejiben.com/account/register.php', 'act=checkemail&email='+$(this).val(), $(this).nextAll('.messge') );
		}
	} 
);

//普通用户/设计师注册选择
function change_tab()
{
	$(".register_yz ul li").eq(0).addClass("cur");
	$(".center_register .register_from").hide();
	$(".center_register .register_from").eq(1).show();
	$(".register_yz ul li").click(function(){
		var li_cur=$(this).index();
		$(".register_yz ul li").not(this).removeClass("cur");
		$(this).addClass("cur");
		$(".center_register .register_from").hide();
		$(".center_register .register_from").eq(li_cur+1).show();
	});
}
//用户手机验证
function check_phone(obj){
		if(obj.length <= 0){return true;}//不存在的节点直接返回true
		var value = obj.val();
		var errorObj = obj.nextAll(".messge");
		if(value == "")
		{
			var infoMsg = "请填写您的手机号码";
			showMsg(errorObj,infoMsg,2); 
			setBorder(obj,1);
			return false;
		}
		else
		{

			var infoMsg ="请填写正确的中国大陆11位手机号码。没有手机号？您可以使用<a href='"+url+"' style='color:#FF0000;' class='hover'>邮箱注册</a>";
			var reg= /^1[34587]\d{9}$/;
			if(value.length != 11 || !reg.test(value))
			{
				showMsg(errorObj,infoMsg,2);
				setBorder(obj,1);
				return false;
			}
			else
			{
				
				var infoMsg = "";
				showMsg(errorObj,infoMsg,1);
				return true;
			}
		}
	
}	
//验证码验证
function check_mobileCode(obj){
		if(obj.length <= 0){return true;}//不存在的节点直接返回true
		var value = obj.val();
		var errorObj = obj.nextAll(".messge");
		if(value == "")
		{
			var infoMsg = "请填写验证码";
			showMsg(errorObj,infoMsg,2);
			setBorder(obj,1);
			return false;
		}
		else
		{
			if(value.length != 6 || isNaN(value))
			{
				var infoMsg = "请填写6位数字的验证码";
				showMsg(errorObj,infoMsg,2);
				setBorder(obj,1);
				return false;
			}
			else
			{
				var infoMsg = " ";
				showMsg(errorObj,infoMsg,1);
				return true;
			}
		}
	
}
//验证密码
function check_passwd(obj){
		if(obj.length <= 0){return true;}//不存在的节点直接返回true
		var value = $.trim(obj.val());
		var errorObj = obj.nextAll(".messge");
		if(value == "")
		{
			var infoMsg = "请填写密码";
			showMsg(errorObj,infoMsg,2);
			setBorder(obj,1);
			return false;
		}
		else  
		{
			//
			if(/^[A-Za-z0-9\_\S]+$/.test(value))
			{

				if(value.length > 16)  //2015-12-21  原来14改成16
				{
					var infoMsg = "密码太长，最多16个字符。";
					showMsg(errorObj,infoMsg,2); 
					setBorder(obj,1);
					return false;
				}

				if(value.length < 6 )
				{
					var infoMsg = "密码太短，至少6个字符。";
					showMsg(errorObj,infoMsg,2); 
					setBorder(obj,1);
					return false;
				}

				//2015-12-21 新加规则
				var pregRule2 = /^\d{6,8}$/;
				if( pregRule2.test( value ) ) 
				{
					var infoMsg = "密码不能为9位以下纯数字。";
					showMsg(errorObj,infoMsg,2); 
					setBorder(obj,1);
					return false;
				}

				useNum = String(value);
	            var useFirst = useNum.substring(0,1);
	            var usearr = useNum.split(useFirst);
	            var usrStrNum = usearr.length-1;
	            if(useNum.length == usrStrNum)
	            {
	         		var infoMsg = "密码字符不能完全一致。";
					showMsg(errorObj,infoMsg,2); 
					setBorder(obj,1);
					return false;
	            }
	            //end

				var infoMsg = "";
				showMsg(errorObj,infoMsg,1);
				return true;
			}

			else
			{
				var infoMsg = "密码仅支持数字、字母及常用符号，不允许有空格。";
				showMsg(errorObj,infoMsg,2);
				setBorder(obj,1);
				return false;
			}

			
		}

}
//验证昵称
function check_name(obj){

		if(obj.length <= 0){return true;}//不存在的节点直接返回true
		var value = $.trim(obj.val());
		var errorObj = obj.nextAll(".messge");
		var str = '昵称';
		var length = 14;
		if(obj.attr('indentity')){

			switch(parseInt(selectIndentObj.val())){
				case 0:
					str = '真实姓名';
				break;

				case 1:
					str = '机构名称';
				break;

				case 2:
					str = '昵称';
				break;

			}
		};

		
		if(obj.attr('loginThenBind')){
			str = '登录帐户';
			length = 25;
		};

		if(value == "")
		{
			var infoMsg = "请填写"+str;
			showMsg(errorObj,infoMsg,2);
			setBorder(obj,1);
			return false;
		}
		else
		{

			if( /^[\w\u4e00-\u9fa5]+$/.test(value))
			//else if( /^[A-Za-z0-9\_\u4e00-\u9fa5]+$/.test(value))
			{
				value = value.replace (/[^\x00-\xff]/g,"rr");  
				if(value.length > 14 ){

					var infoMsg = str+"太长，最多14个字符。";
					showMsg(errorObj,infoMsg,2);
					return false;
				}

				if(value.length < 4 ){

					var infoMsg = str+"太短，至少4个字符。";
					showMsg(errorObj,infoMsg,2);
					return false;
				}
				var infoMsg = " ";
				showMsg(errorObj,infoMsg,1);
				return true;
			}
			else
			{

				var infoMsg = str+"仅支持汉字、字母、数字、-、_，不允许有空格。";
				showMsg(errorObj,infoMsg,2);
				setBorder(obj,1);
				return false;
			}

		}
}

//验证登录用户名
function check_loginUerName(obj){
	var value = $.trim(obj.val());
	if(value == ''){
		showMsg(obj.nextAll('.messge'),'请填写帐号',2)
		setBorder(obj,1);
		return false;
	}
	showMsg(obj.nextAll('.messge'),'',3)
	return true;

}

//第三方验证密码
function checkPasswd(obj){
	var value = $.trim(obj.val());
	if(value == ''){
		showMsg(obj.nextAll('.messge'),'请填写密码',2)
		setBorder(obj,1);
		return false;
	}
	showMsg(obj.nextAll('.messge'),'',3)
	return true;
}


//验证邮箱
function check_mail(obj){

	if(obj.length <= 0){return true;}//不存在的节点直接返回true
	var value = $.trim(obj.val());
	var errorObj = obj.nextAll(".messge");
	if (value == '')
	{
		var infoMsg = "请填写邮箱地址";
		showMsg(errorObj,infoMsg,2);
		setBorder(obj,1);
		return false;
	}
	else 
	{

		if (/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$/.test(value) && value.length >= 6 )
		{
			var infoMsg = "";
			showMsg(errorObj,infoMsg,1);	
			return true;
		}
		else
		 {
			var infoMsg = "请填写正确的邮箱地址";
			showMsg(errorObj,infoMsg,2);
			setBorder(obj,1);
			return false;
		}
	}
}

//选择身份
function check_indent(obj){

	if(obj.length <= 0){return true;}//不存在的节点直接返回true
	var select = obj.is(':checked');
	var errorObj = obj.parent().next(".messge");
	if(!select){
		var infoMsg = "请选择注册身份";
		showMsg(errorObj,infoMsg,2);
		setBorder(obj,1);
		return false;
	}

	showMsg(errorObj,'',3); 
	return true;
}

//验证选择身份(select)
function check_selectIndentObj(obj){


	if(obj.length <= 0){return true;}//不存在的节点直接返回true
	
	var ident = obj.val();

	var errorObj = obj.next(".messge");
	if( ident == -1 ){
		var infoMsg = "请选择身份类型";
		showMsg(errorObj,infoMsg,2);
		setBorder(obj,1);
		return false;
	}

	showMsg(errorObj,'',3); 
	return true;

}
//复选框的选中处理
function check_checkbox(obj)
{
	if(obj.length <= 0){return true;}//不存在的节点直接返回true
	var ck = obj.attr('checked');
	var errorObj = obj.nextAll(".messge");
	if(!ck){
		var infoMsg = "请阅读并同意《百爪鱼网服务协议》";
		showMsg(errorObj,infoMsg,2);
		setBorder(obj,1);
		return false;
	}
	showMsg(errorObj,'',1); 
	return true;

}

//手机是否可用
function mobile_isagin(){
	if(check_phone(mobileObj)){
		$.ajax({
			url:document.location.href,
			type:'POST',
			data:'',
			dataType:'json'
		});
	}

}


//注册验证
function register_check()
{
		
	if(
		check_indent(indentObj) &&
	    check_mail(emailObj) && 
	    check_phone(mobileObj) &&
	    check_mobileCode(mobileCodeObj) &&
	    check_mobileCode(emailCodeObj) &&
	    check_passwd(passWordObj) &&
	   	check_selectIndentObj(selectIndentObj) &&
	   	check_name(userNameObj) && 
	    check_checkbox(agreeObj) 
	  )
	{
		passWordObj.val( $.md5( $.trim( passWordObj.val() ).toLowerCase() ) );
		setundisabled(submitRegisterObj,true,'提交中...');
		return true; 
	}
	else
	{
		return false;		
	}
}

//登录验证
function checkLoginForm(){
	if(check_loginUerName(loginUserNameObj) && checkPasswd(passWordObj)){
		setundisabled(submitLoginObj,true,'登录中...');
		$.ajax({
			url:'/account/login.php',
			type:'post',
			data:'username='+loginUserNameObj.val()+'&password='+$.md5( $.trim(passWordObj.val()).toLowerCase() )+'&bindthird=1',
			dataType:'json',
			success:function(data){
					var error = data.error;
					if (data.meg*1 == 1) {
						setundisabled(submitLoginObj,false,'立即登录');
						showMsg(passWordObj.nextAll('.messge'),error,2);
					}else if (data.meg == 0) {
						setundisabled(submitLoginObj,true,'登录成功...');
						window.location.href = data.error;

					};
			},
			error:function (XMLHttpRequest, textStatus, errorThrown){
				setundisabled(submitLoginObj,false,'立即登录');
              	alert('登录出错，请重试。');
			}
		})
	}

	return false;

}
//刷新验证码
function newverifypic() {
    var A = new Date().getTime();
    if ($('#passport')) {
        $('#passport').attr('src', 'http://www.shejiben.com/passport.php?t=' + A);
    }
};

//获取手机验证码
getMobileCodeObj.click(function (){
	if(!check_phone(mobileObj)){return false;}//先检查手机号的合法性
	$('.auth_code').css('display','block');
	
	if(!autoCode(mathCodeObj)){return false;}

});
function autoCode(obj){

	$('.auth_code').show();
    //if(obj.length <= 0){return true;}//不存在的节点直接返回true
    $("#btn_mathcode").die().live('click',function(){

        var rand_num = $.trim(obj.val());

        if(rand_num == '') 
        {    	
            obj.focus().css('border','1px #00b34b solid');
        }
        else
        {
            $(".auth_code").hide();
            if($("#btn_mathcode").parents('.box').siblings().find('input[name=email]').length <=0){
				getCode(rand_num);
            }
            else 
            {
				getCodeEmail(rand_num);
            }
            
        }
    });
}

function getCode(rand_num){
	mobileCodeObj.focus();//文本框获取焦点
	setundisabled($(this),true,'获取中...');
	 $(this).css({'background':'#eee'});
	$.ajax({

		url:document.location.href,
		type:'POST',
		data:'act=getMobileCode&rand_num='+rand_num+'&mobile='+mobileObj.val(),
		dataType:'json',
		success:function (data){
			//
			if(data.error*1 == 1 ){
				setundisabled(getMobileCodeObj,false,codevalue);
				showMsg(mobileObj.nextAll('.messge'),data.msg,2);

			}else{
				mobileCodeObj.attr('disabled',false);
				send_agin(getMobileCodeObj);
				showMsg(mobileObj.nextAll('.messge'),data.msg,1);
				interval = setInterval(function (){
					send_agin(getMobileCodeObj);
				},1000);
			}
			 $(this).css({'background':'#eee'});
		},
		error:function (XMLHttpRequest, textStatus, errorThrown){
			  //  alert(XMLHttpRequest.status);
              //  alert(XMLHttpRequest.readyState);
              //alert(textStatus);
              setundisabled(getMobileCodeObj,false,codevalue);
              alert('获取手机验证码失败，请重试。');
		}
	});
}
//获取邮箱验证码
getEmailCodeObj.click(function (){
		
	if(!check_mail(emailObj)){return false;}//先检查邮箱的合法性
	$('.auth_code').css('display','block');
	
	if(!autoCode(mathCodeObj)){return false;}

});

submitLoginObj.click(function (){
	 checkLoginForm();
})

function getCodeEmail(rand_num){
	emailCodeObj.focus();//文本框获取焦点
	setundisabled($(this),true,'获取中...');
	 $(this).css({'background':'#eee'});
	$.ajax({

		url:document.location.href,
		type:'POST',
		data:'act=getEmailCode&rand_num='+rand_num+'&email='+emailObj.val(),
		dataType:'json',
		success:function (data){
			//
			if(data.error*1 == 1 ){
				setundisabled(getEmailCodeObj,false,emailcodevalue);
				showMsg(emailObj.nextAll('.messge'),data.msg,2);

			}else{
				emailCodeObj.attr('disabled',false);
				send_agin(getEmailCodeObj);
				showMsg(emailObj.nextAll('.messge'),data.msg,1);
				interval = setInterval(function (){
					send_agin(getEmailCodeObj);
				},1000);
			}
			 $(this).css({'background':'#eee'});
		},
		error:function (XMLHttpRequest, textStatus, errorThrown){
			  //  alert(XMLHttpRequest.status);
              //  alert(XMLHttpRequest.readyState);
              //alert(textStatus);
              setundisabled(getEmailCodeObj,false,emailcodevalue);
              alert('获取邮箱验证码失败，请重试。');
		}
	});
}
function send_agin(obj){
	if(times > 0){
		setundisabled(obj,true,'重新获取('+times+')');
	}else{
			clearInterval(interval);
		//if(getCookie('moblie_yz_num')<=10){
			setundisabled(obj,false,"发送验证码")
			times = 120;
	//	}
	}
	times=times-1;
}

function isUserAgin(url,data,obj){  
	
	$.ajax({
		url:url,
		type:'POST',
		data:data,
		dataType:'json',
		success:function (data){

			if(data.error *1 == 1){
				showMsg(obj,data.msg,2);
			}
		
		},
		error:function (){
			return ;
		}
	});
		
}

function setBorder(obj,type){
	type = type *1;
	switch(type){
		//默认样式
		case 0:
		wrong = '1px solid #cbcbcb';
		break;
		
		//错误样式
		case 1:
		wrong = '1px #f77071 solid';
		break;

		//焦点状态
		case 3:
		wrong = '1px #68a666 solid';
		break;

		default:
		wrong = '1px solid #cbcbcb';
		break;
	}
	obj.css({'border':wrong});
}

selectIndentObj.change(function (){

	var str = '昵&nbsp;&nbsp;&nbsp;&nbsp;称：';
	switch(parseInt($(this).val())){
		case 0:
			str = '真实姓名：';
		break;

		case 1:
			str = '机构名称：';
		break;

		case 2:
			str = str;
		break;


	}

	if( $(this).val() != -1 ){
		showMsg($(this).next('.messge'),'',3);
	}
	userNameObj.prev('label').html(str);
	setBorder(userNameObj,0);
	showMsg(userNameObj.next('.messge'),'',3);

});