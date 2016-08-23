/* design-note js dev by lshc ,email:lshclshc@163.com*/
/*标签页面转换。*/
$('[href^="#rmd"]').click(function (e) {
    e.preventDefault();
    var targetId = $(this).attr('href'),
        $toggleTarget = $(targetId);
    $toggleTarget.siblings('div').hide();
    //$(this).toggleClass('active');
    $(this).parent().siblings().find('a').removeClass('active');
    $(this).parent().siblings().find('i').hide();
    $(this).parent().find("a").addClass('active');
    $(this).parent().find("i").show();
    $toggleTarget.show();
});

$(function(){
    bottomZb();   //底部增加发需求入口
    $('[href^="#tab-menu"],[href^="#sub-type-"]').click(function(e){
        e.preventDefault();
        var targetId = $(this).attr('href'),
            $toggleTarget = $(targetId);
        $toggleTarget.siblings('div').hide();
        $(this).toggleClass('active');
        $(this).parent().siblings().find('a').removeClass('active');
        $(this).parent().find("span").addClass('active');
        $toggleTarget.toggle();
    });

    $(".after-arrow-white").on("touchstart",function(){
        $(".showtype").slideToggle(100);
    });

    var designSize=$("#desingerlist ul li figure").size()
   /*designer list width */

    var desigerList=$("#desingerlist ul");
    desigerList.css("min-width",function(){
        return designSize*80+designSize*10;
    })

     var designerCompany=$("#designerCompany ul li figure").size()
     var designerCon=$("#designerCompany ul");
     designerCon.css("min-width",function(){
        return designerCompany*80+ designerCompany*10;
    })

    /*edit by 2015-03-02*/
    var detailRemd=$(".hot-3d-recommend li").size();
    var detailsremds=$(".hot-3d-recommend ul")
    detailsremds.css("min-width",function(){
        return detailRemd*115 + detailRemd*10;
    });

    $("#select-itme-type").change(function()
    {
        var selectTxt= $(this).find("option:selected").text();
        $("#getText").text(selectTxt)
        $("#typeText").text(selectTxt)
    });

    $("#select-itme-area").change(function()
    {
        var selectTxt= $(this).find("option:selected").text();
        $("#getTextArea").text(selectTxt)
    });

    $("#s1").change(function()
    {   var selectTxt= $(this).find("option:selected").text();
        $("#getProvinceText").text(selectTxt)
    });

    $("#s2").change(function()
    {   var selectTxt= $(this).find("option:selected").text();
        $("#getCityText").text(selectTxt)
    });
    $("#select-itme-yusuan").change(function()
    {
        var selectTxt= $(this).find("option:selected").text();
        $("#yusuanText").text(selectTxt)
    });

    $("#getText").text("房屋类型");
    $("#getCityText").text("市");
    $("#getProvinceText").text("省");
    $("#getTextArea").text("项目面积");
    $("#typeText").text("项目类型");
    $("#yusuanText").text("设计预算");
    
    /*图像加载。。。*/
    var imgload = $(".lazy");
    if(imgload.length > 0){
        imgload.lazyload({
            effect : "fadeIn"
        });
    }
    

    /*answer type scroll..*/
    // var answerType=$(".qa-top-menu li").size();
    // var sumWidth =0;
    // $(".qa-top-menu").find("li").each(function(){
    //     sumWidth += $(this).outerWidth();
    // });

    // var scrollArea=$(".qa-top-menu");
    // scrollArea.css("width",function(){
    //     return sumWidth;
    // })
    // var linkActive=$(".qa-top-menu li")
    // linkActive.on("touchstart",function(){
    //     $(this).addClass("active");
    //     $(this).siblings().removeClass("active");
    // })
    // var linkActive=$(".top-menus li,.room-inner-case ul li,.nav-link li,.hot-recommend ul li,.gally-case li,.answerQuestions li,.clickeffect li a,.case-select li");
    // linkActive.on("touchstart",function(){
    //    $(this).addClass("actives");
    //   })

    // linkActive.on("touchend",function(){
    //     $(this).removeClass("actives");
    // })

    $("#showZx").on("touchstart",function(){
        $(".zx_types").fadeToggle();
    })

    /*显示导航菜单*/
    $("#show-pop-menus").on("touchstart",function(e){
        e.preventDefault();
        $(".pop-menus").animate({height:"show"},50);
        $('.content').hide();
    });
    $("#hide-pop-menus").on("touchstart",function(e){
        e.preventDefault();
        $(".pop-menus").animate({height:"hide"},50);
        $('.content').show();
    })
    $(".pop-menus").on("touchmove",function(){
        $(this).hide()
    })
    //拔打电话。
    $("#contact-designer").on("touchstart",function(e){
        e.preventDefault();
        $(".telphone").fadeToggle()
        $(".zx_types").hide()
    })

    $("#tel-cancel").on("touchstart",function(e){
        e.preventDefault();
        $(".telphone").hide()
    })
    var scrollScreen = $("#scrollButton");
    if(jQuery('.botFloatBar').length > 0 || jQuery('#zb_form').length > 0 ){
        scrollScreen.hide();
    }
    else{
       scrollScreen.show(); 
    }
    scrollScreen.on("touchstart", function (e) {
        e.preventDefault();
        var nowScroll = $(window).scrollTop(),
            flag = "up";
        var funScroll = function () {
            var top = $(window).scrollTop();
            if (flag == "up") {
                top -= top; //返回顶部
                if (top <= 0) {
                    top = 0;
                    flag = "down";
                }
            }
            else {
                return;
            }
            $(document.body).animate({scrollTop: top}, 400);
        };
        if (nowScroll) {
            funScroll();
        };
    });

    $('#softDesc').find("p:gt(1)").hide();//软件详细页的介绍默认显示两条

    checkCookie(); //来源统计标识


    //问答改版主页tab切换
    $('.ask-tab-tlt').on('click',function(){
        var thisIndex=$(this).index();
        $(this).addClass('ask-tab-cur').siblings().removeClass('ask-tab-cur');
        $('.ask-con-box .ask-content-list').eq(thisIndex).show().siblings().hide();
        $('.list-more .ask-list-more').eq(thisIndex).show().siblings().hide();
   
    })

    //问答改版主页问答标签模块
    $('.list-tlt-icon').click(function(){
       $(this).next('.label-list').toggleClass('label-show-line');
    });

    /***注册登录验证***/
    /***kiki添加于20160129***/
    var regLoginAccount = {
        times: 60,
        flag: true,
        init : function(){
            var _this = this;
            _this.checkLogin();
            _this.checkReg();                          
            _this.getmobilecode();
        },
        checkPhone : function(){            //验证手机(注册)
            var _this = this;
            var obj = $('#username');
            if(obj.length <= 0){return false;}//不存在的节点直接返回true
            var value = obj.val();
            var reg= /^1[34587]\d{9}$/;
            if(value == "" || value.length != 11 || !reg.test(value)){
                errorshow('请输入正确的电话号码');
                return false;
            }
            else{                       
                _this.checkAct('http://m.shejiben.com/user/regindex',{'act':'checkmobile', 'mobile':value});                     
                $('.login_msg').css('display','none');
                return true;
            }              
        },
        getmobilecode:function(){          //获取验证码(注册)
            var _this = this;
            $('#getmobilecode').on('touchstart',function(){
                _this.flag = true;
                var userName = $('#username');                
                var phone = userName.val();
                if(!_this.flag){
                    return false;
                }
                _this.flag = false;                
                if(!_this.checkPhone(phone)){return false;}
                else{                                      
                    $.ajax({
                        url:'http://m.shejiben.com/user/regindex',
                        type:'POST',
                        data:{'act':'getMobileCode', 'mobile':phone,'reg':'sjbregster'},
                        dataType:'json',
                        success:function (data){
                            if(data.errCode == 7){
                                interval = setInterval(function (){
                                    _this.sendCodeItver();
                                },1000);                                
                            }
                            else if(data.errCode == 13){
                                errorshow(data.errMsg);
                                window.location.href = data.url;

                            }else{
                                errorshow(data.errMsg);
                            }                
                        },
                        error:function (){
                            return ;
                        }
                    })
                }                
            }) 
        },        
        sendCodeItver:function(){          //发送验证码倒计时(注册) 
            var _this = this;                   
            var getCode = $('#getmobilecode');
            if(_this.times > 0){
                getCode.css('background','#a0a0a0');
                getCode.val('('+_this.times+'s)后重发');                                
            }else{
                clearInterval(interval);
                getCode.css('background','#dd4f50');
                getCode.val('获取验证码');
                _this.times = 60;
                _this.flag = true;
            }
            _this.times = _this.times-1;
        },
        checkCode : function(){            //验证验证码(注册)
            var _this = this;
            var obj = $('.reg_btn');
            var phone = $('#username').val();
            var code = $('#code').val();
            if(obj.length <= 0){return true;}  //不存在的节点直接返回true            
            if(code == ""){
                errorshow('请填写验证码');
                return false;
            } else {
                if (code.length != 6 || isNaN(parseInt(code))){
                    errorshow('请填写6位数字的验证码');
                    return false; 
                }
                else{
                    // _this.checkAct('http://m.shejiben.com/user/regindex',{'act':'CheckMobileCode', 'mobile':phone,'yzm':code})
                    $('.login_msg').css('display','none');
                    return true;
                }
            }   
            return true;         
        },
        checkPasswd : function(){         //验证密码(注册)
            var obj = $('#psw');
            var value = obj.val();
            if(obj.length <= 0){return true;}//不存在的节点直接返回true
            if(value == ""){
                errorshow('请设置您的帐号密码');
            }
            else{
                if(/^[A-Za-z0-9\_\S]+$/.test(value)){
                    if(value.length > 16){
                        errorshow('密码太长，最多16个字符。');
                        return false;
                    }

                    if(value.length < 6 ){
                        errorshow('密码太短，至少6个字符。');
                        return false;
                    }

                    var pregRule2 = /^\d{6,8}$/;
                    if( pregRule2.test( value ) ){
                        errorshow('密码不能为9位以下纯数字。');
                        return false;
                    }

                    useNum = String(value);
                    var useFirst = useNum.substring(0,1);
                    var usearr = useNum.split(useFirst);
                    var usrStrNum = usearr.length-1;
                    if(useNum.length == usrStrNum){
                        errorshow('密码字符不能完全一致。');
                        return false;
                    }
                }
                else{
                    errorshow('密码仅支持数字、字母及常用符号，不允许有空格。');
                    return false;
                } 
                return true;  
            }     
        },        
        checkLogin : function(){          //登录
            $('.login_btn').on('touchstart',function(){
                var _this = this;
                if($('#loginuser').val() == "" && $('#loginpsw').val() == ""){
                    errorshow('请输入帐号和密码');
                    return false; 
                }
                else if($('#loginuser').val() == ""){
                    errorshow('请输入帐号');
                    return false;
                }
                else if($('#loginpsw').val() == ""){
                    errorshow('请输入密码');
                    return false;
                }
                else{
                    var loginuser = $('#loginuser').val();
                    var password = $('#loginpsw').val();
                    var Hreferer = $('#http_referer').val();
                    var referer = $('#referer').val();
                    var login = $('#login').val();
                    $('.login_msg').css('display','none');
                    $('.login_btn').attr('disabled','disabled').val('登录中...');
                    $.ajax({
                        url:'http://m.shejiben.com/user/login',
                        type: 'POST',
                        data:{'username':loginuser, 'password':password, 'http_referer':Hreferer,'referer':referer,'login':login},
                        dataType:'json',
                        success:function(data){ 
                            if(data.errCode == 0){
                                window.location.href=data.errMsg;
                            }                                             
                            else{
                                $('.login_btn').removeAttr('disabled').val('登录');                                                      
                                errorshow(data.errMsg);
                            }               
                        }
                    })
                    return true;  
                }                
            })            
        },        
        checkReg: function(){             //注册
            var _this = this;
            $('.reg_btn').on('touchstart',function(){
                var ident = $('#ident').val();
                var phone = $('#username').val();
                var password = $('#psw').val();
                var code = $('#code').val();       
                if(!_this.checkPhone($('#username'))){return false;}
                if(!_this.checkCode($('#code'))){return false;}
                if(!_this.checkPasswd($('#psw'))){return false;}
                $.ajax({
                    url:'http://m.shejiben.com/user/register',
                    type:'POST',
                    data:{'reg':'sjbregster', 'ident':ident, 'mobile':phone, 'password':password, 'yzm':code},
                    dataType:'json',
                    success:function (data){
                        data=eval(data);
                        if(data.errCode == 11){
                            window.location.href = data.errMsg;                                
                        } 
                        else{
                            errorshow(data.errMsg);
                        }               
                    }
                })

            }) 
        },
        checkAct:function(url,dataJson){
            $.ajax({
                url:url,
                type:'POST',
                data:dataJson,
                dataType:'json',
                async:true,
                success:function (data){
                    if(data.errCode){
                        errorshow(data.errMsg);
                    }                
                },
                error:function (){
                    return ;
                }
            })   
        }
    }
    regLoginAccount.init();

    /***错误信息提示***/
    /***kiki添加于20160218***/
    function errorshow(txt){
        var errorObj = $('.login_msg');       
        errorObj.html(txt);
        errorObj.css('display','block');
        return false;
    }
    /***问答提问和回答字数限制以及提示***/
    /***kiki添加于20160129***/
    var askAnswer = {
        errorObj: $('.login_msg'),
        init : function(){
            var _this = this;
            _this.editNum($('.ask_tlt'),50);
            _this.editNum($('.answer_con'),9000);
            _this.askErrPro();
            _this.proWorks();
            _this.postAnswer();
            _this.myAskAnswer();
            _this.createTop();
            $('#answer').on('touchstart',function(){
                 _this.nullErrPro($('.answer_con'),'回答内容不能为空');        
            });
            $('#replay').on('touchstart',function(){
                 _this.nullErrPro($('.answer_con'),'回复内容不能为空');
                 if($('.answer_con').val() != ""){
                    $('.login_msg').css('display','none');
                 }               
            })
        },
        editNum : function(obj,num){
            obj.keyup(function(){ 
                var qtitle = obj.val();
                var counter = qtitle.length;
                if(counter > num){
                    var sub = qtitle.substring(0,num);
                    obj.val(sub);
                }
            })  
        },
        askErrPro : function(){
            var _this = this;
            var  askFlag = true;
            $('.ask_btn').on('touchstart',function(){
                _this.nullErrPro($('.ask_tlt'),'问题标题不能为空');
                var counter = $('.ask_tlt').val().length;
                if(counter == 0){
                    errorshow('问题标题不能为空');
                    return false;
                }
                else if(counter > 0 && counter < 5){
                    errorshow('问题标题太短，要求不少于5个字');
                    return false;
                }
                else if(counter >= 5 && askFlag == true){
                    var title = $('.ask_tlt').val();
                    var content = $('.ask_con').val();
                    askFlag = false;
                    $('.login_msg').css('display','none');
                    $.ajax({
                        url:'http://m.shejiben.com/user/submitask',
                        type:'POST',
                        data:{'act':'sjbnewask','title':title,'content':content},
                        dataType:'json',
                        success:function (data){
                            if(data.errorCode == 1){
                               // errorshow('发布成功');
                                window.location.href = data.url;
                            }  
                            else{
                                errorshow(data.errorMsg);
                            }              
                        }
                    })
                }  
            })
        },
        nullErrPro : function(obj,txt){
            var value = $.trim(obj.val());
            if(value == ''){
                errorshow(txt);
                return false;
            }
        },
        proWorks:function(){      //问答提问页提示文字的显示隐藏
            $('.ask_tlt,.ask_con').focus(function(){
                $(this).prev('.ask_ts').hide();
            })
            $('.ask_tlt,.ask_con').blur(function(){
                if($(this).val() == ""){
                    $(this).prev('.ask_ts').show();
                }  
            })
            $('.ask_ts').on('click',function(){
                $(this).next('.ask_tlt,.ask_con').focus();
            })
        },
        postAnswer:function(){     //回答和回复
            var flak = true;
            $('.answer_btn').on('touchstart',function(){
                var answerCon = $('.answer_con').val();
                if(answerCon != "" && flak == true){
                    flak = false;
                    var tid = $('#tid').val();
                    var type = $('#type').val();
                    var toid = $('#toid').val();
                    var aid= $('#aid').val();
                    $('.login_msg').css('display','none');
                    $.ajax({
                        url:'http://m.shejiben.com/user/repqt',
                        type:'POST',
                        data:{'id':tid,'type':type,'toid':toid,'ask_answer':answerCon,aid:aid,act:'sjbask'},
                        dataType:'json',
                        async:true,
                        success:function (data){
                            if(data.errCode == 1){
                               // errorshow(data.errMsg);
                                window.location.href = data.url;
                            }else{
                                errorshow(data.errMsg);
                            }
                        }
                    })
                } 
            })
        },
        myAskAnswer:function(){    //我的提问回答
            var _this = this;  
            var flagk = true;
            var flas = 0;  
            var askPage = 2; 
            var answerPage = 2;
            var isPageOne = true;       
            $('.my-answer').on('touchstart',function(){   //点击我的回答获取第一页的数据
                flas = 1;
                flagk = true;
                $('.answer-list').show();
                if($('.ask-list').length > 0){
                    $('.ask-list').hide();
                }else{
                    $('.ask-no-con').hide();
                }
                if(isPageOne){
                    $('.answer-list').html('');  
                    $.ajax({
                        url:'http://m.shejiben.com/user/myask',
                        type:'POST',
                        data:{'act':'answer','page':1},
                        dataType:'json',
                        async:true,
                        success:function (data){          
                             var listLength = data.aAsks.length; //获取的数据长度
                             var allpage = data.allpage;
                             $('.answer-list').attr('answerpage',allpage);
                             if(listLength == 0){
                                $('.answer-no-con').show();                                  
                             }else{
                                for(var i = 0; i < listLength; i++){
                                    $(".answer-list").append(createCon(data,i));
                                }
                                // var wiHeight = $(window).height(); 
                                // var answerList = $('.answer-list').height(); //我的回答
                                // if(answerList < wiHeight - 169){                                    
                                //     var answerListBottom = wiHeight - answerList -169;
                                //     $('.answer-list').css('margin-bottom',answerListBottom + 'px');
                                // }
                                                          
                             }                                           
                        }
                    })
                }  
                else{
                    var answerList = $('.answer-list').height();
                    if(answerList <= 0){
                        $('.answer-no-con').show();
                    }
                }
                isPageOne = false;                                                                 
            });
            $('.my-ask').on('touchstart',function(){
                flas = 0;
                flagk = true;
                $('.answer-list').hide();
                $('.answer-no-con').hide(); 
                if($('.ask-list').length <= 0){   
                    $('.ask-no-con').show();                                  
                }
                else{
                    $('.ask-list').show();
                }
            })            
            $(window).scroll(function(){
                if($('.ask-tab-tlts').length <= 0){return false;}
                var dataJson;
                var obj;
                var pageNum;
                var scrTop = $(this).scrollTop();
                var winHeight = $(document).height(); 
                var thisHeight = $(this).height();
                if(scrTop >= winHeight - thisHeight - 30){
                    if(flas == 0) {
                       aPage = askPage;
                       dataJson = {'act':'question','page':askPage};  //我的提问
                       obj = $('.ask-list'); 
                       pageNum = $('.ask-list').attr('askpage');                          
                    } else if (flas == 1) {
                       aPage = answerPage;
                       dataJson = {'act':'answer','page':answerPage};  //我的回答
                       obj = $('.answer-list');
                       pageNum  = $('.answer-list').attr('answerpage');
                    } 

                    if(flagk == false){
                        return false;
                    }
                    flagk = false;
                    $.ajax({
                        url: 'http://m.shejiben.com/user/myask',
                        type: "POST",
                        data: dataJson,
                        async: true,
                        dataType:'json',                                               
                        success:function(dataList){
                            var listLength = dataList.aAsks.length;
                            if(aPage < pageNum)
                            {                        
                                flagk = true;
                            }
                            else{
                                flagk = false;
                            }  
                            for(var i = 0; i < listLength; i++){
                                obj.append(createCon(dataList,i));
                            } 
                            if(flas == 0) {
                                askPage++;                         
                            } else if (flas == 1) {
                                answerPage++;
                            }  
                        }
                    });
                } 
                      
            })
            
            //我的提问回答tab切换
            $('.ask-tab-tlts').on('touchstart',function(){ 
                $(this).addClass('ask-tab-cur').siblings().removeClass('ask-tab-cur');    
            })

            //我的提问回答追加内容
            function createCon(info,i){
               var askClass = "";
               if(info.aAsks[i]['pic'] !== ""){
                   askClass = 'ask-hasimg';
              }
               var createCon ='<li class="ask-con ' + askClass + ' clearfix">\
                                    <a href="'+ info.aAsks[i]['detailUrl'][0] +'" class="ask-con-list">\
                                    <h2 class="ask-con-tlt">'+ info.aAsks[i]['title'] +'</h2>\
                                    <span class="ask-number clearfix">\
                                        <em class="ask-time">'+ info.aAsks[i]['fputdate'] +'</em>\
                                        <em class="answer-num">'+ info.aAsks[i]['comment_nums'] +'个回答</em>\
                                    </span>\
                              </a>';                                     
                              if(info.aAsks[i]['pic'] !== ""){
                                   createCon += '<a href="'+ info.aAsks[i]['detailUrl'][0] +'"  class="ask-con-img"><img  width="80" height="80" src="'+ info.aAsks[i]['pic'] +'" /></a>';
                              }
                createCon += '</li>';
                return createCon;
            }
        },
        createTop: function(){     //我的提问回答追加返回顶部按钮
            var thisUrl = window.location.href;
            thisUrl = thisUrl.split('?');
            thisUrl.pop();
            var myAskUrl = 'http://m.shejiben.com/user/myask';
            if(thisUrl == myAskUrl){
                var goTop ='<div id="scrollButton" class="scrollButton" style = "display:block;"></div>';
                $('body').append(goTop);
            }  
            $("#scrollButton").on('touchstart',function(){
                $(document.body).animate({scrollTop: top}, 400);

            })        
        }
    };
    askAnswer.init();


   
    /***问答搜索***/
    /***kiki添加于20160224***/
    var searchAsk = {
        init: function(){
            var _this = this;
            _this.searchAsk();
        },        
        searchAsk: function(){        //根据关键字搜索
            var _this = this;
            $('.search_btn').on('touchstart',function(){ 
                $('.ask-content-list').html('');                                  
                var searchKey = $('#searchKey').val();
                if(searchKey == ''){
                    alert('请输入关键字');
                }
                else{
                    var thisUrl = window.location.href;
                    var searchUrl = 'http://m.shejiben.com/search/ask';
                    _this.postAsk({'q': searchKey,'p': 1}); 
                    if(thisUrl == searchUrl){
                        var goTop ='<div id="scrollButton" class="scrollButton" style = "display:block;"></div>';
                        $('body').append(goTop);
                    }
                    $("#scrollButton").on('touchstart',function(){
                        $(document.body).animate({scrollTop: top}, 400);
                    })       
                }
            })
        },
        postAsk:function(dataAsk){
            var _this = this;
            $.ajax({
                url:'http://m.shejiben.com/search/ask',
                type:'POST',
                data:dataAsk,
                dataType:'html',
                async:true,
                success:function (data){
                     data=eval('('+data+')');
                      if(data.url){
                         window.location.href=data.url;
                          return false;
                      }
                      var listLength = data.askList.length;
                      var allpage = data.allPage;
                      $('#searchKey').attr('page',allpage);
                      if(listLength == 0){
                          $(".ask-content-list").prepend(_this.noCon());  
                      }
                      else{
                         for(var i = 0; i < listLength; i++){
                            $(".ask-content-list").append(_this.createCon(data,i));
                         }                         
                      }                                                                          
                },
                error:function (data){
                    alert(data);
                }
            })
            var sFlag = true;
            var sPage = 2;            
            $(window).scroll(function(){
                if($('.search_btn').length <= 0){return false;}
                var scrTop = $(this).scrollTop();
                var winHeight = $(document).height(); 
                var thisHeight = $(this).height();
                var searchKey = $('#searchKey').val();
                var pageNum = $('#searchKey').attr('page');                
               if(scrTop >= winHeight - thisHeight - 30){                    
                    if(sFlag == false){
                        return false;
                    }
                    sFlag = false;
                    $.ajax({
                        url: 'http://m.shejiben.com/search/ask',
                        type: "POST",
                        data: {'q': searchKey,'p': sPage},
                        async: true,
                        dataType:'json',                                               
                        success:function(dataList){
                            var listLength = dataList.askList.length;
                            if(sPage < pageNum)
                            {                        
                                sFlag = true;
                            }
                            else{
                                sFlag = false;
                            }  
                            for(var i = 0; i < listLength; i++){
                                $(".ask-content-list").append(_this.createCon(dataList,i));
                            }                      
                            sPage++;
                        }
                    });
                }     
            }) 
               
        },        
        createCon: function(info,i){
           var askClass = "";
           if(info.askList[i]['image_src'] !== ""){
               askClass = 'ask-hasimg';
            }
           var createCon ='<li class="ask-con '+ askClass +' clearfix">\
                                <a href="'+ info.askList[i]['url'] +'" class="ask-con-list">\
                                <h2 class="ask-con-tlt">'+ info.askList[i]['title'] +'</h2>\
                                <span class="ask-number clearfix">\
                                    <em class="ask-time">'+ info.askList[i]['createtime'] +'</em>\
                                    <em class="answer-num">'+ info.askList[i]['comment_nums'] +'个回答</em>\
                                </span>\
                          </a>';                                     
          if(info.askList[i]['image_src'] !== ""){
               createCon += '<a href="'+ info.askList[i]['url'] +'"  class="ask-con-img"><img  width="80" height="80" src="'+ info.askList[i]['image_src'] +'" /></a>';
          }
            createCon += '</li>';
            return createCon;
        },      
        noCon:function(){      
            $(".ask-content-list").html('');
            var searchKey = $('#searchKey').val();
            var createCon = '<li style="text-align:center;line-height:80px;">找到0个 “'+searchKey+'” 相关结果</li>';
            return createCon;
        }
    }
    searchAsk.init();   
});

function showMore(thisObj)
{
    thisText = $(thisObj).text();
    if(thisText=='更多'){
      $('#softDesc').find("p:gt(1)").show();
      $(thisObj).text('收起');
      $('.details-msg').addClass('details-msgd');
    }else{
      $('#softDesc').find("p:gt(1)").hide();
      $(thisObj).text('更多');
      $('.details-msg').removeClass('details-msgd');
    }
}


/* 自定义弹窗 */
var myAlert = {

    btnText : '确定',
    jumpUrl : '',
    isJump  : false,

    show: function(msgText, btnText, isJump, jumpUrl){
        this.msgText = msgText;
        this.btnText = btnText || this.btnText;
        this.jumpUrl = jumpUrl || this.jumpUrl;
        isJump = isJump || this.isJump;
        html = '<div class="myOverlay"></div>';
        html += '<div class="myAlert"><p>'+this.msgText+'</p><input type="button" id="alertClose" value="'+this.btnText+'" /></div>';
        $(document.body).append(html);
        $('.myOverlay').show();
        if(isJump == false){
            $('#alertClose').click(this.close);
        }else{
            $('#alertClose').click(this.jump);
        }
    },
    
    close: function(){
        $('.myOverlay,.myAlert').remove();
    },

    jump: function(){
        $('.myOverlay,.myAlert').remove();
        location.href = jumpUrl;
    }
}

/**
 * 来源统计 By Reson 20150827
 */
function checkCookie() {
    var valsource = getCookie( 'sourcepage', 1 );
    var valland = getCookie( 'landpage', 1 );
    var sourcepage = document.referrer;
    var landpage = location.href;
    if( sourcepage!='' ) {
        var domain = sourcepage.split('/');
        if( domain[2] ) {
            domain = domain[2];
        } else {
            domain = sourcepage;
        }
    } else {
        var domain = '';
    }
    //新规则，每次进来如果来源不同，则更新
    if ( !valsource || ( domain.indexOf('shejiben.com') == -1 && valsource != sourcepage ) ) {
        setCookie( 'sourcepage', encodeURI(sourcepage), 90*3600*24, 1, 'shejiben.com' );
    }
    
    if ( !valland || domain.indexOf('shejiben.com') == -1 ) {
        setCookie( 'landpage', encodeURI(landpage), 90*3600*24, 1, 'shejiben.com' );
    }
}

function setCookie(name, value, expire, pre, domain) {
    if (!expire) {
        expire = 5000
    };
    if (pre) {
        name = 'to8to_' + name
    };
    var expiry = new Date();
    expiry.setTime(expiry.getTime() + expire);
    var domain_url = '';
    if (domain) domain_url = 'domain=' + domain + ';';
    document.cookie = name + '=' + value + ';expires=' + expiry.toGMTString() + ';path=/;' + domain_url
};
function getCookie(name, pre) {
    if (pre) {
        name = 'to8to_' + name
    };
    var r = new RegExp("(\\b)" + name + "=([^;]*)(;|$)");
    var m = document.cookie.match(r);
    return (!m ? "": decodeURIComponent(m[2]))
};

//底部招标入口
function bottomZb(){
    var pagename=$('#page_value').attr('pagename');
    if( pagename == 'regok' || pagename == 'submitask'){
       return false;
    }
    if(jQuery('.botFloatBar').length > 0 || jQuery('.app_push_bottom').length > 0 || jQuery('#zbForm').length > 0 || jQuery('.no_app_push').length > 0){
        return false;
    }
    str='<a href="http://m.shejiben.com/zb/" class="app_push_bottom">\
            <div class="content">\
                <div class="overlay_bottom"></div>\
                <div class="logo">\
                    <img class="img_logo" src="http://img.shejiben.com/wap/new_wap/footer_zb.png"/>\
                    <img class="img_tips" src="http://img.shejiben.com/wap/new_wap/zb_img.png"/>\
                </div>\
                <div class="btn_download">\u7ACB\u5373\u7533\u8BF7</div>\
            </div>\
        </a>';  
    jQuery('body').append(str);  
    if(jQuery('#scrollButton').length > 0){
       jQuery('#scrollButton').css({'bottom':'70px'}); 
    } 
}
