<!DOCTYPE html>
<html lang="en" class="en">
  <head>
    <meta charset="utf-8"/>
    <meta name="renderer" content="webkit"/>
    <title>装修申请</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="mobile-agent" content=""/>
    <link rel="canonical" href=""/>
    <link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${base}/resources/pc/css/publish_demand.css"/>
    <link href="${base}/resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <script src="${base}/resources/pc/js/common.js" type="text/javascript"></script>
    <script src="${base}/resources/pc/js/GlobalProvincesNoqu.js" type="text/javascript"></script>
    <script src="${base}/resources/pc/js/jquery.js" type="text/javascript"></script>
    <script>var jq = jQuery.noConflict();</script>
    <script type="text/javascript">
      var dateFormat = 'yyyy-mm-dd';
      var sShen = '';
      var sTown = '';
      var sCity = '';
      var gpm = new GlobalProvincesModule; //城市类
      gpm.def_province = ["省/市", ""];
      gpm.def_city1 = ["市/地区", ""];
      gpm.def_city2 = ["县/市", ""];
      
      
      jq(function(){
      
      	
      });
      
      function submit_form(){
      	var User_Shen = jq("#User_Shen").val();
      	var User_City = jq("#User_City").val();
      	jq("#User_Shen").remove();
      	jq("#User_City").remove();
      	jq("#User_Town").remove();
      	jq("#entity_area").val(User_Shen + " " + User_City);
      	
     // 	console.log(jq("#zb_form").serialize());
      	jq.ajax({
             type: "POST",
             url: "${base}/pc/demand/demand!save.action?result=json",
             data: jq("#zb_form").serialize(),
             dataType: "json",
             success: function(data){
             	if(data.success){
             		alert("需求提交成功");
             	}
             }
             
        });
      
      }
    </script>
  </head>
  <body class="narrow_980">
    <div class="global_wrap" id="gloWrap">
      <!--头部 开始-->
      <div class="container demand_head">
        <div class="web-logo">
          <span class="logo_left">
            <a href="${base}/pc/index.action"></a>
          </span>
          
        </div>
        <div class="">
          <span class="tel_left">
          
          </span>
          <span class="tel_right" style="float:right;font-size:24px;margin-right:150px;">
            <p class="p_top"></p>
            
            <p class="p_bottom"> 无设计，不装修</p>
          </span>
          <div class="clear"></div>
        </div>
        <div class="clear"></div>
      </div>
      <!--头部 结束-->
      <!--主体 开始-->
      <div class="demand_form_wrap">
        <!--提交需求表单-->
        <div class="form_content">
          <form action="#" id="zb_form" method="post">
            <div class="input_form">
              <p class="total">已有
                <em>119,555</em>
                位业主提交设计需求
              </p>
              <div class="box">
                <label class="default_value">您的称呼</label>
                <input class="input_txt" name="entity.nickname" type="text">
                <label class="msg">
                  <em></em>
                  <p></p>
                </label>
              </div>
              <div class="box" id="userMobileDom">
                <label class="default_value">手机号码</label>
                <input class="input_txt" name="entity.phoneNo" type="text">
                <label class="msg">
                  <em></em>
                  <p></p>
                </label>
              </div>
              <div class="box" id="title">
                <label class="default_value">需求标题</label>
                <input class="input_txt" name="entity.title" type="text">
                <label class="msg">
                  <em></em>
                  <p></p>
                </label>
              </div>
              <div class="box">
                <script type="text/javascript">
                  if (sCity == '' || GP == '省/市') City = '';
                  else City = GC1[sShen];
                  if (sTown == '' || sCity == '市/地区') Town = '';
                  else Town = GC2[sShen][sCity];
                  jsSelectItem(GP, sShen, 'V-V', 'User_Shen', 'onchange=\'changeProvince("User_Shen","User_City","User_Town")\'', true, '省/市');
                  jsSelectItem(City, sCity, 'V-V', 'User_City', 'onchange=\'changeTown("User_Shen","User_City","User_Town")\'', true, '市/地区');
                  jsSelectItem(Town, sTown, 'V-V', 'User_Town', '', true, '县/市');
                </script>
                <div class="clear"></div>
                <label class="msg">
                  <em></em>
                  <p></p>
                </label>
              </div>
              <input type="hidden" name="entity.areaZone" id="entity_area"/>
              <div class="box">
                <select class="select_l" name="entity.projectType">
                  <option value="">
                    需求风格
                  </option>
                  <option value="1">
                    住宅空间
                  </option>
                  <option value="2">
                    餐饮空间
                  </option>
                  <option value="3">
                    办公空间
                  </option>
                  <option value="4">
                    酒店空间
                  </option>
                  <option value="5">
                    商业展示
                  </option>
                  <option value="6">
                    娱乐空间
                  </option>
                  <option value="7">
                    休闲场所
                  </option>
                  <option value="8">
                    文化空间
                  </option>
                  <option value="9">
                    医疗机构
                  </option>
                  <option value="10">
                                    售楼中心
                  </option>
                  <option value="11">
                    金融机构
                  </option>
                  <option value="12">
                    运动场所
                  </option>
                  <option value="13">
                    教育机构
                  </option>
                  <option value="14">
                                    其他
                  </option>
                </select>
                <label class="">
                   <input name="entity.areaSqm" type="text" placeholder="项目面积" style="width: 126px;margin-left: 9px;height:36px;">
                </label>
               
                <em class="unit" style="right:5px;">
                                 ㎡
                </em>
                <div class="clear">
                </div>
                <label class="msg">
                  <em></em>
                  <p></p>
                </label>
              </div>
              <div class="box">
                <select class="select_all" name="entity.budgetName">
                  <option value="">
                    设计预算
                  </option>
                  <option value="3000">
                    3000元以下
                  </option>
                  <option value="3000-6000">
                    3000-6000元
                  </option>
                  <option value="6000-10000">
                    6000-10000元
                  </option>
                  <option value="10000-50000">
                    10000-50000元
                  </option>
                  <option value="50000-100000">
                    50000-100000元
                  </option>
                  <option value="100000">
                    100000元以上
                  </option>
                </select>
                <label class="msg">
                  <em></em>
                  <p></p>
                </label>
              </div>
              <div class="box">
                <label class="default_value">
                  备注（选填）
                </label>
                <input class="input_txt" name="entity.requirement" type="text">
              </div>
              <div class="box">
                <input type="button" class="smbmit_btn" id="baidu_hmt" value="立即提交" onclick="submit_form()">
              </div>
              <p class="bottom">
                * 百爪鱼将严格保护您的隐私，请放心填写
              </p>
              <label id="erro_msg">
                <em></em>
                <p></p>
              </label>
            </div>
            
          </form>
        </div>
      </div>
      <!--无设计 不装修 -->
      <!---->
      <!--主体 结束-->
      <!--尾部 开始-->
      <div class="wrap wrap_cppyright">
        <div class="string"></div>
        <div class="cppyright_content">
          <ul>
             <li>
                <a href="${base}/resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
              </li>
              <li>
                <a href="${base}/resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
              </li>
            <li>
              <a href="" rel="nofollow" target="_blank">意见建议</a>
            </li>
            <li>
              <a href="" rel="nofollow" target="_blank">帮助中心</a>
            </li>
            <li class="no_border">
              <a href="" rel="nofollow" target="_blank">使用条款</a>
            </li>
          </ul>
          <p class="statement">
            免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其作品情形，请及时与本站联系。
          </p>
          <p class="bottom_bah">
            ©2012shejiben.com,All Rights Reserved.(
            <a hidefocus="" href="" rel="nofollow">
              粤ICP备0812558号-2
            </a>
            )
          </p>
          <div class="bottom_icon">
            <a href="" target="_blank" title="" alt="">
              <label class="icon_gongan"></label>
            </a>
            <a href="" target="_blank">
              <label class="icon_falv"></label>
            </a>
          </div>
        </div>
      </div>
      <!--尾部 结束-->
    </div>
    <!--发布需求表单 底部-->
    <div class="container_wrap form_bottom_wrap" style="display: none; top: 252px;">
      <form action="#" method="post" id="zb_form2">
        <div class="container form_bottom  ">
          <div class="box">
            <select id="User_Shen2" name="User_Shen2" onchange="changeProvince(&quot;User_Shen2&quot;,&quot;User_City2&quot;,&quot;User_Town2&quot;)">
              <option>省/市</option>
              <option value="安徽"> 安徽</option>
              <option value="北京">北京</option>
              <option value="重庆">重庆</option>
              <option value="福建">福建</option>
              <option value="广西">广西</option>
              <option value="贵州">贵州</option>
              <option value="广东">广东</option>
              <option value="甘肃">甘肃</option>
              <option value="海南">海南</option>
              <option value="湖北">湖北</option>
              <option value="黑龙江">黑龙江</option>
              <option value="河南">河南</option>
              <option value="河北"> 河北</option>
              <option value="湖南">湖南</option>
              <option value="江苏">江苏</option>
              <option value="吉林">吉林</option>
              <option value="江西">江西</option>
              <option value="辽宁">辽宁</option>
              <option value="内蒙古">内蒙古</option>
              <option value="宁夏">宁夏</option>
              <option value="澳门">澳门</option>
              <option value="青海">青海</option>
              <option value="四川">四川</option>
              <option value="陕西">陕西</option>
              <option value="上海">上海</option>
              <option value="山东">山东</option>
              <option value="山西">山西</option>
              <option value="台湾">台湾</option>
              <option value="天津">天津</option>
              <option value="西藏">西藏</option>
              <option value="香港">香港</option>
              <option value="新疆">新疆</option>
              <option value="云南">云南</option>
              <option value="浙江">浙江</option>
            </select>
            <div class="msg">
              <em class="error"></em>
              <p></p>
              <em class="arrow"></em>
            </div>
          </div>
          <div class="box">
            <select id="User_City2" name="User_City2" onchange="changeTown(&quot;User_Shen2&quot;,&quot;User_City2&quot;,&quot;User_Town2&quot;)">
              <option>市/地区</option>
            </select>
            <select id="User_Town2" name="User_Town2">
              <option>县/市</option>
            </select>
            <div class="msg">
              <em class="error">
              </em>
              <p>
              </p>
              <em class="arrow">
              </em>
            </div>
          </div>
          <div class="box">
            <select class="select_l" name="hometype">
              <option value="">
                需求风格
              </option>
              <option value="1">
                住宅空间
              </option>
              <option value="2">
                餐饮空间
              </option>
              <option value="3">
                办公空间
              </option>
              <option value="4">
                酒店空间
              </option>
              <option value="5">
                商业展示
              </option>
              <option value="6">
                娱乐空间
              </option>
              <option value="7">
                休闲场所
              </option>
              <option value="8">
                文化空间
              </option>
              <option value="9">
                医疗机构
              </option>
              <option value="10">
                            售楼中心
              </option>
              <option value="11">
                金融机构
              </option>
              <option value="12">
                运动场所
              </option>
              <option value="13">
                教育机构
              </option>
              <option value="14">
                           其他
              </option>
            </select>
            <div class="msg">
              <em class="error"></em>
              <p></p>
              <em class="arrow"></em>
            </div>
          </div>
          <div class="box">
            <label class="default_value">
              项目面积
            </label>
            <input class="input_txt input_txt_area" name="oarea" type="text">
            <em class="unit">㎡</em>
            <div class="msg">
              <em class="error"></em>
              <p></p>
              <em class="arrow"></em>
            </div>
          </div>
          <div class="box">
            <label class="default_value">您的称呼</label>
            <input class="input_txt" name="chenghu" type="text">
            <div class="msg">
              <em class="error"></em>
              <p></p>
              <em class="arrow"></em>
            </div>
          </div>
          <div class="box tel" id="userMobileDom2">
            <label class="default_value">
              手机号码
            </label>
            <input type="text" class="input_txt" name="phone">
            <div class="msg">
              <em class="error">
              </em>
              <p>
              </p>
              <em class="arrow">
              </em>
            </div>
          </div>
          <input type="button" value="立即找设计师" class="btn_submit" id="baidu_hmt2">
        </div>
        <input type="hidden" value="1" name="fromZb">
        <input type="hidden" value="1" name="ajax">
        <input type="hidden" value="0" name="biao">
        <input id="zbtype" type="hidden" value="0" name="zbtype">
        <input id="sj_biao_id" type="hidden" value="5" name="sourceid">
        <input id="sj_biao_sid" type="hidden" value="21" name="s_sourceid">
        <input type="hidden" value="0" name="source_referer">
        <input type="hidden" name="project_type" value="住宅">
        <input type="hidden" name="pro_sourceid" value="1">
      </form>
    </div>
    <!--==弹窗==-->
    <div class="popupMask"></div>
    <div class="popupContent" style="left: 229.5px; top: -89px;">
      <span class="arrow prev">
      </span>
      <div class="img_list">
        <ul>
          <li>
            <div class="title">平面布局设计</div>
            <div class="msg">房屋寸土寸金，通过空间美学改造、功能布局优化、家具合理尺寸摆放最大化利用好每一平方米。</div>
            <div class="img">
              <img src="http://www.shejiben.com/img/fbxq/popup_img_01.png">
            </div>
          </li>
          <li>
            <div class="title">
              效果图制作
            </div>
            <div class="msg">
              效果图将空间效果具象表现出来，让您对未来家居网咖风格有个直观的认识。
            </div>
            <div class="img">
              <img src="http://www.shejiben.com/img/fbxq/popup_img_02.png">
            </div>
          </li>
          <li>
            <div class="title">
              施工图细化
            </div>
            <div class="msg">
              施工图是指导工人施工的全套图纸，施工工人拿着施工图就可以进行标准化施工。
            </div>
            <div class="img">
              <img src="http://www.shejiben.com/img/fbxq/popup_img_03.png">
            </div>
          </li>
        </ul>
        <span class="btn_close"></span>
      </div>
      <span class="arrow next"></span>
    </div>
    <script type="text/javascript" src="${base}/resources/pc/js/jquery.colorbox.min.js"></script>
    <script type="text/javascript" src="${base}/resources/pc/js/publish_demand.js"></script>
    <script type="text/javascript" src="${base}/resources/pc/js/check_form.js"></script>
    <p style="display:none">
      <script type="text/javascript">
        jq(function() {
          browserType();
          guide_tab();
          select_new();
          fixBottom();
          showPopup();
          checkCookie();
        });
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://": " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fff9f2264b4da35f5adbd4b34ccb9756b' type='text/javascript'%3E%3C/script%3E"));
      </script>
      <a href="" target="_blank">
        <img border="0" src="http://eiv.baidu.com/hmt/icon/21.gif" width="20" height="20">
      </a>
    </p>
    <form action="" method="POST" target="frm_dealer" id="frm_dealer_form">
      <input type="hidden" id="clickValId" name="key" value=""/>
    </form>
    <iframe frameborder="0" height="0" name="frm_dealer" id="clsIframe"></iframe>
  </body>

</html>