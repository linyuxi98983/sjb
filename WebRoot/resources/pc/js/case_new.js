/**
 * 新版案例内页JS
 */

//这个方法是iframe 中调用的
function ajax_send_sixin(id, content) {
	if (id != '' && content != '') {
		jQuery.ajax({
			url: 'http://www.shejiben.com/pms.php?act=ajaxSend',
			type: 'post',
			data: 'toid=' + id + '&msg=' + content,
			dataType: 'json',
			success: function(data) {
				if (data != 'undefined' && data.code == 1) {
					jQuery.colorbox({
						iframe: true,
						href: "http://www.shejiben.com/my/message.php?act=success&msg=恭喜，发送成功啦！",
						opacity: "0.5",
						height: "100",
						width: "230"
					});
				} 
				else {
					jQuery.colorbox({
						iframe: true,
						href: "http://www.shejiben.com/my/message.php?act=error&msg=" + data.msg,
						opacity: "0.5",
						height: "100",
						width: "230"
					});
				}
			}
		})
	}
}

(function() {

	jQuery(".preview-box").each(function(){
		
		jQuery(this).on("click",function(){
			
			
			layer.open({
			    type: 2,
			    //skin: 'layui-layer-lan',
			    title: '图片库',
			    fix: false,
			    shadeClose: true,
			    maxmin: true,
			    area: ['800px', '800px'],
			   	content:jQuery(this).attr("src")
			  });
		})
	});
	
	jQuery(".preview-box-x").each(function(){
		
		jQuery(this).on("click",function(){
			
			layer.photos({
			    photos: '#imgContent'
			  });
		})
	});
	var topAd = jQuery('#top_add').length ? jQuery('#top_add').height() : 0, //广告图的高度
		bannerTop = jQuery('#sjbNewTop').height(), //头部导航的高度
		menuTop = jQuery('#head_menubar').height(), //导航栏的高度
		scrollMax = topAd + bannerTop + menuTop, //滚动条高度超过这个值触发事件
		scrollBanner = jQuery('#scrollAuthorInfo'),
		positionX = jQuery('.content_width ')[0].offsetLeft + jQuery('.content_width ')[0].offsetWidth + 15;
	domain = document.domain;

	function setDomain(_domain) {
		try {
			document.domain = _domain;
		} catch (e) {
			throw new Error('error domain string');
		}
	}

	function revertDomain() {
		document.domain = domain;
	}

	var backToTop = {

		showBtn: function() {
			jQuery('#backToTopBtn').show();
		},
		hideBtn: function() {
			jQuery('#backToTopBtn').hide();
		},

		toTop: function() {
			jQuery(document).scrollTop(0);
		}

	}

	/**
	 * 发私信方法
	 */
	function sendPrivateMsg(fromid, sendid) {
		if (!to8to_uid) {
			document.domain = 'shejiben.com';
			showSingleLogin(2, 2);
			return false;
		} else if (fromid == sendid) {
			alert('不能给自己发私信！');
			return false;
		}
		setDomain('shejiben.com');
		jQuery.colorbox({
			iframe: true,
			title: '发私信',
			href: "http://www.shejiben.com/my/message.php?act=send&uid=" + sendid,
			opacity: "0.5",
			height: "190",
			width: "430",
			onClosed: function() {
				parent.revertDomain();
			}
		});
	}

	function Attention(obj, followtype, gzvid, rel, url, nick, sclass, callback) {
		var followUrl = '/sjs/index.php';
		if (!to8to_uid) {
			showSingleLogin(2, 1);
			return false;
		} else if (to8to_uid == gzvid) {
			alert('不能关注自己');
			return false;
		}
		jQuery.post(followUrl, {
			'gzvid': gzvid,
			'gztype': followtype,
			'rel': rel,
			'url': url,
			'name': nick
		}, function(data) {
			if (typeof callback === 'function') {
				callback(data, followtype);
			}
		});
	}

	function initFollowStatus(blog_uid) {
		if (!to8to_uid) {
			return false;
		}
		var url = '/sjs/' + blog_uid + '/';
		jq.ajax({
			url: url,
			type: 'POST',
			dataType: 'json',
			data: 'followid=' + blog_uid,
			success: function(data) {
				if (data == undefined || data.code == '1000') {
					showSingleLogin(2, 1);
					return false;
				} else {
					jq('#followStatus').text(data.msg);
				}
			}
		});
	}


	//这个页面不需要使导航处于顶部,所以取消了滚动事件
	window.onscroll = function() {
		return false;
	}

	jQuery(document).scroll(function() {
		var _scrllTop = jQuery(document).scrollTop();
		if (_scrllTop >= scrollMax) {
			scrollBanner.show();
			backToTop.showBtn();
		} else {
			scrollBanner.hide();
			backToTop.hideBtn();
		}
	});

	jQuery(document).ready(function() {
		//博客用户id
		var blogUid = parseInt(jQuery('#blogUid').val());
		jQuery('#sendMsg').bind('click', function() {
			sendPrivateMsg(to8to_uid, parseInt(jQuery(this).attr('data-uid')));
		});

		//设置返回顶部按钮的相对网页左边的偏移位置

		jQuery('#backToTopBtn').css('left', positionX + 'px');

		jQuery('#backToTopBtn').bind('click', function() {
			backToTop.toTop();
		});

		//点击预约
		jQuery('.reservation').bind('click', function() {
			var sendId = parseInt(jQuery(this).attr('data-id'));
			free_yuyue.init(sendId);
		});

		initFollowStatus(blogUid);

		jQuery('#addFollow').hover(function() {
			if (jQuery('#followStatus').text() == '已关注') {
				jQuery('#followStatus').text('取消关注');
			}
		}, function() {
			if (jQuery('#followStatus').text() == '取消关注') {
				jQuery('#followStatus').text('已关注');
			}
		});

		jQuery('#addFollow').bind('click', function() {
			var url = jQuery(this).attr('data-url'),
				nick = jQuery(this).attr('data-nick'),
				gzuid = jQuery(this).attr('data-id');
			gztype = jQuery('#followStatus').text() == '取消关注' ? 2 : 1,
			self = this;
			Attention(this, gztype, gzuid, 0, url, nick, '', function(data, type) {
				if (type == '1') {
					jQuery('#followStatus').html('已关注');
				} else {
					jQuery('#followStatus').html('加关注');
				}
			});
		});

		jQuery('.caseImgList').bind('mouseover', function() {
			//收藏和提问
			//	jQuery(this).find('.wraps').show();
		}).bind('mouseout', function() {
			jQuery(this).find('.wraps').hide();
		});

		ActionCollection.init(jQuery('.addCollection-detail'), 5);
		ActionAsk.init(jQuery('.addQuestion-detail'));

	});

	window.ActionAsk = ActionAsk;
	window.ActionCollection = ActionCollection;
   initHeight();
})();


function initHeight(){
    var _height = jQuery('.caseInfo').height();
    var w_height = jQuery(window).height();
    if(_height < w_height){
        jQuery('.authorInfo_new_outside').css('height',(w_height-320)+'px');
    }
    else{
        jQuery('.authorInfo_new_outside').css('height',(_height-40)+'px');
    }

}

jQuery(window).scroll(function() {
    scrollWindow();
    initHeight();
});

function scrollWindow(){
	var scrollTop = jQuery(document).scrollTop();
    var documentW =  jQuery(document).height();
    if (scrollTop >= 260) {
        if((scrollTop + 770) > documentW){
                jQuery('.authorInfo_new').css({'bottom':'40px'});
                jQuery('.authorInfo_new').css({'top':'auto'});
            
        }else{
            var targetTop = scrollTop - 200, adTop = 0;
            if (jq('#top_add').length) {
                adTop = jq('#top_add')[0].clientHeight;
            }
            targetTop -= adTop;
            jQuery('.authorInfo_new').css({'top': targetTop+'px'});
        }
    }
    else {
        jQuery('.authorInfo_new').css({'top':'0'});
    }
}

/*******案例加收藏和评论*******/
/***kiki添加于20151229***/
//左侧分享的添加
    function imgShare(){
        var img_share = '<div class="img_share">'
                            +'<div class="share_top">'
                                +'<a href="javascript:void(0)" class="a_01" id="oneclick"><i></i><em>'+0+'</em></a>'
                                +'<a href="javascript:void(0)" class="a_02" id="toImgComment"><i></i><em>'+0+'</em></a>'
                            +'</div>'
                        +'</div>';
        jQuery('body').append(img_share);
    }
    //左边分享等的定位
    function shareColumnMark() {
        var topAd = 0;
        topAd = jQuery('#top_add').is(':visible')?jQuery('#top_add').height():0;
        var winWidth = jQuery(window).width();
        var sHeight = jQuery(".img_share").height();
        var sWidth = jQuery(".img_share").width();
        var tWidth = (winWidth-990)/2;
        var imgTop = topAd+206;
        if(tWidth > sWidth){
            jQuery(".img_share").css({'left':(tWidth-sWidth-12)+'px','top':imgTop});
        }
        else{
            jQuery(".img_share").css({'left':0,'top':imgTop});
        }
    }
    //调整窗口的大小时，重置工具栏的定位
    jQuery(window).resize(function(){
        shareColumnMark();
    });

    // 提交按钮可点与不可点,键盘输入提示文字隐藏
     jQuery(".input_text").bind('keydown keyup change', function() {
        jQuery(this).prev('label').hide();
        if(!jQuery(this).val()==''){
            jQuery(this).next('.com_div .sub_btn').removeAttr("disabled").css("background","#dd4f50");
        }
        else{
            jQuery(this).next('.com_div .sub_btn').attr("disabled","disabled").css("background","#f79b9c");
        }
    });
    jQuery(".input_text").blur(function(){
    	
        if(jQuery(this).val()==''){
            jQuery(this).prev('label').show();
        }
    });
      //点击回复出现回复框
      jQuery(".com_div01").hide();
      jQuery(".com_reply").click(function(){
            if(jQuery(this).next(".com_div01").is(':hidden')){
                jQuery(this).next(".com_div01").show();
                jQuery(this).parents('li').siblings().find('.com_div01').hide();
            }else{
                jQuery(this).next(".com_div01").hide();
            }   
      })
      //点击回复框边框变红
      jQuery(".input_text,.def_value").click(function(){
    	 	
            if(!log_uid){
                showSingleLogin(2,2);
            }else{
                jQuery(this).parents(".com_div").css("border-color","#dd4f50");
            }
    	
      })
      jQuery(".input_text").blur(function(){
            jQuery(this).parents(".com_div").css("border-color","#e3e3e3");
      })
      //点击默认文字时输入框获得焦点
        jQuery('.def_value').click(function(){
            if(jQuery(this).length < 1){
                return false;
            }
            jQuery(this).next('.input_text').focus();
        });


//文字长度
var checkLength = function(strTemp) {
    var i,sum;
    sum = 0;
    for (i = 0; i < strTemp.length; i++) {
        if ((strTemp.charCodeAt(i) >= 0) && (strTemp.charCodeAt(i) <= 255)) {
            sum = sum + 1
        } else {
            sum = sum + 2
        }
    }
    return sum
};
//对博文进行评论
jQuery('.send_comment_btn_post').click(function() {
	
	
	// alert(getRootPath())
	  
	jQuery.ajax({
		url:getRootPath()+'/pc/eva/eva!save.action',
		method:'post',
		data:{
			"entity.content":jQuery("#comment_input").val(),
			"entity.ltSpMemberId":jQuery("#memberId").val(),
			"entity.parentId":jQuery("#caseId").val(),
			"entity.objectId":jQuery("#caseId").val(),
			"result":"json"
		},
		dataType:"json",
		success:function(data){
			if(data.success){
				layer.alert("提交评论成功！");
				jQuery("#comment_input").val("");
			}
		},
		error:function(){
			alert("error");
		}
	});
})

//对博文评论进行回复
jQuery('.send_reply_btn').click(function(){
    var uid = whoid;
    var to8to_uid = log_uid;
    var reply_content=jQuery(this).prev('#reply_337').val();
    var obj=jQuery(this);
    var cid = jQuery(this).prev('#reply_337').attr('data-cid');
    if (jQuery.trim(reply_content) == '') {
        alert('回复内容不能为空！');
        jQuery(this).prev('#reply_337').focus();
        return false;
    }
    else if (reply_content.length > 500)
    {
        alert('对不起输入内容必需小于500字符!');
        return false;
    }
    if (!to8to_uid)
    {
        document.domain = 'shejiben.com';
        showSingleLogin(2,2);
        return false;
    }
    var url = "/sys_php/reply_new.php";
    jQuery.post(url, {
            'editor_content': reply_content,
            'source': 'case_comment',
            'uid': uid,
            'type': 25,
            'oid': lid,
            'f_replyid': cid
        },
        function(data)
        {
            obj.css('background','rgb(247, 155, 156)');
            if (data.errorCode == 0)
            {
                alert('发布成功！请等待审核。');
                obj.prev('#reply_337').val('').blur();
                jQuery('.sub_btn').attr("disabled","disabled").css("background","#f79b9c")
                return false
            }
            else
            {
                alert(data.errorMessage);
            }
        },'json')
});

  //案例收藏
jQuery(document).ready(function(){
    jQuery('#oneclick').click(function(){
        if (!log_uid)
        {
            document.domain = 'shejiben.com';
            showSingleLogin(2,2);
            return false;
        }
        var url = "/sys_php/reply_new.php";
        jQuery.post(url, {
                'source': 'case_sc',
                'type': type,
                'oid': lid
            },
            function(data)
            {
                if (data.success == 1)   //收藏成功
                {
                    jQuery('#oneclick > em').html(data.errorMessage);
                    confirmPop('收藏成功！');
                    showCollectPop();
                    return false;
                }
                else if(data.errorCode == 2)   //已收藏
                {
                    jQuery('#oneclick > em').html(data.errorMessage);
                    confirmPop('您已收藏过该案例了!');
                    showCollectPop();
                    return false;
                }else{
                    alert(data.msg);
                }
            },'json')
    });

    jQuery('.btn_red,#cboxClose').live('click',function(){
        jQuery('.container_popup').remove();
        jQuery.colorbox.close();
    })
    
    function confirmPop(str){
        str=str?str:'收藏成功！';
        var confirmPop =  " <div class='container_popup' id='container_popup' >\
                                <div class='contents'>\
                                    <p class='tips_b'>"+str+"</p>\
                                    <p class='tips_s'>您可以到“个人中心-我的收藏”查看</p>\
                                    <div class='btn'>\
                                        <input type='button' class='btn_red' value='确定''>\
                                    </div>\
                                </div>\
                            </div>"
        jQuery('body').append(confirmPop);
        
    }
    function showCollectPop(){
        jQuery.colorbox({
            inline: true,
            width:520,
            height:200,
            title:"收藏案例",
            opacity: "0.7",
            overlayClose : false,
            href: '#container_popup',
            onComplete: function() {
                initColorboxCss();
                jQuery('.tips_b').css('marginTop','32px');
            }
            
        })
    }
});

