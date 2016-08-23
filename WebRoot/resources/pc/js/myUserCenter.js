var jq = jQuery.noConflict();
function removeValue(element){
    var ele_after_val = element.val();
    element.focus(function(){
        jq(this).css({'border':'1px solid #f8c7c7',"border-top":"0"});
        if(jq(this).val() == ele_after_val){
            jq(this).val("");
        }
    });
    element.focusout(function(){
        jq(this).css({'border':'1px solid #e6e6e6',"border-top":"0"});
        if(jq(this).val() == ""){
            jq(this).val(ele_after_val);
        }
    });
}
function chioce_pic(element){
    element.click(function(){
        var count= jq(this).parents('.pic_').find('i').attr('count');
        if(count==0){
            jq(this).parent().addClass("_pic_click");
            jq(this).parents('.pic_').find('i').attr('count','1');
            jq(this).siblings('input').attr('checked','checked');
            chooseNum();
        }else if(count == 1){
            jq(this).parent().removeClass("_pic_click");
            jq(this).parents('.pic_').find('i').attr('count','0');
            jq(this).siblings('input').removeAttr('checked');
            chooseNum();
        }
    });
}

//收藏和作品计算勾选的数量
function chooseNum(){
    var nums = jq('.thumbnail_val:checked').length;
    var totalNums = jq('.thumbnail_val').length;
    if(nums < totalNums){
        jq('.pics_del').find('input:[type=checkbox]').removeAttr('checked');
    }else{
        jq('.pics_del').find('input:[type=checkbox]').attr('checked','checked');
    }
    jq('#chooseNums').text(nums);
}

function product_upload(element){
    element.click(function(){
        var msg = check_tpl();
        dialog(msg);
    });
}
function dialog (msg){
    jq('.dialog_bg').show();
    jq('.upload_product_tpl .cont .tpl_msg>label').html(msg);
    jq('.upload_product_tpl').show();
}
function pic_upload(){
    jq('.pict_upload .chioce_pic').click(function(){
        jq(this).next().click();
    });
}
function dialog_show(ele,show_dialog){
    ele.click(function(){
        jq(".dialog_bg").show();
        jq(show_dialog).show();
    });
}
function close(){
    jq(".close").click(function(){
        jq('.dialog_bg').hide();
        jq(this).parent().parent().hide();
    });
}

function check_tpl(){
    // 项目名称
    var pro_name = jq('.upload_info .prod_name>input').val();
    var pro_type = jq('.upload_info .prod_type>select:eq(0)>option').val();
    var pro_type2 = jq('.upload_info .prod_type>select:eq(1)>option').val();
    var pro_type3 = jq('.upload_info .prod_type>select:eq(2)>option').val();
    var pro_type4 = jq('.upload_info .prod_type>select:eq(3)>option').val();
    var pro_size = jq('.upload_info .prod_info>input:eq(0)').val();
    var pro_price = jq('.upload_info .prod_info>input:eq(1)').val();
    var msg = "";
    if(pro_name==""){
        msg="请写作品名称";  //        请填写作品名称
    }else if(pro_type==0){
        msg = "请选择空间分类";      //
    }else if(pro_type2 == 0){
        msg = "请选择空间二级分类";
    }else if(pro_type3 == 0){
        msg = "请选择空间三级分类";
    }else if(pro_type4 == 0){
        msg = "请选择网咖风格";
    }else if(pro_size==""){
        msg = "请写项目面积"; // 请填写项目面积
    }else if(pro_price==""){
        msg = "请写项目报价";  //   请填写项目报价
    }
    return msg ;
}

function showCitiesNew( city, space, price, area ) {
    var oJsLoader = new SJB.jsLoader();
    oJsLoader.onsuccess = function() {
        editPhotoCat('http://www.shejiben.com/order_lobby/ordershow.php?cityname='+city+
                    '&spaceTag='+space+'&price='+price+'&area='+area, '设计需求', 530, 246);
    };
    oJsLoader.load('http://www.shejiben.com/gb_js/popup.js');
    return false;
};

jq(function(){
    //头部右侧 导航css 切换 // 鼠标移开时 无边框及背景样式
    var css_={'border-left':'1px #efefef solid','border-right':'1px #efefef solid','background':'none','border-bottom':'none'};
    // 头部右侧 导航css 切换 // 鼠标移上时 有边框及背景样式
    var css_d={'background':'#fff','border-bottom':'1px solid #ddd'};
    // 鼠标移动在登录的li 的时候隐藏掉兄弟节点下的子菜单
    var hea_top_li_one = jq(".hea_top_right>ul.tp_node>li:eq(0)");
    //鼠标移上时
    var hea_top_liOver = jq(".hea_top_right>ul.tp_node>li.cur");
    // 左侧菜单栏的导航切换样式
    var cont_bann = jq('.content_left>div>ul>li');
    // 头部 左侧鼠标移上 显示二维码
    var code_ = jq('.hea_top_left ul li.hover');
    // 接单大厅 条件筛选
    var sele_ = jq('.selec_ele>div>ul>li');
    //排序筛选
    var des = jq('.selec_sort>div>ul>li');
    // 分页
    var st_page = jq('.bg_page>ul>li');
    // 其他城市
    var _city = jq('#city_py').val(),
        _space = jq('#space_py').val(),
        _price = jq('#price_range').val();
        _area = jq('#area_range').val();
    //var athCity = jq('.athCity');
    jq('.athCity').bind( 'click', function() {
        //alert(11);
        showCitiesNew( _city, _space, _price,_area );
    } );
    // 关闭博文弹出框
    close();
    // 签到
    var qd_sub = jq('.mid').find('input.btn_click');
    // 申请接单 弹出框
    //var sq_dialog = jq('._msg_info').find('.apply_for');
    // 接单提醒 弹出框
    var tx_dialog = jq('#int_order');//
    // 编辑作品信息
    var edit_info= jq('.pict .pic_edit').find("span:eq(0)");
    // 删除作品
    var del_prod = jq('.pic_edit .del');
    // 移动图片
    var move_pic = jq('.btn_05');
    //新建图集
    var add_pics = jq('.my_collect').find('.tal>.pics_add>.btn_06');
    // 收藏图片
    var one_bat = jq('._collected>input:eq(0)');
    // 创建新的图集名称
    var add_name = jq('.bulid_new .add');
    // 点击清除 val()
    removeValue(jq('.pic_focus>.describe>textarea'));
    //removeValue(jq('.pic_focus>.describe>input'));
    // 选中图片
    chioce_pic(jq('.pic_focus>.pic_>i'));
    chioce_pic(jq('.pic_focus>.pic_>.pic_click'));

    pic_upload();

    // 取消
    jq(".btn_unclick").click(function(){jq('.close').click()});

    // 顶部 鼠标滑过
    //return;
    hea_top_liOver.mouseover(function(){
        jq(this).find('div:first').show();
        jq(this).siblings().find('div').first().hide();

    });

    hea_top_liOver.mouseout(function(){
        jq(this).find('div:first').hide();
    });

        //个人中心首页个人资料的完善度
        var total = jq('.progress_bar .font_16').text().replace(/%/,"");
        jq('.progress_bar').addClass("progress_bar_"+total);

    jq('.infomation_new .leb dl dd').click(function(){
        jq(this).addClass('cur').siblings().removeClass('cur');
        if(jq(this).index() == 2){
            jq(this).parent().parent().prev().attr('class','sx')
        }else{
            jq(this).parent().parent().prev().attr('class','sx_lev');
        }
        var index = jq(this).index();
        jq(this).parent().parent().siblings('div.tab_info').find('.item:eq('+index+')').show();
        jq(this).parent().parent().siblings('.tab_info').find('.item:eq('+index+')').siblings().hide();
    });

    cont_bann.mouseover(function(){
        jq(this).addClass('cur').siblings().removeClass('cur');
        jq(this).parent().parent().siblings().find('li').removeClass('cur');
    });
    code_.mouseover(function(){
        jq(this).find('div').show();
    });
    code_.mouseout(function(){
        jq(this).find('div').hide();
    });
    sele_.click(function(){
        jq(this).addClass('cur').siblings().removeClass('cur');
    });
    des.click(function(){

        if(jq(this).index()==4){
            jq(this).unbind('click');
        }else{
            jq(this).addClass('cur').siblings().removeClass('cur');
        }
    });

    dialog_show(qd_sub,'.qd_dia');
    dialog_show(tx_dialog,'.or_03');
    dialog_show(edit_info,'.edit_prod_info');
    dialog_show(add_pics,'.add_picts');
    dialog_show(one_bat,'.collect_pictures');
    click_select('#globalDivClick');
    click_select('#globalDivClick1');

    jq('.bottoms>span:eq(1)').click(function(){jq(".close").click();});
    //一键收藏  创建图集
    add_name.click(function(){
        jq(this).parent().siblings().append('<li>'+jq(this).prev().val()+'</li>');
        jq(this).parent().prev().find('li').click(function(){
            jq(this).parent().parent().prev().find('label').html(jq(this).html());
            jq(this).parent().parent().hide();
        });
    });

    // 私信

    jq(".private_cont").find(".letter_list").find('.time>span').click(function(){
        jq(this).parent().siblings().toggle();
    });

    // 选择好友

    jq('.send_to>.sele_click').click(function(){
        jq(this).parent().next().toggle();
    });
    // 关注 .my_vermicelli .vermicelli_cont .vermicelli_list img:hover{}

    jq('.vermicelli_list img,.vermicelli_list i').mouseover(function(){
        jq(this).parent().find('i').show();
    });
    jq(' .vermicelli_list img,.vermicelli_list i').mouseout(function(){
        jq(this).parent().find('i').hide();
    });
     //关注 取消关注
     jq('.vermicelli_list i').click(function(){
         var this_stats = jq(this).attr('for');
         if(this_stats==0){
            jq(this).html('已关注');
            jq(this).attr('for','1');
         }
         if(this_stats==1){
             jq(this).html('+关注');
             jq(this).attr('for','0');
         }
     });
    // 博文编辑
    //var um = UM.getEditor('myEditor1');
    st_page.click(function(){
        jq(this).addClass('cur').siblings().removeClass('cur');
    });
     //首页导航栏-鼠标悬浮时隐藏左右间隔线
    removeTopBarString();
    tabMsgLog();
    tab_deposit();
    
    tabYzhtIndex(jq('.store_index .column_name .name'),jq('.store_index .list_store'));
    tabYzhtIndex(jq('.designer_index .column_name .name'),jq('.designer_index .list_designer'));
    tabYzhtIndex(jq('.answer_index .column_name .name'),jq('.answer_index .answer_content'));
});
// 点击公用下拉框
function click_select(globalDivClick){
    jq(globalDivClick).click(function(){
        console.info(jq(this));
        jq(this).parent().siblings().find('div.md_options').hide();
        jq(this).next().toggle();
        select_atlas(jq(this).next().find('ul li'),jq(this).find('label'),jq(this),jq(this).next())
    });
}
function select_atlas(element,ele,show,hide){

    element.click(function(){
        ele.html(jq(this).html());
        jq(this).parent().parent().hide();
    });
    document_click(show,hide);
}
function document_click(show,hide){
    show = show.attr('id');
    document.onclick = function (event)
    {
        var e = event || window.event;
        var elem = e.srcElement||e.target;
        while(elem)
        {
            if(elem.id == elem || elem.id == show ||elem.id=='bulid_new')
            {
                return;
            }
            elem = elem.parentNode;
        }
        hide.hide();
    }
}

//type:哪个业务的弹框 typeid:博文分类ID
//type=1 : 博文分类删除； type=2 ：博文删除; type=3 : 新增分类
function Dialog(type, id, typeid)
{
    
    if (type == 3) 
    {
        var _html = '<div class="qd_suc publish_blong" style="width:445px;">';
            _html += '<div class="title"><label>添加分类</label><span class="close"></span></div>';
            _html += '<div class="qd_cont">';
            _html += '<div class="qd_cont_line">';
            _html += '<div class="btne _publish"><label class="type">分类名称：</label>';
            _html += '<input type="text" name="newTypeName" id="newTypeName" class="new_type_name"/>';
            _html += '<input type="button" style="float:right;" class="btn_click" name="addBtn" id="addBtn" value="增加">';
            _html += '</div></div></div></div>';
    }
    else
    {
        var _html = '<div class="qd_suc del_blong" >';         
            if ( type == 1 ) 
            {
                _html += '<div class="title"><label>删除博文分类</label><span class="close"></span></div>';
                _html += '<div class="qd_cont">';
                _html += '<div class="qd_cont_line">';
                _html += '<div class="_su">您确定要删除该博文分类么？</div>';
                _html += '<div class="ml">删除分类后，该分类下的博文不会被删除。</div>';
                _html += '<div class="btne _del">';
                _html += '<input type="button" onclick="del('+id+');" class="btn_click" value="确定">';
            }
            else if( type == 2 )
            {
                _html += '<div class="title"><label>删除博文</label><span class="close"></span></div>';
                _html += '<div class="qd_cont">';
                _html += '<div class="qd_cont_line">';
                _html += '<div class="_su">您确定要删除该博文么？</div>';
                _html += '<div class="ml">博文删除后将不能再恢复。</div>';
                _html += '<div class="btne _del">';
                _html += '<input type="button" onclick="delLog('+id+','+typeid+');" class="btn_click" value="确定">';
            }
            _html += '<input type="button" class="btn_unclick" value="取消"></div></div></div></div>';
    }
        
        jq('body').append(_html);
        jq('.dialog_bg , .qd_suc').show();
        closePop(jq('.qd_suc'));
}

function closePop(popObj)
{
    jq('.btn_unclick , .close').click(function(){
        jq(popObj).remove();
        jq('.dialog_bg').hide();
    });

}

//首页导航栏-鼠标悬浮时隐藏左右间隔线
function removeTopBarString(){
    var obj = jq('ul.tp_node li.po');
    jq('ul.tp_node li').mouseover(function(){
        jq(this).prev('.po').css('color','#efefef');
        jq(this).next('.po').css('color','#efefef');
    }).mouseout(function(){
            jq(this).prev('.po').css('color','#ddd');
            jq(this).next('.po').css('color','#ddd');
        });
}

//展开/收起/添加业主跟进记录
function tabMsgLog(){

    var obj = jq('.assign_tab span');
    var msgObj = jq('.assign_add .msg');
    var inputObj = jq(".assign_add input[type='text']");
    var ctrlObj = jq(".assign_add .msg , .assign_add input[type='text']");
    inputObj.val('');
    obj.click(function(){
        var value = obj.html();
        if(value == '收起+'){
            obj.html('展开-');
            obj.parent().next('.follow_up_content').hide();
            obj.parents('.assign_follow_up').css('border-bottom','none');
        }
        else{
            obj.html('收起+');
            obj.parent().next('.follow_up_content').show();
        }
   });
    ctrlObj.click(function(){
        inputObj.focus();
    });
    inputObj.keyup(function(){
        msgObj.hide();
    }).blur(function(){
            var inputValue = inputObj.val();
            if(inputValue == ''){
                msgObj.show();
            }


        });
}
//缴纳保证金 tab
function tab_deposit(){
    var btn_01 = jq('.deposit_01 .submit_deposit');
    var btn_02 = jq('.deposit_02 .btn_click');
    var btn_cancel = jq('.deposit_02 .btn_cancel');
    var obj_01 = jq('.deposit_01');
    var obj_02 = jq('.deposit_02');
    obj_01.show();
    obj_02.hide();
    btn_01.click(function(){
        obj_01.hide();
        obj_02.show();
    });
    btn_cancel.click(function(){
        obj_01.show();
        obj_02.hide();
    });
}
//作品、收藏全选
function selectAll(obj){
    if(jq(obj).attr("checked")=="checked"||jq(obj).attr("checked")==true){
        jq('.pic_').addClass("_pic_click");
        jq('.pic_ input').attr('checked','checked');
        jq('.pic_ i').attr('count','1');
        jq('#chooseNums').text(jq('.thumbnail_val').length);
    }else{
        jq('.pic_').removeClass("_pic_click");
        jq('.pic_ input').removeAttr('checked');
        jq('.pic_ i').attr('count','0');
        jq('#chooseNums').text(0);
    }
}

function popClose()
{
    window.location.reload();
}

//弹窗自适应居中
function popup_center(popupObj){

    var windowsWidth = jq(window).width();
    var windowsHeight = jq(window).height();
    var popupWidth = popupObj.width();
    var popupHeight = popupObj.height();
    var vLeft = (windowsWidth - popupWidth)/2;
    var vTop = (windowsHeight - popupHeight)/2;
    popupObj.css({"left":vLeft,"top":vTop});
}

//公用弹窗 适用于删除/修改成功等简单提示
function showPopUp(type){
    var title = '';
    var msg = '';
    if(type == 0){
        title = '输入内容不能为空';  //添加业主记录
    }
    else if(type == 1){
        title = '请输入分类名';         //新建博文分类
        //msg = '个人资料修改身份类型个人资料修改成功个人资料修改成功个人资料修改成功';
    }
    else if(type == 3 ){
        title = '修改成功';          //个人资料修改身份类型 ，个人资料修改成功
    }
    else{
        title = '';
    }
    var popupStr = '<div class="popup_mask"></div>' +
        '<div class="popup_wrap popup_single"><div class="title"><span class="name"></span><span class="btn_close" onclick=closePopUp(jQuery(".popup_wrap"))></span></div>' +
        '<div class="contents"><p class="msg_top">'+title+'</p><p class="msg_bottom">'+msg+'</p></div>' +
        '<div class="btn_control"><input type="button" class="btn_click" value="确 定" onclick=closePopUp(jQuery(".popup_wrap")) /></div></div>';
    jQuery('body').append(popupStr);
    jQuery("body,html").css({"overflow":"hidden"});
    popup_center(jQuery(".popup_wrap"));
}
function closePopUp(obj){
    obj.remove();
    jQuery('.popup_mask').remove();
    jQuery('body,html').removeAttr('style');
    //window.location.href = window.location.href; //刷新页面
}
function addYzList(){
    jQuery('.assign_add .btn_submit').click(function(){
        var value = jQuery('.assign_add .user_txt').val();
        if(value == ''){
            showPopUp(0);
        }
    });
}
function addBoWenList(){
    jQuery('#addtype').click(function(){
        var value = jQuery('#typename').val();
        if(value == ''){
            showPopUp(1);

        }
    });
}
jq(window).resize(function(){
    popup_center(jQuery('.popup_wrap'));
});

/**
 * 2015-11-11 tony.tang隐藏掉，只留下了设计师个人主页上线提醒写在js里面  begin
 */
//设计师中心新版上线推送
//function popupNewOnline(){
//    str = '<div class="popup_mask_sjs"></div>'+
//    '<div class="popup_wrap popup_newonline"><a class="btn_close" href="javascript:void(0)"></a>'+
//    '<a class="btn_go" href="http://www.shejiben.com/my/"></a></div>';
//    jq('body').append(str);
//    setCookie('to8to_cookie_price_sjs', 1, 90*3600*24*10000,'','.shejiben.com');
//    popup_center(jQuery(".popup_newonline"));
//    jq('.popup_newonline .btn_close').click(function(){
//        jq('.popup_mask_sjs , .popup_newonline').remove();
//        setCookie('to8to_cookie_price_sjs', 1, 90*3600*24*10000,'','.shejiben.com');
//    });
//}

//业主个人中心新版上线推送
//function popupNewOnlineYz(){
//    str = '<div class="popup_mask_yz"></div>'+
//    '<div class="popup_wrap popup_newonline_yz">'+
//    '<a class="btn_go" href="http://www.shejiben.com/my/"></a></div>';
//    jq('body').append(str);
//    popup_center(jQuery(".popup_newonline_yz"));
//    jq('.popup_newonline_yz .btn_go').click(function(){
//        jq('.popup_mask_yz , .popup_newonline_yz').remove();
//    });
//}

/**
 * 2015-11-11 tony.tang隐藏掉，只留下了设计师个人主页上线提醒写在js里面  end
 */
//业主后台 -个人资料 业主喜欢网咖风格选择
function yzhtcheckStyle(){
    var obj = jq('.content_usermsg .style li');
    obj.click(function(){
        var data_id = jq(this).attr('data-id');
        if(jq(this).hasClass("cur"))
        {
            jq(this).removeClass('cur');
            jq('#style').val('');
        }
        else
        {
            jq(this).addClass('cur').siblings().removeClass('cur');

            jq('#style').val(data_id);
        }
    });
}
//业主后台 -首页 选项卡
function tabYzhtIndex(obj , ele){
    obj.click(function(){
        var index = jq(this).index();
        jq(this).addClass('cur').siblings('').removeClass('cur');
        ele.eq(index).show().siblings().hide();
        jq(this).nextAll('.more_item').find('.more').eq(index).show().siblings('.more').hide();
    });
}

//设计师中心引导页的 定位以及翻页
/*
function guidePosition(){
    var windowsW = jq(window).width();
    //var windowsH = jq(window).height();
    //var scrollH = jq(document).scrollTop();
    //jq('.guide_index').css('margin-top',(windowsH-430)/2+scrollH);      //引导页首页的居中
    jq(' .popup_mask_guide , .user_guide').show();
    if(windowsW < 1180){
        jq('.user_guide').css({'left':'30px','margin':'0'});
    }
    else{
        jq('.user_guide').css({'left':'50%','margin-left':'-560px'});
    }
}
jq(window).bind("resize",function(){
    if(jq(".user_guide").css("display")=="block")
    {
        guidePosition();
    }

});
*/
function userControl(){
    jq('.user_guide .btn_close').bind('click',function(){
        jq('.popup_mask_guide , .user_guide').hide();
    });
    jq('.user_guide .btn_next').bind('click',function(){
        jq(this).parent().hide().next().show();
    });
    jq('.btn_repeat').bind('click',function(){
        jq(this).parent().hide().nextAll().hide();
        jq('.guide_order').show();
    });
}

/*******个人中心取消收藏案例弹窗*******/
/***kiki添加于20151231***/
jq(function(){
    var lid;      //文章ID
    var log_uid;  //当前用户ID
    var type;     //类型
//  var block;    //取消对象
    jq('.del_icon').bind('click',function(){
        lid=jq(this).attr('csid');
     //   block=jq(this).parent('li');
        cancelCollect();
        showCancelPop();
    })
    jq('.btn_red,.btn_grey,#cboxClose').live('click',function(){
        jq('.container_popup').remove();
        jq.colorbox.close();
    })
    function cancelCollect(){        
        var cancelCollect = "<div class='container_popup' id='container_popup' >\
                                <div class='contents'>\
                                    <p class='tips_b'>您确定要取消收藏该案例吗？</p>\
                                    <div class='btn'>\
                                        <input type='button' class='btn_red' value='确定'>\
                                        <input type='button' class='btn_grey' value='取消'>\
                                    </div>\
                                </div>\
                            </div>"
        jq('body').append(cancelCollect);     
   }
   
    function showCancelPop(){
        jq.colorbox({
            inline: true,
            width:520,
            height:175,
            title:"取消收藏",
            opacity: "0.7",
            overlayClose : false,
            href: '#container_popup',
            onComplete: function() {
                initColorboxCss();
                jQuery('.tips_b').css('marginTop','36px');
            }
            
        })
    }
    //取消收藏
    jq('.container_popup .btn_red').live('click',function(){
        var url = "/sys_php/reply_new.php";
        jq.post(url, {
                'source': 'case_sc',
                'type': type,
                'oid': lid
            },
            function(data)
            {
                if (data.errorCode == 1)
                {
                  //  block.remove();
                    location.reload();
                }
                else
                {
                    alert(data.errorMessage);
                }
            },'json')
    });
})

