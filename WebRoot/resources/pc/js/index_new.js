define(function (require, exports, module) {

    var $ = require('jquery');
    var UI = require('ui');
    var desTabList = $('.des-tab-list'), _tabIndex = 0,
        desWrapList = $('.designers_list'),
        slideArr = {}, containerId, scontainerId,
        pageNext = $('.designers_list > .next'),
        pagePrev = $('.designers_list > .prev');

    // 顶部大banner轮播
    var bannerSlider = new Swiper('#index_slider', {
        autoplay: 5000, //可选选项，自动滑动
        pagination: '.slider_mark',
        paginationElement: 'li',
        paginationClickable: true,
        loop: true
    });
    window.bannerSlider = bannerSlider;

    // 找设计师选项卡切换
    initTab(_tabIndex);
    desTabList.mouseenter(function () {
        var _this = $(this);
        _tabIndex = desTabList.index(_this);
        initTab(_tabIndex);

        LazyObj.reload();
    });

    function initTab(item) {
        desWrapList.hide();
        desWrapList.eq(item).show();
        desTabList.removeClass('cur');
        desTabList.eq(item).addClass('cur');

        if (!slideArr[item]) {
            initTabSlide(item);
        }
    }

    function initTabSlide(item) {
        containerId = '.swiper-container_0' + (item + 1);
        scontainerId = '.swiper-container-s0' + (item + 1);
        slideArr[item] = {};
        // 大图推荐位轮播
        if($('#designers_list_scroll_0'+(item+1)).find('ul li').length > 5){
            slideArr[item]['topslide'] = new Swiper(containerId, {
                loop: true,
                slidesPerView: 5,
                speed: 500
            });
            // 小图推荐位轮播
            slideArr[item]['bottomslide'] = new Swiper(scontainerId, {
                loop: true,
                slidesPerView: 10,
                slidesPerGroup: 2,
                speed: 500
            });
        }
    }

    //找设计师 （图库）的tab切换
    var mapDepot = $('#search_pic .column_name_l p'),
        mapLayer = $('#search_pic .pic_content .index_pic_list'),
        navLayer = $('#search_pic .column_name_r label'),
        mapIndex = 0, contextThat;    
    mapDepot.click(function () {
        contextThat = $(this);
        mapIndex = mapDepot.index(contextThat);
        mapLayer.hide().eq(mapIndex).show();
        navLayer.hide().eq(mapIndex).show();
        mapDepot.removeClass('cur').eq(mapIndex).addClass('cur');
         LazyObj.reload();
    });

    pageNext.click(function () {
        var _this = $(this);
        _tabIndex = pageNext.index(_this);
        slideArr[_tabIndex]['topslide'].swipeNext();
        slideArr[_tabIndex]['bottomslide'].swipeNext();
        LazyObj.reload();
    });

    pagePrev.click(function () {
        var _this = $(this);
        _tabIndex = pagePrev.index(_this);
        slideArr[_tabIndex]['topslide'].swipePrev();
        slideArr[_tabIndex]['bottomslide'].swipePrev();
        LazyObj.reload();
    });

    // 设计机构改版（图片滑动）
    var picPos;
    picPos = [550, 760, 970, 210, 420, 630];
    $('.index_rank_img > div').mouseenter(function () {
        var vLeftTwo = $('.index_rank_img_2').position().left,
            vLeftThree = $('.index_rank_img_3').position().left,
            vLeftFour = $('.index_rank_img_4').position().left;
        if ($(this).hasClass('index_rank_img_1') && vLeftTwo != '' + picPos[0] + '') {
            $('.index_rank_img_2').stop().animate({
                left: picPos[0]
            }, 500);
            $('.index_rank_img_3').stop().animate({
                left: picPos[1]
            }, 500);
            $('.index_rank_img_4').stop().animate({
                left: picPos[2]
            }, 500);
        } else if ($(this).hasClass('index_rank_img_2') && vLeftTwo == '' + picPos[0] + '') {
            $('.index_rank_img_2').stop().animate({
                left: picPos[3]
            }, 500);
        } else if ($(this).hasClass('index_rank_img_2') && vLeftTwo == '' + picPos[3] + '' && vLeftThree == '' + picPos[4] + '') {
            $('.index_rank_img_3').stop().animate({
                left: picPos[1]
            }, 500);
            $('.index_rank_img_4').stop().animate({
                left: picPos[2]
            }, 500);
        } else if ($(this).hasClass('index_rank_img_2') && vLeftTwo == '' + picPos[3] + '' && vLeftThree == '' + picPos[4] + '' && vLeftFour == '' + picPos[5] + '') {
            $('.index_rank_img_3').stop().animate({
                left: picPos[1]
            }, 500);
            $('.index_rank_img_4').stop().animate({
                left: picPos[2]
            }, 500);
        } else if ($(this).hasClass('index_rank_img_3') && vLeftThree == '' + picPos[1] + '') {
            $('.index_rank_img_3').stop().animate({
                left: picPos[4]
            }, 500);
            $('.index_rank_img_2').stop().animate({
                left: picPos[3]
            }, 500);
        } else if ($(this).hasClass('index_rank_img_3') && vLeftTwo == '' + picPos[3] + '' && vLeftThree == '' + picPos[4] + '' && vLeftFour == '' + picPos[5] + '') {
            $('.index_rank_img_4').stop().animate({
                left: picPos[2]
            }, 500);
        } else if ($(this).hasClass('index_rank_img_4') && (vLeftThree >= '' + picPos[1] + '' || vLeftThree >= '' + picPos[3] + '')) {
            $('.index_rank_img_2').stop().animate({
                left: picPos[3]
            }, 500);
            $('.index_rank_img_3').stop().animate({
                left: picPos[4]
            }, 500);
            $('.index_rank_img_4').stop().animate({
                left: picPos[5]
            }, 500);
        }
        ;
    });

    function imgMark() {
        $('.original_detail,.index_pic_list li,.index_case_list li').mouseover(function () {
            $(this).find('img').css('opacity', 0.85);
        }).mouseout(function () {
            $(this).find('img').css('opacity', 1);

        });
    }

    function column_list() {
        var outObj = $('.column_outside .content_outside');
        var innerObj = $('.column_content .column_inner');
        outObj.eq(2).addClass('no_border');
        outObj.mouseover(function () {
            $(this).prev().addClass('outside_prev_cur');
            $(this).removeClass('outside_prev_cur');
            $(this).addClass('outside_cur').siblings('.content_outside').removeClass('outside_cur');
            $(this).find('.column_inner ').show();

        }).mouseout(function () {
            outObj.removeClass('outside_cur');
            outObj.removeClass('outside_prev_cur');
            innerObj.hide();
        });
    }

    //输入文字时隐藏提示文字
    $('.search_txt').click(function () {
            $(this).find('input').focus();
        })
        .keyup(function () {
            $(this).find('.default_value').hide();
        });
    $('.search_txt .input_txt').blur(function () {
        var inputValue = $('.search_txt .input_txt').val();
        if (inputValue == '') {
            $('.search_txt .default_value').show();
        }
        else {
            $('.search_txt .default_value').hide();
        }
    });

    column_list();   //导航的三级折叠菜单
    imgMark();       //网咖（电竞）图库的半透明效果

    $.fn.scrollUp = function (setting) {
        if (!this.length) {
            return false
        }
        ;
        setting = $.extend({}, $.scrollUp.defaults, setting);
        var obj = this;
        var scroller = {};
        scroller.fn = {};
        scroller.time = setting.time;                      //间隔时间
        scroller.speend = setting.speed;                   //滚动的速度（距离）
        scroller.direction = setting.direction;            //滚动方向
        scroller.content = setting.content;                //面板
        scroller.sContent = setting.sContent;              //滚动面板
        scroller.auto = setting.auto;                      //自动滚动
        scroller.leftBtn = setting.leftBtn;
        scroller.rightBtn = setting.rightBtn;
        var len = 0,
            i = 0;
        scroller.fn.init = function () {
            if (!scroller.content || !scroller.sContent || height <= obj.height()) {
                return false;
            }
            var height = scroller.content.height();
            if (scroller.direction == 'up') {
                len = scroller.content.children().length;
                scroller.sContent.css('height', height * 2);
                var cloneObj = scroller.content.clone();
                scroller.sContent.append(cloneObj);
            }

            if (scroller.auto) {
                setInterval(function () {
                    if (i == len) {
                        i = 0;
                        scroller.sContent.css('margin-top', 0);
                    }
                    scroller.fn.goTo();
                }, scroller.time);
            }
        };
        scroller.fn.goTo = function () {
            if (scroller.direction == 'up') {
                scroller.sContent.animate({
                    marginTop: -scroller.speend * i
                }, 500, function () {
                    i++;
                });
            }
        };
        scroller.fn.init();
    };
    //默认值
    $.scrollUp = {
        defaults: {
            speend: 100,
            time: 1000,
            auto: true,
            direction: 'up',
            leftBtn: '',
            rightBtn: ''
        }
    };

    //底部最新动态
    $('#showQuestionList').scrollUp({
        speed: 101,
        time: 2000,
        auto: true,
        direction: 'up',
        content: $('#showQuestionList').find('.list'),
        sContent: $('#showQuestionList').find('.scroll_content')
    }, "showQuestionList");

    $('#showDemandList').scrollUp({
        speed: 101,
        time: 2000,
        auto: true,
        direction: 'up',
        content: $('#showDemandList').find('.list'),
        sContent: $('#showDemandList').find('.scroll_content')
    }, "showDemandList");

    $('#showOrderList').scrollUp({
        speed: 101,
        time: 2000,
        auto: true,
        direction: 'up',
        content: $('#showOrderList').find('.list'),
        sContent: $('#showOrderList').find('.scroll_content')
    }, "showOrderList");

    window.slideArr = slideArr;
    var LazyObj = UI.lazyLoad($('img.lazy'));
    // var LazyPicObj = UI.lazyLoad($('img.lazy_pic'));
    // var LazyOriginalObj = UI.lazyLoad($('img.lazy_original'));

});
