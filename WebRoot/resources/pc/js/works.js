define(function (require, exports, module) {
    var $ = require('jquery');
    var UI = require('ui');
    require('colorbox');
    var digital = {
        speed : 1000,

        _replace : function(number, select) {
            var n = number.toString(), //数字转化成字符串
                dom = document.getElementById(select);
            if (n > 0) {
                var n_len = n.length,
                    d_span = dom.getElementsByTagName('span'),
                    d_len = d_span.length;

                //数字的长度和元素的长度相等，不需要增加span来存放数字，直接遍历替换就可以
                if (n_len == d_len) {
                    for (var i = 0; i < n_len; i++) {
                        jQuery(d_span).eq(i).attr('item-data', n[i]);
                    }
                } else{
                    //数字长度大于或小于元素长度，需要增减span标签
                    var needSpan = n_len - d_len,
                        template = '';
                    if (needSpan > 0) {
                        for (var k = 0; k < needSpan; k++) {
                            template += '<span class="picNum" item-data=""></span>';
                        }
                        dom.innerHTML += template;
                    } else {
                        jQuery(d_span).each(function(index, val) {
                            if (index > (n_len - 1)) {
                                val.remove();
                            }
                        });
                    }
                    digital._replace(number, select);
                }
            }
        }, 

        verticalmove : function() {
            jQuery('.picNum').each(function(i) {
                var pix = (0 - parseInt(jQuery(this).attr('item-data'))) * 19 + 1;
                if (jQuery.browser.mozilla) {
                    //火狐不支持position-y, 可以用css3做动画效果
                    jQuery(this).css({
                        'background-position': '-4px ' + pix + 'px',
                        '-moz-transition': 'all ' + this.speed + 'ms ease'
                    });
                } else {
                    //因为当浏览器窗口不在最前面的时候，jquery的animate动画会积累，当切换过去的时候会一次性执行完
                    //所以在执行之前需要先清空animate事件队列
                    jQuery(this).stop().animate({
                        'background-position-y':pix
                    }, digital.speed);
                }
            });
        }
    };

    /*var ActionCollection = {
        image_id : 0,
        image_src : '',
        alt : '',
        default_domain : '',
        init : function(obj) {
            var sthis = this;
            sthis.default_domain = document.domain;
            obj.live('click', function() {
                document.domain = 'shejiben.com';
                if (!to8to_uid) {
                    showSingleLogin(1, 2);
                    return false;
                }
                sthis.image_id = jQuery(this).attr('data-id');
                sthis.image_src = jQuery(this).attr('data-src');
                if (sthis.image_id && sthis.image_src.length > 0) {
                    ActionCollection.colorbox();
                }
            });
        },
        colorbox : function() {
            var sthis = this;
            jQuery.colorbox({
                iframe: true,
                title: '我要收藏这张图',
                href: "http://www.shejiben.com/works/add_collections.php?act=add_collection&src=" + sthis.image_src + '&image_id=' + sthis.image_id + '&alt=' + sthis.alt+ '&_='+Math.random(),
                opacity: "0.5",
                height: "340",
                width: "474",
                onColosed: function() {
                    if (ActionCollection.default_domain.length > 0) {
                        document.domain = ActionCollection.default_domain;
                    }
                }
            });
        }
    }*/

    // function initCss() {
    //     jQuery('#cboxContent').css('margin-top', '0px');
    //     jQuery('#colorbox').css('border', 'none');
    //     jq('#cboxTitle').hide();
    //     jQuery('#colorbox').css('padding-bottom', '0px');
    // }

    // function revertCss() {
    //     jQuery('#cboxContent').css('margin-top', '32px');
    //     jQuery('#colorbox').css('border', 'none');
    //     jq('#cboxTitle').show();
    //     jQuery('#colorbox').css('padding-bottom', '32px');
    // }


    jQuery(document).ready(function() {
        
        var image_id;
        var submitStatus = 0;
        var time_sta = 0;
        var recordObjectId = 0;
        var myFollowUrl = myFollowUrl || '';
        myFollowUrl = "/works/myfollow/" + myFollowUrl;
        // myFollowUrl = myFollowUrl ? "/works/myfollow/" + myFollowUrl + '/' : "/works/myfollow/";

        //装修图片频道我关注的设计师的图片
        if(SJB.GLOBAL_VAR.to8to_uid && jQuery(".my-follow").size() > 0){
            jQuery('.my-follow').attr('href',myFollowUrl);
            jQuery.post('/works/index_new.php?ajax=12',{uid:SJB.GLOBAL_VAR.to8to_uid},function(msg){
                if(parseInt(msg) > 0 && jQuery('LABEL.float_r .my-follow').size() > 0){
                    jQuery('LABEL.float_r .my-follow').children('EM').html(msg).show();
                }
            });
            /*
            var labelObj =  jQuery("LABEL.float_r");
            var thisPageUrl = window.location.href;

             if(thisPageUrl.indexOf('myfollow') >= 0){
             labelObj.children('.onOrder').addClass('image_order').removeClass('onOrder');
             labelObj.prepend('<span class="onOrder my-follow">我关注的设计师</span>');
             }else{
             labelObj.prepend('<span class="image_order my-follow">我关注的设计师</span>');
             }
             */
        }

        SJB.ActionCollection.init(jQuery('.new_ahoveradd .collection'));
        SJB.ActionAsk.init(jQuery('.new_ahoveradd .question'));
        SJB.ActionAsk.init(jQuery('.new_ahoveradd .addQuestion'));
        if (jQuery('.collection').length && jQuery('.question').length) {
           
        } else {
            if (!SJB.GLOBAL_VAR.to8to_uid) {
            jQuery(".addCollection , .addQuestion").live("click", function() {
                showSingleLogin(1,2);
            });

        } else {
            jQuery(".addCollection").live("click", function() {
                document.domain = 'shejiben.com';
                init_colorbox_css();
                image_id = jQuery(this).attr("data-id");
                init_colorbox_css();
                var image_id = jQuery(this).attr('data-id');
                if (jQuery("#the_page").css("display") == 'none' || jQuery("#content").css("display") == 'none') {
                    if (jQuery("#lbMainimg").css("display") == 'none') {
                        var src = jQuery("#lbMainsmallimg img").attr("src");
                        var alt = jQuery("#lbMainsmallimg img").attr("alt");
                    } else {
                        var src = jQuery("#lbMainimg img").attr("src");
                        var alt = jQuery("#lbMainimg img").attr("alt");
                    }
                } else if (jQuery("#case_d_img").size() > 0) {
                    var src = jQuery("#case_d_img img").attr("src");
                    var alt = jQuery("#case_d_img img").attr("alt");
                } else {
                    var src = jQuery("a.preview-box[data-id='" + image_id + "'] img").attr("src");
                    var alt = jQuery("a.preview-box[data-id='" + image_id + "'] img").attr("alt");
                }
                jQuery('#cboxTitle').attr('style', '');
                    jQuery.colorbox({
                        iframe: true,
                        title: '我要收藏这张图',
                        href: "http://www.shejiben.com/works/add_collections.php?act=add_collection&src=" + src + '&image_id=' + image_id + '&alt=' + alt,
                        opacity: "0.5",
                        height: "340",
                        width: "474",
                        onComplete: function() {}
                    });
            });

        }
        
        }

        if (jQuery('.show_add').length > 0) {
            jQuery('.show_add').mouseover(function() {
                jQuery(this).children('.add_j,.add_notice').show();
            }).mouseout(function() {
                jQuery(this).children('.add_j,.add_notice').hide();
            });
        }

        //modify by shejiben 2013.04.16  th小图片预加载
        if (jQuery("#lbMainimgonload").size() > 0 && jQuery(".preview-box img").size() > 0) {
            jQuery.each(jQuery(".preview-box img"), function(i, n) {
                jQuery("#lbMainimgonload").html('<img src="' + jQuery(n).attr("data") + '" />');
            });
        }
        
        if (token && appid && openid) { //qq用户登录
            jQuery("#add_qq_share").click(function() {
                var isShare = jQuery("#isShare").val();
                if (isShare == 1) {
                    jQuery(this).removeClass("onshare");
                    jQuery(this).addClass("outshare");
                    jQuery("#isShare").val(0);
                    jQuery(this).attr("title", '未同步到QQ空间');
                } else {
                    jQuery(this).removeClass("outshare");
                    jQuery(this).addClass("onshare");
                    jQuery("#isShare").val(1);
                    jQuery(this).attr("title", '取消同步到QQ空间');
                }
            });
        }
        if (token_weibo) { //新浪微博登陆
            jQuery("#add_weibo_share").click(function() {
                var isShareWeibo = jQuery("#isShareWeibo").val();
                if (isShareWeibo == 1) {
                    jQuery(this).removeClass("onshareweibo");
                    jQuery(this).addClass("outshareweibo");
                    jQuery("#isShareWeibo").val(0);
                    jQuery(this).attr("title", '未同步到新浪微博');
                } else {
                    jQuery(this).removeClass("outshareweibo");
                    jQuery(this).addClass("onshareweibo");
                    jQuery("#isShareWeibo").val(1);
                    jQuery(this).attr("title", '取消同步到新浪微博');
                }
            });
        }
        jQuery(":button[id=cancel]").click(function() {
            jQuery(".addCollection").colorbox.close();
        });
        jQuery(":button[id=cancelQuestion]").click(function() {
            jQuery(".addQuestion").colorbox.close();
        });

        jQuery(":button[id=ok]").live("click", function() {
            jQuery(".addCollection").colorbox.close();
        });

        jQuery(":button[id=addToCollection]").click(function() {
            jQuery(":button[id=addToCollection]").attr("disabled", "disabled");
            if (jQuery("input[name=selectCollection]:checked").val() == null) {
                jQuery("#addToCollectionForm #addToCollectionFormError").html('请选择灵感图集');
                jQuery("#addToCollectionForm #addToCollectionFormError").show();
            } else {
                var collectionKind = jQuery("input[name=selectCollection]:checked").val();
                var newCollectionName = jQuery("input[name=newCollectionTitle]").val();
                var collection_id = jQuery("select[name=collectionId] option:selected").val();
                var comment = jQuery("#collectionImageComment").val();

                if (collectionKind == 'newCollection' && newCollectionName == false) {
                    jQuery("#addToCollectionForm #addToCollectionFormError").html('新建的灵感图集名称不能为空，请输入');
                    jQuery("#addToCollectionForm #addToCollectionFormError").show();
                    jQuery(":button[id=addToCollection]").removeAttr("disabled");
                    return false;
                } else {
                    if (newCollectionName) {
                        var count = jQuery("select[name=collectionId] option").length;
                        for (var i = 0; i < count; i++) {
                            if (newCollectionName == jQuery("select[name=collectionId]").get(0).options[i].text) {
                                jQuery("#addToCollectionForm #addToCollectionFormError").html('灵感图集名称不能重复，请重新输入');
                                jQuery("#addToCollectionForm #addToCollectionFormError").show();
                                jQuery("input[name=newCollectionTitle]").focus();
                                jQuery(":button[id=addToCollection]").removeAttr("disabled");
                                return false;
                            }
                        }
                    }

                    jQuery("#addToCollectionForm #addToCollectionFormError").hide();

                    if (jQuery("#the_page").css("display") == 'none' || jQuery("#content").css("display") == 'none') {
                        if (jQuery("#lbMainimg").css("display") == 'none') {
                            var src = jQuery("#lbMainsmallimg img").attr("src");
                            var alt = jQuery("#lbMainsmallimg img").attr("alt");
                        } else {
                            var src = jQuery("#lbMainimg img").attr("src");
                            var alt = jQuery("#lbMainimg img").attr("alt");
                        }
                    } else if (jQuery("#case_d_img").size() > 0) {
                        var src = jQuery("#case_d_img img").attr("src");
                        var alt = jQuery("#case_d_img img").attr("alt");
                    } else {
                        var src = jQuery("a.preview-box[data-id='" + image_id + "'] img").attr("src");
                        var alt = jQuery("a.preview-box[data-id='" + image_id + "'] img").attr("alt");
                    }

                    //modify by shejiben 2013.04.26
                    var col_ok = 0; //是否收藏成功
                    jQuery.ajax({
                        type: 'POST',
                        url: "http://www.shejiben.com/piwigo/plugins/UserCollections/toggle_image.php",
                        data: {
                            "collectionKind": collectionKind,
                            "newCollectionName": newCollectionName,
                            "collection_id": collection_id,
                            "image_id": image_id,
                            "comment": comment,
                            "images": src,
                            "isShare": jQuery("#isShare").val(),
                            "isShareWeibo": jQuery("#isShareWeibo").val()
                        },
                        success: function(msg) {
                            if (jQuery.trim(msg) == 'Alreadyexists') {
                                jQuery.colorbox({
                                    title: '将图片收藏到我的灵感图集',
                                    opacity: "0.5",
                                    height: "140",
                                    width: "474",
                                    html: '<div id="addCollectionDialog"><div class="dialogBody"><br /><p style="margin-bottom:5px;">该图片已经收藏到该灵感图集中</p><a href="http://www.shejiben.com/linggantuji/thumbs/' + collection_id + '/" class="lv"><b>访问我的灵感图集>></b></a></div><div class="dialogControls"><input value="确定" type="button" id="ok" class="delsubmit" onmouseover="this.className=\'delsubmithover\'" onmouseout="this.className=\'delsubmit\'"></div>'
                                });
                            } else if (jQuery.trim(jQuery.trim(msg)) == 'repeatname') {
                                jQuery("#addToCollectionForm #addToCollectionFormError").html('灵感图集名称不能重复，请重新输入');
                                jQuery("#addToCollectionForm #addToCollectionFormError").show();
                                jQuery("input[name=newCollectionTitle]").focus();
                                jQuery(":button[id=addToCollection]").removeAttr("disabled");
                                return false;
                            } else if (jQuery.trim(msg) == -100) {
                                jQuery.colorbox({
                                    title: '警告',
                                    opacity: "0.5",
                                    height: "100",
                                    width: "474",
                                    html: '<div id="addCollectionDialog"><br />警告：您的文本中含有系统不允许的内容，被屏蔽。</div>'
                                })

                            } else if (!isNaN(jQuery.trim(msg))) {

                                jQuery.colorbox({
                                    title: '将图片收藏到我的灵感图集',
                                    opacity: "0.5",
                                    height: "300",
                                    width: "474",
                                    html: '<div id="addCollectionDialog"><div class="dialogBody"><br /><p style="margin-bottom:5px;">图片收藏成功！</p><p style="text-align:center; padding:10px;"><img src="' + src + '" width="160" height="140" /></p><a href="http://www.shejiben.com/linggantuji/thumbs/' + collection_id + '/" class="lv"><b>访问我的灵感图集>></b></a></div><div class="dialogControls"><input value="确定" type="button" id="ok" class="delsubmit" onmouseover="this.className=\'delsubmithover\'" onmouseout="this.className=\'delsubmit\'"></div>'
                                })
                                jQuery("#addCollectionDialog_0").hide();
                                jQuery("input[name=newCollectionTitle]").val('');
                                jQuery("em[iid=" + image_id + "]").html(msg);
                                col_ok = 1;
                            } else {
                                if (jQuery.trim(msg) != 'error') {
                                    var msgnan = msg.split(',');

                                    jQuery.colorbox({
                                        title: '将图片收藏到我的灵感图集',
                                        opacity: "0.5",
                                        height: "300",
                                        width: "474",
                                        html: '<div id="addCollectionDialog"><div class="dialogBody"><br /><p style="margin-bottom:5px;">图片收藏成功！</p><p style="text-align:center; padding:10px;"><img src="' + src + '" width="160" height="140" /></p><a href="http://www.shejiben.com/linggantuji/thumbs/' + msgnan[0] + '/" class="lv"><b>访问我的灵感图集>></b></a></div><div class="dialogControls"><input value="确定" type="button" id="ok" class="delsubmit" onmouseover="this.className=\'delsubmithover\'" onmouseout="this.className=\'delsubmit\'"></div>'
                                    })
                                    jQuery("#addCollectionDialog_0").hide();
                                    newOption = '<option value="' + msgnan[0] + '">' + newCollectionName + '</option>';
                                    jQuery("select[name=collectionId]").append(newOption);
                                    jQuery("#selectCollectionBlock").show();
                                    jQuery("input[name=newCollectionTitle]").html('');
                                    jQuery("em[iid=" + image_id + "]").html(msgnan[1]);
                                    col_ok = 1;
                                    collection_id = msgnan[0];
                                } else {
                                    jQuery(".addCollection").colorbox.close();
                                }
                            }
                            if ((jQuery("#isShareWeibo").val() == 1) && col_ok) {
                                jQuery.post(
                                    "http://www.shejiben.com/piwigo/plugins/UserCollections/toggle_image.php", {
                                        collection_id: collection_id,
                                        image_id: image_id,
                                        images: src,
                                        imgname: alt,
                                        weibo_tag: 1
                                    }
                                );
                            }
                        }
                    });
                }
            }
        });


            // 表单定位以及验证提交
            zsjFormPosition();
            jQuery('#zsjBtn').click(function() {
                SJB.postFrom(jQuery(this),111);
            }); 
    });


    //图片延迟加载
    UI.lazyLoad( $('img') );

    jQuery(".case_list label").hover(function() {
        var _template_tender = '<span class="ahoveradd new_ahoveradd" style="display:none;">'+
                                '<a href="javascript:void(0);" class="add_atlas_new collection" data-src="{@src}" data-id="{@id}" ><em></em>收藏</a>'+
                                '<a href="javascript:void(0);" class="add_atlas_new question" data-src="{@src}" data-id="{@id}" ><em></em>提问</a>'+
                            '</span>';
        var dataSrc = jQuery(this).attr('data-src');
        var dataId = jQuery(this).attr('data-id');
        _template_tender = _template_tender.replace(/{@src}/g, dataSrc);
        _template_tender = _template_tender.replace(/{@id}/g, dataId);
        jQuery(this).find('.wrap1').html( _template_tender );
        jQuery(this).find(".ahoveradd").show(); //光标经过
        var index = jQuery(".case_list label").index(jQuery(this));
        jQuery('.gradual').eq(index).fadeIn('slow');
    }, function() {
        jQuery(this).find(".ahoveradd").remove(); //光标移出
        var index = jQuery(".case_list label").index(jQuery(this));
        jQuery('.gradual').eq(index).fadeOut('fast');
    });

    function login() {
        window.location.href = '/sjb/pc/designer/designer!personal.action';
        return;
    }
    //作品页排序方式切换
    jQuery(".img-order").live('click',function(){
        if(jQuery(this).hasClass('my-follow')){
            if(!SJB.GLOBAL_VAR.to8to_uid){
                showSingleLogin(1,2);
              
                // window.location.href = myFollowUrl;
                return false;
            }
        }
        var linkUrl = window.location.href;
        linkUrl = linkUrl.replace(/order[0-9]/,'');
        linkUrl = linkUrl.replace(/myfollow\//,'');
        if (linkUrl.lastIndexOf('/') != linkUrl.length - 1)
            window.location.href = parseInt(jQuery(this).attr("data")) ? linkUrl+'/'+'order'+jQuery(this).attr("data") : linkUrl+'/';
        else
            window.location.href = parseInt(jQuery(this).attr("data")) ? linkUrl+'order'+jQuery(this).attr("data") : linkUrl;
    });

    if (jQuery(".preview-box").size() > 0) {
        jQuery(".preview-box").each(function() {
            this.onselectstart = function() {
                return false;
            };
            this.ondragstart = function() {
                return false;
            };
            this.oncontextmenu = function() {
                return false;
            };
        });
    }
    if (jQuery(".workSearchTag").size() > 0) {
        jQuery(".workSearchTag").each(function() {
            this.onselectstart = function() {
                return false;
            };
            this.ondragstart = function() {
                return false;
            };
            this.oncontextmenu = function() {
                return false;
            };
        });
    }

    /* 热门效果图,友情链接,最新推荐选项卡效果 */
    jQuery(".bottom_tab_hd p").mouseover(
        function(){
            var tabCurNum = jQuery(this).index();
            jQuery(this).addClass('cur').siblings().removeClass('cur');
            jQuery(".bottom_tab_body ul").removeClass('tabed');
            jQuery(".bottom_tab_body ul").eq(tabCurNum).addClass('tabed');
        }
    );

    // 发需求表单定位以及提交成功后的提示弹窗
    function zsjFormPosition(){
        var scrollHeight = jQuery(document).scrollTop();
        var documentHeight = jQuery(document).height();
        jQuery('#menubar-left').css({'height':jQuery('.works_right_new').height()});
        var topAd = 0;
        var hotAd = 0;
        topAd = jQuery('#top_add').length > 0 && jQuery('#top_add').is(':visible')?jQuery('#top_add').height():0;
        //图库列表页有热点广告位
        hotAd = jQuery('.shejiben_qr_code').length != 0 ? 360 : 20;
        if(scrollHeight > 920){

            if(documentHeight - scrollHeight < 400 + 320){
                jQuery('#zsjForm').css({'top':'auto','bottom':'0'});
            }
            else{
                jQuery('#zsjForm').css('top',scrollHeight-190-topAd);
            }

        }
        else{
            jQuery('#zsjForm').css('top',jQuery('#menubar').height()+hotAd+'px');
        }
    }
    jQuery(window).scroll(function() {
        zsjFormPosition();
    });

    // function showPopUpForm(){  
    //     var popupStr = '<div class="popupMask"></div><div class="popup_wrapz popup_success"><div class="column_name"><p class="name">提交成功</p><span class="btn_close" onclick=closePopUp(jQuery(".popup_success"))></span></div>'
    //         +'<div class="popup_content submit_status"><span class="icon icon_sucess"></span><span class="show_msg">'
    //         +'<p class="title">提交成功</p><p class="msg">为了详细了解您的装修需求及房屋情况，百爪鱼客服会在24小时内与您电话联系。</p></span>'
    //         +'<div class="clear"></div><a href="javascript:void(0)" class="btn_ok" onclick=closePopUp(jQuery(".popup_success"))>好的</a></div></div>';
    //     jQuery('body').append(popupStr);
    //     jQuery("body,html").css({"overflow":"hidden"});
    //     jQuery('.popupMask').show();
    // }

    // function closePopUp(obj){
    //     obj.remove();
    //     jQuery('.popupMask').remove();
    //     jQuery('.popupMask').hide();
    //     jQuery('html,body').removeAttr('style');
    // }


});