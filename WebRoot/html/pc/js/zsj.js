define( function( require, exports, module ) {

    var $ = require('jquery');
    var UI = require('ui');

    var _city = $('#city_py').val(),
        _space = $('#space_py').val(),
        _price = $('#price_range').val(),
        _order = $('#order_val').val(),
        _page = $('#page_val').val();

    /*$('.reservation').bind('click', function() {
        var sendId = parseInt( $(this).attr('data-id') );
        SJB.free_yuyue.init( sendId, SJB.GLOBAL_VAR.to8to_uid );

    });*/

    var traverse = {
        options : null,
        element : null,
        onMove  : false, //避免在移动过程中重复点击，生成多个animate队列。
        init : function(options) {
            this.options  = options;
            var childLen  = options.element.children('li'),
                self      = this,
                realWidth = 0;

            childLen.each( function( i, n ) {

                thisWidth = $(n).hasClass('line-end') ? 110 : options.eachWidth;
                realWidth = realWidth + thisWidth;

            } );

            options.element.css('width', realWidth + 'px');
            options.nextBtn.bind('click', function() {
                self.toNext();
            });
            options.leftBtn.bind('click', function() {
                self.toPrev();
            });
        },
        toNext : function() {
            if (!this.onMove && !this.options.nextBtn.hasClass('end') && this.options.element.width() > this.options.eachMoveWidth) {
                var _left    = parseInt(this.options.element.position().left),
                    _endLeft = _left + (-this.options.eachMoveWidth);
                if (Math.abs(_endLeft) >= this.options.element.width()) {
                    this.options.nextBtn.addClass('end');
                } else {
                    this.onMove = true;
                    this.options.element.stop().animate({'left' : _endLeft}, this.options.speed, function() {
                        traverse.onMove = false;
                    });
                }
            }
            this.options.leftBtn.removeClass('end');
        },
        toPrev : function() {
            if (!this.onMove && !this.options.leftBtn.hasClass('end')) {
                var _left = parseInt(this.options.element.position().left),
                    _endLeft = _left + (this.options.eachMoveWidth);
                if (_endLeft > 0) {
                    _endLeft = 0;
                    this.options.leftBtn.addClass('end');
                }
                this.onMove = true;
                this.options.element.stop().animate({'left' : _endLeft}, this.options.speed, function() {
                    traverse.onMove = false;
                });
            }
            this.options.nextBtn.removeClass('end');
        },
        moveToSelectPic : function() {
            if ('index' in this && this.index >= this.options.eachNum) {
                var n =  this.index % this.options.eachNum !== 0
                    ? Math.ceil(this.index / this.options.eachNum)
                    : (this.index / this.options.eachNum) + 1;
                this.options.element.animate({'left' : -( (n - 1) * this.options.eachMoveWidth) + 'px'}, this.options.speed);
            }
        }
    }

    traverse.init({
        'element' : $('.switch-box ul'),
        'eachWidth' : 139,
        'eachMoveWidth' : 834,
        'nextBtn' : $('.the-next'),
        'leftBtn' : $('.the-prev'),
        'speed' : 500,
        'eachNum' : 6
    });

    $('.more_cities').bind( 'click', function() {
        SJB.showCities( _city, _space, _price );
    } );
    
    //预约咨询
    $('.yyzx').bind( 'click', function() {
    	var id = $(this).attr("id");
        SJB.showApplyWin(id);
    } );
    
    //图片延迟加载
    UI.lazyLoad( $('img') );

    //点击我也要显示在这
    $( '.showhere').bind( 'click', function() {
        document.domain = 'shejiben.com';
        if ( !SJB.isLogin() ){
            SJB.showSingleLogin( 2, 2 );
            return false;
        };

        require.async( 'colorbox', function() {
            $.colorbox({
                inline: true,
                title: '',
                href: "#showMe",
                opacity: "0.5",
                height: "141",
                width: "600",
                speed: 0
            });
        } )

    } );

    //滚动时筛选框置顶
    var filterBox = $('.fiterbox');
    var orderBox  = $('.order-box');
    if(filterBox.length == 1 && orderBox.length == 1)
    {
        var f_offsetTop = filterBox.offset().top - 2 ,
            o_offsetLeft = orderBox.offset().left,
            o_offsetTop = orderBox.offset().top - 2;

        $(document).ready( function() {
            if ( _city != '' || _space != '' || _price != '0' || _order != 0 || _page != '1' ) {
                window.scrollTo( 0, f_offsetTop );
            }
            $(window).scroll( function() {
                var scrollTop = $(document).scrollTop();
                if ( scrollTop > o_offsetTop ) {
                    orderBox.addClass( 'filterbox_scrolling' );
                    orderBox.css({left: o_offsetLeft + 'px'});
                } else {
                    orderBox.removeClass( 'filterbox_scrolling' );
                }
            });

        } );
    }
    $(document).ready( function() {
        zsjFormPosition();
        jQuery(window).scroll(function() {
            zsjFormPosition();
        });  
    });

    // 无缝轮播
    var TestSlider2 = new UI.Slider({
        navigate: $('#slider-wrap-2'),
        pointNav: $('#pointer-2'),
        aniType: 'slide',
        step: 1000,
        duration: 4000,
        seamless: true,
        container: $('#container-wrap-2'),
        event: 'mouseover'
    });


    // 表单验证
    $('#zsjBtn').click(function() {
        //百度统计函数
        try{
            _hmt && _hmt.push(['_trackEvent', 'zsj', 'rljtj', '4_1']);
        }catch(e){

        }
        SJB.postFrom(jQuery(this),6);
    });

    function zsjFormPosition(){
        var scrollHeight = jQuery(document).scrollTop();
        var topAd = 0;
        if(jQuery('#top_add').length && jQuery('#top_add').is(':visible')){
            topAd = jQuery('#top_add').height();
        }
        if(scrollHeight > 1760){
            jQuery('#zsjForm').css('top',scrollHeight-200-topAd);
        }
        else{
            jQuery('#zsjForm').css('top','15px');
        }
    }
   jQuery(".bottom_tab_hd p").mouseover(
    function(){
        var tabCurNum = jQuery(this).index();
        jQuery(this).addClass('cur').siblings().removeClass('cur');
        jQuery(".bottom_tab_body ul").removeClass('tabed');
        jQuery(".bottom_tab_body ul").eq(tabCurNum).addClass('tabed');
    }
);
});