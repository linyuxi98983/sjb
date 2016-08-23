/*省市区选择*/
    function checkForm() {
        var name = $('#zxd-name').val(),
            tel = $('#zxd-tel').val(),
            selArea = $("#getArea").val(),
            yuSuan = $('#select-itme-yusuan').val();
        if(!name){
            alert('请填写您的称呼');
            $('#zxd-name').focus();
            return;
        }
        if(name.length > 20){
            alert('称呼不能多于20个字符');
            return;
        }
        if(!tel){
            alert('请填写您的手机号码，方便设计师第一时间联系您');
            $('#zxd-tel').focus();
            return;
        }
        var telRegexp = /^(1[3|4|5|7|8|][0-9]{9}$)/;
        if(!telRegexp.test(tel)){
            alert('请填写正确的中国大陆11位手机号码');
            $('#zxd-tel').focus();
            return;
        }
        if(!selArea && $("#getArea").length > 0)
        {
            alert('请填写项目面积');
            $("#getArea").focus();
            return;
        }
        if(isNaN(selArea) && $("#getArea").length > 0)
        {
            alert('项目面积只能填写数字');
            $("#getArea").focus();
            return;
        }
        if(yuSuan == '设计预算'){
            alert('请填写设计预算');
            return;
        }
        //success
        return true;
    }
    function scrollHandle(e) {
        e.preventDefault();
    }

    $('#zxd-form-submit').click(function(e) {
        e.preventDefault();
        if(checkForm())
        {
            var id;
            var name = $('#zxd-name').val(),
            tel = $('#zxd-tel').val(),
            selArea = $("#getArea").val(),
            yusuan = $('#select-itme-yusuan').val(),
            referer = $("#referer").val();

            //////////
            if(!selArea){
                id = 116;     //H5首页
                //百度统计函数
                try{
                    _hmt && _hmt.push(['_trackEvent', 'mhome', 'mljtj', '1_2']);
                }catch(e){

                }
            }else{
                id = 104;  //H5
                //百度统计函数
                try{
                    _hmt && _hmt.push(['_trackEvent', 'mzb', 'mzbtj', '2_3']);
                }catch(e){

                }
            }
            var town = '';
            var biao = 0;
            // var id = 104;   //H5
            var zbType = 0;
            var sid = '';
            var project_type = '';
            $('#zxd-form-submit').attr('disabled','disabled').val('提交中..');
            $.post('http://m.shejiben.com/zb/post',{'zbtype':zbType,'project_type':project_type,'sourceid':id,'s_sourceid':sid,'phone':tel,'chenghu':name,'oarea':selArea,'yusuan':yusuan,'biao':biao,'source_referer':referer},function(data){
                $('#zxd-form-submit').removeAttr('disabled').val('提交');
                if(data == 'ok'){
                    //成功后清空
                    zbform.submit();
                    zbform.reset();
                }else{
                    alert(data);
                }
            },'text');


        }
    });

 /*省市区选择结束*/
$(function(){

    zbFormFixd();
    $(window).bind('scroll',function(){
        zbFormFixd();

    });

    $('img').click(function(){
        if(!$(this).parent('a')){
            return false;
        }
    });

});

function zbFormFixd(){
    var bannerH = $('figure').height();
    var formH = $('#zb_form').height();
    var windowH = $(window).height();
    var documentH = $(document).height();
    var scrollH = $(window).scrollTop();
    var scrollH = $(window).scrollTop();
    if(scrollH > (bannerH + formH + 10) && scrollH < (documentH - windowH - 10)){
        $('.post_zb').css('bottom','0').show();
    }
    else if(scrollH > (documentH - windowH - 20)){
        $('.post_zb').css('bottom','0').show();
    }
    else {
       $('.post_zb').hide(); 
    }
}