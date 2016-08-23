
define(function(require, exports, module) {

    /**
     * ��ȡcookie
     * @param  {[string]} name ��Ҫ��ȡ��cookie��
     * @param  {[string]} pre  �����Ҫ����ǰ׺��ʹ�ô˲���
     * @return {[string]} ���ض�Ӧ��cookieֵ,�������򷵻ؿ��ַ�
     */
    function getCookie(name, pre) {
        if (pre) {
            name = 'to8to_' + name
        };
        var r = new RegExp("(\\b)" + name + "=([^;]*)(;|$)");
        var m = document.cookie.match(r);
        return (!m ? "" : decodeURIComponent(m[2]))
    }

    function removeValue(element){
        var ele_after_val = element.val();
        element.focus(function(){
            $(this).css({'border':'1px solid #f8c7c7',"border-top":"0"});
            if($(this).val() == ele_after_val){
                $(this).val("");
            }
        });
        element.focusout(function(){
            $(this).css({'border':'1px solid #e6e6e6',"border-top":"0"});
            if($(this).val() == ""){
                $(this).val(ele_after_val);
            }
        });
    }

    function chioce_pic(element){
        element.click(function(){
            var count= $(this).attr('count');
            if(count==0){
                $(this).parent().addClass("_pic_click");
                $(this).attr('count','1');
            }else if(count == 1){
                $(this).parent().removeClass("_pic_click");
                $(this).attr('count','0');
            }
        });
    }

    function product_upload(element){
        element.click(function(){
            var msg = check_tpl();
            dialog(msg);
        });
    }
    function dialog (msg){
        $('.dialog_bg').show();
        $('.upload_product_tpl .cont .tpl_msg>label').html(msg);
        $('.upload_product_tpl').show();
    }
    function pic_upload(){
        $('.pict_upload .chioce_pic').click(function(){
            $(this).next().click();
        });
    }
    function dialog_show(ele,show_dialog){
        ele.click(function(){
            $(".dialog_bg").show();
            $(show_dialog).show();
        });
    }
    function close(){
        $(".close").click(function(){
            $('.dialog_bg').hide();
            $(this).parent().parent().hide();
        });
    }

    //��ҳ������-�����ʱ�������Ҽ����
    function removeTopBarString(){
        var obj = $('ul.tp_node li.po');
        $('ul.tp_node li').mouseover(function(){
            $(this).prev('.po').css('color','#efefef');
            $(this).next('.po').css('color','#efefef');
        }).mouseout(function(){
                $(this).prev('.po').css('color','#ddd');
                $(this).next('.po').css('color','#ddd');
            });
    }

    function check_tpl(){
        // ��Ŀ���
        var pro_name = $('.upload_info .prod_name>input').val();
        var pro_type = $('.upload_info .prod_type>select:eq(0)>option').val();
        var pro_type2 = $('.upload_info .prod_type>select:eq(1)>option').val();
        var pro_type3 = $('.upload_info .prod_type>select:eq(2)>option').val();
        var pro_type4 = $('.upload_info .prod_type>select:eq(3)>option').val();
        var pro_size = $('.upload_info .prod_info>input:eq(0)').val();
        var pro_price = $('.upload_info .prod_info>input:eq(1)').val();
        var msg = "";
        if(pro_name==""){
            msg="��д��Ʒ���";  //        ����д��Ʒ���
        }else if(pro_type==0){
            msg = "��ѡ��ռ����";      //
        }else if(pro_type2 == 0){
            msg = "��ѡ��ռ��������";
        }else if(pro_type3 == 0){
            msg = "��ѡ��ռ������";
        }else if(pro_type4 == 0){
            msg = "��ѡ����";
        }else if(pro_size==""){
            msg = "��д��Ŀ���"; // ����д��Ŀ���
        }else if(pro_price==""){
            msg = "��д��Ŀ����";  //   ����д��Ŀ����
        }
        return msg ;
    }

    function showCitiesNew( city, space, price, area ) {
        var oJsLoader = new SJB.jsLoader();
        oJsLoader.onsuccess = function() {
        	var url="http://www.baidu.com";
            editPhotoCat(path+'/html/pc/user/other_city.html?cityname='+city+
                        '&spaceTag='+space+'&price='+price+'&area='+area, '�������', 530, 246);
        };
        oJsLoader.load(path+'/html/pc/js/popup.js');
        return false;
    };

    // �������������
    function click_select(globalDivClick){
        $(globalDivClick).click(function(){
            $(this).parent().siblings().find('div.md_options').hide();
            $(this).next().toggle();
            select_atlas($(this).next().find('ul li'),$(this).find('label'),$(this),$(this).next())
        });
    }
    function select_atlas(element,ele,show,hide){

        element.click(function(){
            ele.html($(this).html());
            $(this).parent().parent().hide();
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

    function initNewHeader() {
        //ͷ���Ҳ� ����css �л� // ����ƿ�ʱ �ޱ߿򼰱�����ʽ
        var css_={'border-left':'1px #efefef solid','border-right':'1px #efefef solid','background':'none','border-bottom':'none'};
        // ͷ���Ҳ� ����css �л� // �������ʱ �б߿򼰱�����ʽ
        var css_d={'background':'#fff','border-bottom':'1px solid #ddd'};
        // ����ƶ��ڵ�¼��li ��ʱ�����ص��ֵܽڵ��µ��Ӳ˵�
        var hea_top_li_one = $(".hea_top_right>ul.tp_node>li:eq(0)");
        //�������ʱ
        var hea_top_liOver = $(".hea_top_right>ul.tp_node>li.cur");
        // ���˵����ĵ����л���ʽ
        var cont_bann = $('.content_left>div>ul>li');
        // ͷ�� ���������� ��ʾ��ά��
        var code_ = $('.hea_top_left ul li.hover');
        // �ӵ����� ����ɸѡ
        var sele_ = $('.selec_ele>div>ul>li');
        //����ɸѡ
        var des = $('.selec_sort>div>ul>li');
        // ��ҳ
        var st_page = $('.bg_page>ul>li');
        // �������
        var _city = $('#city_py').val(),
            _space = $('#space_py').val(),
            _price = $('#price_range').val();
            _area = $('#area_range').val();
        //var athCity = $('.athCity');
        $('.athCity').bind( 'click', function() {
            //alert(11);
            showCitiesNew( _city, _space, _price,_area );
        } );
        // ɾ����
        var del_blogs=$('.edit').find('span:eq(1)');
        var del = $('.edit').find('a:eq(1)');
        // �رղ��ĵ�����
        close();
        // ǩ��
        var qd_sub = $('.mid').find('input.btn_click');
        // ����ӵ� ������
        //var sq_dialog = $('._msg_info').find('.apply_for');
        // �ӵ����� ������
        var tx_dialog = $('#int_order');//
        // �༭��Ʒ��Ϣ
        var edit_info= $('.pict .pic_edit').find("span:eq(0)");
        // ɾ����Ʒ
        var del_prod = $('.pic_edit .del');
        // �ƶ�ͼƬ
        var move_pic = $('.btn_05');
        //�½�ͼ��
        var add_pics = $('.my_collect').find('.tal>.pics_add>.btn_06');
        // �ղ�ͼƬ
        var one_bat = $('._collected>input:eq(0)');
        // �����µ�ͼ�����
        var add_name = $('.bulid_new .add');
        // ������ val()
        removeValue($('.pic_focus>.describe>textarea'));
        removeValue($('.pic_focus>.describe>input'));
        // ѡ��ͼƬ
        chioce_pic($('.pic_focus>.pic_>i'));

        pic_upload();

        // ȡ��
        $(".btn_unclick").click(function(){$('.close').click()});

        // ���� ��껬��
        //return;
        hea_top_liOver.mouseover(function(){
            $(this).find('div:first').show();
            $(this).siblings().find('div').first().hide();

        });

        hea_top_liOver.mouseout(function(){
            $(this).find('div:first').hide();
        });

        //����������ҳ�������ϵ����ƶ�
        var total = $('.progress_bar .font_16').text().replace(/%/,"");
        $('.progress_bar').addClass("progress_bar_"+total);

        $('.infomation_new .leb dl dd').click(function(){
            $(this).addClass('cur').siblings().removeClass('cur');
            if($(this).index() == 2){
                $(this).parent().parent().prev().attr('class','sx')
            }else{
                $(this).parent().parent().prev().attr('class','sx_lev');
            }
            var index = $(this).index();
            $(this).parent().parent().siblings('div.tab_info').find('.item:eq('+index+')').show();
            $(this).parent().parent().siblings('.tab_info').find('.item:eq('+index+')').siblings().hide();
        });

        cont_bann.mouseover(function(){
            $(this).addClass('cur').siblings().removeClass('cur');
            $(this).parent().parent().siblings().find('li').removeClass('cur');
        });
        code_.mouseover(function(){
            $(this).find('div').show();
        });
        code_.mouseout(function(){
            $(this).find('div').hide();
        });
        sele_.click(function(){
            $(this).addClass('cur').siblings().removeClass('cur');
        });
        des.click(function(){

            if($(this).index()==4){
                $(this).unbind('click');
            }else{
                $(this).addClass('cur').siblings().removeClass('cur');
            }
        });
        //dialog_show(athCity,'.dialog_city');
        dialog_show(del_blogs,'.qd_suc');
        dialog_show(del,'.qd_suc');
        dialog_show($(".add"),'.publish_blong');
        dialog_show(qd_sub,'.qd_dia');
        //dialog_show(sq_dialog,'.sq_dialog');
        dialog_show(tx_dialog,'.or_03');
        dialog_show(edit_info,'.edit_prod_info');
        dialog_show(del_prod,'.edit_prod_del');
        dialog_show(move_pic,'.edit_prod_del');
        dialog_show(add_pics,'.add_picts');
        dialog_show(one_bat,'.collect_pictures');
        click_select('#globalDivClick');
        click_select('#globalDivClick1');

        $('.bottoms>span:eq(1)').click(function(){$(".close").click();});
        //һ���ղ�  ����ͼ��
        add_name.click(function(){
            $(this).parent().siblings().append('<li>'+$(this).prev().val()+'</li>');
            $(this).parent().prev().find('li').click(function(){
                $(this).parent().parent().prev().find('label').html($(this).html());
                $(this).parent().parent().hide();
            });
        });
        product_upload($('.product_btn input'));

        // ˽��

        $(".private_cont").find(".letter_list").find('.time>span').click(function(){
            $(this).parent().siblings().toggle();
        });

        // ѡ�����

        $('.send_to>.sele_click').click(function(){
            $(this).parent().next().toggle();
        });
        // ��ע .my_vermicelli .vermicelli_cont .vermicelli_list img:hover{}

        $('.vermicelli_list img,.vermicelli_list i').mouseover(function(){
            $(this).parent().find('i').show();
        });
        $(' .vermicelli_list img,.vermicelli_list i').mouseout(function(){
            $(this).parent().find('i').hide();
        });
         //��ע ȡ���ע
         $('.vermicelli_list i').click(function(){
             var this_stats = $(this).attr('for');
             if(this_stats==0){
                $(this).html('�ѹ�ע');
                $(this).attr('for','1');
             }
             if(this_stats==1){
                 $(this).html('+��ע');
                 $(this).attr('for','0');
             }
         });

        //��ҳ������-�����ʱ�������Ҽ����
        removeTopBarString();

        //��̬��ȥ��ӵ������ҵ���ҳ����url����ֹ����
        var to8to_uid = getCookie('uid', 1);
        var myURL = window.location.href;
        if (!myURL.match(/(shejiben\.com\/my|pms\.php)/)) {
            if (to8to_uid)
            {
                $.ajax({
                  url: 'http://www.shejiben.com/getuserdata.php?s=1&pos=getLoginUserInfo',
                  dataType:'jsonp',
                  success:function(data) {
                    $('.ban_cont_right li').eq(1).find('a').attr('href',''+data.blog_url+'');
                  }
                });              
            }
            else
            {
                $('.ban_cont_right li').eq(1).find('a').attr('href','/sjb/pc/designer/designer!personal.action');
            }
        }
        
    }


    module.exports = {
        init: initNewHeader
    }

})
