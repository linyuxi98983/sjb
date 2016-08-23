//退出登录
function logout(){
    var page=jQuery('#page_value').attr('pagename');
    $.ajax({
        url:'http://m.shejiben.com/user/logout?'+Date.parse(new Date()),
        type:'POST',
        data:{'act':'sjblogout',page:page},
        dataType:'json',
        success:function (data){
            data=eval(data);
            if(data.code == 1){
                window.location.href=data.url;
            }else{
                alert(data.msg);
            }
        }
    });
};
//获取用户头部信息
function GetactiveHead(){
    $.ajax({
        url:'http://m.shejiben.com/user/activehead?'+Date.parse(new Date()),
        type:'POST',
        data:{'act':'sjbhead'},
        dataType:'html',
        success:function (data){
            jQuery('.pop-menus').prepend(data);
        }
    });
}
GetactiveHead();


