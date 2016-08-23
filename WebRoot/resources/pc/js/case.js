/**
 * 
 */
define(function (require, exports, module) {
		var UI = require('ui');
		var LazyObj = UI.lazyLoad($('img'));

		function showUserInfoFrame(obj, uid) {
		uid = parseInt(uid);
		this.timer = 0;
		var self = this;
		var url = 'http://www.shejiben.com/getuserdata.php?s=1&pos=showUserInfo',
			template = '',
			headphoto = '';
		$.post(url, {'uid' : uid}, function(msg) {
			try {
				msg = $.parseJSON(msg);	
			} catch (e) {
				throw new Error('error json string');
				return false;
			}
			if (typeof msg === 'object' && msg.id) {
				var val = msg;
				headphoto = val.headphoto.replace('_d', '');
				template += '<div class="userInfoFrame" id="userInfoFrame">'+
								'<div class="middleFrame">'+
									'<div class="headphoto float_l">'+
										'<img src="'+val.headphoto+'" alt="" width="100" height="100" id="headphoto" />'+
									'</div>'+
									'<div class="userProperty">'+
										'<ul>'+
											'<li class="userName">设计师：<a href="/sjs/'+val.id+'/" target="_blank">'+val.truename+'</li>'+
											'<li class="userMedal">';
				if(val.goodlevel == '2' || val.goodlevel == '4' || val.goodlevel == '5' || val.goodlevel == '8' ){
                    var sheji_strs = '找TA设计';
				}else{
					var sheji_strs = '申请设计';
				}


				if (val.apply_status == '4') {
					if (val.ident == '1') {
						template += '<span class="medal qy_vip" title="企业身份认证"></span>';
					}else{
						template += '<span class="medal vip" title="个人身份认证"></span>';
					}
				}
				if (val.goodlevel == '5') {
					template += '<span class="medal fam" title="行业知名设计师"></span>';
				}
				if (val.goodlevel == '4') {
					template += '<span class="medal elite" title="行业精英设计师"></span>';
				}
				if (val.goodlevel == '2') {
					template += '<span class="medal xinrui" title="行业新锐设计师"></span>';
				}
				var followStatus = val.follow == '0' ? '关注' : '已关注';
				template += '<p class="clear"></p>'+
											'</li>'+
											'<li class="designPrice">设计费用：<span>'+val.price_range+'</span></li>'+
											'<li class="place">所在地：'+val.city+'</li>'+
										'</ul>'+
									'</div>'+
									'<p class="clear"></p>'+
									'<div class="buttons">'+
										'<a href="javascript:;" class="reserveBtn reservation" data-id="'+val.id+'">'+sheji_strs+'</a>';
				// 如果是自己就不再增加关注/取消关注操作
				if(SJB.GLOBAL_VAR.to8to_uid != uid){
					template += '<a href="javascript:;" data-id="'+val.id+'" data-nick="'+val.truename+'" data-url="'+val.homepage+'" data-follow="'+val.follow+'" class="followBtn"><span>+</span>'+followStatus+'</a>';	
				}						
				template +=	'</div>'+
								'</div>'+
								'<div class="sharp"></div>'+
							'</div>';													
				if ($('#userInfoFrame').length) {
					$('#userInfoFrame').remove();
				}
				$(obj).parents('.caseAuthor').append(template);
				//设置偏移位置
				$('#userInfoFrame').css({'left':0 + 'px', 'top':-185 + 'px'});
				clearTimeout(self.timer);
				$(obj).unbind('mouseout');
				$('#userInfoFrame').unbind('mouseover').unbind('mouseout');
				$(obj).bind('mouseout', function() {
					self.timer = setTimeout(function() {
						$('#userInfoFrame').remove();
					}, 300);
				});

				$('#userInfoFrame').bind('mouseover', function() {
					clearTimeout(self.timer);
				}).bind('mouseout', function() {
					self.timer = setTimeout(function() {
						$('#userInfoFrame').remove();
					}, 300);
				});
			}
		});
	}

	function Attention(obj, followtype, gzvid, rel, url, nick, sclass ,callback) {
        var followUrl = '/sjs/index.php';
        if (!SJB.GLOBAL_VAR.to8to_uid) {
        	document.domain = 'shejiben.com';
            SJB.showSingleLogin(2, 2);
            return false;
        } else if (SJB.GLOBAL_VAR.to8to_uid == gzvid) {
            alert('不能关注自己');
            return false;
        }
        $.post(followUrl,{'gzvid': gzvid, 'gztype': followtype, 'rel': rel, 'url' : url, 'name' : nick },function(data) {
            if (typeof callback === 'function') {
                callback(data, followtype);
            }
        });
    }
		$(document).ready(function() {
			$('.showUser').bind('mouseover', function() {
				var uid = $(this).attr('data-id');
				showUserInfoFrame(this, uid);
			});

		//点击预约
		jQuery('.reservation').live('click', function() {
			var toid = parseInt(jQuery(this).attr('data-id'));
			SJB.free_yuyue.init(toid);
		});

		jQuery('.followBtn').live('click', function() {
			var url = jQuery(this).attr('data-url'),
                nick = jQuery(this).attr('data-nick'),
                follow = jQuery(this).attr('data-follow'),
                gzuid = jQuery(this).attr('data-id');
                gztype = follow == 0 ? 1 : 2,
                self = this;
            	Attention(this,gztype, gzuid, 0, url, nick, '' ,function(data, type) {
            	if (type == '1') {
            		jQuery(self).html('<span>+</span>已关注');
            		jQuery(self).attr('data-follow', 1);
            	} else {
            		jQuery(self).html('<span>+</span>关注');
            		jQuery(self).attr('data-follow', 0);
            	}
            });
		});

		jQuery('.followBtn').live('mouseover', function() {
			if (jQuery(this).attr('data-follow') == 1) {
				jQuery(this).html('<span>+</span>取消关注');
			}
			else{
				jQuery(this).html('<span>+</span>关注');
			}
		}).live('mouseout', function() {
			if (jQuery(this).attr('data-follow') == 1) {
				jQuery(this).html('<span>+</span>已关注');
			} else {
				jQuery(this).html('<span>+</span>关注');
			}
		});

		});

});
