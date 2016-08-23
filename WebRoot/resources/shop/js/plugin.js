/**
 * @create: Nelson
 * @initHomeToolbar	首页右侧工具条初始化
 * @调用方式	
   $("#h-toolbar").initHomeToolbar();
 */
$.fn.extend({
    initHomeToolbar: function () {
        var This = $(this),
            left = This.parent().find(".home-new>.row").offset().left + 1180,
            isFixed = false;
        This.css("left", left + "px");
        $(window).scroll(function () {
            var st = $(this).scrollTop();
            if (st >= 600) {
                if (!isFixed) {
                    This.removeClass("abs").addClass("fixed");
                    This.css("left", left + "px");
                    isFixed = true;
                }
            }
            if (st < 600) {
                if (isFixed) {
                    This.removeClass("fixed").addClass("abs");
                    This.css("left", left + "px");
                    isFixed = false;
                }
            }

        });
        $(window).resize(function () {
            left = This.parent().find(".home-new>.row").offset().left + 1180;
            This.css("left", left + "px");
        });
        This.find(".gototop").click(function () {
            $("html,body").animate({ scrollTop: 0 }, 1500);
        });
    },
    initHomeToolbar2: function () {
    var This = $(this),
        //left = This.parent().find(".home-new>.row").offset().left + 1180,
        isFixed = false;
   // This.css("left", left + "px");
    $(window).scroll(function () {
        var st = $(this).scrollTop();
        if (st >= 600) {
            if (!isFixed) {
                This.removeClass("abs").addClass("fixed");
                //This.css("left", left + "px");
                isFixed = true;
            }
        }
        if (st < 600) {
            if (isFixed) {
                This.removeClass("fixed").addClass("abs");
                //This.css("left", left + "px");
                isFixed = false;
            }
        }

    });
    /*$(window).resize(function () {
        left = This.parent().find(".home-new>.row").offset().left + 1180;
        This.css("left", left + "px");
    });*/
    This.find(".gototop").click(function () {
        $("html,body").animate({ scrollTop: 0 }, 1500);
    });
    },
    initHomeToolbarV32: function (isLeft) {
      try{
        var This = $(this),
            offset = This.parent().find(".home-new>.row").length != 0 ? This.parent().find(".home-new>.row").offset() : (This.parent().find(".promote-pannel").length != 0 ? This.parent().find(".promote-pannel").offset() : This.parent().find(".orderby-tabs2").offset()),
            left = isLeft ? offset.left - 134 : offset.left + 1100,
            isFixed = false;
        This.css("left", left + "px");
        $(window).scroll(function () {
            var st = $(this).scrollTop();
            if (st >= 600) {
                if (!isFixed) {
                    This.removeClass("abs").addClass("fixed");
                    This.css("left", left + "px");
                    isFixed = true;
                }
            }
            if (st < 600) {
                if (isFixed) {
                    This.removeClass("fixed").addClass("abs");
                    This.css("left", left + "px");
                    isFixed = false;
                }
            }

        });
        $(window).resize(function () {
            left = isLeft ? offset.left - 134 : offset.left + 1100;
            This.css("left", left + "px");
        });
       }
       catch(e){
        
       }
    }
})

/**
 * @create: Nelson
 * @popWindow	弹出蒙版层窗口插件
 * @调用方式	
   $("body").popDialog({
      title: "出错了",//弹出框标题
      content: "出错了", //弹出框里面的内容
      height: 328,//内容部分高度，不是整个对话框高度
      width: 690, //整个对话框的宽度，标题和内容部分要小20px的padding
      callback: function () { }，//加载完成后执行回调函数
      duration:0//对话框持续时间，过了指定时间后会自动消失
   })
 */
$.fn.popDialog = function (options) {
    var defaults = {
        title: "出错了",//弹出框标题
        content: "出错了", //弹出框里面的内容
        height: 328,//内容部分高度，不是整个对话框高度
        width: 690, //整个对话框的宽度，标题和内容部分会自动小20px的padding
        callback: function () { },//加载完成后执行回调函数
        duration:0//对话框持续时间，过了指定时间后会自动消失
    };
    var options = $.extend({}, defaults, options);

    this.each(function () {
        var This = $(this),
            mask_h = ($("body").height() > $(window).height()) ? $("body").height() : $(window).height(),
            dialog_top = $(window).height() / 2 - options.height / 2 - 50,
            dialog_left = $(window).width() / 2 - options.width / 2;
        var html = '<div id="popDialog" class="ui-dialog" style="width:'
            + options.width
            + 'px; position: fixed; z-index: 10000; display: block; overflow: hidden; top: '
            + dialog_top
            + 'px; left: '
            + dialog_left
            + 'px;"><div class="ui-dialog-title" style="width: '
            + (options.width - 20)
            + 'px;"><span>'
            + options.title
            + '</span></div><div class="ui-dialog-content" style="height: '
            + options.height
            + 'px; width: '
            + (options.width - 20)
            + 'px; overflow: hidden;">'
            + options.content
            + '</div><a class="ui-dialog-close" title="关闭"><span class="ui-icon ui-icon-delete"></span></a></div>'
            + '<div id="popMask" class="ui-mask" style="position: fixed; left: 0px; top: 0px; opacity: 0.25; z-index: 9998; width: 100%; height:'
            + mask_h
            + 'px; background-color: rgb(0, 0, 0); filter: progid:DXImageTransform.Microsoft.Alpha(opacity=25);"></div>';
        This.find("#popDialog,#popMask").remove();
        This.append(html).find("#popDialog").find(".ui-dialog-close").click(function () {
            This.find("#popDialog,#popMask").remove();
        });
        options.callback();
        if (options.duration > 0) {
            setTimeout(function () {
                This.find("#popDialog,#popMask").remove();
            }, options.duration);
        }
    });
};
$.extend($, {
    closeDialog: function () {
        $("#popDialog,#popMask").remove();
    }
});

/**
 * @create: Nelson
 * @initNumberPlus	点击增减数字插件
 * @调用方式	
   $(obj).initNumberPlus({
       maxNumber: 5,//最大值
       minNumber: 1,//最小值
       restNumber: 100, //剩余数量
       callback: function () { } //每次改变数量后执行的回调函数
   });
*/
$.fn.extend({
    initNumberPlus: function (options) {
        var defaults = {
            maxNumber: 5,//最大值
            minNumber: 1,//最小值
            restNumber: 100, //剩余数量
            callback: function () { } //每次改变数量后执行的回调函数
        };
        var options = $.extend({}, defaults, options);
        this.each(function () {
            var This = $(this),
            _input = This.find("input.itxt");
            This.find(".increment").click(function () {
                var value = parseInt(_input.val()) + 1;
                if (value > options.maxNumber) {
                    alert("最多只能购买" + options.maxNumber + "件！");
                    return;
                }
                if (value > options.restNumber) {
                    alert("库存不足！");
                    return;
                }
                if (value >= options.minNumber) {
                    _input.val(value);
                    options.callback();
                }
            })
            This.find(".decrement").click(function () {
                var value = parseInt(_input.val()) - 1;
                if (value >= options.minNumber) {
                    _input.val(value);
                    options.callback();
                }
            });
            _input.blur(function () {
                var self = $(this),
                    value = parseInt(self.val());
                if (parseInt(value, 10) !== value) {
                    value = 1;
                }
                if (value >= options.maxNumber) {
                    self.val(options.maxNumber);
                    options.callback();
                    return;
                }
                if (value >= options.restNumber) {
                    self.val(options.restNumber);
                    options.callback();
                    return;
                }
                if (value <= options.minNumber) {
                    _input.val(options.minNumber);
                    options.callback();
                }
                else {
                    _input.val(value);
                    options.callback();
                }
            });

        });
    }
});

/*
 * @create: nelson
 * @countdown 倒计时插件
 * @调用方式	
   $(obj).countdown({
        time: "", //倒计时时间对象
        dayPanel: "", //显示天的标签
        hourPanel: "", //显示小时的标签
        minutePanel: "", //显示分钟的标签
        secondPanel: "", //显示秒的标签
        endText: "" //倒计时结束文字
   })
 */
$.fn.countdown = function (options) {
    //默认值
    var defaults = {
        time: "", //倒计时时间对象
        dayPanel: "", //显示天的标签
        hourPanel: "", //显示小时的标签
        minutePanel: "", //显示分钟的标签
        secondPanel: "", //显示秒的标签
        endText: "" //倒计时结束文字
    }
    var options = $.extend({}, defaults, options);

    this.each(function () {
        var obj = $(this);
        //倒计时函数
        function countDown() {
            var openTime = options.time;
            var openTimeStr = countTime(openTime).split("-");
            if (openTimeStr[0] >= 0) {;
                obj.find(options.dayPanel).html(openTimeStr[0]);
                obj.find(options.hourPanel).html(openTimeStr[1]);
                obj.find(options.minutePanel).html(openTimeStr[2]);
                obj.find(options.secondPanel).html(openTimeStr[3]);
            }
            if (openTimeStr[0] == "") {
                obj.parent().css("background", "none");
                obj.parent().html("<p>" + options.endText + "</p>");
            }
            timeout = setTimeout(function () {
                countDown();
            }, 1000);
        }
        //计算时间差函数
        function countTime(timeObj) {
            var nowTime = new Date();	//现在时间  
            /* 
			 * 如果求的时间差为天数则处以864000000，如果是小时数则在这个数字上 
			 *除以24，分钟数则再除以60，依此类推 
			*/
            var timesGAp = timeObj.getTime() - nowTime.getTime();
            var days = Math.floor(timesGAp / (1000 * 60 * 60 * 24));
            var hour = Math.floor(timesGAp / (1000 * 60 * 60)) % 24;
            if (hour < 10) hour = "0" + hour;
            var minute = Math.floor(timesGAp / (1000 * 60)) % 60;
            if (minute < 10) minute = "0" + minute;
            var second = Math.floor(timesGAp / 1000) % 60;
            if (second < 10) second = "0" + second;
            return days + "-" + hour + "-" + minute + "-" + second;
        }
        //调用倒计时
        countDown();
    })
}

/**
 * @create: nelson
 * @rotatelist	内容轮播插件
 * @调用方式	
   $(obj).rotatelist({
		speed: 10, //移动速率
		rate : 3, //图片每次移动的距离
		par : 80, //基数
		direction : 1, //方向，1是水平方向，2是垂直方向
        callback:function(){}//回调函数
   })
 */
$.fn.rotatelist = function (options) {
    var defaults = {
        speed: 10, //移动速率
        rate: 3, //图片每次移动的距离
        par: 70, //基数
        direction: 1, //方向，1是水平方向，2是垂直方向
        callback:function(){}//回调函数
    };
    var options = $.extend({}, defaults, options);

    this.each(function () {
        var obj = $(this);
        var action_timer = null;
        var init_timer = null;
        var On = false;
        var length = 0;
        var In = false;
        var slideobj = null;
        var holder1 = null;
        //初始化
        function init() {
            slideobj = obj.find(".slideshow");
            holder1 = slideobj.find(".holder1");
            slideobj.find(".holder2").html(holder1.html());

            if (options.direction == 1) {
                slideobj.scrollLeft(holder1.outerWidth());
                if (holder1.outerWidth() > slideobj.outerWidth()) {
                    //start();
                }
                else {
                    options.callback();
                    return;
                }
            }
            else if (options.direction == 2) {
                slideobj.scrollTop(holder1.outerHeight());
                if (holder1.outerHeight() > slideobj.outerHeight()) {
                    start();
                }
                else {
                    options.callback();
                    return;
                }
            }

            slideobj.mouseover(function () {
                stop()
            })
            slideobj.mouseout(function () {
                //start()
            })

            if (obj.find(".leftbtn").size() != 0) {
                var aleft = obj.find(".leftbtn");
                aleft.mousedown(function () {
                    up();
                })
                aleft.mouseup(function () {
                    stopUp();
                })
                aleft.mouseout(function () {
                    stopUp();
                })
                aleft.mouseover(function () {
                    stop();
                })
            }

            if (obj.find(".rightbtn").size() != 0) {
                var aright = obj.find(".rightbtn");
                aright.mousedown(function () {
                    down();
                })
                aright.mouseup(function () {
                    stopDown();
                })
                aright.mouseout(function () {
                    stopDown();
                })
                aright.mouseover(function () {
                    stop();
                })
            }
            options.callback();
        }
        function start() {
            clearInterval(init_timer);
            init_timer = setInterval(function () {
                down();
                stopDown();
            }, 3000)
        };
        function stop() {
            clearInterval(init_timer)
        };
        function up() {
            if (On) {
                return
            }
            clearInterval(init_timer);
            On = true;
            action_timer = setInterval(function () {
                move_backword()
            }, options.speed)
        };
        function stopUp() {
            if (In) {
                return
            }
            clearInterval(action_timer);
            if (options.direction == 1) {
                if (slideobj.scrollLeft() % options.par != 0) {
                    length = -(slideobj.scrollLeft() % options.par);
                    T()
                } else {
                    On = false
                }
            }
            else if (options.direction == 2) {
                if (slideobj.scrollTop() % options.par != 0) {
                    length = -(slideobj.scrollTop() % options.par);
                    T()
                } else {
                    On = false
                }
            }
           // start();
        };
        function move_backword() {
            if (options.direction == 1) {
                if (slideobj.scrollLeft() <= 0) {
                    slideobj.scrollLeft(holder1.outerWidth());
                }
                var lf = slideobj.scrollLeft() - options.rate;
                slideobj.scrollLeft(lf);
            }
            else if (options.direction == 2) {
                if (slideobj.scrollTop() <= 0) {
                    slideobj.scrollTop(holder1.outerHeight());
                }
                var tp = slideobj.scrollTop() - options.rate;
                slideobj.scrollTop(tp);
            }
        };
        function down() {
            clearInterval(action_timer);
            if (On) {
                return
            }
            clearInterval(init_timer);
            On = true;
            move_forword();
            action_timer = setInterval(function () {
                move_forword();
            }, options.speed)
        };
        function stopDown() {
            if (In) {
                return
            }
            clearInterval(action_timer);
            if (options.direction == 1) {
                if (slideobj.scrollLeft() % options.par != 0) {
                    length = options.par - slideobj.scrollLeft() % options.par;
                    T();
                } else {
                    On = false
                }
            }
            else if (options.direction == 2) {
                if (slideobj.scrollTop() % options.par != 0) {
                    length = options.par - slideobj.scrollTop() % options.par;
                    T();
                } else {
                    On = false
                }
            }
            //start();
        };
        function move_forword() {
            if (options.direction == 1) {
                if (slideobj.scrollLeft() >= holder1.outerWidth()) {
                    slideobj.scrollLeft(0);
                }
                var lf = slideobj.scrollLeft() + options.rate;
                slideobj.scrollLeft(lf);
            }
            else if (options.direction == 2) {
                if (slideobj.scrollTop() >= holder1.outerHeight()) {
                    slideobj.scrollTop(0);
                }
                var tp = slideobj.scrollTop() + options.rate;
                slideobj.scrollTop(tp);
            }
        };
        function T() {
            if (length == 0) {
                On = false;
                In = false;
                return
            }
            var V;
            var W = options.speed,
				X = options.rate;
            if (Math.abs(length) < options.par / 5) {
                X = Math.round(Math.abs(length / 5));
                if (X < 1) {
                    X = 1
                }
            }
            if (length < 0) {
                if (length < -X) {
                    length += X;
                    V = X
                } else {
                    V = -length;
                    length = 0
                }
                if (options.direction == 1) {
                    var lf = slideobj.scrollLeft() - V;
                    slideobj.scrollLeft(lf);
                }
                else if (options.direction == 2) {
                    var tp = slideobj.scrollTop() - V;
                    slideobj.scrollTop(tp);
                }
                setTimeout(function () {
                    T()
                }, W)
            } else {
                if (length > X) {
                    length -= X;
                    V = X
                } else {
                    V = length;
                    length = 0
                }
                if (options.direction == 1) {
                    var lf = slideobj.scrollLeft() + V;
                    slideobj.scrollLeft(lf);
                }
                else if (options.direction == 2) {
                    var tp = slideobj.scrollTop() + V;
                    slideobj.scrollTop(tp);
                }
                setTimeout(function () {
                    T()
                }, W)
            }
        }
        init();
    });

}

// JavaScript Document
/****
desc : 分页异步获取列表数据，页面向上滚动时候加载前面页码，向下滚动时加载后面页码
ajaxdata_url    ajax异步的URL 如data.php
page_val_name   ajax异步的URL中的页码参数名 如pageno
page_no         初始加载页码，默认1  [如2,则与前面两参数结合为data.php?pageno=2
is_lazyload     是否开启懒加载
page_count      总页数
empty_msg       没有数据的时候提示（可传输图片）
ending_msg      最大页码显示提示
***/
$.fn.list_data = function (options) {
    //参数
    var This = $(this);
    var flag = false;//flag为false时为初次加载，防止不断加载
    var defaults = {
        ajaxdata_url: '',
        page_val_name: 'current',
        page_no: 1,
        page_count: '',
        is_lazyload: true,
        loading_msg: '加载中...',
        empty_msg: '没有相关数据！',
        ending_msg: '没有更多数据了!'
    };
    var opt = $.extend(defaults, options)

    //没有数据的提示语
    if (opt.page_count <= 0) {
        This.html("<div class='ui-no-msg'>" + opt.empty_msg + "</div>");
        return true;
    }

    //获取页码，暂时不会用到
    var get_return_page = function () {
        /*var url = location.href;
        var page = '';
        if (url.indexOf("#") > 0) {
            var arr = url.split("#");
            var pagestr = arr[1];
            if (pagestr.indexOf("_") > 0) {
                var arr2 = pagestr.split("_");
                var page = arr2[0];
            }
        }
        if (page == '' || page == undefined) {
            return 1;
        } else {
            return page;
        }*/
        return opt.page_no;
    }

    //基础参数
    var page = get_return_page() * 1;
    var page_up = page;
    var page_down = page;

    //异步加载数据
    var loadmore = function (page, pos) {
        var loading = "<div class='ajax-loading'>" + opt.loading_msg + "</div>";
        $.ajax({
            type: "GET",
            url: opt.ajaxdata_url + "&" + opt.page_val_name + "=" + page,
            beforeSend: function () {
                $(".ajax-loading").remove();
                $(".ui-no-msg").remove();
                if (pos == 'before') {
                    $(loading).insertBefore(This);
                } else {
                    $(loading).insertAfter(This);
                }
                $(".ajax-loading").show();
                flag = true;
            },
            dataType: "html",
            error: function () {
                //This.html("<div class='ui-no-msg'>数据异常，请刷新重试！</div>");
                $("<div class='ui-no-msg'>数据异常，请刷新重试！</div>").appendTo(This);
                $(".ajax-loading").remove();
            },
            success: function (content) {
                flag = false;
                content = $.parseHTML(content);
                if (pos == 'before') {
                    $(content).prependTo(This);
                } else {
                    $(content).appendTo(This);
                }
                $(".ajax-loading").remove();
                $(".ui-no-msg").remove();

                //是否开启懒加载
                if (opt.is_lazyload == true) {
                    lazyLoadImgs(This);
                }
            }

        });
    }

    //懒加载
    function lazyLoadImgs(e) {
        e.find("img").lazyload({
            effect: "show",
            event: "sporty"
        });
        var timeout = setTimeout(function () { e.find("img").trigger("sporty") }, 500);
    }

    //初始加载
    if (flag == false) {
        loadmore(page, 'after');

        $(window).scroll(function () {
            var scrollTop = $(this).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(this).height();

            //滚动到顶部 
            if (scrollTop == 0) {
                if (page_up > 1) {
                    page_up--;
                    //loadmore(page_up, 'before');暂时不需要向上滚动加载
                }
            } else {
                //滚动到底部 
                if (scrollTop + windowHeight >= (scrollHeight - 200)) {
                    if (page_down < opt.page_count) {
                        page_down++;
                        loadmore(page_down, 'after');
                    } else {
                        $(".ajax-ending").remove();
                        $("<div class='ajax-ending'>" + opt.ending_msg + "</div>").appendTo(This);
                        $(".ajax-ending").delay(2000).hide();
                    }
                }
            }
        });
    }

}

/**
 * @create: Nelson
 * @initFlashSale 闪购初始化
 * @调用方式    
   $("obj").initFlashSale();
 */
$.fn.initFlashSale = function () {
    var This = $(this),
         _items = This.find(".item-wrap"),
         itemIndexArr = [],
         count = _items.length,
         capacity = 4;
    if (count == undefined || count == 0) {
        This.remove();
    } else {
        _items.find(".countdown").each(function () {
            initCountDown(this);
        });
        for (var i = 0; i < capacity; i++) {//初始化
            itemIndexArr.push(i);
            _items.eq(i).addClass("on");
        }
        This.find(".flash-sale-controller").click(function () {
            This.find(".item-wrap").removeClass("on");
            for (var i = 0; i < capacity; i++) {
                if (itemIndexArr[i] + capacity < count) {
                    itemIndexArr[i] += capacity;
                } else {
                    itemIndexArr[i] = itemIndexArr[i] + capacity - count;
                }
                //_items.eq(itemIndexArr[i]).addClass("on");
                lazyLoadImgs(_items.eq(itemIndexArr[i]).addClass("on"));
            }
            This.find(".item-wrap").removeClass("first").eq(itemIndexArr.min()).addClass("first");
        });
    }
    function lazyLoadImgs(e) {
        e.find("img").lazyload({
            effect: "show",
            event: "sporty"
        });
        var timeout = setTimeout(function () { e.find("img").trigger("sporty") }, 500);
    }
    Array.prototype.min = function () {
        return Math.min.apply(Math, this);
    }
    /****
    倒计时函数
    time   2014/10/1 10:00:00
    id     元素
    example countDown("#colockbox1");
    <span  data-nowtime="2015/10/22 17:57:52" data-starttime="2015/10/22 18:57:52" id="colockbox1"></span>
    ****/
    function initCountDown(obj) {
        var This = $(obj),
            ntime = This.attr("data-nowtime"),
            stime = This.attr("data-starttime");
        var day_elem = This.find('.day');
        var hour_elem = This.find('.hour');
        var minute_elem = This.find('.minute');
        var second_elem = This.find('.second');
        var sys_time = new Date(ntime).getTime();
        var end_time = new Date(stime).getTime();
        var sys_second = (end_time - sys_time) / 1000;
        var timer = setInterval(function () {
            if (sys_second >= 1) {
                sys_second -= 1;
                var day = Math.floor((sys_second / 3600) / 24);
                var hour = Math.floor((sys_second / 3600) % 24);
                var minute = Math.floor((sys_second / 60) % 60);
                var second = Math.floor(sys_second % 60);
                if (parseInt(day) > 0) {
                    day_elem.text(day + '天');
                    hour_elem.text((hour < 10 ? "0" + hour : hour) + '小时');//计算小时
                } else {
                    hour_elem.text((hour < 10 ? hour : hour) + '小时');
                    minute_elem.text((minute < 10 ? "0" + minute : minute) + '分');//计算分钟
                    second_elem.text((second < 10 ? "0" + second : second) + '秒');//计算秒杀
                }
            } else {
                This.parent().hide();
                clearInterval(timer);
            }
        }, 1000);
    }

}