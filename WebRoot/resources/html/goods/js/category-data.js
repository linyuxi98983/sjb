var category=['ͼ��','ͯ��','����','Ůװ','ŮЬŮ��','������Ʒ','��װ','��Ь�а�','�˶�����','��Ӥͯ','ͯװͯЬ','�鱦��Ʒ','�ֱ��۾�','�Ҿ�����','�Ҿ�����','��ױ����','ʳƷ����','�ֻ�����','���԰칫','���õ���','����֮��'];
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
