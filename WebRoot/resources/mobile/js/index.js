(function(a) {
    var f = {
    	ids:null,
        init: function() {
            this.isScroll = 1;
            //this.initScroller();
        },
        initScroller: function() {
            function b() {
                if (/iPhone|iPad|iPod|Macintosh/i.test(navigator.userAgent)) return ! 1;
                if (/Chrome/i.test(navigator.userAgent)) return /Android/i.test(navigator.userAgent);
                if (/Silk/i.test(navigator.userAgent)) return ! 1;
                if (/Android/i.test(navigator.userAgent)) {
                    var a = navigator.userAgent.substr(navigator.userAgent.indexOf("Android") + 8, 3);
                    return 44 > parseFloat(a[0] + a[3]) ? !1 : !0
                }
            }
            var c = a(".list_null").height(); - 1 < navigator.userAgent.indexOf("MQQB") && a(".jp_block").css({
                top: "50%"
            });
            setTimeout(function() {
                if (c) {
                    f.empty = !0;
                    a("html,body").css({
                        "-webkit-overflow-scrolling": "touch",
                        height: "auto"
                    });
                    var e = (190 * a(".advs").val() - 10) / 20;
                    a(".guessList").css({
                        width: e + "rem"
                    });
                    a(".viewport section:last-child").css({
                        "margin-bottom": "0px"
                    })
                } else e = window.innerHeight - a("footer").height() - a(".h_label").height(),
                f.empty = !1,
                a("#wrapper").height(e),
                a(".viewport").css({
                    overflow: "initial"
                }),
                f.scroller = new IScroll("#wrapper", {
                    click: b()
                }),
                window.isAndroidWebview = /Android/i.test(navigator.userAgent),
                window.inputMoved = !1,
                a(".header .menu").on("click",
                function() {
                    setTimeout(function() {
                        var b = window.innerHeight - a(".t-nav").height() - a("footer").height() - a(".h_label").height();
                        a("#wrapper").height(b);
                        f.scroller && f.scroller.refresh()
                    },
                    500)
                })
            },
            0)
        },
        //�߶����µ���
        refreshHeight: function() {
            var b = window.innerHeight - a(".t-nav").height() - a("footer").height() - a(".h_label").height();
            a("#wrapper").height(b);
            f.scroller && f.scroller.refresh();
        },
        //ͼƬ�ֲ�
        slideInit: function(a) {
            var c = this;
            a.on("scrollStart",
            function() {
                window.clearInterval(a.timer);
                a.timer = setInterval(function() {
                    a.directionX = 1;
                    c.slidePic(a)
                },
                5E3)
            });
            a.on("scrollEnd",
            function() {
                c.slidePic(this)
            });
            c.slideRun(a)
        },
        slidePic: function(b) {
        	0 != b.directionX && (b.pageNum += b.directionX, b.pageNum >= b.pageSize ? b.pageNum = 0 : 0 > b.pageNum && (b.pageNum = b.pageSize - 1), b.scrollToElement(a(b.scroller).find("li").eq(b.pageNum)[0], 300), a(b.wrapper).find(".on").removeClass("on"), a(b.wrapper).find(".dot li").eq(b.pageNum).addClass("on"), b.directionX = 0)
        },
        slideRun: function(a) {
            var c = this;
            a.timer = setInterval(function() {
                a.directionX = 1;
                c.slidePic(a)
            },
            5E3)
        },
        productSliderInit: function() {
            this.topSlider = a.os.ios ? new IScroll("#slider", {
                useTransition: !1,
                scrollX: !0,
                scrollY: !1,
                snap: !1,
                momentum: !1,
                click: !1,
                eventPassthrough: !0,
                preventDefault: !0
            }) : new IScroll("#slider", {
                scrollX: !0,
                scrollY: !1,
                snap: !1,
                momentum: !1,
                click: !1,
                eventPassthrough: !0,
                preventDefault: !0
            });
            this.topSlider.pageNum = 0;
            this.topSlider.pageSize = a(".top-slider li").length;
            this.slideInit(this.topSlider);
            this.sliderPullToJump(a(".top-slider li").last());
            a("#slider li").on("click",
            function() {
                a("#bigpic").toggleClass("bigpic");
                a("#cell").toggleClass("cell")
            })
        },
        sliderPullToJump: function(b) {
            var c = this;
            b.on("touchstart",
            function(b) { ! a("#bigpic").hasClass("bigpic") && (c.pullStartX = b.touches[0].pageX) && (c.pullStartY = b.touches[0].pageY)
            });
            b.on("touchmove",
            function(b) { ! a("#bigpic").hasClass("bigpic") && b.touches[0].pageX < c.pullStartX && Math.abs(b.touches[0].pageX - c.pullStartX) > Math.abs(b.touches[0].pageY - c.pullStartY) && !a("#slider").hasClass("tip") && a("#slider").addClass("tip") && window.clearInterval(c.topSlider.timer)
            });
            b.on("touchend",
            function(b) {
                setTimeout(function() {
                    //a("#slider").hasClass("tip") && (a("#slider").removeClass("tip"), location.href = a("#detail_link").attr("href"))
                },
                0)
            })
        }
    };
    //ҳ������Ӧ
    a(window).resize(function(b) {
    	document.getElementsByTagName("body")[0].style.height = document.documentElement.clientHeight + "px";
        //f.empty || (b = window.innerHeight - a("footer").height() - a(".h_label").height(), a("#wrapper").height(b), document.getElementsByTagName("body")[0].style.height = document.documentElement.clientHeight + "px");
        //f.scroller && f.scroller.refresh()
    });
    a(document).ready(function() {
        f.init();
        window.onload = function() {
            f.productSliderInit()
        }
        if (document.documentElement.scrollHeight <= document.documentElement.clientHeight) {
            window.hideurlbar = !0;
            var b = document.getElementsByTagName("body")[0];
            b.style.height = document.documentElement.clientWidth / screen.width * screen.height + "px"
        }
        window.hideurlbar && setTimeout(function() {
            window.scrollTo(0, 1);
            //var c = b.style.height.replace("px", "") - a("footer").height() - a(".h_label").height();
            //f.scroller && f.scroller.refresh(); ! f.empty && a("#wrapper").height(c)
        },
        0)
    })
})(Zepto);

$(function(){
  	function cal(ele){
  		var start = parseInt(ele.attr("start").replace(/,/g,""));
  		var end = parseInt(ele.attr("end").replace(/,/g,""));
  		var now = parseInt(ele.attr("now").replace(/,/g,""));
  		var tipArr = ["离开始","离结束","已经结束"];
  		var $tip = ele.find(".tip");
  		var timestamp;
  		if(now < start){
  			$tip.html(tipArr[0]);
  			//ele.parents(".specil-section").hide();
  			bindCountdown(ele,start);
  		}else if(start < now && now < end){
  			$tip.html(tipArr[1]);
  			bindCountdown(ele,end);
  		}else if(end < now){
  			$tip.html(tipArr[2]);
  		}
  	}
  
  	function bindCountdown(ele,timestamp){
		ele.countdown({
			timestamp:timestamp,
			callback:function(days, hours, minutes, seconds){
				if(days == 0 && hours == 0 && minutes == 0 && seconds == 0){
					window.location.href = window.location.href;
				}
			}
		});
  	}
  	
  	$(".countdown").each(function(){
  		var $this = $(this);
  		cal($this);
  	});
  });