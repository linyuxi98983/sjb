/**
 *  设计师博客公用js文件
 */

var blog = (function() {

    var blog_uid = ""; //设计师博客用户id

    var cssstyleid = "";

    var who_ind = ""; //博客用户类型

    var issingle = "";

    var who_ind_cn = "";

    var HeadPhoto = "";

    var author = '';

    var user_level = 0; //设计师等级

    var timeStatus = 0; //频道下拉菜单显示 settimeout标志

    var menuSpeed = 500; //菜单隐藏的时间间隔

    var waterFallW = 10; //瀑布流左右间隔距离  单位px

    var waterFallH = 10; // 瀑布流上下间隔  单位px

    var maxRow = 3; // 瀑布流最大的列数

    var waterFallContentId = '' //瀑布流容器id

    var waterFallListName = '' //瀑布流列表className

    var waterFallCountArr = new Array(0, 0, 0);

    var lastDomLeft = 0;

    var eachRow_W = 303;

    var dynamicPage = 1;

    var inRequest = 0; //加载标识，防止重复请求

    var onComplete = 0; //所有瀑布流数据加载完成标识，避免多余的请求

    var clip = null;

    var is_index = 1;

/*    //博客头部链接复制
    function copyInit() {
        clip = new ZeroClipboard.Client();
        clip.setHandCursor(true);
        clip.addEventListener('mouseOver', function(client) {
            clip.setText(jq('.s_l').text());
        });

        clip.addEventListener('complete', function(client, text) {
            alert("该地址已经复制，你可以使用Ctrl+V 粘贴。");
        });

        clip.glue('url_clip', 'url_clip_content');
    }*/

/*    jq(document).ready(function() {
        if (/^(.*)sjs\/[0-9]+\/$/.test(window.location.href)) {
            is_index = 1;
        } else {
            copyInit();
            is_index = 0;
        }
        jQuery('#sjb_footer').css('margin-top', '0px');
        jQuery('.a_sendMsg').click(function() {
            if (to8to_uid == '') {
                showSingleLogin(2, 2);
                return false;
            } else if (to8to_uid == whoid) {
                alert('不能给自己发私信！');
                return false;
            }
            jQuery.colorbox({
                iframe: true,
                title: '发私信',
                href: "http://www.shejiben.com/my/message.php?act=send&uid=" + whoid,
                opacity: "0.5",
                height: "190",
                width: "430"
            });
        });

        jq('.show_share_content').toggle(function() {
            jq('#show_share').show();
        }, function() {
            jq('#show_share').hide();
        });

        if (jq('.item_img_list').children('li').length > 0) {
            jq('.item_img_list').children('li').mouseover(function() {
                jq(this).find('.ahoveradd').show();
            }).mouseout(function() {
                jq(this).find('.ahoveradd').hide();
            })
        }

        blog.setDropMenuPosition();
        var timeout_id = '';
        clearTimeout(timeout_id);
        jq('.user_info_new').hover(function() {
            jq('.info_nav').show();
        }, function() {
            timeout_id = setTimeout(function() {
                jq('.info_nav').hide();
            }, 100);
        })
        jq('.info_nav').hover(function() {
            clearTimeout(timeout_id);
        }, function() {
            timeout_id2 = setTimeout(function() {
                jq('.info_nav').hide();
            }, 100);
        })

        jq('.info_nav li').hover(function() {
            jq(this).find('a').css('text-decoration', 'underline');
        }, function() {
            jq(this).find('a').css('text-decoration', 'none');
        })

        jq('.drop_down_menu li').hover(function() {
            jq(this).find('a').css('text-decoration', 'underline');
        }, function() {
            jq(this).find('a').css('text-decoration', 'none');
        })

        jq('.page_num a').not(jq('.prev')).not(jq('.next')).not('.on').mouseover(function() {
            jq(this).css({
                background: "#ff3c30",
                color: "#fff"
            });
        })
        jq('.page_num a').not(jq('.prev')).not(jq('.next')).not('.on').mouseout(function() {
            jq(this).css({
                background: "none",
                color: "#797c8b"
            });
        })
        // jq('.page_num a').not(jq('.next')).mouseover(function(){
        //     jq(this).css({background:"#ff3c30",color:"#fff"});
        // })
        // jq('.page_num a').not(jq('.next')).mouseout(function(){
        //     jq(this).css({background:"none",color:"#797c8b"});
        // })

        jq('.prev').text('');
        jq('.next').text('');
        jq('.prev').hover(function() {
            jq(this).css('backgroundPosition', '-403px -20px');
        }, function() {
            jq(this).css('backgroundPosition', '-342px -20px');
        })
        jq('.next').hover(function() {
            jq(this).css('backgroundPosition', '-383px -20px');
        }, function() {
            jq(this).css('backgroundPosition', '-362px -20px');
        })
    });*/

    function initCss() {
        jQuery('#cboxContent').css('margin-top', '0px');
        jQuery('#colorbox').css('border', 'none');
        jq('#cboxTitle').hide();
        jQuery('#colorbox').css('padding-bottom', '0px');
        jQuery('#cboxClose').hide();
    }

    function revertCss() {
        jQuery('#cboxContent').css('margin-top', '32px');
        jQuery('#colorbox').css('border', 'none');
        jq('#cboxTitle').show();
        jQuery('#colorbox').css('padding-bottom', '32px');
        jQuery('#cboxClose').show();
    }

    return {
        //初始化博客用户信息
        init_blog_user_info: function(whoidval, cssstyleidv, who_indv, issinglev, who_ind_cnv, HeadPhotov, authorv, gdlevel) {
            blog_uid = whoidval;
            cssstyleid = cssstyleidv;
            who_ind = who_indv;
            issingle = issinglev;
            who_ind_cn = who_ind_cnv;
            HeadPhoto = HeadPhotov;
            author = authorv;
            user_level = gdlevel;
            blog.initFollowStatus();
            blog.initFollowEvent('followBtn');
            blog.initFollowEvent('s_follow');
            blog.setShareHref();
            blog.setMouseEvent('s_follow');
            blog.setMouseEvent('followBtn');
        },

        //初始化频道菜单下拉框位置, 初始化鼠标悬浮事件
        setDropMenuPosition: function() {
            var channels = jq('.channels') || '';
            if (channels) {
                var channels_l = jq('.channels').offset().left;
                var channels_t = (jq('.channels').offset().top + 30);
                jq('.drop_down_menu').css('left', channels_l + 'px');
                jq('.drop_down_menu').css('top', channels_t + 'px');
                jq('.channels').hover(function() {
                    jq('.drop_down_menu').show();
                    jq('.drop_down_menu').hover(function() {
                        clearTimeout(menuSpeed);
                    }, function() {
                        menuSpeed = setTimeout(function() {
                            blog.hideDropMenu()
                        }, menuSpeed);
                    });
                }, function() {
                    menuSpeed = setTimeout(function() {
                        blog.hideDropMenu()
                    }, menuSpeed);
                })
            }
        },

        hideDropMenu: function() {
            jq('.drop_down_menu').hide();
        },

        //获取用户某一项信息
        getParams: function(param) {
            return eval(param);
        },

        setParam: function(key, val) {

        },

        sendReserveMsg: function(uid) {
            free_yuyue.init(uid);
        },

        //初始化关注事件
        initFollowEvent: function(elementId) {
            var followBtn = jq('#' + elementId) || '';
            if (!followBtn) return false;
            followBtn.bind('click', function() {
                if (!to8to_uid) {
                    showSingleLogin(2, 2);
                    return false;
                }
                if (blog_uid == to8to_uid) {
                    alert('不能关注自己');
                    return false;
                } else {
                    var rel = followBtn.attr('rel');
                    var url = '/sjs/index.php';
                    var gzUrl = '/'+who_ind_cn+'/'+blog_uid+'/';
                    var name = author;
                    if (followBtn.text() == '加关注') // 点击关注
                    {
                        jq.post(url, {
                            'gzvid': followBtn.attr('rev'),
                            'gztype': "1",
                            'rel': rel,
                            'name':name,
                            'url':gzUrl
                        }, function(data) {
                            followBtn.text('已关注');
                            followBtn.parents('.followBtn').removeClass('redBtn');
                            followBtn.prev().removeClass('jia');
                        });
                    } else {
                        jq.post(url, {
                            'gzvid': followBtn.attr('rev'),
                            'gztype': "2",
                            'rel': rel,
                            'name':name,
                            'url':gzUrl
                        }, function(data) { // 点击取消关注
                            followBtn.text('加关注');
                            followBtn.parents('.followBtn').addClass('redBtn');
                            followBtn.prev().addClass('jia');
                        });
                    }
                }
            })
        },

        //初始化瀑布流配置
        initWaterFall: function(contentId, className, waterFallw, waterFallh, maxR, eachw) {
            waterFallContentId = contentId || '';
            waterFallListName = className || '';
            waterFallW = waterFallw || waterFallW;
            waterFallH = waterFallh || waterFallH;
            maxRow = maxR || maxRow;
            eachRow_W = eachw || eachRow_W;
            blog.computeWaterFallPosition();
        },

        //绘制瀑布流
        computeWaterFallPosition: function(object) {
            if (!object) {
                object = jq('.' + waterFallListName);
            }
            //reset数组
            waterFallCountArr = new Array();
            for (var i = 0; i < maxRow; i++) {
                waterFallCountArr[i] = 0;
            }
            var full_W = jq('#' + waterFallContentId).width();
            var auto_H = jq('#' + waterFallContentId).height();
            object.each(function(index, el) {
                var me = object.eq(index)[0];
                var my_H = me.offsetHeight;
                var my_col = Math.floor((index / maxRow) + 1);
                var index_row = (index > (maxRow - 1)) ? (index % maxRow) : index;
                //第一行不用计算最小高度
                if (waterFallCountArr[index_row] == 0) {
                    thisPositionLeft = index_row * (eachRow_W + waterFallW);
                    thisPositionTop = 0;
                    waterFallCountArr[index_row] += (my_H + waterFallH);
                } else {
                    var min_index = blog.getArrayMinIndex(waterFallCountArr);
                    thisPositionLeft = min_index * (eachRow_W + waterFallW);
                    thisPositionTop = blog.getMinHeight(waterFallCountArr);
                    waterFallCountArr[min_index] += (my_H + waterFallH);
                }
                me.style.left = thisPositionLeft + 'px';
                me.style.top = thisPositionTop + 'px';
                auto_H = blog.getMaxHeight(waterFallCountArr);
                jq('#' + waterFallContentId).css('height', auto_H + 'px');
                //监听滚动事件
                blog.bindScroll();
            });
        },

        getMaxHeight: function(arr) {
            return Math.max.apply({}, arr);
        },

        getMinHeight: function(arr) {
            return Math.min.apply({}, arr);
        },

        getArrayMinIndex: function(arr) {
            var _a = blog.getMinHeight(arr);
            for (var i in arr) {
                if (arr[i] == _a) {
                    return i;
                }
            }
        },

        bindScroll: function() {
            jq(window).scroll(function(event) {
                if (inRequest == 1) {
                    return false;
                }
                var footerHeight = jq('#sjb_footer').height();
                var scrollTop = blog.getScrollTop();
                var domHeight = jq(document).height();
                var maxTop = (domHeight - footerHeight - 50);
                if ((scrollTop + jq(window).height()) >= maxTop) {
                    inRequest = 1;
                    blog.getMoreDynamic(blog_uid, author);
                }
            });
        },

        //获取更多动态,只针对博客首页瀑布流
        getMoreDynamic: function(id, author) {
            if (onComplete == 1 || nowpage == 2) {
                return false;
            }
            var data = {
                'nowpage': dynamicPage,
                'friend': 1
            };
            jq.ajax({
                url: window.location.href,
                data: data,
                type: 'POST',
                dataType: 'json',
                success: function(data) {
                    if (data && typeof data != 'undefined' && data.friendDynamic != '') {
                        var appendWaterFall = '';
                        jq.each(data.friendDynamic, function(index, val) {
                            if (!val.content || !val.content.name) {
                                var contentName = '';
                                var contentUrl = '';
                            } else {
                                var contentName = val.content.name;
                                var contentUrl = val.content.url;
                            }
                            contentName = contentName.substr(0, 20);
                            appendWaterFall += '<div class="waterfallList">';
                            if (val.content && val.content.imgsrc) {
                                var imgs = val.content.imgsrc;
                                appendWaterFall += '<img style="margin-bottom:10px;" src="' + imgs[0] + '" width="280" height="210">';
                            }
                            appendWaterFall += '<div class="float_l">';
                            appendWaterFall += '<a href="' + val.uinfo.url + '">';
                            appendWaterFall += '<img src="' + val.uinfo.headphoto + '" alt="' + val.uinfo.nick + '" width="52" height="52" />';
                            appendWaterFall += '</a></div>';
                            appendWaterFall += '<div class="float_r nrr">';
                            appendWaterFall += '<ul>';
                            appendWaterFall += '<li style="height:35px;">';
                            appendWaterFall += '<a href="' + val.uinfo.url + '" class="reds"  target="_blank">';
                            appendWaterFall += val.uinfo.nick;
                            appendWaterFall += '</a>';
                            appendWaterFall += val.eventtype_zh;
                            appendWaterFall += '<a href="' + contentUrl + '" class="reds"  target="_blank">';
                            appendWaterFall += contentName;
                            appendWaterFall += '</a>';
                            appendWaterFall += '</li>';
                            appendWaterFall += '<li>' + val.dateline + '</li>';
                            appendWaterFall += '</ul>';
                            appendWaterFall += '</div>';
                            appendWaterFall += '<p class="clear"></p>';
                            appendWaterFall += '</div>';
                        });
                        jq('#' + waterFallContentId).append(appendWaterFall);
                        //瀑布流重绘
                        blog.computeWaterFallPosition(jq('.' + waterFallListName));
                        //页数加1
                        dynamicPage++;
                        //reset请求状态
                        inRequest = 0;
                    } else {
                        //设置所有数据加载完标识
                        onComplete = 1;
                        return false;
                    }
                }
            })
        },

        getScrollTop: function() {
            return document.documentElement.scrollTop || window.pageYoffset || document.body.scrollTop;
        },

        //设置分享链接
        setShareHref: function(obj) {
            //设置分享内容
            var shareContent = '';
            //url编码
            var shareUrl = encodeURIComponent(window.location.href);
            //生成第三方分享接口url
            var sinaHref = 'http://v.t.sina.com.cn/share/share.php?url=' + shareUrl + '&title=' + shareContent;
            var qqzone = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + shareUrl + '&desc=' + shareContent;
            var tc_weibo = 'http://v.t.qq.com/share/share.php?title=' + shareContent + '&url=' + shareUrl;
            jq('.share_to_sina').attr('href', sinaHref);
            jq('.share_to_qqweibo').attr('href', tc_weibo);
            jq('.share_to_qqzone').attr('href', qqzone);
        },

        //设置关注按钮的鼠标悬浮事件
        setMouseEvent: function(elementid) {
            if (!elementid) {
                return false;
            }
            jq('#' + elementid).mouseover(function() {
                var thisText = jq(this).text();
                if (thisText == '已关注') {
                    jq(this).text('取消关注');
                }
            }).mouseout(function() {
                var thisText = jq(this).text();
                if (thisText == '取消关注') {
                    jq(this).text('已关注');
                }
            })
        },

        weixin_share: function() {
            var share_dialog = '<div style="display:none;"><div class="wx_dialog" id="wx_dialog"><div class="rcode"><img src="http://s.jiathis.com/qrcode.php?url=' + encodeURIComponent(window.location.href) + '" width="170" height="170" /></div><div class="wx_notice">打开微信，点击底部的“发现”，使用 “扫一扫” 即可将网页分享到我的朋友圈。</div></div></div>';
            jq('body').append(share_dialog);
            jQuery.colorbox({
                inline: true,
                title: '分享到微信朋友圈',
                href: '#wx_dialog',
                opacity: "0.0",
                height: "362",
                width: "362"
            });
        },

        initFollowStatus: function() {
            if (!to8to_uid) {
                jq('.followBtn').addClass('redBtn');
                jq('.add_friends').addClass('jia');
                return false;
            }
            var url = '/sjs/'+blog_uid+'/';
            jq.ajax({
                url: url,
                type: 'POST',
                dataType: 'json',
                data: 'followid=' + blog_uid,
                success: function(data) {
                    if (data == undefined || data.code == '1000') {
                        showSingleLogin(2, 2);
                        return false;
                    } else {
                        jq('#followBtn').text(data.msg);
                        jq('#s_follow').text(data.msg);
                        if (data.code == '1002') {
                            jq('.followBtn').addClass('redBtn');
                            jq('.add_friends').addClass('jia');
                        }
                    }
                }
            });
        },

        popChangeWallPaperDialog: function() {
            //只有登录用户id和博客用户id一致才可以设置壁纸
            if (!to8to_uid) {
                showSingleLogin(2, 2);
                return false;
            } else if (to8to_uid != blog_uid) {
                return false;
            }

            if (jq('#wallPaperDialog').length > 0) {
                jq('#wallPaperDialog').show();
                return false;
            }

            var dialogHtml = '<div id="wallPaperDialog">';
            dialogHtml += '<div id="wallPaperDialogContent">';
            dialogHtml += '<a href="javascript:;" class="paper_menu on_menu" id="chooseP">选择封面推荐</a>';
            dialogHtml += '<a href="javascript:;" class="paper_menu" id="uploadP">本地上传封面</a>';
            dialogHtml += '<a href="javascript:;" id="close_dialog"></a>';
            dialogHtml += '<div id="chooseWallPaperDiv" class="dialog_info" style="height:354px;overflow-y:scroll;margin-top:20px;">';
            jq.each(configTitlePage, function(index, val) {
                val += '?' + Math.random();
                dialogHtml += '<a href="javascript:;" class="y_i"><img src="' + val + '" width="254" height="167" /></a>';
            });
            dialogHtml += '<p class="clear"></p></div>';
            dialogHtml += '<div id="uploadWallPaperDiv" class="dialog_info" style="display:none;">';
            dialogHtml += '<div style="padding:60px 90px 30px 90px;"><p style="font-size:16px;margin-bottom:10px;">选择图片文件(可上传10M以内图片)</p><input type="file" id="fileInput">';
            dialogHtml += '<p style="margin:20px 0px 0px 0px;font-size:12px;line-height:20px;">只有知名、精英、VIP等会员设计师才可以上传自己的作品作为主页封面，开通会员请联系QQ<a href="tencent://message/?uin=943725859" style="color:#e84040;text-decoration:underline;">943725859</a></p><p style="margin:0px;font-size:12px;line-height:20px;">上传的图片不能大于10M，高不小于400px，宽不小于1920px。图片上传后需要客服审核，严禁在图片中附带广告信息。</p>';
            dialogHtml += '<p>金币购买特权服务即将开通，敬请期待。</p></div>';
            dialogHtml += '<p class="clear"></p></div>';
            dialogHtml += '<p class="clear"></p></div></div>';
            jq('body').append(dialogHtml);

            //绑定对话框关闭事件
            jq('#close_dialog').bind('click', function() {
                jq('#wallPaperDialog').hide();
            });

            //绑定菜单切换事件
            jq('.paper_menu').bind('click', function() {
                var index = jq('.paper_menu').index(jq(this));
                jq('.paper_menu').removeClass('on_menu');
                jq(this).addClass('on_menu');
                jq('.dialog_info').hide();
                jq('.dialog_info').eq(index).show();
            });

            //绑定img click事件
            jq('.y_i').children('img').bind('click', function() {
                var myImage = jq(this).attr('src');
                var index = jq('.y_i').children('img').index(jq(this));
                if (myImage == '') return false;
                if (confirm('确定将该图设为封面')) {
                    jq.ajax({
                        url: '/sjs/index.php',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            setDefaultPage: 1,
                            src: myImage,
                            index: index
                        },
                        success: function(data) {
                            if (data != undefined && data.code == '1001') {
                                alert(data.msg);
                                window.location.reload();
                            } else {
                                alert('设置失败，请稍后再试');
                            }
                            return false;
                        }
                    });
                }
            });

            //绑定按钮触发上传事件
            jq('#st_up_btn').bind('click', function() {
                if (!to8to_uid) return false;
                if (blog.user_level != 1 && blog.user_level != 2 && blog.user_level != 4 && blog.user_level !=5) {
                    alert('抱歉，只有VIP/精英/知名会员可以自定义自己的壁纸，联系客服(QQ943725859)开通会员。');
                    return false;
                }
                jq("#fileInput").uploadify('upload', '*');
            });
            var max_queue = 1;
            // 绑定file框 uploadify事件
            jq('#fileInput').uploadify({
                'fileTypeDesc': 'Image Files',
                'fileTypeExts': '*.jpg; *.jpeg',
                'swf': '/img/front_end/huodong/uploadify_new.swf',
                'uploader': '/api/getRelativeInfo.php?act=sign&uid=' + to8to_uid,
                'fileSizeLimit': '10MB',
                'queueSizeLimit': 1,
                'removeCompleted': false,
                'multi': true,
                'simUploadLimit': 1,
                'auto': true,
                'scriptData': {
                    'uid': to8to_uid
                },
                'onUploadStart': function(file) { // 开始上传
                    jq('#st_up_btn').attr('disabled', true);
                    jq('#st_up_btn').val('上传中');
                    jq("#fileInput").uploadify('disable', true);
                },
                'onDialogOpen': function() {
                    this.settings.file_queue_limit = max_queue;
                    this.settings.queueSizeLimit = max_queue;
                },
                'onDialogClose': function(files) {
                    var _arr = jq('.cancel');
                    if (_arr) {
                        for (var i = 0; i < _arr.length; i++) {
                            var hrefAttr = jq(_arr[i]).children('a').attr('href');
                            hrefAttr = hrefAttr.replace('$', 'jq');
                            jq(_arr[i]).children('a').attr('href', hrefAttr);
                        }
                    }
                },
                'onUploadSuccess': function(file, data, response) { // 单张上传完成
                    if (typeof data != 'undefined') {
                        data = jq.parseJSON(data);
                        if (data.code == 1) {
                            alert('上传成功');
                        } else {
                            alert(data.msg);
                            jq('#st_up_btn').removeAttr('disabled');
                            jq('#st_up_btn').val('开始上传');
                        }
                        window.location.reload();
                        return false;
                    }
                },
                'onQueueComplete': function(queueData) { // 上传队列完成
                    jq('#submit').attr('disabled', false);
                    jq('#competition_btn').removeAttr('disabled');
                    jq("#fileInput").uploadify('disable', true);
                },
                'onUploadError': function(file, errorCode, errorMsg, errorString) { // 上传出错
                    console.log(errorCode, errorMsg, errorString, file);
                    if (errorString.toLocaleLowerCase() != 'cancelled') {
                        alert(file.name + ' 上传失败: ' + errorString);
                    }
                    jq('#st_up_btn').removeAttr('disabled');
                    jq('#st_up_btn').val('开始上传');
                },
                'onInit': function() {
                    var upBtn = jq('#fileInput .uploadify-button-text');
                    if (upBtn) {
                        upBtn.text('选择图片');
                        upBtn.css('color', '#fff');
                        jq('#fileInput-button').css({
                            'background': '#333',
                            'border-radius': '5px',
                            'text-align': 'center'
                        });
                        jq('#SWFUpload_0').attr('width', '160');
                    }
                },
                'onFallback': function() {
                    alert('请检查你的flash版本');
                },
                'onSelectError': function(file, errorCode, errorMsg) {
                    if (errorCode == '-100') {
                        this.queueData.errorMsg = '最多只能能选择一张图片';
                    }
                    if (errorCode == SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE) {
                        this.queueData.errorMsg = '最多只能能选择一张图片';
                    } else if (errorCode == SWFUpload.QUEUE_ERROR.INVALID_FILETYPE) {
                        this.queueData.errorMsg = '只支持jpeg格式的图片上传';
                    }
                }
            });
        }
    }

})();