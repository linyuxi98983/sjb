$(function(){
	//加载数据
    m_loadMore.init();
});
//加载更多
$("#curr_page").val(1);
var m_loadMore = {
    p: "",
    loading: !1,
    loadC: 0,
    big_pic_class: "",
    pageSize: 10,
    hasNext: !0,
    type: 1,
    page: 2,
    init: function() {
        this.loading = !1;
        this.loadC = 0;
        this.page = 2;
        this.extendFun();
        this.be();
    },
    extendFun: function() {},
    be: function() {
        this.scrollAutoLoad()
    },
    loadMore: function() {
    	this.loading = !0;
    	var a = parseInt($("#curr_page").val()) + 1; //当前加载的页数
    	this.page = a;
    	var d = this;
    	//渲染数据开始
    	$.ajax({
            type: "GET",
            url: "/xg/html/admin/goods/data.json",
            dataType: "json",
            success: function(c) {
				var html='';
				html+='<li><table><tr><td class="shop-img"><a href="../goods/goods-detail.htm"><p><img class="auto-img" src="../images/bg_pic.png"></p></a></td>';
			   	html+='<td valign=top class="shop-info"><p><span>\u865A\u62DF\u6570\u636E</span><span class="addr-img"><img src="../images/addressmgr.png"/><span>100m</span></span></p>';
			   	html+='<p>3\6708\u9500108\u5355<span class="sale-num"><img src="../images/zan.png"/><span>98</span></span></p><p><span>6.0\u6298\u8D77</span><span class="shop-fav-on"></span></p>';
				html+='</td></tr></table></li>';
				this.loading = !1;
            	$(html).appendTo(".nearby-list ul");
            	//渲染数据结束
            	d.loading = !1;
            	//延迟加载图片
            	//$("img.img_lazy_xf").lazyload();
            },
            error: function(a, b, d) {
                console.log(d)
            }
        })
    },
    scrollAutoLoad: function() {//判断滚动条位置
        var a = this;
        $(function() {
            var f = $(window).height();
            $(window).scroll(function() {
                var e = $(".load"),
                d = $("._pre").css("display");
                if (0 < e.length && "none" !== d) {
                    var d = parseInt(e.height()),
                    e = e.offset().top,
                    c = d + e,
                    d = $(window).scrollTop() + f,
                    c = d - c; 
                    (100 > Math.abs(c) || 0 <= c || d >= e) && !a.loading && a.loadMore()
                }
            })
        })
    }
};
