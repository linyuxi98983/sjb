    
(function() {

    var jq = jQuery.noConflict(),
        cookieUid = jQuery('#cookieUid').val(),
        jsbtype=new Array("选择分类","住宅空间","公共空间"),
        jssj_type=new Array();
        jssj_type[0]=new Array();jssj_type[1]=new Array();jssj_type[2]=new Array();jssj_type[0][0]="选择分类";jssj_type[1][0]="选择分类";jssj_type[1][1]="网咖";jssj_type[1][2]="别墅豪宅";jssj_type[1][3]="样板房";jssj_type[2][0]="选择分类";jssj_type[2][1]="酒店空间";jssj_type[2][2]="购物空间";jssj_type[2][3]="文化空间";jssj_type[2][4]="商业展示";jssj_type[2][5]="交通空间";jssj_type[2][6]="医疗机构";jssj_type[2][7]="办公空间";jssj_type[2][8]="餐饮空间";jssj_type[2][9]="娱乐空间";jssj_type[2][10]="休闲会所";jssj_type[2][11]="售楼中心";jssj_type[2][12]="酒吧设计";jssj_type[2][13]="金融机构";jssj_type[2][14]="运动场所";jssj_type[2][15]="教育机构";jssj_type[2][16]="厂房设计";jssj_type[2][17]="公园景观";     var jssj_smalltype =[[['选择分类']],[['选择分类'],['选择分类','小地段','二居','三居','四居','复式'],['选择分类','别墅设计','豪宅设计','公馆设计'],['选择分类','别墅设计','豪宅设计','样板房设计','样板间设计']],[['选择分类'],['选择分类','商务酒店设计','精品酒店设计','酒店设计','宾馆设计','饭店设计','度假酒店设计','度假村'],['选择分类','卖场设计','专卖店设计','旗舰店设计','商场设计','商店设计','服装店设计','美发店设计'],['选择分类','图书馆设计','博物馆设计','音乐厅设计','剧场设计','剧院设计','电影院设计'],['选择分类','展览馆设计','展厅设计','展柜设计','橱窗设计','展销厅设计','展示空间设计'],['选择分类','机场设计','码头设计','火车站设计','汽车站设计','客运站设计','候机楼设计','游艇设计'],['选择分类','医院设计','牙科中心设计','眼科中心设计','急救中心设计'],['选择分类','办公室设计','办公楼设计','写字楼设计','营业场所设计'],['选择分类','餐厅设计','西餐厅设计','中餐厅设计','酒楼设计','快餐店设计','咖啡厅设计','茶馆设计'],['选择分类','酒吧设计','ktv 设计','夜总会设计','歌舞厅设计','娱乐场所设计','俱乐部设计'],['选择分类','高级会所设计','会所设计','桑拿中心设计','休闲中心设计','足浴中心设计','按摩中心设计'],['选择分类','售楼处设计','售楼中心设计','营销中心设计'],['选择分类','酒吧设计','酒馆设计','慢摇吧设计'],['选择分类','银行设计','储蓄所设计','证卷交易所设计'],['选择分类','球场设计','球馆设计','高尔夫设计','网球场设计','体育馆设计','体育中心设计','网球馆设计'],['选择分类','幼儿园','小学','中学','大学','图书馆','教学楼','培训中心'],['选择分类','工厂厂区','工厂厂房','工厂车间'],['选择分类','公园设计','广场设计','景观设计','园林设计']]];


    function changeType(btype,casesj_type,casesj_smalltype) {
        var btypeid = document.getElementById(btype).value;
        if(jssj_type[btypeid])
        {
            var ilen = jssj_type[btypeid].length;
            if(btypeid==2)
                ilens=ilen-4;
            else
                ilens=ilen;
            document.getElementById(casesj_type).length = ilens;
            j=1;
            for(var i=0;i < ilen;i++)
            {
                if(btypeid==2)
                {
                    if(i!=0 && i!=5 && i!=12 && i!=16 && i!=17)
                    {document.getElementById(casesj_type).options[j].value = i;document.getElementById(casesj_type).options[j].text  = jssj_type[btypeid][i];j++}
                }
                else
                {
                    document.getElementById(casesj_type).options[i].value = i;
                    document.getElementById(casesj_type).options[i].text  = jssj_type[btypeid][i];
                }
            }
            document.getElementById(casesj_type).options[0].selected="selected";
            if(document.getElementById(casesj_smalltype))
                document.getElementById(casesj_smalltype).options[0].selected="selected";
        }
    }

    function changeSmallType(btype,casesj_type,casesj_smalltype) {
        var casesj_type_id = document.getElementById(casesj_type).value;
        var btypeid = document.getElementById(btype).value;
        if(jssj_smalltype[btypeid][casesj_type_id])
        {
            var ilen = jssj_smalltype[btypeid][casesj_type_id].length;
            document.getElementById(casesj_smalltype).length = ilen;
            for(var i=0;i < ilen;i++)
            {
                document.getElementById(casesj_smalltype).options[i].value = i;
                document.getElementById(casesj_smalltype).options[i].text  = jssj_smalltype[btypeid][casesj_type_id][i];
            }
            document.getElementById(casesj_smalltype).options[0].selected="selected";
        }
    }

    /**
     * 上传模块
     */
    window.Upload = window.Upload || {};
    Upload.fileId = 'uploadify';
    Upload.upload_config = {};
    Upload.upload_type   = 'category'; //1为作品， 2为图集
    Upload.base_url = '/my/classic_photos_add.php?act=upload&cookieUid='+cookieUid;
    Upload.success_url = '/my/classic_photos_add.php?act=upload_success';
    Upload.catid    = '';
    Upload.errorHtml = '<div class="error_sjb">';
    Upload.errorLevel = 0;
    Upload.fileSize = 0;
    Upload.postData = {};
    Upload.success_image_id = [];

    Upload.init_upload_type = function() {
        var indentity = jQuery('#indentity').val();
        if (indentity == 0) {
            //业主用户只能上传图集
            this.upload_type = 'thumb';
        }
    };

    Upload.init_uploadify_config = function(config) {
        this.upload_config = config;
        jQuery('#'+this.fileId).uploadify(config);
    };
    Upload.onCreateSuccess = function(type) {
        if (type == 'category') {
            jQuery('#cate-name').attr('disabled', 'disabled').addClass('disabled');
            jQuery('#create-cate').hide();
            jQuery('#recreate-cate').show();
        } else {
            jQuery('#case-name').attr('disabled', 'disabled').addClass('disabled');
            jQuery('#create-case').hide();
            jQuery('#recreate-case').show();
        }
    };
    Upload.set_upload_type = function(type) {
        this.upload_type = type;
    };

    Upload.reCreate = function(id) {
        var input_id  = id == 'recreate-cate' ? 'cate-name' : 'case-name',
            comment_id = id == 'recreate-cate' ? 'cate-des' : 'case-des';
            type      = id == 'recreate-cate' ? 'category' : 'thumb';
        this.catid = '';
        jQuery('#'+input_id).removeClass('disabled').removeAttr('disabled').val('');
        jQuery('#'+comment_id).val('');
        if (type == 'category') {
            jQuery('#pro-area').val('');
            jQuery('#pro-price').val('');
            jQuery('#create-cate').show();
            jQuery('#recreate-cate').hide();
        } else {
            jQuery('#create-case').show();
            jQuery('#recreate-case').hide();
        }
    }

    Upload.create = function(id) {
        var dthis     = this,
            input_id  = id == 'create-cate' ? 'cate-name' : 'case-name',
            type      = id == 'create-cate' ? 'category' : 'thumb',
            name      = jQuery('#'+input_id).val().substr(0,20), //名字截取前20个字符
            //qcode     = jQuery('#c_code').val();
            createUrl = '/my/classic_photos_add.php?act=create&type=' + type;
        if (name == '') {
            alert('作品名称不能为空！');
            return false;
        }
        jQuery.ajax({
            url: createUrl,type:'POST',data:{name:name},dataType: 'json',success: function(data) {
                if ( data == -100 ) {
                    alert('警告：您的文本中含有系统不允许的内容，被屏蔽。');
                    return false;
                }
                if (typeof data === 'object' && data.status == '1000') 
                {
                        //dthis.onCreateSuccess(type);
                        dthis.catid = data.id;
                        //OK 开始上传
                        dthis.uploadDisabled();
                        dthis.fileUploadStart();
                } else {
                    alert(data.msg);
                    return false;
                }
            }
        })
    }

    Upload.onSelect = function() {
        var dthis = this;
        jQuery('.add_tag').live('click', function(e) {
            var des   = jQuery(this).attr('data-description') == 'null' ? '' : jQuery(this).attr('data-description'),
                ctype = jQuery(this).attr('data-type');
            if (ctype == 1) {
                var values = {
                    'cate-name' : jQuery(this).html(),
                    'pro-area' : jQuery(this).attr('data-area'),
                    'pro-price' : jQuery(this).attr('data-price'),
                    'cate-des' : des,
                    'style' : jQuery(this).attr('data-style')
                };
            } else {
                var values = {
                    'case-name' : jQuery(this).html(),
                    'case-des' : des
                }
            }
            dthis.setValue(values);
            dthis.onCreateSuccess(dthis.upload_type);
            dthis.catid = jQuery(this).attr('data-id');
            jQuery('#topic_dialog').hide();
        });
    }

    Upload.setValue = function(values) {
        if (typeof values === 'object') {
            jQuery.each(values, function(k, v) {
                jQuery('#'+k).val(v);
            });
        }
    }

    //图片上传之前
    Upload.beforeUpload = function() {
        //检查表单数据
        if (!this.check()) {
            return false;
        }
        //创建案例名
        var sid = jQuery("#create_type").val();
        this.create(sid);
        //return false;
    }
    Upload.setUploadifyData = function(data) {
        jQuery("#uploadify").uploadifySettings('postData', data);
    }
    Upload.fileUploadStart = function() {
    	
    	console.log(jQuery("#uploadForm"));
        //配置
        this.postData.uploadid = this.catid;
        this.postData.type     = this.upload_type;
        this.postData.comment  = Upload.upload_type == 'category' ? jQuery('#cate-des').val() : jQuery('#case-des').val();
        //传参
        this.postData.name = jQuery('#cate-name').val();
        this.postData.kind = jQuery('#kind').val();
        this.postData.subkind = jQuery('#subkind').val();
        this.postData.subsubkind = jQuery('#subsubkind').val();
        this.postData.style = jQuery('#style').val();
        this.postData.area = jQuery('#pro-area').val();
        this.postData.price = jQuery('#pro-price').val();
        if(jQuery('#bindQQ').attr("checked")=="checked"||jQuery('#bindQQ').attr("checked")==true){
            this.postData.bindQQ = 'qq';
        }
        if(jQuery('#bindSina').attr("checked")=="checked"||jQuery('#bindSina').attr("checked")==true){
            this.postData.bindSina = 'sina';
        }
        this.postData.cookieUid = cookieUid;
        this.setUploadifyData(this.postData);
        jQuery("#uploadify").uploadifyUpload();
    }
    Upload.uploadDisabled = function() {
        jQuery('#start_up').attr('disabled', 'disabled');
        jQuery('#start_up').val('上传中..');
    }
    Upload.removeDisabled = function() {
        jQuery('#start_up').removeAttr('disabled');
        jQuery('#start_up').val('开始上传');
    }

    //表单check
    Upload.check = function() {
        var name = jQuery("#cate-name").val();
        var kind = jQuery("#kind").val();
        var subkind = jQuery("#subkind").val();
        var subsubkind = jQuery("#subsubkind").val();
        var style = jQuery("#style").val();
        var area = jQuery("#pro-area").val();
        var price = jQuery("#pro-price").val();
        var desc = jQuery("#cate-des").val();
        //var name = jQuery("#cate-name").val();
        //消息
        var mesStr = '';
        if(jQuery.trim(name)==""){
            mesStr += this.appendErrorHtml('请输入作品名称');
        }
        if(kind==0){
            mesStr += this.appendErrorHtml('请选择作品一级分类');
        }
        if(subkind==0){
            mesStr += this.appendErrorHtml('请选择作品二级分类');
        }
        if(subsubkind==0){
            mesStr += this.appendErrorHtml('请选择作品三级分类');
        }
        if(style==-1&&kind==1){
            mesStr += this.appendErrorHtml('请选择网咖风格分类');
        }

        if(area==''||isNaN(area)||parseInt(area)<1||parseInt(area)>10000000){
            mesStr += this.appendErrorHtml('请填写正确的项目面积');
        }
     //   if(price==''||isNaN(price)||parseInt(price)<1||parseInt(price)>10000000){
        if(price && (isNaN(price)|| parseInt(price)>10000000)){
            mesStr += this.appendErrorHtml('请填写正确的项目造价');
        }
        Upload.fileSize = jQuery(".loding").size();
        if (Upload.fileSize <= 0) {
            mesStr += this.appendErrorHtml('最少要添加一个图片');
        }
        if(!jQuery("#cate-agree").attr('checked')){
            mesStr += this.appendErrorHtml('您还没同意承诺');
        }
        //如果验证数据不通过，给出弹出提示
        if(mesStr){
            jQuery("#noticeMes").html(mesStr);
            jQuery(".dialog_bg").show();
            jQuery(".upload_product_tpl").show();
            return false;
        }else{
            return true;
        }
    }
    //错误信息
    Upload.appendErrorHtml = function(str){
        text = '<div class="tpl_msg"><span></span><label>'+str+'</label></div>';
        return text;
    }

    Upload.errorLog = function(msg) {
        this.errorLevel++;
        this.errorHtml += '<p>'+this.errorLevel+'.'+msg+'</p>';
    }
    Upload.showError = function() {
        this.errorHtml += '</div>';
        jQuery.colorbox({
            title:'上传失败',
            html:Upload.errorHtml,
            opacity:"0.5",
            onClosed : function() {
                Upload.clearError();
            }
       });
    }
    Upload.clearError = function() {
        this.errorLevel = 0;
        this.errorHtml  = '<div class="error_sjb">';
    }

    /********************************  END  ***************************************/

    function switchSlide () {
        this.options = null;
        this.elements = null;
        this.contentObj = null;
        this.init = function(elements,options,contentObj) {
            this.elements = elements;
            this.options = options;
            this.contentObj = contentObj;
            this.contentObj.first().show();
            this.bindEvents();
        };
        this.bindEvents = function() {
            var self = this;
            jQuery.each(self.options, function(index, val) {
                self.elements.eq(index).bind('click', function() {
                    if ( index == 0 ) {
                        jQuery('#noticebox').show();
                    } else {
                        jQuery('#noticebox').hide();
                    }

                    jQuery('#topic_dialog').hide();
                    var s_class = index == 0 ? 'on_works_t' : 'on_thumb_t',
                        upload_type = index == 0 ? 'category' : 'thumb';
                    Upload.set_upload_type(upload_type);
                    self.elements.removeClass('on');
                    self.elements.children('span').removeClass('on_works_t').removeClass('on_thumb_t');
                    jQuery(this).addClass('on');
                    jQuery(this).children('span').addClass(s_class);
                    self.contentObj.not(jQuery('#' + val)).fadeOut('fast', function() {
                        jQuery('#' + val).fadeIn('fast');
                    });
                })
            });
        }
        this.removeEvents = function() {
            var self = this;
            jQuery.each(self.options, function(index, val) {
                self.elements.eq(index).unbind('click');
            });
        }
    }

    //选择已有案例或图集相关js
    function chooseExists(element,stype) {
        this.element = element;
        this.type = 'category';  //默认选择作品
        this.allowType = 'category, thumb';
        this.data = {};  //已经查询获取到的数据会存到这里
        this.url  = '/my/classic_photos_add.php?act=existsTag';
        this.template = {};
        this.dialog = jQuery('#topic_dialog');
        this.dialog_content = jQuery('.dialog_content');
        this.closeBtn = jQuery('#close_dialog');
        this.position = {};
        if (this.allowType.indexOf(stype) === -1) {
            return false;
        }
        this.type = stype;
        this.load = function() {
            var d_this = this,
                loadUrl = d_this.url + '&type=' + d_this.type;
            d_this.dialog_content.html('<p>加载中,请稍后...</p>');
            try {
                if (typeof d_this.template[d_this.type] !== 'undefined') {
                    d_this.dialog_content.html(d_this.template[d_this.type]);
                } else {
                    jQuery.ajax({url: loadUrl,type: 'POST',dataType: 'json',success: function(d) {
                            if (typeof d === 'object') {
                                d_this.dialog_content.html(d_this.render(d));
                            } else {
                                d_this.dialog_content.html('<p>暂无数据</p>');
                            }
                        }
                    });
                }
            } catch(e) {
                // continue;
            }
        },
        this.render = function(object) {
            try {
                if (typeof this.template[this.type] !== 'undefined') {
                    return this.template[this.type];
                }
            } catch(e) {
                // continue;
            }
            var _html = '',
                data_type = this.type == 'category' ? 1 : 2;
            jQuery.each(object, function(index, el) {
                var data_price = data_type == 1 ? 'data-price = "'+el.price+'"' : '',
                    data_area = data_type == 1 ? 'data-area = "'+el.area+'"' : '',
                    data_style = data_type == 1 ? 'data-style = "'+el.styleid+'"' : '';
                _html += '<span class="add_tag" data-id="'+el.id+'"' +
                        ' data-type="'+data_type+'" data-description="'+el.comment+'" ' +
                        ' '+ data_price +' '+ data_area +' '+data_style+'>'+el.name+'</span>';
            });
            this.template[this.type] = _html;
            return _html;
        },
        this.init = function() {
            var dthis = this;
            this.element.bind('click', function(e) {
                dthis.load();
                dthis.show();
            });
            this.closeBtn.bind('click', function() {
                dthis.close();
            });
        },
        this.close = function() {
            this.dialog.hide();
        },
        this.show = function() {
            this.dialog.show();
        }
    }

    jQuery(document).ready(function() {
        var a = new chooseExists(jQuery('#choose-cate'), 'category'),
            b = new chooseExists(jQuery('#choose-case'), 'thumb');
        a.init();
        b.init();

        jQuery('.add_btn').bind('click', function() {
            //var sid = jQuery("#create_type").val();
            //Upload.create(sid);
        });

        jQuery('.reset_btn').bind('click', function() {
            var sid = jQuery(this).attr('id');
            Upload.reCreate(sid);
        });

        Upload.onSelect();

        jQuery('#start_up').bind('click', function() {
            Upload.beforeUpload();
        });

        //当为电竞时候，隐藏网咖风格select
        jQuery("#kind").bind('change', function(){
            if(jQuery("#kind").val()==2){
                jQuery("#style").hide();
            }else{
                jQuery("#style").show();
            } 
        });
    });


    //分类和网咖风格切换
    jQuery("select[name=kind]").change(function(){
        changeType('kind','subkind','subsubkind');
    });
    jQuery("select[name=subkind]").change(function(){
        changeSmallType('kind','subkind','subsubkind');
    });

    jQuery('#kind').bind('click', function() {
        if (this.value == 2) {
            jQuery('.style-select').hide();
        } else {
            jQuery('.style-select').show();
        }
    })

    //图集和项目切换
    var switchSlide = new switchSlide();
    switchSlide.init(jQuery('.checkTagBtn'), ['cate-form', 'case-form'], jQuery('.cate-info'));
    if (jQuery('#indentity').val() != 1) {
        jQuery('.checkTagBtn').eq(1).click();
        switchSlide.removeEvents();
        jQuery('#noticebox').hide();
        jQuery('.checkTagBtn').eq(0).hide();
    }


    Upload.init_uploadify_config({
        'uploader'       : Upload.base_url,
        'langFile'       : '../js/uploadifyLang_en.js',
        'swf'            : 'http://www.shejiben.com/piwigo/include/classic_photos_add/uploadify/uploadify.swf',
        'checkExisting'  : false,
        // 'debug'            : true,
        buttonCursor     : 'pointer',
        'buttonText'     : '选择图片',
        'width'          : 70,
        'height'         : 25,
        'cancelImage'    : '../images/cancel.png',
        'queueID'        : 'newfileQueue',
        'auto'           : false,
        'multi'          : true,
        'file_upload_limit' : 100,
        'fileTypeDesc'   : 'Photo files',
        'fileTypeExts'   : '*.jpg;*.JPG;*.jpeg;*.JPEG;*.png;*.PNG;*.gif;*.GIF',
        'fileSizeLimit'  : 10240,
        'progressData'   : 'barBg',
        requeueErrors   : false,
        'onSelect'       : function(event,ID,fileObj) {
          jQuery("#newfileQueue").show();
        },
        'onQueueComplete'  : function(stats) {
              // jQuery("input[name=submit_upload]").click();
    	    Upload.postData.imageid = Upload.success_image_id;
    	    Upload.postData.comment = Upload.upload_type == 'category' ? jQuery('#cate-des').val() : jQuery('#case-des').val();
    	    jQuery.ajax({url:Upload.success_url, type:'POST', data: Upload.postData, dataType:'json',
    		    success : function(data) {
                    if (  data == -100 )
                    {
                        alert('警告：您的文本中含有系统不允许的内容，被屏蔽。');
                        window.location.reload();
                        return false;
                    }
                    theUrl = '/my/works_edit.php?step=twostep&cat='+Upload.catid+'&display=big';
                    window.location.href = theUrl;
                    /*if ( data.status == 1004 ) {
                        alert( data.msg );
                        window.location.reload();
                        return false;
                    };*/
    		        /*var tp = Upload.upload_type;
    		        jQuery('<form action="/my/classic_after_upload.php?type='+tp+'&id='+Upload.catid+'" method="post">'+
    			           '<input type="hidden" name="ids" value="'+data.ids+'"><input type="submit" id="after_upload"></form>').appendTo(jQuery('body'));
                    setTimeout(function() {
                         jQuery('#after_upload').click();
                    }, 2000);*/
    		    }
            });
        },
        onUploadSuccess: function (file,data,response) {
            if (  data == -100 ) {
                alert('警告：您的文本中含有系统不允许的内容，被屏蔽。');
                window.location.reload();
                jQuery('#'+Upload.fileId).uploadify('stop', '*');
                return false;
            }
            var data = jQuery.parseJSON(data);
    	    if (data.image_id > 0) {
    		    Upload.success_image_id.push(data.image_id);
    	    }
        },
        onUploadError: function (file,errorCode,errorMsg,errorString,swfuploadifyQueue) {
            return false;
        }
    });

})();


/* 2015-2-28 */

function closeNoticeBox(){
    jQuery(".dialog_bg").hide();
    jQuery(".upload_product_tpl").hide();
}


    
var MM_contentVersion = 6; 
var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"]) ? 
navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0; 
if ( plugin ) { 
    var words = navigator.plugins["Shockwave Flash"].description.split(" "); 
    for (var i = 0; i < words.length; ++i){ 
        if (isNaN(parseInt(words[i]))) 
        continue; 
        var MM_PluginVersion = words[i]; 
    } 
    var MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion; 
} 
else if( navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0 && (navigator.appVersion.indexOf("Win") != -1) ) { 
    //FS hide this from IE4.5 Mac by splitting the tag 
    document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n'); 
    document.write('on error resume next \n'); 
    document.write('MM_FlashCanPlay = ( IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n'); 
    document.write('</SCR' + 'IPT\> \n'); 
} 
if ( MM_FlashCanPlay ) { 
} 
else{ 
    var html='<div class="msg_no_flash">温馨提示：您的浏览器未安装flash播放器，请安装后再进行图片上传，点击<a href="http://www.adobe.com/go/getflash">这里</a>安装~</div>';
    jQuery('.tel').after(html);
    jQuery('#uploadify').click(function(){
        var msg = '<div class="error_msg_no_flash">您的浏览器未安装flash播放器，请完成安装后再进行图片上传</div>';
        jQuery('.pict_upload').append(msg);
    });
} 