/**
 * ********************************************
 * Description   : 公用JS函数
 * Filename      : func.js
 * Create time   : 2013-12-18 13:33:22
 * Last modified : 2013-12-18 13:34:40
 * License       : MIT, GPL
 * ********************************************
 */

function lazyExe(){
  var imgload=$(".lazy");
  imgload.lazyload({
      effect : "fadeIn"
   });
}

//获取object的Length属性

function getObjectLength(object) {
    var count = 0;
    for (var i in object) {
        count++;
    }
    return count;
}

/**
 * 获取网页body参数
 */

function getBodySize() {
    var size = new Array();
    if (document.documentElement) {
        size[0] = document.documentElement.clientWidth;
        size[1] = document.documentElement.clientHeight;
    } else {
        size[0] = document.body.clientWidth;
        size[1] = document.body.clientHeight;
    }
    return size;
}

function getScrollTop() {
    return document.documentElement.scrollTop || window.pageYoffset || document.body.scrollTop;
}

function getDocumentScrollHeight() {
    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
}

var scrollHandle = function(event) {//ie下的页面滚动
    event.returnValue = false;
    event.preventManipulation();
}
var scrollHandle_ = function(event) {//其他浏览器的页面滚动
    event.preventDefault();
}
/**
 * 禁止页面滚动事件
 */
function noScroll() {
    if ( window.navigator.msPointerEnabled ) {
        document.body.addEventListener('MSPointerMove',scrollHandle , false);
    } else {
        document.body.addEventListener('touchmove', scrollHandle_, false);
    }
}

/**
 * 允许页面滚动
 */
function arrowScroll(){
    if ( window.navigator.msPointerEnabled ) {
        document.body.removeEventListener('MSPointerMove',scrollHandle , false);
    } else {
        document.body.removeEventListener('touchmove', scrollHandle_, false);
    }
}

function reachBottom() {
    var scrollTop = getScrollTop(); //滚动条高度
    var _size = getBodySize();
    var scrollHeight = getDocumentScrollHeight() * 0.6;
    var clientHeight = _size[1];
    if (scrollTop + clientHeight >= scrollHeight) {
        return true;
    } else {
        return false;
    }
}

function objectToHtml(object, actionName, options) {
    if (typeof(object) == 'object') {
        var o_l = getObjectLength(object);
        if (o_l <= 0) return null;
        var html = '';
        switch (actionName) {
            //获取案例列表
            case 'getWorksList':
                $.each(object, function(index, val) {
                    html += '<a href="/works/'+val.id+'.html"><div class="pic">';
                    html += '<img class="lazy" src="http://img.shejiben.com/wap/new_wap/h5layout.gif" data-original="'+val.path+'" alt="'+val.name+'"/>';
                    html += '<div class="pic_pens"><img src="'+val.facePic+'" alt="'+val.author+'"/>';
                    html += '<span>设计师:'+val.author+'</span></div></div></a>';
                });
                break;
            //找设计师
            case 'getDesignerList':
                $.each(object, function(index, val) {
                    if(val.id>0){
                        var qiandan = val.qiandanNum;
                        var renzheng ='';
                        var touxian ='';
                        if(val.ident == 1){
                            renzheng = '<em class="qy_vip">V认证</em>'; //企业认证
                        }else{
                            renzheng = '<em class="vip">V认证</em>'; //个人认证
                        }
                        if(val.goodlevel == 5){
                            touxian = '<em class="zhiming">F知名</em>';
                        }else if(val.goodlevel == 4){
                            touxian = '<em class="jingying">E精英</em>';
                        }else if(val.goodlevel == 3){
                            touxian = '<em class="xinrui">N新锐</em>';
                        }
                        html += '<div class="designer">';
                        html += '<div class="logo"><a href="/'+ val.is_blog_flag +'/'+ val.id +'/"><img src="' + val.headphoto + '" alt="' + val.truename + '" width="100%"/></a></div>';
                        html += '<div class="info">';
                        html += '<p><a href="/'+ val.is_blog_flag +'/'+ val.id +'/"><span>' + val.truename + '</span></a>'+renzheng+touxian+'</p>';
                        html += '<p class="addr">'+val.shen+'&nbsp;&nbsp;&nbsp;'+val.city+'</p>';
                        html += '<p>' + val.yuyueNum + '预约&nbsp;&nbsp;&nbsp;';
                        html += qiandan > 0 ? qiandan+'签单' : '';
                        html += '&nbsp;&nbsp;&nbsp;'+val.appraise_num+'评价</p></div>';
                        html += '<div class="price">'+val.price_range+'</div>';
                        html += '</div>';
                    } 
                })
                break;
            //博文列表
            case 'getLogList':
                $.each(object, function(index, val) {
                    html += '<a href="' + options.baseurl + '/'+ val.is_blog_flag +'/' + val.uid + '/log-' + val.type + '-l' + val.lid + '.html">';
                    html += '<div class="information no_logo">';
                    html += '<div class="title">' + val.subject_s + '</div>';
                    html += '<div class="content"><div class="cont"><p>' + val.content_desc + '</p></div></div>';
                    html += '<div class="btm">';
                    html += '<div class="date">' + val.puttime + '</div>';
                    html += '<div class="see"><img src="http://img.shejiben.com/wap/new_wap/ck.png" alt="" width="16"/><span>' + val.hits + '</span></div>';
                    html += '</div></div></a>';
                });
                break;
            //设计师主页->评价列表
            case 'getCommentComment':
                $.each(object, function(index, val) {
                    html += '<div class="appraise">';
                    html += '<div class="logo"><img src="' + val.headphoto + '" alt=""/></div>';
                    html += '<div class="cen">';
                    html += '<div class="name">'+val.nick+'<span class="time">'+val.puttime+'</span></div>';
                    if(val.credits==1){
                        html += '<div class="good"><img src="http://img.shejiben.com/wap/new_wap/good_app.png" alt="" width="16"/><span>好评</span></div>';
                    }
                    html += '<div class="center">'+val.direction+'</div>';
                    html += '</div></div>';
                });
                break;
            //设计师主页->交易列表
            case 'getCxtComment':
                $.each(object, function(index, val) {
                    html += '<div class="item">';
                    html += '<span class="type">'+val.str_h_status+'</span>';
                    html += '<span class="text">'+val.name_s+'</span>';
                    html += '<span class="time">'+val.puttime+'</span></div>';
                });
                break;
            
            //设计师主页->案例列表
            case 'getUserCasesList':
                $.each(object, function(index, val) {
                    if(val.path){
                        path = val.path
                    }else{
                        path = 'http://img.shejiben.com/wap/new_wap/placeholdImg.jpg';
                    }
                    /*html += '<a href="'+val.url+'"><div class="exmp">';
                    html += '<img class="lazy12" src="http://img.shejiben.com/wap/new_wap/placeholdImg.jpg" data-original="'+path+'" />';
                    html += '<div class="msg"><div class="tit">'+val.name+'</div>';
                    html += '<div class="numb"><strong>'+val.priceName+'/'+val.areaName+'/'+val.spaceName+'/'+val.styleName+'</strong>';
                    html += '<span><img src="http://img.shejiben.com/wap/new_wap/pi.png" width="16"/>'+val.counts+' <img src="http://img.shejiben.com/wap/new_wap/yj.png" width="16"/>'+val.hits+'</span></div>';
                    html += '</div></div></a>';*/ 
                    html += '<a href="'+val.url+'"><div class="exmp"><img src="'+path+'"/>';
                    html += '<div class="msg"><div class="tit">'+val.name+'</div>';
                    html += '<div class="numb"><strong>'+val.priceName+'/'+val.areaName+'/'+val.spaceName+'/'+val.styleName+'</strong>';
                    html += '<span><img src="http://img.shejiben.com/wap/new_wap/pi.png" width="16"/>'+val.counts+' <img src="http://img.shejiben.com/wap/new_wap/yj.png" width="16"/>'+val.hits+'</span></div>';
                    html += '</div></div></a>';
                });
                break;
            //商品标签列表页
            case 'getMallSearchList':
                $.each(object, function(index, val) {
                    html += '<li><a href="'+val.url+'">';                    
                    html += '<img class="lazy" src="http://img.shejiben.com/wap/new_wap/h5layout.gif" data-original="'+val.img+'" alt="'+val.title+'"/></a>';
                    html += '<div><a href="'+val.url+'">'+val.title+'</a></div>';
                    html += '<p>￥'+val.price+'</p></li>';
                });
                break;
        }
        return html;
    }
}

(function($) {

    var inRequest = false; //请求状态标识

    var full = false; //数据加载完成标识

    var page = 2;
    var ableScroll = 1; //是否允许滚动加载

    $.fn.scrollpage = function(options) {
        var configs = {
            controller: '', //控制器名
            action: '', //动作名
            page: 2, //起始页数
            baseurl: '',
            data: {}, //自定义传参
            perpage: 6 //每页显示条数
        };

        if (!this.length) {
            return this;
        }

        try {
            var options = $.extend(configs, options);
            var _obj = $(this);
            page = options.page;
            options.data = $.parseJSON(options.data);
            /*if (/getWorksList(.*)/.test(options.action)) {
                options.url = options.baseurl + '/' + options.controller + '/' + options.data.actionPageName;
            } elseif */
            if (/getDesignerList(.*)/.test(options.action)) {
                options.url = options.baseurl + '/' + options.controller + '/' + options.data.actionPageName;
            } else {
                options.url = options.baseurl + '/' + options.controller + '/' + options.action + '/';
            }

            if (typeof _obj == 'object' && options.baseurl != '' && options.controller != '' && options.action != '') {
                bindScrollPage();
            }
        } catch (e) {
            return false;
        }

        function ajaxPage(obj, options) {
            if(options.action=='getWorksList' && ableScroll==0)
            {
                return;
            }
            if (inRequest || full) {
                return false;
            }
            inRequest = true;
            var _dt = options.data;
            _dt.page = page;
            if(page > options.total_page) return false;
            //兼容装修图片分页
            /*if (/getWorksList(.*)/.test(options.action)) {
                options.action = 'getWorksList';
                options.url = options.url.replace(/\/p[0-9]+\/?/, '');
                options.url = options.url + '/p' + (options.perpage * (page - 1));
            }*/
            if (/getDesignerList(.*)/.test(options.action)) {
                options.action = 'getDesignerList';
                options.url = options.url.replace(/p[0-9]+\/?/, '');
                options.url = options.url + '/p/' + (page);
            }
            $.ajax({
                url: options.url,
                type: 'POST',
                data: _dt,
                dataType: 'json',
                beforeSend: function(){
                    obj.append('<div id="preLoading" style="clear:both;width:32px;height:32px;margin:6px auto;"><img src="http://img.shejiben.com/icon/load.gif" /></div>');
                },
                success: function(data) {
                    if(options.action=='getWorksList')
                    {
                        ableScroll = 0; //不允许滚动
                        $('.pageCounts').show(); //显示分页
                    }
                    var o_l = getObjectLength(data);
                    if (typeof(data) == 'object' && o_l > 0) {
                        var intoHtml = objectToHtml(data, options.action, options);
                        if (intoHtml) {
                            page++;
                        }
                        if($("#preLoading").size() > 0 ) $("#preLoading").remove();
                        obj.append(intoHtml);
                        lazyExe(); //延时加载
                    } else {
                        full = true; //没有数据了
                    }
                    inRequest = false;
                }
            })
        }

        function bindScrollPage() {
            window.onscroll = function() {
                if (reachBottom()) {
                    //如果滚动条到达底部
                    ajaxPage(_obj, options);
                }
            }
        }
    };

})(jQuery)