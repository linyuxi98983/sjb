/**
 * ********************************************
 * Description   : ����JS����
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

//��ȡobject��Length����

function getObjectLength(object) {
    var count = 0;
    for (var i in object) {
        count++;
    }
    return count;
}

/**
 * ��ȡ��ҳbody����
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

var scrollHandle = function(event) {//ie�µ�ҳ�����
    event.returnValue = false;
    event.preventManipulation();
}
var scrollHandle_ = function(event) {//�����������ҳ�����
    event.preventDefault();
}
/**
 * ��ֹҳ������¼�
 */
function noScroll() {
    if ( window.navigator.msPointerEnabled ) {
        document.body.addEventListener('MSPointerMove',scrollHandle , false);
    } else {
        document.body.addEventListener('touchmove', scrollHandle_, false);
    }
}

/**
 * ����ҳ�����
 */
function arrowScroll(){
    if ( window.navigator.msPointerEnabled ) {
        document.body.removeEventListener('MSPointerMove',scrollHandle , false);
    } else {
        document.body.removeEventListener('touchmove', scrollHandle_, false);
    }
}

function reachBottom() {
    var scrollTop = getScrollTop(); //�������߶�
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
            //��ȡ�����б�
            case 'getWorksList':
                $.each(object, function(index, val) {
                    html += '<a href="/works/'+val.id+'.html"><div class="pic">';
                    html += '<img class="lazy" src="http://img.shejiben.com/wap/new_wap/h5layout.gif" data-original="'+val.path+'" alt="'+val.name+'"/>';
                    html += '<div class="pic_pens"><img src="'+val.facePic+'" alt="'+val.author+'"/>';
                    html += '<span>���ʦ:'+val.author+'</span></div></div></a>';
                });
                break;
            //�����ʦ
            case 'getDesignerList':
                $.each(object, function(index, val) {
                    if(val.id>0){
                        var qiandan = val.qiandanNum;
                        var renzheng ='';
                        var touxian ='';
                        if(val.ident == 1){
                            renzheng = '<em class="qy_vip">V��֤</em>'; //��ҵ��֤
                        }else{
                            renzheng = '<em class="vip">V��֤</em>'; //������֤
                        }
                        if(val.goodlevel == 5){
                            touxian = '<em class="zhiming">F֪��</em>';
                        }else if(val.goodlevel == 4){
                            touxian = '<em class="jingying">E��Ӣ</em>';
                        }else if(val.goodlevel == 3){
                            touxian = '<em class="xinrui">N����</em>';
                        }
                        html += '<div class="designer">';
                        html += '<div class="logo"><a href="/'+ val.is_blog_flag +'/'+ val.id +'/"><img src="' + val.headphoto + '" alt="' + val.truename + '" width="100%"/></a></div>';
                        html += '<div class="info">';
                        html += '<p><a href="/'+ val.is_blog_flag +'/'+ val.id +'/"><span>' + val.truename + '</span></a>'+renzheng+touxian+'</p>';
                        html += '<p class="addr">'+val.shen+'&nbsp;&nbsp;&nbsp;'+val.city+'</p>';
                        html += '<p>' + val.yuyueNum + 'ԤԼ&nbsp;&nbsp;&nbsp;';
                        html += qiandan > 0 ? qiandan+'ǩ��' : '';
                        html += '&nbsp;&nbsp;&nbsp;'+val.appraise_num+'����</p></div>';
                        html += '<div class="price">'+val.price_range+'</div>';
                        html += '</div>';
                    } 
                })
                break;
            //�����б�
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
            //���ʦ��ҳ->�����б�
            case 'getCommentComment':
                $.each(object, function(index, val) {
                    html += '<div class="appraise">';
                    html += '<div class="logo"><img src="' + val.headphoto + '" alt=""/></div>';
                    html += '<div class="cen">';
                    html += '<div class="name">'+val.nick+'<span class="time">'+val.puttime+'</span></div>';
                    if(val.credits==1){
                        html += '<div class="good"><img src="http://img.shejiben.com/wap/new_wap/good_app.png" alt="" width="16"/><span>����</span></div>';
                    }
                    html += '<div class="center">'+val.direction+'</div>';
                    html += '</div></div>';
                });
                break;
            //���ʦ��ҳ->�����б�
            case 'getCxtComment':
                $.each(object, function(index, val) {
                    html += '<div class="item">';
                    html += '<span class="type">'+val.str_h_status+'</span>';
                    html += '<span class="text">'+val.name_s+'</span>';
                    html += '<span class="time">'+val.puttime+'</span></div>';
                });
                break;
            
            //���ʦ��ҳ->�����б�
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
            //��Ʒ��ǩ�б�ҳ
            case 'getMallSearchList':
                $.each(object, function(index, val) {
                    html += '<li><a href="'+val.url+'">';                    
                    html += '<img class="lazy" src="http://img.shejiben.com/wap/new_wap/h5layout.gif" data-original="'+val.img+'" alt="'+val.title+'"/></a>';
                    html += '<div><a href="'+val.url+'">'+val.title+'</a></div>';
                    html += '<p>��'+val.price+'</p></li>';
                });
                break;
        }
        return html;
    }
}

(function($) {

    var inRequest = false; //����״̬��ʶ

    var full = false; //���ݼ�����ɱ�ʶ

    var page = 2;
    var ableScroll = 1; //�Ƿ������������

    $.fn.scrollpage = function(options) {
        var configs = {
            controller: '', //��������
            action: '', //������
            page: 2, //��ʼҳ��
            baseurl: '',
            data: {}, //�Զ��崫��
            perpage: 6 //ÿҳ��ʾ����
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
            //����װ��ͼƬ��ҳ
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
                        ableScroll = 0; //���������
                        $('.pageCounts').show(); //��ʾ��ҳ
                    }
                    var o_l = getObjectLength(data);
                    if (typeof(data) == 'object' && o_l > 0) {
                        var intoHtml = objectToHtml(data, options.action, options);
                        if (intoHtml) {
                            page++;
                        }
                        if($("#preLoading").size() > 0 ) $("#preLoading").remove();
                        obj.append(intoHtml);
                        lazyExe(); //��ʱ����
                    } else {
                        full = true; //û��������
                    }
                    inRequest = false;
                }
            })
        }

        function bindScrollPage() {
            window.onscroll = function() {
                if (reachBottom()) {
                    //�������������ײ�
                    ajaxPage(_obj, options);
                }
            }
        }
    };

})(jQuery)