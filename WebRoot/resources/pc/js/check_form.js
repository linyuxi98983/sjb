// JavaScript Document

// 兼容头部搜索栏
// var jQuery = jQuery;
// jQuery('#quicksearch input').bind('focus blur',function(){
//     jQuery(this).css('border','none');   
//     return false; 
// });

var labelValueObj = jQuery(".default_value"); //label代替显示文本框的value值
var input_textObj = jQuery("input[type='text']"); //文本框

labelValueObj.click(function(){
    if(labelValueObj.length < 1){
        return false;
    }
    jQuery(this).nextAll('input').focus();
});

jQuery("form:not('#quicksearch')").find("input[type='text'],select").focus(function(){
    if(jQuery(this).parents('form').attr('id') == 'common_bottom_zb' ){
        return false;
    }
    jQuery(this).parents('form').find('.msg').hide();
    jQuery(this).css("border","1px #00b34b solid");
}).keyup(function(){
    var inputValue = jQuery(this).val();
        //jQuery(this).prev('.default_value').hide();
        if(inputValue !== '' ){
            jQuery(this).prevAll('.default_value').hide();
        }
    }).blur(function(){
    if(jQuery(this).parents('form').attr('id') == 'quicksearch' || jQuery(this).parents('form').attr('id') == 'common_bottom_zb'){
        return false;
    }
    var value = jQuery(this).val();
    if(value !== ""){
        jQuery(this).prevAll("label.default_value").hide();
    }
    else{
        jQuery(this).prevAll("label.default_value").show();
    }
    jQuery(this).css("border","1px #e3e3e3 solid");  //失去焦点变为默认的灰色
});
jQuery('form').find("input[name='oarea']").keyup(function(){
    var inputValue = jQuery(this).val();
    //jQuery(this).prev('.default_value').hide();
    if(inputValue.length >10 ){
        inputValue = inputValue.substring(0,10);
        jQuery(this).val(inputValue);

    }
});
//用户昵称
function check_userName(obj){
    if(obj.length <= 0){return true;}//不存在的节点直接返回true
    var value = jQuery.trim(obj.val());
    var errorObj = obj.nextAll(".msg");

    if(value == ""){

        var infoMsg = "请填写您的称呼";
        showMsg(errorObj,infoMsg,1);

        return false;
    }
    else if(value.length > 20)
    {
        var infoMsg = "称呼不能多于20个字符";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else{
        var infoMsg = " ";
        showMsg(errorObj,infoMsg,0);
        return true;
    }
}
//手机号码
function check_mobile(obj){
    if(obj.length <= 0){return true;}//不存在的节点直接返回true
    var value = jQuery.trim(obj.val());
    var errorObj = obj.nextAll(".msg");
    if(value == ""){
        var infoMsg = "请填写您的手机号码";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else if(/^1[34578]\d{9}$/.test(value)){
        var infoMsg = "所填信息正确";
        showMsg(errorObj,infoMsg,0);
        return true;
    }
    else{
        var infoMsg = "请填写正确的手机号码";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
}
//项目面积
function check_area(obj){
    if(obj.length <= 0){return true;}//不存在的节点直接返回true
    var value = jQuery.trim(obj.val());
    var errorObj = obj.nextAll(".msg");
    if(value == ""){
        var infoMsg = "请填写您的项目面积";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else if(/^[0-9]+$/.test(value)){
        var infoMsg = "所填信息正确";
        showMsg(errorObj,infoMsg,0);
        return true;
    }
    else{

        var infoMsg = "项目面积只能填写数字";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
}
//下拉菜单是否选择
function check_select(obj , type){
    if(obj.length <= 0){return true;}//不存在的节点直接返回true
    var val = obj.val();
    var errorObj = obj.nextAll(".msg");
    if(val.replace('省/市', '') == '' && type == 1){
        var infoMsg = "请选择你所在的省";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else if(val.replace('市/地区', '') == '' && type == 2){
        var infoMsg = "请选择你所在的市";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else if(val == '' && type == 3){
        var infoMsg = "请选择您的需求风格";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else if(val == '' && type == 4){
        var infoMsg = "请选择您的设计预算";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else{
        var infoMsg = "所填信息正确";
        showMsg(errorObj,infoMsg,0);
        return true;
    }
    obj.preventDefault();
}

//备注 
function check_demo(obj){
    if(obj.length <= 0){return true;}//不存在的节点直接返回true
    var value = jQuery.trim(obj.val());
    var errorObj = obj.nextAll(".msg");
    if(value.length > 200){
        var infoMsg = "备注不能多于200个字符";
        showMsg(errorObj,infoMsg,1);
        return false;
    }
    else{
        var infoMsg = " ";
        showMsg(errorObj,infoMsg,0);
        return true;
    }
}


function checkForm(formId){
        if(
            check_userName(jQuery("#"+formId+" input[name='chenghu']")) &&
            check_mobile(jQuery("#"+formId+" input[name='phone']")) &&
            check_select(jQuery("#"+formId+" select[name='User_Shen']") ,1) && 
            check_select(jQuery("#"+formId+" select[name='User_City']") , 2) && 
            check_select(jQuery("#"+formId+" select[name='hometype']") , 3) && 
            check_area(jQuery("#"+formId+" input[name='oarea']")) && 
            check_select(jQuery("#"+formId+" select[name='yusuan']") , 4) &&
            check_demo(jQuery("#"+formId+" input[name='demo']")) 

            ){
            return true;
        }
        else{
            return false;
        }
}

//默认的信息
function showMsg(obj,msg,error){
    var c = 'msg_info';

    switch(error){

        //正确消息
        case 0:
            c = 'msg_success';
            obj.removeClass("msg_error").hide();
            break;


        //错误消息
        case 1:
            c = 'msg_error';
            obj.prevAll('input,select').css('border','1px #faafaf solid');
            obj.addClass('msg_error').show();
            obj.find('p').html(msg);
            break;

        //默认是普通消息
        default:
            c = 'msg_info';
            break;
    }

    obj.addClass(c);
}
