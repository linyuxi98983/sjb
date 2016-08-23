(function($) {
    var view = {
    	el: $('.review_list ul'),
        pageindex: 1,//页码数
        init: function() {
        	//默认加载
            this.getReviews(this.getType());
            //放大图片
            this.el.on('click', '.pic_list img', this.enlargeImage);
            //评论详情
            this.el.on('click', 'li', this.toReview);
            //加载更多
            $('.more').on('click', this.getMoreReviews);
            //评论类型tab切换
            $(window).on('hashchange',this.changeType );
        },
        changeType: function() {
            view.pageindex = 1;
            view.getReviews(view.getType());
        },
        getType: function() {
            var type = window.location.hash;
            type = type ? parseInt(type.substr(1)) : 1;
            $('#type_' + type).addClass('on').siblings().removeClass('on');
            return type;
        },
        getMoreReviews: function() {
            view.pageindex++;
            view.getReviews();
        },
        getReviews: function(type) {
            $('.more').hide();
            $('.load').show();
            type = type || view.getType() || 1;//type 表示评论的类型,1,2,3,4分别对应四个评论tab
            //加载数据渲染
            //$('.review_list ul').append("dsa;fljkdsla;fjldsajfdsa;lfjdsa;ljfkjsa;dfjkdlsajfjsal;dfjds;lajflksa;jd;j;lj;lkjlj");
           
            if(view.pageindex > 1){
            	$.ajax({
   	             type: "GET",
   	             url: "../../mobile/goods/goods!subcomment.action",
   	             dataType: "html",
   	             success: function(data){
   	             
   	             	$("section.review_list").append(data);
   	                      }
   	                      
   	         });
            }
            $('.load').hide();
            $('.more').show();
        },
        toReview: function(e) {
            var url = $(this).children('input').val();
            e.target.tagName !== 'IMG' && (window.location.href = url);
            return false;
        }
    };
    view.init();
})(Zepto);