(function(a) {
    window.mxg_product = {
        init: function() {
            this.eventInit()
        },
        eventInit: function() {
            this.headerInit();
            this.lazyLoadInit();
            this.tabSwitch();
        },
        headerInit: function() {
        	//顶部隐藏菜单
            a(".header .menu").click(function(b) {
                a(this).hasClass("active") ? (a(this).removeClass("active"), a(".t-nav").removeClass("active")) : (a(this).addClass("active"), a(".t-nav").addClass("active"));
                b.preventDefault();
            })
        },
        images: function(a) {
            var c = new Image,
            e = a.attr("imgsrc");
            c.onload = function() { ! 0 == c.complete && (a.attr("src", e), a.removeClass("lazy"), a.removeAttr("imgsrc"))};
            c.src = e
        },
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
        },
        lazyLoadInit: function() {
            var b = this;
            this.alsoBuyLazyload = this.guessLazyload = !1;
            a(".lazy").each(function() {
                b.images(a(this))
            });
            window.onscroll = function() {
                a(".lazy").each(function() {
                    b.images(a(this))
                });
            }
        },
        tabSwitch: function(){
        	a(".review_nav ul li").click(function() {
                a(this).closest(".review_nav").find("li").removeClass("on");
                a(this).addClass("on");
        		a(".shop-list,.shop-desc").hide();
        		var id = a(this).attr("id");
        		a("."+id).css("display","block");
            })
        }
    };
    a(document).ready(function() {
        FastClick.attach(document.body);
        mxg_product.init();
        window.onload = function() {
            mxg_product.productSliderInit();
        }
    })
})(Zepto);