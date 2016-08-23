$(function() {
    //����������ʾ�߼�
    var sbox = $("#head_search_box"),
    sort = $('#product_sort'),
    related = $("#hot_search"),
    g_list = $("#goods_list"),
    g_m1 = "0",
    g_m2 = "90px";
    var initCss = function(type) {
        if (type == 1) {
            sort.css({
                "position": "static",
                "width": "100%"
            });
            g_list.css("margin-top", g_m1);
        } else {
            sort.attr("style", "");
            g_list.css("margin-top", g_m2);
        }
    };
    var m = {
        input: $("#_keyword"),
        rawAll: '',
        dd: $(".text_box"),
        cancel: $(".mix_back"),
        rawKey: '',
        main: function() {
            this.init();
            this.be();
        },
        init: function() {
            this.rawAll = this.input.val();
        },
        be: function() {
            var _this = this;
            this.input.focus(function() {
                var mix_search = $("#mix_search_div");
                if (mix_search.length > 0) {
                    _this.dd.trigger("click"); //for ddclick
                    $("._pre").hide();
                    mix_search.show();
                    $("#keyword").val(_this.rawKey).focus();
                    return;
                }
                var newKey = _this.input.val();
                if (newKey != _this.rawKey && newKey != _this.rawAll) {
                    $(this).val(newKey);
                } else {
                    $(this).val(_this.rawKey);
                }
                if ($(window).scrollTop() > 0) {
                    initCss(1);
                    window.scrollTo(0, 0);
                    _this.dd.trigger("click"); //for ddclick
                }
            }).blur(function() {
                var newKey = _this.input.val();
                if (newKey === _this.rawKey) {
                    $(this).val(_this.rawAll);
                } else {
                    $(this).val(newKey);
                }
            });
            this.cancel.bind("click",
            function() {
                $("#mix_search_div").hide();
                $("._pre").show();
            });
        }
    };
    m.main();
    $(window).resize(function() {
        sbox.css("width", "100%");
        sort.css("width", "100%");
    });
    //����stickyЧ��
    setTimeout(function() {
        var sboxH = sbox.height();
        var relatedH = related.height();
        relatedH <= 20 && related.remove();
        var sortH = sort.height();
        var sortStart = sort.offset().top - sboxH;
        var showEnd = sort.offset().top;
        var init = function() {
            sbox.css({
                "position": "fixed",
                "top": "0"
            });
            window.scrollTo(0, 0);
        };
        var rawScroll = 0,
        nowScroll = 0;
        var upOrDown = function() {
            var delta = 30;
            if (nowScroll > rawScroll + delta) {
                return 1;
            } else if (nowScroll < rawScroll - delta) {
                return 2;
            } else {
                return 0;
            }
        };
        var sticky = function() {
            nowScroll = $(window).scrollTop();
            if (nowScroll >= sortStart) {
                sort.css({
                    "position": "fixed",
                    "top": sboxH
                });
                g_list.css({
                    "margin-top": sortH
                });
            } else {
                sort.attr("style", "");
                g_list.attr("style", "");
            }
            if (nowScroll > showEnd + sortH) {
                var up = upOrDown();
                if (up == 1) {
                    if (sbox.css("display") != "none") {
                        sbox.hide();
                        sort.hide();
                    }
                    rawScroll = nowScroll;
                } else if (up == 2) {
                    if (sbox.css("display") == "none") {
                        sbox.show();
                        sort.show();
                    }
                    rawScroll = nowScroll;
                }
            } else {
                if (sbox.css("display") == "none") {
                    sbox.show();
                    sort.show();
                }
            }
        };
        init();
        $(document).on("touchmove", sticky);
        $(window).on("scroll", sticky);
    },
    500);
    
    //ͼƬ�ӳټ���
    $("img[data-original]").lazyload();
    //ɸѡ������ʾ����
    var filtrate = $(".filtrate"),
    submit = $(".submit,.back");
    filtrate.bind("click",
    function() {
        $("._next").show();
        $("._pre").hide();
        window.scrollTo(0, 0);
    });
    submit.bind("click",
    function() {
        $("._next").hide();
        $("._pre").show();
    });
    //���ض����߼�
    $("#backtop").click(function() {
        window.scrollTo(0, 0);
    });
    
    $("#filter_brand_nav").click(function(){//Ʒ��
    	
    	var span = $(this).find(".up_down");
    	if(span.html()=="\u6536\u8D77"){
    		span.html("\u5C55\u5F00");//չ��
    		$("#filter_brand_nav").removeClass("filtrate_category_show");
    	}else{
    		span.html("\u6536\u8D77");//����
    		$("#filter_brand_nav").addClass("filtrate_category_show");
    	}
    	$("#filter_brand_list").toggle();
    });
    //�ղؼ�
    $(".btn_sc").click(function(){
    	
    });
    //�������
    m_loadMore.init();
    
    //�۸��������¼�ͷ
    $(".arrow_up").click(function(){//�۸�ӵ͵���
    	$(this).addClass("active_up");
    	$(".arrow_down").removeClass("active_down");
    	//$(".goods_list .clearfix ul").html("yyyyyyyyyyyyyy");
    	m_loadMore.type = 1;
    	ajax_comment("1");
    	//������Ⱦ���
    	//window.location.href = "goods!list.action?searchProperties\[\'orderby\'\]=price&searchProperties\[\'orderdec\'\]=asc";
    });
    $(".arrow_down").click(function(){//�۸�Ӹߵ���
    	$(this).addClass("active_down");
    	$(".arrow_up").removeClass("active_up");
    	//������Ⱦ���
    	m_loadMore.type = 2;
    	ajax_comment("2");
    	//$(".goods_list .clearfix ul").html("xxxxxxxxxxxxxxxx");
    	//window.location.href = "goods!list.action?searchProperties\[\'orderby\'\]=price&searchProperties\[\'orderbydec\'\]=desc";
    });
    
    //ɸѡtab�л�
    $(".filtrate_term li").click(function(index){
    	if($(this).find("a").attr("name") =="list_sort_index"){
    		//Ĭ��
    		ajax_comment();
    	}else if($(this).find("a").attr("name") =="list_sort_sales"){
    		//����
    		m_loadMore.type = 3;
    		ajax_comment(3);
    	}else if($(this).find("a").attr("name") =="list_sort_score"){
    		//����
    	}else if($(this).find("a").attr("name") =="list_sort_date"){
    		//ɸѡ
    		if(m_loadMore.brand == null){
    			$.ajax({
                    type: "GET",
                    url: searchUrl + "../brand/brand!list.action",
                    dataType: "html",
                    success: function(c) {
                    	m_loadMore.brand = c;
                    	$("#filter_brand_list").append(c);
                    	var li=$("#filter_brand_list").find("li");
                    	li.on("click",function(){
                    		$(this).addClass("on");
                    		o = $(this);
                    		li.each(function(){
                    			if($(this).attr("id") != o.attr("id")){
                    				$(this).removeClass("on");
                    			}
                    		});
                    	});
                    	
                    },
                    error: function(a, b, d) {
                        console.log(d)
                    }
                });
    		}
    	}else{
    		if(m_loadMore.type ==0){
    			m_loadMore.type =1;
    		}else if(m_loadMore.type ==1){
    			m_loadMore.type =2;
    		}else{
    			m_loadMore.type =1;
    		}
    		
        	ajax_comment(m_loadMore.type);
    	}
    	$(this).closest("ul").find("li").css("cursor","pointer").removeClass("on");
    	$(this).addClass("on");
    });
    
    $(".reset").click(function(){
    	$("#filter_brand_list").find("li").each(function(){
    		$(this).removeClass("on");
    	})
    	$("#lp").val("");
    	$("#hp").val("");
    });
    //ɸѡ������ѯ
    $("#submit_btn").click(function(){
    	
    	var lp = $("#lp").val();
    	var hp = $("#hp").val();
    	var brand;
    	$("#filter_brand_list").find("li").each(function(){
    		if($(this).hasClass("on")){
    			brand = $(this).attr("id");
    		}
    	}) ;
    	var data = {
    			'pageNumber':1,
            	"result":getResult(),
            	"type":queryUrlParam("type"),
    			'searchProperties.startprice':lp,
    			'searchProperties.endprice':hp,
    			'searchProperties.brand':brand,
            	"mhomeId ":queryUrlParam("mhomeId"),
            	"proId ":queryUrlParam("proId"),
            	"ticketId ":queryUrlParam("ticketId")
    	}
    	var pageCount = parseInt($("#total_page").val());
    	if(pageCount >1){
    		m_loadMore.reloadData(data);
    	}  
    	
    });
    //��Ʒ�б�չ�ַ�ʽ�л�
    $("#goods_list_type").click(function(){
   		if($(this).hasClass("goods_list_two")){//�л��ɵ�����ʾ
   			$(this).addClass("goods_list_single").removeClass("goods_list_two");
   			
   			//���ص������
   			ajax_comment();
   		}else{//�л���˫����ʾ
   			$(this).addClass("goods_list_two").removeClass("goods_list_single");
   			
   			//����˫�����
   			ajax_comment();
   		}   		
    });
    
    function ajax_comment(select){ 
    	var data = {
            	'pageNumber':1,
            	"type":queryUrlParam("type"),
            	"result":getResult(),
            	"orderby":select,
            	"mhomeId ":queryUrlParam("mhomeId"),
            	"proId ":queryUrlParam("proId")
            };
    	var pageCount = parseInt($("#total_page").val());
    	if(pageCount >1){
    		m_loadMore.reloadData(data);
    	}  
    }
    
    function getResult(){
    	var result = "";
    	if($("#goods_list_type").hasClass("goods_list_two")){
    		result = "sub_single";
    	}else if($("#goods_list_type").hasClass("goods_list_single")){
    		result = "sub_list";
    	}
    	
    	return result;
    }
});