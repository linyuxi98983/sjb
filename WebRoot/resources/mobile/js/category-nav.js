/*add comment by wind 2015-10-22 in guangzhou*/
var showRel = 0,
resetScrollEle = function() {
    var a = $("#cate_lev2_div_" + showRel + ">li").find("a").eq(0).width() + "px";
    $(".cate_icon_img").css({
        width: a,
        height: a
    })
};
window.onload = function() {
    $("img[data-original]").lazyload();
    $(".search_header .menu").click(function(a) {
        $(this).hasClass("active") ? ($(this).removeClass("active"), $(".t-nav").removeClass("active"), setTimeout(function() {
            $(".main_box").css("height", "");
            lv1S.refresh();
            lv2S.refresh()
        },
        300)) : ($(this).addClass("active"), $(".t-nav").addClass("active"), setTimeout(function() {
            var a = $(".t-nav").height(),
            b = $(".main_box").height();
            $(".main_box").css("height", b - a + "px");
            lv1S.refresh();
            lv2S.refresh()
        },
        300));
        a.preventDefault()
    })
};
window.addEventListener("resize",
function() {
    resetScrollEle()
});
window.addEventListener("orientationchange",
function() {
    resetScrollEle()
});
var lv2S, nav = $(".class_list_nav_box ul>a"),
cSrc = function(a) {
    a.each(function(a, b) {//替换图片链接
        var c = $(b).attr("data-src"),
        d = $(b).attr("src");
        c !== d && $(b).attr("src", c)
    })
};
lv1S = new iScroll("class_list_nav_box", {
    hScrollbar: !1,
    vScrollbar: !1,
    hScroll: !1,
    vScroll: !0
});
lv2S = new iScroll("class_box_inner", {
    hScrollbar: !1,
    vScrollbar: !1,
    hScroll: !1,
    vScroll: !0,
    checkDOMChanges: !0
});
//点击二级分类事件
nav.bind("click",function() {
    lv2S.stop();
    $(this).children("li").addClass("on");
    $(this).siblings().children("li").removeClass("on");
    var a = $(this).attr("rel");
    showRel = a;
    var ids = ".cate_lev2_div_" + a;
    a = $(".cate_lev2_div_" + a); 
    
    a.siblings().hide();
    a.show();
    cSrc(a.find("img"));
    resetScrollEle();
    lv2S.destroy();
    lv2S = new iScroll("class_box_inner", {
        hScrollbar: !1,
        vScrollbar: !1,
        hScroll: !1,
        vScroll: !0,
        checkDOMChanges: !0
    });
    //lv1S.scrollToElement(this, 500)
});
//默认选中二级分类的第丄1�7个分籄1�7
nav.eq(0).trigger("click");

$(function() {
    $("#_keyword").bind("focus",
    function() {
        $(this).parent().trigger("click");
        $(".main").hide();
        $("#mix_search_div").show();
        $("#keyword").focus()
    });
    $(".mix_back").bind("click",
    function() {
        $("#mix_search_div").hide();
        $(".main").show()
    })
});