var category=['图书','童书','音像','女装','女鞋女包','内衣袜品','男装','男鞋男包','运动户外','孕婴童','童装童鞋','珠宝饰品','手表眼镜','家居日用','家具汽车','美妆个护','食品保健','手机数码','电脑办公','家用电器','宠物之家'];
$(function(){
	var id="cate_lev1_";
	var html="";
	for(var i=1;i<category.length;i++){
		html+="<a name='cate_lev1_'"+i+" dd_name='"+category[i]+"' rel="+i+">";
		if(i==0){
			html+="<li class=on'>"+category[i]+"</li></a>";
		}else{
			html+="<li>"+category[i]+"</li></a>";
		}
	}
	$(html).insertAfter("a[name=cate_lev1_0]");
	//$("#aaa").html(html);
});
