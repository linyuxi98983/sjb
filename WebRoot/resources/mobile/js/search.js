var $_GET = function() {
    var a = window.document.location.href.toString().split("?");
    if ("string" == typeof a[1]) { - 1 != a[1].indexOf("#") ? (a = a[1].split("#"), a = a[0].split("&")) : a = a[1].split("&");
        var f = {},
        e;
        for (e in a) {
            var d = a[e].split("=");
            f[d[0]] = d[1]
        }
        return f
    }
    return {}
} ();
String.prototype.strip_tags = function(a) {
    a = a ? a.toLowerCase() : "";
    return this.replace(/<[\/\!\?]?([\w_-]*)[^>]*>/igm,
    function(f, e) {
        return - 1 < a.indexOf("<" + e.toLowerCase() + ">") ? f: ""
    })
};
String.prototype.replaceAll = function(a, f, e) {
    return RegExp.prototype.isPrototypeOf(a) ? this.replace(a, f) : this.replace(RegExp(a, e ? "gi": "g"), f)
};
var m_collect = {
    clearwishfail: "",
    mdd_token: "",
    search_login_url: "",
    wishfail: function(a) {
        $("#customer_load").html(a);
        $("#customer_load").parent().fadeIn();
        this.clearwishfail = window.setTimeout("$('#customer_load').parent().fadeOut('fast');", 1E3);
        return ! 1
    },
    addwishlist: function(a, f) {
        var e = location.href,
        d = $("#search_" + a),
        c = d.attr("flag"),
        b = "add" == c ? "\u6536\u85cf\u5931\u8d25": "\u53d6\u6d88\u6536\u85cf\u5931\u8d25",
        h = this;
        clearTimeout(h.clearwishfail);
        $.ajax({
            type: "POST",
            url: searchUrl + "search_wishlist.php",
            data: {
                product_id: f,
                dotype: c,
                burl: e
            },
            timeout: 5E3,
            dataType: "json",
            success: function(a) {
                0 == a.errorCode ? (d.toggleClass("span_sc_on"), d.attr("flag", "add" == c ? "del": "add"), $("#customer_load").parent().fadeOut("fast")) : 96 == a.errorCode ? location.assign(h.search_login_url) : h.wishfail(a.errorMsg)
            },
            error: function(a, c, d) {
                h.wishfail(b)
            }
        })
    },
    checkLogin: function() {
        var a = this.search_login_url;
        return "" == this.mdd_token ? (location.assign(a), !1) : !0
    },
    searchWishlist: function(a, f) {
        if (this.checkLogin() && "none" == $("#customer_load").parent().css("display")) {
            var e = "add" == $("#search_" + a).attr("flag") ? "\u6536\u85cf\u4e2d...": "\u53d6\u6d88\u6536\u85cf\u4e2d ...";
            $("#customer_load").html(e).parent().fadeIn("fast");
            this.addwishlist(a, f)
        }
    }
};

var m_loadMore = {
	/***
	 * 加载参数loadParams
	 * appendCls 列表数据加载后的append对象
	 * data 加载的额外参数
	 * url 加载链接
	 * callback 成功加载后的回调方法
	 */
	loadParams:{appendCls:'',data:{},url:'',callback:function(){}},
    p: "",
    loading: !1,
    loadC: 0,
    big_pic_class: "",
    pageSize: 10,
    hasNext: !0,
    type: 1,
    page: 2,
    init: function() {
    	this.reset();
        this.loading = !1;
        this.loadC = 0;
        this.page = 2;
        this.extendFun();
        this.be();
        this.loadMore();
    },
    reset:function(){// 清零
    	this.loading=!1;
    	this.loadC = 0;
		$("#curr_page").val(1);
		this.hasNext = !0;
		$("._load").removeClass("_load").addClass("load").show();
    },
    extendFun: function() {},
    be: function() {
        this.scrollAutoLoad()
    },
    loadData: function(o){
    	var d = this;
    	var appendCls = o.appendCls;
    	var data = o.data;
    	var url = o.url;
    	var callback = o.callback;
    	$.ajax({
    		url: url,
    		type: "POST",
    		data:$.extend({},{currpage:$("#curr_page").val()},data),
    		dataType: "html",
    		cache: false,
    		success: function(html) {
    			var $html = $(html);
    			$(appendCls).append($html);
    			if(callback) callback();
    			
    			var pageindex = $html.find("input[name='pageNumber']").val();
    			var pageSize = $html.find("input[name='pageSize']").val();
    			var total = $html.find("input[name='pageCount']").val();
    			var curLength = $html.find("input[name='curLength']").val();
    			
    			$("#curr_page").val(parseInt($("#curr_page").val()) + 1);
    			pageindex == total && $(".load").removeClass("load").addClass("_load").hide();
                d.loading = !1;
                d.loadC++;
                curLength < pageSize && (d.hasNext = !1, $(".load").removeClass("load").addClass("_load")).hide();
                
                $html.find(".pager").remove();
    		}
    	});
    },
    loadMore: function() {
    	console.log('loadMore,hasNext='+this.hasNext);
        this.loading = !0;
        this.page = parseInt($("#curr_page").val()) + 1;
        this.hasNext && this.loadData(this.loadParams);
    },
    scrollAutoLoad: function() {
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
                    c = d - c; (100 > Math.abs(c) || 0 <= c || d >= e) && !a.loading && a.loadMore()
                }
            })
        })
    },
    cDom1: function(a) {
        var f = 1,
        e = "",
        d = "",
        c;
        for (c in a) {
            var b = "",
            h = 1 == a[c].is_customer ? "span_sc_on": "",
            k = 1 == a[c].is_customer ? "del": "add",
            b = b + "<li><div>",
            b = b + ('<a href="' + a[c].product_url + '" name="product_item" dd_name="\u5546\u54c1">'),
            b = b + ('<p class="img"><img class="img_lazy_' + this.loadC + '" data-original="' + a[c].image_url + '" src="' + proxyAssets + 'coreimages/bg_pic.png" alt="' + String.prototype.strip_tags(a[c].product_name + " " + a[c].sub_name) + ' ">');
            0 != a[c].is_overseas && (b += '<span class="overseas"></span>');
            b += "</p>";
            b += '<p class="name">' + a[c].product_name + " " + a[c].sub_name + "</p>";
            0 < a[c].m_save && (b += '<span class="tuijian sjzx">\u5df2\u7701&yen;' + a[c].m_save + "</span>");
            b += "</a>";
            b += '<p class="price"><span class="red">&yen;' + a[c].price + "</span>";
            "undefined" != typeof a[c].discount && 0 < a[c].discount && (b += '<span class="zk">' + a[c].discount + "\u6298</span>");
            b += '<span name="item_collect" dd_name="\u6536\u85cf" class="span_sc ' + h + '" onclick="m_collect.searchWishlist(\'' + this.page + "_" + c + "_" + a[c].product_id + "','" + a[c].product_id + '\')" id="search_' + this.page + "_" + c + "_" + a[c].product_id + '" flag="' + k + '"></span></p>';
            b += "</div></li>";
            0 != f % 2 ? e += b: d += b;
            f++
        }
        $(e).appendTo($(".goods_list ul").eq(0));
        $(d).appendTo($(".goods_list ul").eq(1));
        $("img.img_lazy_" + this.loadC).lazyload()
    },
    cDom2: function(a, f) {
        var e = $("#pubo_box_left"),
        d = $("#pubo_box_right"),
        c = "undefined" != typeof f.big_pic_class ? f.big_pic_class: "",
        b;
        for (b in a) {
            var h = e.height(),
            k = d.height(),
            l = 1 == a[b].is_customer ? "span_sc_on": "",
            m = 1 == a[b].is_customer ? "del": "add",
            g = '<div class="pubo_shop_box' + c + '">',
            g = g + ('<a href="' + a[b].product_url + '"  name="product_item" dd_name="\u5546\u54c1">'),
            g = g + ('<p class="img"><img class="img_lazy_' + this.loadC + "_" + b + '" id="pro_' + this.page + "_" + a[b].product_id + '" data-original="' + a[b].image_url + '" src="' + proxyAssets + 'coreimages/bg_pic.png" alt="' + String.prototype.strip_tags(a[b].product_name + " " + a[b].sub_name) + '">');
            0 != a[b].is_overseas && (g += '<span class="overseas"></span>');
            g += "</p>";
            0 < a[b].m_save && (g += '<span class="tuijian sjzx">\u5df2\u7701&yen;' + a[b].m_save + "</span>");
            g += "</a>";
            g += '<a href="' + a[b].product_url + '"><p class="name">' + a[b].product_name + " " + a[b].sub_name + "</p></a>";
            g += '<p class="price"><span class="red">&yen;' + a[b].price + "</span>";
            "undefined" != typeof a[b].discount && 0 < a[b].discount && (g += '<span class="zk">' + a[b].discount + "\u6298</span>");
            g += '<span name="item_collect" dd_name="\u6536\u85cf" class="span_sc ' + l + '" onclick="m_collect.searchWishlist(\'' + this.page + "_" + b + "_" + a[b].product_id + "','" + a[b].product_id + '\')" id="search_' + this.page + "_" + b + "_" + a[b].product_id + '" flag="' + m + '"></span></p></div>';
            h <= k ? e.append(g) : d.append(g);
            $("img.img_lazy_" + this.loadC + "_" + b).lazyload()
        }
    }
};