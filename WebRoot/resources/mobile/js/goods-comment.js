(function($) {
    var view = {
    	el: $('.review_list ul'),
        pageindex: 1,//ҳ����
        init: function() {
        	//Ĭ�ϼ���
            this.getReviews(this.getType());
            //�Ŵ�ͼƬ
            this.el.on('click', '.pic_list img', this.enlargeImage);
            //��������
            this.el.on('click', 'li', this.toReview);
            //���ظ���
            $('.more').on('click', this.getMoreReviews);
            //��������tab�л�
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
            type = type || view.getType() || 1;//type ��ʾ���۵�����,1,2,3,4�ֱ��Ӧ�ĸ�����tab
            //����������Ⱦ
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