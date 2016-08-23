define(function(require, exports, module) {
   var UI = require('ui');
    require('colorbox');
    var province = require('http://www.shejiben.com/gb_js/GlobalProvinces_module.js?20150911');
    var lazyObj = UI.lazyLoad($('img'));
    if($('#User_Shen').length > 0){
          province({
            elems : ['#User_Shen' , '#User_City'],
            placeHolders: ['省/市', '市/地区']
        });      
    }


    var picks = (function() {
        var jq = $;
        var timeStatus = 0;
        var scrollSpeed = 50;
        var image_id;
        var srcIndex;
        var commentTop = 0;
        var scrollStatus = 0;
        jq('#to_comment').live('click', function() {
            window.scrollTo(0, jq('#comment_input')[0].offsetTop);
        });

        return {

            hideTopicDialog: function(speed) {
                jq('#sharp2').hide(speed);
                jq('#topic_dialog').hide(speed);
            },

            showTopicDialog: function(speed) {
                jq('#sharp2').show(speed);
                jq('#topic_dialog').show(speed);
            },

            setTopicDialogShow: function() {
                jq('#add_topic').click(function() {
                    picks.showTopicDialog('slow');
                });
            },

            setTopicDialogHide: function() {
                jq('#close_dialog').click(function() {
                    picks.hideTopicDialog('slow');
                });
            },

            setNoticeDialog: function() {
                jq('#add_img').mouseover(function() {
                    jq('#share_dialog').show();
                    jq('#sharp3').show();
                }).mouseout(function() {
                    timeStatus = setTimeout(picks.hideShareDialog, 500);
                });
                jq('#share_dialog').mouseover(function() {
                    clearTimeout(timeStatus);
                }).mouseout(function() {
                    timeStatus = setTimeout(picks.hideShareDialog, 500);
                });
            },

            hideShareDialog: function() {
                jq('#share_dialog').hide();
                jq('#sharp3').hide();
            },

            showMessageBox: function() {
                jq('.visits').mouseover(function() {
                    jq(this).append('<em class="msg_box">浏览数</em>');
                }).mouseout(function(event) {
                    jq('.msg_box').remove();
                });
                jq('.collections').mouseover(function() {
                    jq(this).append('<em class="msg_box">图片数</em>');
                }).mouseout(function(event) {
                    jq('.msg_box').remove();
                });
            },

            addTopic: function() {
                jq('.add_tag').bind('click', function() {
                    clearTimeout(timeStatus);
                    jq('#notice_s').remove();
                    jq(this).unbind('click');
                    jq(this).get(0).className = 'on';
                    jq(this).append('<em id="notice_s">添加成功，小编收到了哟~</em>');
                    jq('#notice_s').fadeIn('slow', function() {
                        timeStatus = setTimeout(picks.removeNotice, 2000);
                    });
                    var keywords = jq(this).text(),
                        hotid = jq(this).attr('data-id');
                    jq.ajax({
                        url: 'http://www.shejiben.com/linggantuji/',
                        type: 'POST',
                        dataType: 'text',
                        data: {
                            keywords: keywords,
                            ajax: 1,
                            hotid: hotid
                        }
                    })
                });
            },

            setOrder: function() {
                jq('.order_link').click(function() {
                    var order = jq(this).attr('data');
                    var setFrom = jq('<form method="post" action="http://www.shejiben.com/linggantuji/"><input type="hidden" name="orderby" value="' + order + '"></form>');
                    setFrom.submit();
                })
            },

            removeNotice : function() {
                jq('#notice_s').fadeOut('400', function() {
                    jq('#notice_s').remove();
                });
            },

            getTop100 : function() {
                return false;
                //TOP100排行数据
                jq.ajax({
                    url: '?',
                    type: 'POST',
                    dataType: 'json',
                    data: {act: 'top100'},
                    success: function(res) {
                        jq('#add_data').remove();
                        jq('#top100').append(res.html);
                        // jq('#make_gold_c').html(res.ask);
                        var speed = 50;
                        if(jq("#new_get_order").height() > 329){
                            jq("#new_get_order").height(329);
                            var MyMar=setInterval("scrollTT()",speed);
                            jq("#new_get_order").mouseover(function(){clearInterval(MyMar)});
                            jq("#new_get_order").mouseout(function(){MyMar=setInterval("scrollTT()",speed)});
                        }
                        var disabledLinkCss = {
                            color: "grey",
                            cursor: "default",
                            "text-decoration": "none"
                        };
                        var enabledLinkCss = {
                            color: "#3D8901",
                            cursor: "pointer",
                            "text-decoration": "none"
                        }
                        //var todayList = jq("#hzCommunityTodayList");
                        var weekList = jq("#hzCommunityWeekList");
                        var monthList = jq("#hzCommunityMonthList");
                            //jq('#hzCommunityTodayList .hzCommunityTopContributorEntry').pagination();
                            jq('#hzCommunityWeekList .hzCommunityTopContributorEntry').pagination();
                            jq('#hzCommunityMonthList .hzCommunityTopContributorEntry').pagination();
                        //todayList.hide();
                        weekList.show();
                        monthList.hide();
                        jq("#hzCommunityDateWindow").on("click","a.enabledLink",function changeList(event){
                            var this_s = jq(this);
                            if (this_s.hasClass("todayLink")){
                                //todayList.find("[class^='page']").hide();
                                //todayList.find(".page0").show();
                                jq("a.prevLink").addClass("disabled").css(disabledLinkCss);
                                jq("a.nextLink").addClass("enabled").css(enabledLinkCss);
                                //todayList.show();
                                weekList.hide();
                                monthList.hide();
                                this_s.parent().find(".disabledLink").removeClass("disabledLink").addClass("enabledLink");
                                this_s.removeClass("enabledLink").addClass("disabledLink");
                            } else if (this_s.hasClass("weekLink")){
                                weekList.find("[class^='page']").hide();
                                weekList.find(".page0").show();
                                jq("a.prevLink").addClass("disabled").css(disabledLinkCss);
                                jq("a.nextLink").addClass("enabled").css(enabledLinkCss);
                                //todayList.hide();
                                weekList.show();
                                monthList.hide();
                                this_s.parent().find(".disabledLink").removeClass("disabledLink").addClass("enabledLink");
                                this_s.removeClass("enabledLink").addClass("disabledLink");
                            } else if (this_s.hasClass("monthLink")){
                                monthList.find("[class^='page']").hide();
                                monthList.find(".page0").show();
                                jq("a.prevLink").addClass("disabled").css(disabledLinkCss);
                                jq("a.nextLink").addClass("enabled").css(enabledLinkCss);
                                //todayList.hide();
                                weekList.hide();
                                monthList.show();
                                this_s.parent().find(".disabledLink").removeClass("disabledLink").addClass("enabledLink");
                                this_s.removeClass("enabledLink").addClass("disabledLink");
                             }
                            event.preventDefault();
                    });

                    jq("span#hzCommunityDateWindow").on("click","a.disabledLink",function(event){
                        event.preventDefault();
                    });
                    }
                })
            },

            changeGold :  function() {
                if (jq('.golden').length > 0) {
                   jq('.golden').mouseover(function() {
                        jq('#box_list').show();
                   }).mouseout(function(event) {
                        jq('#box_list').hide();
                   });
                }
            },

            checkFormData : function() {
                if (jq('.send_comment_btn').length > 0) {
                    jq('.send_comment_btn').click(function() {
                        // if (!to8to_uid) {
                        //     document.domain = 'shejiben.com';
                        //     showSingleLogin(2,2);
                        //     return false;
                        // }
                        var comment = jq('#comment_input').val();
                        var ckey = jq('#ckey').val();
                        if(comment==''){
                            alert('请输入评论内容');
                            return false;
                        }
                        jq('.send_comment_btn').attr('disabled','disabled').val('提交..');
                        var url = window.location.href;
                        jq.post(url, {"act":"addCmt", "comment":comment, "key":ckey}, function(res){
                            if(res.error==0){
                                alert(res.msg);
                                jq('#comment_input').val('').blur();
                                jQuery('.sub_btn').attr('disabled','disabled').css('background','#f79b9c');
                            } else {
                                alert(res.msg);
                            }
                            jq('.send_comment_btn').val('提交');
                        }, 'json');
                        
                    })
                }
            },

            setScroll : function() {
                jq.ajax({
                    url: '?',
                    type: 'POST',
                    dataType: 'json',
                    data: {'ajax': 1, 'add_gold':1},
                    success : function(data) {
                        if (typeof data != 'undefined' && data.html) {
                            jq('#make_gold_c').html(data.html);
                            if(jq("#new_get_order").height() > 319){
                                jq("#new_get_order").height(320);
                                var MyMar=setInterval(picks.scrollTT,scrollSpeed);
                                jq("#new_get_order").mouseover(function(){clearInterval(MyMar)});
                                jq("#new_get_order").mouseout(function(){MyMar=setInterval(picks.scrollTT,scrollSpeed)});
                            }
                        } else {
                            jq('#make_gold_c').html('<p>暂无数据</p>');
                        }
                    }
                });
                
            },

            scrollTT : function() {
                var obj = jq('#new_get_order');
                var obj1 = obj.children('UL').get(0);
                var obj2 = obj.children('UL').get(1);
                obj = obj.get(0);
                if(obj2.innerHTML == '')
                    obj2.innerHTML = obj1.innerHTML;

                if(obj2.offsetTop - obj.scrollTop <= 0){
                    obj.scrollTop -= obj1.offsetHeight;
                }else{
                    obj.scrollTop++;
                }
            },
            Login : function() {
                document.domain = "shejiben";
                showSingleLogin(2,2);
            },
            hideCommentLine : function() {
                if (jq('.comment_content').length > 0) {
                    jq('.comment_content').last().css('border','none');
                }
            },

            LoadImages : function(number) {
                if (!SJB.GLOBAL_VAR.to8to_uid) {
                    document.domain = 'shejiben.com';
                    showSingleLogin(2,2);
                    return false;
                }
                var imgLen = start = jq('.takeNum').length;
                if (start > 0) {
                    start = start - 1;
                    var html_tags = '';
                    var key = 0;
                    jq.each(thumb_list, function(index, thisVal) {
                        if (index > start && key < number) {
                            if (((Math.floor(index/3) * 3) + 1) == index) {
                                html_tags += '<span class="atlas_pic_list simg takeNum smiddle">';
                            } else {
                               html_tags += '<span class="atlas_pic_list simg takeNum">'; 
                            }
                            html_tags += '<span class="img simg"><a href="http://www.shejiben.com/works/'+thisVal.id+'/" class="preview-box" title="'+thisVal.name+'" data-id="'+thisVal.id+'" rel="0"><img width="230" height="230" class="thumbnail" src="'+thisVal.img_url_lager+'" data-src="'+thisVal.img_url_lager+'" data-original="'+thisVal.img_url_lager+'" alt="" title="'+thisVal.name+'"  data="'+thisVal.img_url_lager+'"></a><span class="wrap1"><span class="ahoveradd new_ahoveradd newleft"><a href="javascript:;" class="add_atlas addCollection addCollection_new" data-id="'+thisVal.id+'" ></a><a href="javascript:;" class="add_atlas addQuestion addQuestion_thumb addQuestion_thumb_new" data-id="'+thisVal.id+'" ></a></span></span></span></span>';
                            key++;
                        }
                    });
                    if (html_tags == '') {
                        alert('没有了'); 
                        jq('#loadImg').remove(); 
                    } else {
                        jq('.left_fix').first().before(html_tags);
                        var len = (imgLength - imgLen -5) > 0 ? (imgLength - imgLen -5) : 0;
                        if (len > 0) {
                            jq('#loadImg').html('加载更多图片');
                        } else {
                            jq('#loadImg').remove();
                        }
                        picks.initBindClickFun();
                    }
                }
            },

            initBindLoadFun : function() {
                if (jq('#loadImg').length > 0) {
                    jq('#loadImg').click(function() {
                        picks.LoadImages(5);
                    })
                }
            },

            initLoadBigImage : function() {
                if (jq('#loadImg_bsize').length > 0) {
                    jq('#loadImg_bsize').click(function() {
                        if (!SJB.GLOBAL_VAR.to8to_uid) {
                            document.domain = 'shejiben.com';
                            showSingleLogin(2,2);
                            return false;
                        }
                        var imgLen = start = jq('.loadBimg').length;
                        if (start > 0) {
                            start = start - 1;
                            var html_tags = '';
                            var key = 0;
                            var number = 9;
                            jq.each(thumb_list, function(index, thisVal) {
                                if (index > start && key < number) {
                                    html_tags += '<li class="loadBimg"><div class="col_wrap">';
                                    if (thisVal.id < 852000) {
                                        html_tags += '<a hidefocus href="http://www.shejiben.com/works/'+thisVal.id+'/" class="preview-box" title="'+thisVal.name+'" data-id="'+thisVal.id+'" onselectstart="return false" ondragstart="return false" oncontextmenu="return false">';
                                    } else {
                                        html_tags += '<a hidefocus href="http://www.shejiben.com/works/'+thisVal.id+'.html" class="preview-box" title="'+thisVal.name+'" data-id="'+thisVal.id+'" onselectstart="return false" ondragstart="return false" oncontextmenu="return false">';
                                    }
                                    html_tags += '<img class="thumbnail" src="'+thisVal.img_url_lager+'" data-src="" alt="'+thisVal.name+'" title="'+thisVal.name+'" data="'+thisVal.img_url_lager+'"  onselectstart="return false" ondragstart="return false" oncontextmenu="return false"></a>';
                                    html_tags += '<span class="wrap1"><span class="ahoveradd new_ahoveradd"><a href="javascript:;" class="add_atlas addCollection addCollection_new" data-id="'+thisVal.id+'"><em></em>收藏</a><a href="javascript:;" class="add_atlas addQuestion addQuestion_thumb addQuestion_thumb_new" data-id="'+thisVal.id+'"><em></em>提问</a></span></span></div>';
                                    html_tags += '<p class="col_p"></p></li>';

                                    key++;
                                }
                            });
                            if (html_tags == '') {
                                alert('没有了');
                                jq('#loadImg_bsize').remove();  
                            } else {
                                jq('.show_atlas ul').append(html_tags);
                                var len = (imgLength - imgLen -9) > 0 ? (imgLength - imgLen -9) : 0;
                                if (len > 0) {
                                    jq('#loadImg_bsize').html('加载更多图片');
                                } else {
                                    jq('#loadImg_bsize').remove();
                                }
                                picks.initBindClickFun();
                            }
                        }
                    })
                }
            },

            initLoadSmallImage : function() {
                if (jq('#loadImg_ssize').length > 0) {
                    jq('#loadImg_ssize').click(function() {
                        if (!SJB.GLOBAL_VAR.to8to_uid) {
                            document.domain = 'shejiben.com';
                            showSingleLogin(2,2);
                            return false;
                        }
                        var imgLen = start = jq('.atlas_pic_list').length;
                        if (start > 0) {
                            start = start - 1;
                            var html_tags = '';
                            var key = 0;
                            var number = 9;
                            jq.each(thumb_list, function(index, thisVal) {
                                if (index > start && key < number) {

                                    var smiddle = key%3==1 ? ' smiddle' : '';
                                    var is852000 = thisVal.id<852000 ? thisVal.id+'/' : thisVal.id+'.html';
                                    html_tags += '<span class="atlas_pic_list simg takeNum'+smiddle+'">';
                                    html_tags += '<a href="http://www.shejiben.com/works/'+is852000+'" class="preview-box" title="'+thisVal.name+'" data-id="'+thisVal.id+'" rel="">';
                                    html_tags += '<img width="211" height="211" class="thumbnail" src="'+thisVal.img_url_s+'" data-src="" alt="'+thisVal.name+'" title="'+thisVal.name+'"  data="'+thisVal.img_url_s+'">';
                                    if (thisVal.level==16){
                                        html_tags += '<span class="pic_level"><code></code><b><br><br>正在审核中,仅自己可见。<br>我们将尽快为您审核。</b></span>';
                                    }
                                    html_tags += '</a>';
                                    html_tags += '<span class="wrap1"><span class="ahoveradd new_ahoveradd newleft"><a href="javascript:;" class="add_atlas addCollection addCollection_new" data-id="'+thisVal.id+'"><em></em>收藏</a><a href="javascript:;" class="add_atlas addQuestion addQuestion_thumb addQuestion_thumb_new" data-id="{$thumbnail[id]}"><em></em>提问</a></span></span></span>';

                                    key++;
                                }
                            });
                            if (html_tags == '') {
                                alert('没有了');
                                jq('#loadImg_ssize').remove();  
                            } else {
                                jq('.show_atlas_small').append(html_tags);
                                var len = (imgLength - imgLen -9) > 0 ? (imgLength - imgLen -9) : 0;
                                if (len > 0) {
                                    jq('#loadImg_ssize').html('加载更多图片');
                                } else {
                                    jq('#loadImg_ssize').remove();
                                }
                                picks.initBindClickFun();
                            }
                        }
                    })
                }
            },

            initBindClickFun : function() {
                if (jq(".atlas_pic_list .img").length > 0) {
                    jq(".atlas_pic_list .img").hover(function() {
                        jq(this).find(".ahoveradd").show(); //光标经过
                    }, function() {
                        jq(this).find(".ahoveradd").hide(); //光标移出
                    });          
                }

                if (jq(".case_list .col_wrap").length > 0) {
                    jq(".case_list .col_wrap").hover(function() {
                        jq(this).find(".ahoveradd").show(); //光标经过
                    }, function() {
                        jq(this).find(".ahoveradd").hide(); //光标移出
                    });
                }
                SJB.ActionCollection.init(jQuery('.addCollection'));
            },

            initBindBox : function() {
                jq("#lbNavigationLeft").live('click',function(){   /*上一张*/
                    if(!jq.browser.msie){
                        var click_id = jq("#lbMainimg img").attr("data-id");
                        var idUrl = (jq(this).attr("data-id") < 852000) ? jq(this).attr("data-id")+'/' : jq(this).attr("data-id")+'.html';
                        window.history.replaceState({},click_id,'/works/'+idUrl);
                    }
                    if(jq(this).attr('type')=='tlist')
                    {/*当前页面的列表*/
                        jq("#lbMainimg").html('');
                        if(arrayObj[(parseInt(jscurrentPage)-1)] && jscurrentPage!=0 && jq(this).attr("rel")== 0)
                        {
                            for(var i=0;i < arrayObj[(parseInt(jscurrentPage)-1)]['user'].length;i++)
                            {
                                if(jq(this).attr("data-id")==arrayObj[(parseInt(jscurrentPage)-1)]['user'][i].id)
                                {   
                                    lbRootData(jq(this).attr("data-id"),parseInt(jscurrentPage)-1); 
                                    jscurrentPage=parseInt(jscurrentPage)-1;
                                    return false;
                                }
                            }
                        }
                        lbRootData(jq(this).attr("data-id"),parseInt(jscurrentPage));
                    }
                    else if(jq(this).attr('type')=='tone')
                    {/*原创的整套图集*/
                        jq("#lbMainsmallimg").html('');
                        lbRootDatatOne(jq(this).attr("data-id"),up);
                    }
                    else if(jq(this).attr('type')=='cone')  
                    {/*原创的整套案例*/
                        jq("#lbMainsmallimg").html('');
                        lbRootDatacOne(jq(this).attr("data-id"),up);
                    }
                    return false;
                });
                jq("#lbNavigationRight").live('click',function(){  /*下一张*/
                    if(!jq.browser.msie){
                        var click_id = jq("#lbMainimg img").attr("data-id");
                        var idUrl = jq(this).attr("data-id") < 852000 ? jq(this).attr("data-id")+'/' : jq(this).attr("data-id")+'.html';
                        window.history.replaceState({},click_id,'/works/'+idUrl);
                    }
                    if(jq(this).attr('type')=='tlist')
                    {
                        jq("#lbMainimg").html('');
                        if(arrayObj[(parseInt(jscurrentPage)+1)] && (parseInt(jscurrentPage)+1) <= PageCount && jq(this).attr("rel")==arrayObj[(parseInt(jscurrentPage))]['user'].length-1)
                        {
                            for(var i=0;i < arrayObj[(parseInt(jscurrentPage)+1)]['user'].length;i++)
                            {
                                if(jq(this).attr("data-id")==arrayObj[(parseInt(jscurrentPage)+1)]['user'][i].id)
                                {   
                                    lbRootData(jq(this).attr("data-id"),parseInt(jscurrentPage)+1); 
                                    jscurrentPage=parseInt(jscurrentPage)+1;
                                    return false;
                                }
                            }
                        }
                        lbRootData(jq(this).attr("data-id"),parseInt(jscurrentPage));
                    }
                    else if(jq(this).attr('type')=='tone')
                    {
                        jq("#lbMainsmallimg").html(''); 
                        lbRootDatatOne(jq(this).attr("data-id"),down);
                    }
                    else if(jq(this).attr('type')=='cone')
                    {
                        jq("#lbMainsmallimg").html('');
                        lbRootDatacOne(jq(this).attr("data-id"),down);
                    }
                    return false;
                });

                jq(".preview-box").live('click',function(){    /*处理图集当前列表*/
                    if ( jq.browser.msie && jq.browser.version == '6.0'){
                        if(jq("#destopimg").size() > 0)
                            jq("#destopimg").hide();
                        if(jq("#head_menubar").size() > 0)
                            jq("#head_menubar").hide();
                        jq("#the_page").css({"height":'0px'});
                        jq("#the_page").css("overflow",'hidden');
                    }
                    
                    jq("#lbNavigationLeft").attr("type","tlist");
                    jq("#lbNavigationRight").attr("type","tlist");
                    jq('#the_page').hide();
                    jq('#lbRoot').show();
                    jq("#lbMainimg").html('');
                    jq("#lbMainimg").show();
                    jq("#lbMainsmallimg").hide('');
                    jscurrentPage=currentPage;
                    lbRootData(jq(this).data('id'),parseInt(currentPage));
                    return false;
                })

                jq(".fadeOutOnExit").live("click",function (){  /*在单个里点击返回列表*/
                    jq("#lbNavigationLeft").attr("type","tlist");
                    jq("#lbNavigationRight").attr("type","tlist");
                    jq('.fadeOutOnExitDiv').html("");
                    jq("#lbMainimg").show();
                    jq("#lbMainsmallimg").hide();
                    lbRootData(jq("#lbMainimg img").attr('data-id'),parseInt(jscurrentPage));;
                })

                jq(".preview-box-cone").live("click",function(){    /*如果是案例  点击右边单个 查看整套案例*/
                    jq("#lbMainimg").hide();
                    jq("#lbNavigationLeft").attr("type","cone");
                    jq("#lbNavigationRight").attr("type","cone");
                    var cid=jq(".category").val();
                    var dataid=jq(this).data('id');
                    jq('.fadeOutOnExitDiv').html('<a href="#" class="fadeOutOnExit" id="lbContextBreadcrumbs"><div class="crumb"><div class="crumbArrow"></div><div class="crumbArrow"></div><img class="crumbImage" src="'+jq("#lbMainimg img").attr('src')+'" width=60 height=60><div class="crumbType">返回浏览</div></div></a>');
                    arrayRightObjOne=new Array();
                    jq.ajax({
                        url: 'http://www.shejiben.com/piwigo/linggantujidata.php', 
                        type: 'POST', 
                        data:{'cid':cid,'img_id':jq(this).data('id'),'type':'cOneData'}, 
                        dataType: 'json', 
                        beforeSend:function(){
                            jq(".lbObjName").hide();
                            jq(".lbcase_img").hide();
                            jq(".lbCommentTitle").hide();
                            jq(".lbCommentData").hide();
                            jq(".lbQuestionTitle").html('');
                            jq(".lbQuestionData").html('');
                            jq("#lbMainsmallimg").html("");
                            jq("#lbMainsmallimg").show();
                        ;}, 
                        success: function(result){
                            if(result)
                            {
                                arrayRightObjOne[0]=result;
                                up=down=0;
                                lbRootDatacOne(dataid,0);
                            }
                        } 
                    });
                    return false;
                })

                jq(".preview-box-tone").live("click",function(){
                    jq("#lbNavigationLeft").attr("type","tone");
                    jq("#lbNavigationRight").attr("type","tone");
                    jq("#lbMainimg").hide();
                    var cid=jq(".category").val();
                    var dataid=jq(this).data('id');
                    jq('.fadeOutOnExitDiv').html('<a href="#" class="fadeOutOnExit" id="lbContextBreadcrumbs"><div class="crumb"><div class="crumbArrow"></div><div class="crumbArrow"></div><img class="crumbImage" src="'+jq("#lbMainimg img").attr('src')+'" width=60 height=60><div class="crumbType">返回浏览</div></div></a>');
                    jq.ajax({
                        url: 'http://www.shejiben.com/piwigo/linggantujidata.php', 
                        type: 'POST', 
                        data:{'cid':cid,'img_id':jq(this).data('id'),'type':'tOneData'}, 
                        dataType: 'json', 
                        beforeSend:function(){
                            jq(".lbObjName").hide();
                            jq(".lbcase_img").hide();
                            jq(".lbCommentTitle").hide();
                            jq(".lbCommentData").hide();
                            jq(".lbQuestionTitle").html('');
                            jq(".lbQuestionData").html('');
                            jq("#lbMainsmallimg").html("");
                            jq("#lbMainsmallimg").show();
                        ;}, 
                        success: function(result){
                            if(result)
                            {
                                arrayRightObjOne[0]=result;
                                lbRootDatatOne(dataid,0);
                            }
                        } 
                    });
                    return false;
                })


                jq("#lbAnchors .more").live("click",function(){
                    jq(this).hide();    
                    jq.ajax({
                        url: 'http://www.shejiben.com/piwigo/linggantujidata.php', 
                        type: 'POST', 
                        data:{'img_id':jq(this).data('id'),'type':'CommentData'}, 
                        //dataType: 'json', 
                        beforeSend:function(){
                        ;}, 
                        success: function(result){
                            if(result)
                                jq(".lbCommentData").html(result);
                                jq(".lbCommentData").show();
                                ImitateScrolling('lbAnchors','shower');
                        } 
                    });                                         
                })
                //图片提问更多显示
                jq("#lbAnchors .moreQuestion").live('click',function(){
                    jq(this).hide();
                    jq(".lbQuestionData").children('.ask_user').css('display','');
                    ImitateScrolling('lbAnchors','shower');
                });
                var urlHref=window.location.href;
                jq(".lbBg_colosed").click(function(){
                    if(!jq.browser.msie)
                        window.history.replaceState({},'',urlHref);
                    
                    if ( jq.browser.msie && jq.browser.version == '6.0'){
                        if(jq("#destopimg").size() > 0)
                            jq("#destopimg").show();
                        if(jq("#head_menubar").size() > 0)
                            jq("#head_menubar").show();
                        jq("#the_page").css("height",'auto');
                        //jq("#the_page").css("overflow",'auto');
                    }
                    
                    jq('.fadeOutOnExitDiv').html('');
                    jq('#lbRoot').hide();
                    jq('#the_page').show();
                    return false;
                })

                jq('#lbImage').hover(function(){
                   jq(".disNOne").show();
                  },function(){
                    jq(".disNOne").hide();
                });
            },

            collectionByOneClick : function() {
                if ($('#oneclick').length > 0) {
                    $('#oneclick').live('click',function() {
                        if (!SJB.GLOBAL_VAR.to8to_uid) {
                            document.domain = 'shejiben.com';
                            SJB.showSingleLogin(2,2);
                            return false;
                        }
                        jq('#is_index').val('index');
                        if (jq('.takeNum').length <= 0 && jq('.loadBimg').length <= 0) {
                            alert('没有可收藏的图片');
                            return false;
                        }
                        var src = jq('.thumbnail').first().attr('src'),
                            image_id = collectionId,
                            alt = jq('.preview-box').first().attr('title');
                        document.domain = 'shejiben.com';
                        jQuery.colorbox({
                            iframe: true,
                            title: '我要收藏这套图',
                            href: "http://www.shejiben.com/works/add_collections.php?act=add_collection&src=" + src + '&image_id=' + image_id + '&alt=' + alt + '&is_index=' + jq("#is_index").val() + '&_='+Math.random(),
                            opacity: "0.5",
                            height: "340",
                            width: "530",
                            onComplete: function() {}
                        });
                    })
                }
            },

            initPagePosition : function() {
                var page = jq('#the_page').length ? jq('#the_page') : jq('.content_width');
                var offsetLeft = page.offset().left;
                var offsetTop  = jq(window).height();
                var positionTop = (offsetTop - 84) / 2;
                if(jq('#goTop').length > 0){
                    var fwindowHeight = jq('#goTop').offset().top + 66;  //底部悬浮框    
                }
                else{
                    var fwindowHeight = jq('.subColumnMark').offset().top + 66;  //底部悬浮框 
                }

                commentTop = positionTop + 100;
                jq('.nextPageT').css({'right':'30px', 'top':positionTop + 'px'});
                jq('.prePageT').css({'left':'30px', 'top':positionTop + 'px'});
                jq('#to_comment').css({'right':(offsetLeft + 990 + 20) + 'px', 'top': commentTop + 'px'});
                picks.onScrollFun('to_comment');
                // jq('.PageT').show();
                jq('.PageT').mouseover(function() {
                    jq(this).css('background', '#373737');
                    jq(this).find('.pagel').addClass('pagel_on');
                    jq(this).find('.pager').addClass('pager_on');
                    jq(this).find('.pimg').show();
                }).mouseout(function() {
                    jq(this).css('background', '');
                    jq(this).find('.pagel').removeClass('pagel_on');
                    jq(this).find('.pager').removeClass('pager_on');
                    jq(this).find('.pimg').hide();
                });
                if(typeof myLen != 'undefined'){
                    jq('#loadImg').html('加载更多图片');
                    jq('#loadImg_bsize').html('加载更多图片');
                }
            },

            onScrollFun : function(elementid) {
                jq(document).scroll(function(event) {
                    if (jq(document).scrollTop() > 0) {
                        jq('#'+elementid).show();   
                    } else {
                        jq('#'+elementid).hide();
                    }
                    jq('#'+elementid).show(); 
                    jq('#'+elementid).css('top', commentTop + 'px');
                });
            },

            stopScrollFun : function () {
                setTimeout(function() {
                    jq('.PageT').hide();
                }, 1000);
            },

            resizeMargin : function(obj) {
                if (jq(obj).parents('.col_wrap').prev().length > 0) {
                    var barrier = jq(obj).parents('.col_wrap').prev();
                    var thisL = barrier.prev();
                    var imgH = jq(obj).height();
                    var ImgW = jq(obj).width();
                    var marginT = ((imgH - 60) / 2);
                    var marginL = ((ImgW - 190) / 2);
                    thisL.css('width', ImgW + 'px');
                    thisL.css('height', imgH + 'px');
                    barrier.css('top', marginT + 'px');
                    barrier.css('left', marginL + 'px');
                    barrier.show();
                }
            },

            showReplyBox: function() {
                if (jq('.replybtn').length > 0) {
                    jq('.replybtn').live('click', function() {
                        var index = jq('.replybtn').index(jq(this));
                        jq('.comment_hf').eq(index).show();
                    })
                }
            },

            hideCommit : function(id) {
                jq('#hf_'+id).hide();
            },

            hfComment : function(id) {
                if (!SJB.GLOBAL_VAR.to8to_uid) {
                    document.domain = 'shejiben.com';
                    showSingleLogin(2,2);
                    return false;
                }
                var comment = jq('#reply_'+id).val() || '';
                var fid     = id || 0;
                var nick    = jq('#userName .nick').text() || '';
                if (fid <= 0) return false;
                if (comment.replace(/[ ]/g,"") == '') {
                    alert('回复不能为空');
                    return false;
                } else {
                    jq('#sonSubBtn_'+id).attr('disabled','disabled').val('提交..');
                    jq.ajax({
                        url: '?',
                        type: 'POST',
                        dataType: 'json',
                        data: {fid: fid, comment: comment, uid:SJB.GLOBAL_VAR.to8to_uid, col_id:collectionId, nick: nick, act:'reply'},
                        success : function(data) {
                            if( data.error == '1' )
                            {
                                alert(data.msg);
                            } else {                            
                                alert(data.msg);
                                jq('#reply_'+id).val('').blur();
                                jq('#sonSubBtn_'+id).attr('disabled','disabled').css('background','#f79b9c');
                            }
                            jq('#sonSubBtn_'+id).val('提交');
                        }
                    })           
                }
            },
            showLeftRightBtn  : function() {
                jq(document).mousemove(function(event) {
                    /* Act on the event */
                    var d_w     = 990,
                        evt     = event || window.event,
                        max_w   = jq(window).width(),
                        _w      = (max_w - d_w) / 2,
                        _x      = evt.clientX;
                        if (_x <= _w) {
                            jq('.PageT').show();
                        } else if ( _x >= d_w + _w) {
                            jq('.PageT').show();
                        } else {
                            jq('.PageT').hide();
                        }
                });
            }
        }

    })();

    function picksInit(){
        picks.setTopicDialogShow();
        picks.setTopicDialogHide();
        picks.setNoticeDialog();
        picks.showMessageBox();
        picks.addTopic();
        //picks.setOrder();
        //picks.getTop100();
        picks.changeGold();
        picks.setScroll();
        picks.checkFormData();
        picks.hideCommentLine();
        picks.initBindLoadFun();
        picks.collectionByOneClick();
        picks.initPagePosition();
        picks.initLoadBigImage();
        picks.initLoadSmallImage();
        picks.resizeMargin();
        picks.showReplyBox();
        picks.showLeftRightBtn();
        picks.initBindClickFun();
        SJB.ActionAsk.init(jQuery('.addQuestion'));
     } 
        
    //左侧分享的添加
    function imgShare(){
        var num = jQuery('#colComNum').val();
        num = num.split('-');
        var img_share = '<div class="img_share">'
                            +'<div class="share_top">'
                                +'<a href="javascript:void(0)" class="a_01" id="oneclick"><i></i><em>'+num[0]+'</em></a>'
                                +'<a href="javascript:void(0)" class="a_02" id="toImgComment"><i></i><em>'+num[1]+'</em></a>'
                                +'<a href="javascript:void(0)" class="a_03"><i></i><em class="shareCount">0</em></a>'
                            +'</div>'
                            +'<div class="share_bottom" class="share_bottom">'
                                +'<a href="javascript:void(0)" class="bottom_a01"></a>'
                                +'<a href="http://www.shejiben.com/app/" target="_blank" class="bottom_a02"></a>'
                            +'</div>'
                        +'</div>';
        jQuery('body').append(img_share);
        shareColumnMark();
    }
    //左边分享等的定位
    function shareColumnMark() {
        var topAd = 0;
        topAd = jQuery('#top_add').is(':visible')?jQuery('#top_add').height():0;
        var winWidth=jQuery(window).width();
        var sHeight=jQuery(".img_share").height();
        var sWidth=jQuery(".img_share").width();
        var conWidth=jQuery(".img_content").width();
        var leftWidth=jQuery(".con_left").width();
        var tWidth=(winWidth-conWidth)/2;
        var w237Width=jQuery(".w237").width();
        var imgTop=topAd+203;
        if(tWidth>sWidth){
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


    //键盘输入提示文字隐藏
    // jQuery(".input_text").keydown(function(){
    //     jQuery(this).prev('label').hide();
    // });
    // jQuery(".input_text").live('blur',function(){
    //     if(jQuery(this).val()==''){
    //         jQuery(this).prev('label').show();
    //     }
    // });



    // 提交按钮可点与不可点,键盘输入提示文字隐藏
    jQuery(".input_text").live('keydown keyup change', function() {
        jQuery(this).prev('label').hide();
        if(!jQuery(this).val()==''){
            jQuery(this).next('.com_div .sub_btn').removeAttr("disabled").css("background","#dd4f50");
        }
        else{
            jQuery(this).next('.com_div .sub_btn').attr("disabled","disabled").css("background","#f79b9c");
        }
    });
    jQuery(".input_text").live('blur',function(){
        if(jQuery(this).val()==''){
            jQuery(this).prev('label').show();
        }
    });

      //点击回复出现回复框
    jQuery(".com_reply").bind('click',function(){     
        var comId = jQuery(this).attr('data-type');
        var appendCom = '<div class="com_div com_div01">'+
                            '<label class="def_value">说点什么吧！</label>'+
                            '<input type="text" class="input_text" name="input_text" id="reply_'+comId+'" />'+
                            '<input type="submit" class="sub_btn sub_btn_reply" value="提交" id="sonSubBtn_'+ comId +'" data-id="'+comId+'" disabled="disabled"/>'+
                        '</div>'                
        if(jQuery(this).next(".com_div01").length > 0){
            jQuery(this).next(".com_div01").remove();
        }else{
            jQuery(this).parents('li').siblings().find('.com_div01').remove();
            jQuery(this).after(appendCom);
        }   
    });
    $('.sub_btn_reply').live('click',function(){
        var comId = $(this).attr('data-id');
        picks.hfComment(comId);
    });

    //点击回复框边框变红
    jQuery(".input_text,.def_value").live('click',function(){
        if(!SJB.GLOBAL_VAR.to8to_uid){
            document.domain = "shejiben.com";
            SJB.showSingleLogin(2,2);
        }else{
            jQuery(this).parents(".com_div").css("border-color","#dd4f50");
        }    
    })
    jQuery(".input_text").live('blur',function(){
        jQuery(this).parents(".com_div").css("border-color","#e3e3e3");
    })
    //点击默认文字时输入框获得焦点
    jQuery('.def_value').live('click',function(){
        if(jQuery(this).length < 1){
            return false;
        }
        jQuery(this).next('.input_text').focus();
    });
    // 表单定位以及验证提交
            zsjFormPosition();
            jQuery('#zsjBtn').click(function() {
                SJB.postFrom(jQuery(this),112);
            });

    // 发需求表单定位以及提交成功后的提示弹窗
    function zsjFormPosition(){
        var scrollHeight = jQuery(document).scrollTop();
        var documentHeight = jQuery(document).height();
        jQuery('.w237').css({'height':jQuery('.con_left').height()});
        var topAd = 0;
        var hotAd = 0;
        topAd = jQuery('#top_add').length > 0 && jQuery('#top_add').is(':visible')?jQuery('#top_add').height():0;
        //图库列表页有热点广告位
        hotAd = jQuery('.operate_img').length != 0 ? 255 : 20;
        if(scrollHeight > 560){
            //小屏幕
            if(documentHeight - scrollHeight < 400+300){
                jQuery('#tjForm').css({'top':'auto','bottom':'0'});
            }
            //大屏幕
            else{
                jQuery('#tjForm').css('top',scrollHeight-210-topAd);
            }

        }
        //初始化
        else{
            jQuery('#tjForm').css('top',jQuery('.author_info').height()+hotAd+20+'px');
        }
    }
    jQuery(window).scroll(function() {
        zsjFormPosition();
    });

    window.PICKS = module.exports  = {
        imgShare: imgShare,
        picksInit:picksInit
    }

});
          
