
ActionCollection.init(jQuery('.photo_box_new .btn_all .collection'));
ActionAsk.init(jQuery('.photo_box_new .btn_all .question'));
downloadPic.init('.photo_box_new .download');
//点击浏览按钮打开幻灯片
jQuery(".preview-box-one .slide").click(function(){	/*处理图集当前列表*/
	newPhotoBox.init(
		jQuery('.case_list ul li').eq(0).find('label').attr('data-id'),
		currentPage
	);
	return false; 
})

jQuery(".preview-box").click(function(){	/*处理图集当前列表*/
	/*newPhotoBox.init(
		jQuery(this).attr('data-id'),
		currentPage
	);*/
	return false; 
})
var newPhotoBox = {
	fistUrl:'',
	lastUrl:'',
	pid:0,
	p:0,
	k:0,
	i:0,
	clicking:0,
	show:0,
	download_status : 0,
	lastPage : 0,
	init:function(pid,p){
		var _this = this;
		jQuery('.photo_box_new').show();
		jQuery('.content_width').css('z-index',1002);
		_this.pid = pid;
		_this.p = p;
		_this.fistUrl = window.location.href;
		_this.closeBox();
		_this.bindEvent();

		for( var s = 0; s<arrayObj[_this.p]['user'].length; s++){
			if(_this.pid == arrayObj[_this.p]['user'][s]['id']){
				_this.i = s;
				_this.fillContent();
				return false;
			}
		}
	},
	closeBox:function(){
		var _this = this;
		jQuery('.photo_box_new .arrow_right').unbind('click'); //多次打开幻灯片会给按钮重复绑定click事件
		jQuery('.photo_box_new .arrow_left').unbind('click');
		jQuery('.photo_box_new .download').unbind('click');
		jQuery('#to_download_btn').unbind('click');
		jQuery('.photo_box_new .icon_close').click(function(){
			jQuery('.question_list').remove();
			jQuery('.photo_box_new').hide();
			jQuery('.content_width').css('z-index',1);
			_this.i == 0;
			window.history.replaceState({},_this.picId,_this.fistUrl);
		});
		jQuery('.question_list').remove();
		jQuery('.pic_list').html('');
		jQuery('.btn_all .case').remove();
	},
	btnEvent:function(){
		var _this = this;   
		jQuery('.btn_all .question').attr('data-id',arrayObj[_this.p]['user'][_this.i]['id']);
		jQuery('.btn_all .question a').html('提问('+arrayRightObj[_this.pid]['question_num']+')');
		jQuery('.btn_all .collection').attr({'data-id':arrayObj[_this.p]['user'][_this.i]['id'],'data-src':arrayRightObj[_this.pid]['simg']});
		jQuery('.btn_all .collection a').html('收藏('+arrayRightObj[_this.pid]['nb_image']+')'); 
		jQuery('.btn_all .download').attr('data-id',arrayObj[_this.p]['user'][_this.i]['id']); 
		jQuery('.btn_all .download a').html('下载('+arrayRightObj[_this.pid]['download']+')');  
		if(arrayObj[_this.p]['user'][_this.i].uploadtype == 0){
			if(jQuery('.btn_all .case').length > 0){
				return false;
			}
	        var str='<a class="case" target="_blank" href="'+arrayRightObj[_this.pid]['caseurl']+'">\
		                <em class="icon icon_case"></em>\
		                <span>查看套图</span>\
	            	</a>\
			       </div>';
			jQuery('.photo_box_new .btn_all').append(str);        
		}                 
	},
	loadMoreCasePic:function(){
		var _this = this;
		var str = '';
		jQuery('.pic_list').html('');
		var len = arrayObj[_this.p]['user'].length;
		if(len < 7 || (_this.i < 3 && len<7)){
			for(var i =0; i < len; i++)
			{
				str+='<img src='+arrayObj[_this.p]['user'][i]['img_url']+'>';	
			}
		}
		else if(len >= 7 && _this.i < 3){
			for(var i =0; i < 7; i++)
			{
				str+='<img src='+arrayObj[_this.p]['user'][i]['img_url']+'>';	
			}	
		}
		else if(len >= 7 && _this.i <len-3){
			for(var i =0; i < 7; i++)
			{
				str+='<img src='+arrayObj[_this.p]['user'][parseInt(_this.i)-3+i]['img_url']+'>';	
			}
		}
		else{
			for(var i =0; i < 7; i++)
			{
				str+='<img src='+arrayObj[_this.p]['user'][parseInt(len)-7+i]['img_url']+'>';	
			}
		}
		jQuery('.pic_list').append(str);
	},
	loadMorePhoto:function(){
		var _this = this;
		var str = '';
		var len = arrayObj[_this.p]['user'].length;
		if( _this.i < 3 && _this.p == 0){
			var m = len > 7 ? 7 : len;
			for(var i =0; i < m; i++)
			{
				str+='<img src='+arrayObj[_this.p]['user'][i]['img_url']+'>';	
			}
		}
		else if(_this.i <3 && _this.p != 0 && arrayObj[parseInt(_this.p)-1]){
			var prevLen = arrayObj[parseInt(_this.p)-1]['user'].length;
			for(var i =0; i < 3-_this.i; i++)
			{
				str+='<img src='+arrayObj[parseInt(_this.p)-1]['user'][ prevLen- i-1]['img_url']+'>';	
			}
			for(var k =0; k < _this.i+3; k++)
			{
				str+='<img src='+arrayObj[_this.p]['user'][parseInt(_this.i)+k]['img_url']+'>';	
			}
		}
		else if(_this.i <len-3)	{
			for(var i =0; i < 7; i++)
			{
				str+='<img src='+arrayObj[_this.p]['user'][parseInt(_this.i)-3+i]['img_url']+'>';	
			}
		}	
		else{
			if(_this.lastPage == 0){
				for(var i =0; i < len -_this.i+3; i++)
				{
					str+='<img src='+arrayObj[_this.p]['user'][parseInt(_this.i)-3+i]['img_url']+'>';
				}
				for(var k = 0; k< 7-(len - parseInt(_this.i)+3); k++){
					str+='<img src='+arrayObj[parseInt(_this.p)+1]['user'][k]['img_url']+'>';
				}	
			}
			else{
				for(var i =0; i < 7; i++)
				{
					str+='<img src='+arrayObj[_this.p]['user'][parseInt(_this.i)-6+i]['img_url']+'>';	
				}	
			}

		}
		_this.clicking = 0;
		jQuery('.pic_list').append(str);
	},
	questionList:function(){
		var _this = this;
		var len = arrayRightObj[_this.pid]['question_num'];
		if(arrayRightObj[_this.pid] && len != 0){
			var str='<ul class="question_list">';
			var questionLen = arrayRightObj[_this.pid]['questions']?arrayRightObj[_this.pid]['questions'].length : 0;
			if(questionLen == 0){
				jQuery('.reels_msg .questions').hide();
				return false;
			}
			for(var i = 0; i < questionLen; i++){
				str += '<li>\
                    <a class="detail" href="'+arrayRightObj[_this.pid]['questions'][i]['question_url']+'" target="_black">'+arrayRightObj[_this.pid]['questions'][i]['title']+'</a>\
                    <span class="reply">共'+arrayRightObj[_this.pid]['questions'][i]['comment_nums']+'个回复<em class="icon_arrow_right">&gt;</em></span>\
                </li>';
			}
            	str += '</ul>';
            jQuery('.reels_msg .questions').show();
            jq('.reels_msg .questions').append(str);	
		}
		else{
			jQuery('.reels_msg .questions').hide();
		}
	},
	loadSinglePicData:function(){
		var _this = this;
		if(arrayRightObj[_this.pid]){
			_this.btnEvent();
			if(jQuery('.question_list').length == 0 ){
				_this.questionList();
			}
		}
		else{
			jQuery.ajax({
				url: 'http://www.shejiben.com/piwigo/linggantujidata.php?a=3',
				type: 'POST', 
				data:{'col_id':collectionId,'img_id':_this.pid,'noimg':noimg,'type':'ThisData'}, 
				dataType: 'json', 
				beforeSend:function(){}, 
				success: function(result){
					if(result)
					{
						arrayRightObj[_this.pid]=result;
						_this.btnEvent();
						if(jQuery('.question_list').length == 0){
							_this.questionList();
							_this.ImitateScrolling('lbAnchors','shower');
						}
					}	
				}
			});
		}
	},
	nextPageData:function(){
		var _this = this;
		if(jQuery('#photo_box_new').length == 0){
			_this.loadMoreCasePic();
			_this.clicking = 0;
			return false;
		}
		if( _this.i > arrayObj[_this.p]['user'].length -5 || _this.i < 3){
			if(_this.i < arrayObj[_this.p]['user'].length -3 && _this.i > 2 ){
				_this.loading = 0;
				_this.clicking = 0;
				_this.loadMorePhoto();	
			}
			else if((!arrayObj[parseInt(_this.p+1)] && _this.i > arrayObj[_this.p]['user'].length -5 )||(!arrayObj[parseInt(_this.p-1)] &&_this.i < 3 && _this.p !=0 )){
				if(_this.loading == 1){
					return false;
				}
				_this.loading = 1;
				var pageid  = 0;
				if(_this.i < 3){
					pageid = (arrayObj[_this.p]['start']-1);
				}
				else if(_this.i > arrayObj[_this.p]['user'].length -5){
					pageid = (arrayObj[_this.p]['start']+1);
				}
				var typeStyle='caseData';
				jQuery.ajax({
					url: requireUrl+'?1',//在works_new.html页面定义
					type: 'POST', 
					data:{'page':pageid ,'userid':userid,'collectionId':collectionId,'times':time,'keyword':keyword,'nb_image_page':parseInt(nb_image_page),'type':typeStyle},
					dataType: 'json', 
					success: function(result){
						if(result!=0)
						{
							_this.lastPage = 0;
							_this.clicking = 0;
							_this.loading = 0;
							if(_this.i < 3){
								arrayObj[parseInt(_this.p)-1]=result;
								if(_this.i == 0){
									var len = arrayObj[parseInt(_this.p)-1]['user'].length;
									jQuery('.arrow_left').attr('data-id',arrayObj[parseInt(_this.p)-1]['user'][len-1]['id']).show();
								}	
							}
							else{
								arrayObj[parseInt(_this.p)+1]=result;
								jQuery('.arrow_right').attr('data-id',arrayObj[parseInt(_this.p)+1]['user'][0]['id']).show();	
							}
							if(_this.i >= arrayObj[_this.p]['user'].length -3 || _this.i < 3){
								_this.loadMorePhoto();	
							}
						}
					},
					error:function(){
						_this.loading = 0;
						_this.clicking = 0;
						_this.lastPage = 1;
						_this.loadMorePhoto();
					}
				});	
			}
			else{
				if(_this.i >= arrayObj[_this.p]['user'].length -3 || _this.i < 3){
					_this.loadMorePhoto();	
				}
				if(_this.i != arrayObj[_this.p]['user'].length -1){
					jQuery('.arrow_right').attr('data-id',arrayObj[_this.p]['user'][parseInt(_this.i)+1]['id']);	
				}
				else{
					jQuery('.arrow_right').attr('data-id',arrayObj[parseInt(_this.p)+1]['user'][0]['id']).show();	
				}
				_this.clicking = 0;
			}
		}
		else{
			_this.clicking = 0;
			jQuery('.arrow_left').attr('data-id',arrayObj[_this.p]['user'][parseInt(_this.i)-1]['id']).show();	
			jQuery('.arrow_right').attr('data-id',arrayObj[_this.p]['user'][parseInt(_this.i)+1]['id']).show();	
			_this.loadMorePhoto();
		}
	},
	fillContent:function(){
		var _this = this;
		jQuery('.pic_list').html('');
		jQuery('.reels_msg .msg .name em').remove();
		_this.nextPageData();
		_this.loadSinglePicData();//
		//给图片以及左右按钮赋值
		var len = arrayObj[_this.p]['user'].length;
		if(len == 1){
			jQuery('.arrow').hide();
		}
		else if( _this.i < len -1){

			if(_this.i == 0 && _this.p == 0){
				jQuery('.arrow_left').hide();
			}
			else if(_this.i == 0 && _this.p != 0 && arrayObj[parseInt(_this.p)-1]){
				jQuery('.arrow_left').attr('data-id',arrayObj[parseInt(_this.p)-1]['user'][len-1]['id']).show();
			}
			else if(_this.i == 0 && _this.p != 0 && !arrayObj[parseInt(_this.p)-1]){
				jQuery('.arrow_left').hide();
			}
			else{
				jQuery('.arrow_left').attr('data-id',arrayObj[_this.p]['user'][parseInt(_this.i)-1]['id']).show();	
			}
			jQuery('.arrow_right').attr('data-id',arrayObj[_this.p]['user'][parseInt(_this.i)+1]['id']).show();	
		}
		else if(_this.i == len -1){
			jQuery('.arrow_left').attr('data-id',arrayObj[_this.p]['user'][_this.i-1]['id']).show();	
			if(jQuery('#photo_box_new').length == 0){
				jQuery('.arrow_right').hide();		
			}
		}
		jQuery('#container_pic').attr('data-id',_this.pid);
		jQuery('#container_pic').html('<img src='+arrayObj[_this.p]['user'][_this.i]['img_url']+'>');
		// 用户信息填充
		jQuery('#user_head').attr({'href':'http://www.shejiben.com/'+arrayObj[_this.p]['user'][_this.i]['indentityCN']+'/'+arrayObj[_this.p]['user'][_this.i]['added_by']+'/','target':'_blank'});
		jQuery('#user_head').html('<img src='+arrayObj[_this.p]['user'][_this.i]['sHeadPhoto']+' id='+arrayObj[_this.p]['user'][_this.i]['added_by']+'>');
		jQuery('#user_name').html(arrayObj[_this.p]['user'][_this.i]['NICK']).attr({'href':'http://www.shejiben.com/'+arrayObj[_this.p]['user'][_this.i]['indentityCN']+'/'+arrayObj[_this.p]['user'][_this.i]['added_by']+'/','target':'_blank'});
		
		/*  所在地  
			暂时默认为暂未填写	
		*/
		if(!arrayObj[_this.p]['user'][_this.i]['shen'] ){
			var shen = '';
			var city = '';
		}
		else{
			var shen = arrayObj[_this.p]['user'][_this.i]['shen'].replace('省/市','');
			var city = arrayObj[_this.p]['user'][_this.i]['city'].replace('市/地区','');	
		}
		if(shen == ''){
			jQuery('.reels_msg .location #address').html('暂未填写');	
		}
		else{
			jQuery('.reels_msg .location #address').html(shen+' '+city);
		}

		if(arrayObj[_this.p]['user'][_this.i].indentityCN == 'yz'){
			jQuery('.reels_msg .column_name .title').html('用户分享');
			jQuery('.price .icon').removeClass('icon_price').addClass('icon_house');
			jQuery('.reels_msg .btn_reservation').html('申请设计').attr({'href':'http://www.shejiben.com/zb/','target':'_black'});
			jQuery('.reels_msg .btn_reservation').unbind('click');
			jQuery('.reels_msg .400_num').html('4006-808-509 转 9999');
			jQuery('.reels_msg .tel').append('<div class="notice"><p>找设计师？一个电话搞定！</p><span></span></div>')
			var oid = arrayObj[_this.p]['user'][_this.i]['oid'];
			if(oid == 0){
				jQuery('#price_datail').html('还没有买房子呢');
			}
			else if(oid == 1){
				jQuery('#price_datail').html('买了房子，还没有拿到钥匙');
			}
			else if(oid == 2){
				jQuery('#price_datail').html('装修刚开始');
			}
			else if(oid == 3){
				jQuery('#price_datail').html('装修进行了一半');
			}
			else if(oid == 4){
				jQuery('#price_datail').html('刚刚装修完');
			}
			else if(oid == 5){
				jQuery('#price_datail').html('刚刚搬进新家');
			}
			else if(oid == 6){
				jQuery('#price_datail').html('已经入住一年以上');
			}

		}
		else{
			/*  收费标准
				业主用户统一默认为还未买房呢
			*/
			var minPrice = parseInt(arrayObj[_this.p]['user'][_this.i]['min_price']);	
			var maxPrice = parseInt(arrayObj[_this.p]['user'][_this.i]['max_price']);	
			if((minPrice == 0 || minPrice == '') &&( maxPrice== 0  || minPrice == '')){
				jQuery('#price_datail').html('收费面议');
				jQuery('.price .icon').removeClass('icon_house').addClass('icon_price');
			}
			else if((minPrice == '' || minPrice == 0 ) || (maxPrice == '' || maxPrice == 0 )){
				jQuery('.price .icon').removeClass('icon_house').addClass('icon_price');
				jQuery('#price_datail').html((minPrice == '' || minPrice == 0 ) ? maxPrice : minPrice +'元/㎡');
			}
			else{
				jQuery('.price .icon').removeClass('icon_house').addClass('icon_price');
				jQuery('#price_datail').html(minPrice+'-'+maxPrice+'元/㎡');
			}	
			/*  预约按钮   
				合作设计师为找Ta设计 非合作设计师为申请设计
				业主用户为找申请设计，点击跳转到招标页 http://www.shejiben.com/zb/

				apply_status:4是认证用户，1或'0'为非认证用户
				ident:0为设计师认证，1为设计机构
				oodlevel: 4是精英，5是知名
			*/
			jQuery('.reels_msg .btn_reservation').removeAttr('href');
			if(arrayObj[_this.p]['user'][_this.i].goodlevel == 2 || arrayObj[_this.p]['user'][_this.i].goodlevel == 4 ||arrayObj[_this.p]['user'][_this.i].goodlevel == 5 ||arrayObj[_this.p]['user'][_this.i].goodlevel == 8){
				jQuery('.reels_msg .btn_reservation').html('找TA设计').attr('data-id',arrayObj[_this.p]['user'][_this.i]['added_by']);
			}
			else{
				jQuery('.reels_msg .btn_reservation').html('申请设计').attr('data-id',arrayObj[_this.p]['user'][_this.i]['added_by']);
			}
			//预约设计
			jQuery('.btn_reservation').bind('click',function() {
				var toid = parseInt(jQuery(this).attr('data-id'));
				free_yuyue.init(toid);
			});
			// 身份认证  
			jQuery('.reels_msg .name em').remove(); 
			if(arrayObj[_this.p]['user'][_this.i].apply_status == 4){
				if(arrayObj[_this.p]['user'][_this.i].ident == 0){
					jQuery('#user_name').after('<em class="icon_rz"></em>');	
				}
				else{
					jQuery('#user_name').after('<em class="icon_rz_qy"></em>');	
				}

			}
			if (arrayObj[_this.p]['user'][_this.i].goodlevel == 4) {
				jQuery('#user_name').after('<em class="icon_jy"></em>');
			} 
			else if (arrayObj[_this.p]['user'][_this.i].goodlevel == 5) {
				jQuery('#user_name').after('<em class="icon_zm"></em>');
			}	
			/*  原创作品or用户分享，400电话以及提示
				uploadtype: 0是设计师原创作品，1是用户（包含设计师以及业主）分享的作品
				extensionnum: 9999表示用户没有400电话，提示语为 “找设计师？一个电话搞定”
							  其他字符表示用户开通了400电话，提示语为'拨打电话就可以直接与设计师联系哦！'
							  业主用户没有400电话，统一默认9999			  
			*/
			if (arrayObj[_this.p]['user'][_this.i].uploadtype == 0) {
				jQuery('.reels_msg .column_name .title').html('原创作品');
			}
			else {
				jQuery('.reels_msg .column_name .title').html('用户分享');
			}	
			if(arrayObj[_this.p]['user'][_this.i].extensionnum==9999)
			{
				var notice400 = '找设计师？一个电话搞定！';
			}
			else
			{
				var notice400 = '拨打电话就可以直接与设计师联系哦！';
			}
			jQuery('.reels_msg .400_num').html('4006-808-509 转 '+arrayObj[_this.p]['user'][_this.i].extensionnum);
			jQuery('.reels_msg .tel').append('<div class="notice"><p>'+notice400+'</p><span></span></div>');
		}	
		_this.setContainerSize();
	},
	setContainerSize:function(){
		var _this = this;
		var winWidth = jQuery(window).width();
		var winHeight = jQuery(window).height();

		jQuery('.photo_box_new .reels_pic').css({'width':winWidth - 400+'px'});
		jQuery('.photo_box_new .reels_msg').css({'height':winHeight-100});
		var picHeight = 0;
		var picWidth = 0;
		jQuery('#container_pic img').load(function(){
	       picHeight = jQuery(this).height();
	       picWidth = jQuery(this).width();
	        if(picWidth > winWidth - 400){
	            picHeight = (winWidth - 400)*picHeight/picWidth;
	            picWidth = winWidth - 400;
	        }
	        if(picHeight > winHeight - 50){
		        picWidth = picWidth * (winHeight-50)/ picHeight;
		        picHeight= winHeight-50 ;    
	        } 
	        jQuery('#container_pic').css({'width':picWidth+'px',height:picHeight+'px','margin-top':(winHeight-50-picHeight)/2});
	        jQuery(this).css({'width':picWidth,'height':picHeight,'display':'block'});
		});
	},
	bindEvent:function(){
		var _this = this;
		var mark = 0;
		jQuery('.reels_pic').mouseover(function(event){
			if(arrayRightObj[_this.pid]){
				jQuery('.btn_all').show();
			}
			var len = arrayObj[_this.p]['user'].length;
			if(len == 1){
				jQuery('.arrow').hide();
				return false;
			}
			if(_this.i == 0 && _this.p == 0){
				jQuery('.arrow_left').hide();
				jQuery('.arrow_right').show();
			}
			else if(_this.i == 0 &&_this.p !=0 && !arrayObj[parseInt(_this.p)-1]){
				jQuery('.arrow_left').hide();
			}
			else if(_this.i == len -1 && jQuery('#photo_box_new').length == 0 ){
				jQuery('.arrow_left').show();
				jQuery('.arrow_right').hide();
			}
			else if(_this.i == len -1 && !arrayObj[parseInt(_this.p)+1] ){
				jQuery('.arrow_left').show();
				jQuery('.arrow_right').hide();
			}
			else{
				jQuery('.arrow').show();
			}
		});
		jQuery('.reels_pic').mouseout(function(event){
			jQuery('.btn_all').hide();
		});
		jQuery('.reels_msg').mouseover(function(){
			jQuery('.btn_all , .arrow').hide();
		});
		jQuery('.photo_box_new .arrow_right').bind('click',function(){
			if(_this.clicking == 1){
				return false;
			}
			_this.clicking = 1;
			jQuery('.btn_all').hide();
			jQuery(' .btn_all .case').remove();
			jQuery(' .question_list').remove();
			_this.i ++;
			if(jQuery('#photo_box_new').length > 0){
				if(_this.i > arrayObj[_this.p]['user'].length-1){
					_this.p ++;
					_this.i = 0;	
				}
			}
			else{
				if(_this.i == arrayObj[_this.p]['user'].length-1){
					jQuery(this).hide();
				}
			};
			_this.pid = jq(this).attr('data-id');
			_this.fillContent();

			//地址栏赋值
			var idUrl = _this.pid < 852000 ? _this.pid +'/' : _this.pid +'.html';
			window.history.replaceState({},_this.pid,'/works/'+idUrl);
			jQuery('.photo_box_new .cur_url').attr('href','/works/'+idUrl).html('http://www.shejiben.com/works/'+idUrl);
		});
		jQuery('.photo_box_new .arrow_left').bind('click',function(){
			if(_this.clicking == 1){
				return false;
			}
			if(_this.i < 3 && !arrayObj[parseInt(_this.p)-1]){
				jQuery('arrow_left').hide();
			}
			else{ 
				jQuery('arrow_left').show();
			}
			_this.clicking = 1;
			jQuery(' .btn_all .case').remove();
			jQuery('.btn_all').hide();
			jQuery('.question_list').remove();
			_this.pid = jq(this).attr('data-id');
			_this.i --;
			if(_this.i < 0){
				_this.p --;
				_this.i = 47;
			}
			_this.fillContent();
			//地址栏赋值
			var idUrl = _this.pid < 852000 ? _this.pid +'/' : _this.pid +'.html';
			window.history.replaceState({},_this.pid,'/works/'+idUrl);
			jQuery('.photo_box_new .cur_url').attr('href','/works/'+idUrl).html('http://www.shejiben.com/works/'+idUrl);
		});


	},
	ImitateScrolling:function(container, shower){
		var now_wheel = null;  
		var scroller = function(a){
		    var self = this;  
		    var timer;  
		    this.container = document.getElementById(container); // 容器  
		    this.shower = document.getElementById(shower); // 显示的内容  
		    this.scroller = document.getElementById("scroller"); // 滚动条容器  
		    this.scroll_up = document.getElementById("scroll_up"); // 上翻按钮  
		    this.scroll_down = document.getElementById("scroll_down"); // 下翻按钮  
		    this.scroll_bar = document.getElementById("scroll_bar"); // 滑动块  
		    this.clearselect = window.getSelection ? function(){ window.getSelection().removeAllRanges(); } : function(){ document.selection.empty(); }; 
		    self.shower.style.top = 0;
		    if(self.shower.offsetHeight > self.container.offsetHeight){
		    	this.scroll_bar.style.display = 'block';
			    this.is_bottom = function(){ // 检测是不是位于底部了  
			        if (self.shower.offsetTop <= self.container.offsetHeight-self.shower.offsetHeight){  
			            return true;  
			        }  
			        return false;  
			    }  
			    this.resetright = function(){  
			        var a = self.shower.offsetTop / (self.shower.offsetHeight - self.container.offsetHeight);  
			        var b = self.scroller.offsetHeight - self.scroll_down.offsetHeight - self.scroll_bar.offsetHeight - self.scroll_up.offsetHeight;  
			        var c = self.scroll_up.offsetHeight + (0 - b * a);  
			        self.scroll_bar.style.top = c + "px";  
			    }  
			    this.resetleft = function(){  
			        var a = (self.scroll_bar.offsetTop - self.scroll_up.offsetHeight) / (self.scroller.offsetHeight - self.scroll_up.offsetHeight - self.scroll_down.offsetHeight - self.scroll_bar.offsetHeight);  
			        var b = self.shower.offsetHeight - self.container.offsetHeight;  
			        var c = 0 - (b * a);  
			        self.shower.style.top = c + "px";  
			    }  
			    this.move=function(a){  
			        if (self.shower.offsetTop+a <= 0 && self.shower.offsetTop+a >= self.container.offsetHeight-self.shower.offsetHeight){  
			            self.shower.style.top = (self.shower.offsetTop+a)+"px";  
			        }else if (self.shower.offsetTop+a > 0){  
			            self.shower.style.top = 0+"px";  
			        }else if (self.shower.offsetTop+a < self.container.offsetHeight-self.shower.offsetHeight){  
			            self.shower.style.top = self.container.offsetHeight-self.shower.offsetHeight+"px";  
			        }  
			        self.resetright();  
			    }  
			    this.upper = function(){  
			        self.clear();  
			        timer = window.setInterval(function(){self.move(2);}, 5);  
			    }  
			    this.downer = function(){  
			        self.clear();  
			        timer = window.setInterval(function(){self.move(-2);}, 5);  
			    }  
			    this.clear = function(){  
			        window.clearInterval(timer);  
			    }  
			    this.test_bar = function(){  
			        if (self.container.offsetHeight < self.shower.offsetHeight){  
			            self.scroller.style.display = "block";  
			        }else {  
			            self.scroller.style.display = "none";  
			        }  
			    }  
			    this.gotobottom = function(){  
			        var a = (self.shower.offsetHeight > self.container.offsetHeight) ? self.container.offsetHeight - self.shower.offsetHeight : 0;  
			        self.shower.style.top = a + "px";  
			        self.test_bar();  
			        self.resetright();  
			    }  
			    this.wheel = function(){  
			    	if(self.shower.offsetHeight < self.container.offsetHeight){
			    		return false;
			    	}
			        if (now_wheel == null) now_wheel =a;  
			        if (now_wheel == a){  
			            var e=arguments[0]||window.event;  
			            var act = e.wheelDelta ? e.wheelDelta/120 : (0 -e.detail/3);  
			            self.clear();  
			            self.move(80*act);  
			            try{ e.preventDefault();}  
			            catch(e){}  
			        }  
			        window.setTimeout(function(){self.end_wheel();}, 1);  
			        return false;  
			    }  
			    this.end_wheel = function(){  
			        now_wheel = null;  
			    }  
			    this.barmove = function(){  
			        // 记录当时鼠标的位置与  
			        self.clearselect;  
			        var mover = this;  
			        this.can_move_top = self.scroll_bar.offsetTop - self.scroll_up.offsetHeight; // 这个滚动条上方的可移动距离  
			        this.can_move_bottom = self.scroller.offsetHeight - self.scroll_bar.offsetTop - self.scroll_down.offsetHeight - self.scroll_bar.offsetHeight; // 这个滚动条下方的可移动距离  
			        this.e=arguments[0]||window.event;  
			        this.starts = this.e.clientY;  
			        this.starttop = self.scroll_bar.offsetTop;  
			        this.drag = function(){  
			            this.e=arguments[0]||window.event;  
			            this.ends = this.e.clientY;  
			            this.dis = this.ends - mover.starts;  
			            if (this.dis < (0-mover.can_move_top)) this.dis = 0-mover.can_move_top;  
			            if (this.dis > mover.can_move_bottom) this.dis = mover.can_move_bottom;  
			            self.scroll_bar.style.top = (mover.starttop + this.dis) + "px";  
			            self.resetleft();  
			            self.clearselect;  
			        }  
			        this.cleardrag = function(){  
			            if (window.removeEventListener){  
			                document.removeEventListener("mousemove", mover.drag, true);  
			            }else {  
			                document.detachEvent("onmousemove", mover.drag);  
			            }  
			            self.clearselect;  
			        }  
			        this.add_listener = function(){  
			            if (window.addEventListener){  
			                document.addEventListener("mousemove", mover.drag, true);  
			                document.addEventListener("mouseup", mover.cleardrag, true);  
			            }else {  
			                document.attachEvent("onmousemove", mover.drag);  
			                document.attachEvent("onmouseup", mover.cleardrag);  
			            }  
			        }  
			        this.add_listener();  
			    }  
			    this.outbar = function(){  
			        var e=arguments[0]||window.event;  
			        var obj = e.srcElement ? e.srcElement : e.target;  
			        if (obj.id == self.scroller.id){  
			            var y = e.offsetY || e.layerY;  
			            var new_top = y - 0.5 * self.scroll_bar.offsetHeight;  
			            if (y - self.scroll_up.offsetHeight < 0.5 * self.scroll_bar.offsetHeight) new_top = self.scroll_up.offsetHeight;  
			            if (self.scroller.offsetHeight - y - self.scroll_down.offsetHeight < 0.5 * self.scroll_bar.offsetHeight) new_top = self.scroller.offsetHeight - self.scroll_down.offsetHeight - self.scroll_bar.offsetHeight;  
			            self.scroll_bar.style.top = new_top + "px";  
			            self.resetleft();  
			        }  
			    }  
			    this.scroll_bar.ondrag=function(){return false;}  
			    this.scroll_bar.oncontextmenu=function(){return false;}   
			    this.scroll_bar.onselectstart=function(){return false;}  
			    this.stop = function () {return false;}
			    if (window.addEventListener){  
			        this.scroll_up.addEventListener("mousedown", this.upper, false);  
			        this.scroll_down.addEventListener("mousedown", this.downer, false);  
			        this.scroll_bar.addEventListener("mousedown", this.barmove, false);  
			        this.scroller.addEventListener("mousedown", this.outbar, false);  
			        this.container.parentNode.addEventListener("DOMMouseScroll", this.wheel, false);  
			        this.container.parentNode.addEventListener("mousewheel", this.wheel, false);  
			        document.addEventListener("mouseup", this.clear, false);  
			    }else {  
			        this.scroll_up.attachEvent("onmousedown", this.upper);  
			        this.scroll_down.attachEvent("onmousedown", this.downer);  
			        this.scroll_bar.attachEvent("onmousedown", this.barmove);  
			        this.scroller.attachEvent("onmousedown", this.outbar);  
			        this.container.parentNode.attachEvent("onmousewheel", this.wheel);  
			        document.attachEvent("onmouseup", this.clear);  
			        try{ window.event.cancelBubble=true;}  
			        catch(e){}  
			    }  
		    }else {
		    	this.scroll_bar.style.display = 'none';
		    }
		}  
		var te = new scroller();  
	}


}