/**
 * Created with JetBrains WebStorm.
 * User: nini.wen
 * Date: 14-12-26
 * Time: 下午3:58
 * To change this template use File | Settings | File Templates.
 */
$(function(){
    $('.choice_type div').on('touchstart',function(){
        if($(this).find('span').attr('class')=='cur'){
            $(this).find('span').removeClass('cur');
        }else{
            $(this).find('span').addClass('cur').parent().siblings().find('span').removeClass('cur');
        }
        $(this).parent().siblings('div.choice').find('.now').eq($(this).index()).toggle();
        $(this).parent().siblings('div.choice').find('div.now').eq($(this).index()).siblings().hide();
    });
    $('.top_left .se .touch').on("touchstart",function(e){
        $('.select_dec_type').toggle();
        $('.select_type').hide();
        $('.choice_space').hide();
    });

    $('.choice_city .province ul li').on('click',function(){
        $(this).addClass('cur').siblings().removeClass('cur');
    });

    document.onclick = function(event){
        var e = event || window.event;
        var elem = e.srcElement||e.target;

        while(elem)
        {
            if(elem.className == elem || elem.className == 'type'||elem.className == 'select_dec_type'||elem.className == 'select_sj')
            {
                return;
            }
            elem = elem.parentNode;
        }
        $('.select_dec_type').hide();
    }

    // 选择样式
    $('.hot_words .words div').on('touchstart',function(){
        $(this).addClass('cur').siblings().removeClass('cur');
    });

     $('.designer_index .tab').on('click',function(){
         $(this).find('span').addClass('cur');
     });

    $('.choice').find('a').on('touchstart',function(){
        $(this).addClass('cur');
    });
    $('.choice').find('a').on('touchend',function(){
        $(this).removeClass('cur');
    });

    //右侧导航
    $('.search_more .nav').on('touchstart',function(){
        $('.pop-menus').show();
    });
    $('a#hide-pop-menus').on('touchstart',function(){
        $(this).parent().parent('div.pop-menus').hide();
    });

    $("#showZx").on("touchstart",function(){
        $(".zx_types").fadeToggle();
    });
    //拔打电话。
    $("#contact-designer").on("touchstart",function(e){
        e.preventDefault();
        $(".telphone").fadeToggle()
        $(".zx_types").hide()
    })

    $("#tel-cancel").on("touchstart",function(e){
        e.preventDefault();
        $(".telphone").hide()
    })

    checkCookie(); //来源统计标识

    var scrollScreen = $("#scrollButton");
    scrollScreen.on("touchstart", function (e) {
        e.preventDefault();
        var nowScroll = $(window).scrollTop(),
            flag = "up";
        var funScroll = function () {
            var top = $(window).scrollTop();
            if (flag == "up") {
                top -= top;
                if (top <= 0) {
                    top = 0;
                    flag = "down";
                }
            } else {
                return;
            }
            $(document.body).animate({scrollTop: top}, 400);
        };
        if (nowScroll) {
            funScroll()
        }
        ;
    });


    appPushBottom();
});


/**
 * 来源统计 By Reson 20150827
 */
function checkCookie() {
    var valsource = getCookie( 'sourcepage', 1 );
    var valland = getCookie( 'landpage', 1 );
    var sourcepage = document.referrer;
    var landpage = location.href;
    if( sourcepage!='' ) {
        var domain = sourcepage.split('/');
        if( domain[2] ) {
            domain = domain[2];
        } else {
            domain = sourcepage;
        }
    } else {
        var domain = '';
    }
    //新规则，每次进来如果来源不同，则更新
    if ( !valsource || ( domain.indexOf('shejiben.com') == -1 && valsource != sourcepage ) ) {
        setCookie( 'sourcepage', encodeURI(sourcepage), 90*3600*24, 1, 'shejiben.com' );
    }
    
    if ( !valland || domain.indexOf('shejiben.com') == -1 ) {
        setCookie( 'landpage', encodeURI(landpage), 90*3600*24, 1, 'shejiben.com' );
    }
}

function setCookie(name, value, expire, pre, domain) {
    if (!expire) {
        expire = 5000
    };
    if (pre) {
        name = 'to8to_' + name
    };
    var expiry = new Date();
    expiry.setTime(expiry.getTime() + expire);
    var domain_url = '';
    if (domain) domain_url = 'domain=' + domain + ';';
    document.cookie = name + '=' + value + ';expires=' + expiry.toGMTString() + ';path=/;' + domain_url
};
function getCookie(name, pre) {
    if (pre) {
        name = 'to8to_' + name
    };
    var r = new RegExp("(\\b)" + name + "=([^;]*)(;|$)");
    var m = document.cookie.match(r);
    return (!m ? "": decodeURIComponent(m[2]))
};


//底部新增app下载推送
function appPushBottom(){
    str='<div class="app_push_bottom">\
            <div class="content">\
                <div class="overlay_bottom"></div>\
                <div class="close"></div>\
                <div class="logo">\
                    <img class="img_logo" src="http://img.shejiben.com/wap/new_wap/icon_logo.png"/>\
                    <img class="img_tips" src="http://img.shejiben.com/wap/new_wap/app_push_img.png"/>\
                </div>\
                <a href="http://m.shejiben.com/app" class="btn_download">\u7ACB\u5373\u4F7F\u7528</a>\
            </div>\
        </div>';
    var app_push = getCookie('app_push', 1);
    if(app_push){
        return false;
    }  
    if(jQuery('.botFloatBar').length > 0 || jQuery('.app_push_bottom').length > 0 ){
        return false;
    }
    jQuery('body').append(str); 
    jQuery('.app_push_bottom').show(); 
    if(jQuery('#scrollButton').length > 0){
       jQuery('#scrollButton').css({'bottom':'70px'}); 
        jQuery('.scrollButton').show(); 
    }  
    jQuery('.app_push_bottom .close').bind('click',function(){
        if(!app_push){
            setCookie('app_push','1',1000*60*60*24,'app_push','shejiben.com');
        }
        if(jQuery('#scrollButton').length > 0){
            jQuery('#scrollButton').css({'bottom':'10px'}); 
        }   
        jQuery('.app_push_bottom').remove();     
    });
}