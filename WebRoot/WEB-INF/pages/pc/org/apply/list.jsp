<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
        <title>我的接单申请 - 百爪鱼</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
       <link href="resources/pc/css/global.css" rel="stylesheet" type="text/css" />
        <link href="resources/pc/css/my_style.css" rel="stylesheet" type="text/css" />
        <link href="resources/pc/css/userCenter.css" rel="stylesheet" type="text/css" />
          <link type="text/css" rel="stylesheet" href="resources/pc/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="resources/pc/css/pagination.css"/>
    <link href="resources/pc/css/logo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="resources/shop/js/jquery.js"></script>
     <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
    <script type="text/javascript">
  		var pathName =  window.document.location.pathname;
  		var path = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
  		
  		$(function(){
  			
  		})
    </script>
 
      </script>
        <style type="text/css">
            .tcBox{display:block;} 
            #colorbox, #cboxOverlay, 
            #cboxWrapper{display:block;border:none;}
            #cboxTitle{
            	height: 40px;
            	line-height: 40px;
            	background: #333;
            	color: #999;
            	font-size:16px;
            	font-family: 'Microsoft YaHei' ! important;
            	font-weight: normal;
            	width:100%;top: -40px;
            } 
            #cboxContent{margin-top: 40px;} 
            #cboxSlideshow, #cboxPrevious,#cboxNext, #cboxClose{
            	text-indent: -9999px;
            	top: -30px;
            	right: 15px;
            	display:inline-block;
            	width: 15px;
            	height: 15px;
            	background: url(resources/pc/images/small_img.png) -240px -120px;} 
           	.edit_prod_info .qd_cont .prod_type select{ 
            	margin-bottom:10px;
            	padding-left: 0px;
           	} 
           	.edit_prod_info .qd_cont .prod_type label{float:none;}
        </style>
        <script type="text/javascript">
        	function closeWin(){
        		jq(".overWindow,.worksContent").hide();
        	}
        	 function closeColorbox(){
	        	alert("取消");
	        	jq(".overWindow,.worksContent").hide();
	        }
	        function subPhoto(obj){
	        	alert("确定");
	        	jq(".overWindow,.worksContent").hide();
	        }
        </script>
    </head>
    
    <body>

    	<div id="cboxOverlay" class="overWindow" style="opacity: 0.5; cursor: pointer; border: none;display:none"></div>
    	<div id="colorbox" class="worksContent" style="padding-bottom: 32px; padding-right: 0px; display: none; width: 725px; height: 409px; top: 0px; left: 307.5px; border: none; opacity: 1; cursor: auto;">
    		<div id="cboxWrapper" style="height: 441px; width: 725px; border: none;">
		        <div>
		            <div id="cboxTopLeft" style="float: left;"></div>
		            <div id="cboxTopCenter" style="float: left; width: 725px;"></div>
		            <div id="cboxTopRight" style="float: left;"></div>
		        </div>
	        	<div style="clear: left;">
	            	<div id="cboxMiddleLeft" style="float: left; height: 409px;"></div>
	            	<div id="cboxContent" style="float: left; width: 725px; height: 409px;">
	                	<div id="cboxLoadedContent" style="width: 725px; overflow: auto; height: 409px;">
	                    	<div class="tcBox edit_prod_info">
	                        	<div class="qd_cont">
	                            	<div class="prod_name">
	                                	<label>案例名称：</label>
	                                	<input type="text" value="第二个案例" id="name" onkeyup="wordsLimit(this,40)"/>
	                            	</div>
	                            	<div class="prod_type">
	                                    <label>案例分类：</label>
	                                    <select name='kind' id='kind'>
	                                        <option value='0' selected='selected'>选择分类</option>
	                                        <option value='1'>住宅空间</option>
	                                        <option value='2'>公共空间</option>
	                                    </select>
	                                    <select name="subkind" id="subkind">
	                                        <option value="0">选择分类</option>
	                                    </select>
	                                    <select name="subsubkind" id="subsubkind">
	                                        <option value="0">选择分类</option>
	                                    </select>
	                                    <select name='style' id='style'>
	                                        <option value='-1' selected='selected'>选择网咖风格</option>
	                                        <option value='0'>混搭网咖风格</option>
	                                        <option value='2'>欧式网咖风格</option>
	                                        <option value='4'>中式网咖风格</option>
	                                        <option value='6'>新古典网咖风格</option>
	                                        <option value='8'>东南亚网咖风格</option>
	                                        <option value='9'>美式网咖风格</option>
	                                        <option value='11'>田园网咖风格</option>
	                                        <option value='12'>地中海网咖风格</option>
	                                        <option value='15'>现代网咖风格</option>
	                                        <option value='16'>简约网咖风格</option>
	                                        <option value='17'>日式网咖风格</option>
	                                        <option value='18'>宜家网咖风格</option>
	                                        <option value='19'>北欧网咖风格</option>
	                                        <option value='20'>简欧网咖风格</option>
	                                        <option value='21'>LOFT网咖风格</option>
	                                    </select>
	                                </div>
	                            	<div class="prod_info">
		                                <label>项目信息：</label>
		                                <input type="text" value="90" id="area"/>
		                                <em class="_01">㎡</em>
		                                <input type="text" value="300" id="price"/>
		                                <em class="_02">万元</em>
		                            </div>
		                            <div class="prod_desc">
		                                <label>案例描述：</label>
		                                <textarea id="comment">第二个案例</textarea>
		                            </div>
		                            <div class="btne edit_prod">
		                                <input type="hidden" value="3144245" id="cid"/>
		                                <input type="submit" class="btn_click" onclick="subPhoto(this)" value="确定"/>
		                                <input type="submit" class="btn_unclick" onclick="closeColorbox()" value="取消"/>
		                            </div>
	                        	</div>
	                    	</div>
	                	</div>
		                <div id="cboxLoadingOverlay" class="" style="height: 409px; display: none;"></div>
		                <div id="cboxLoadingGraphic" class="" style="height: 409px; display: none;"></div>
		                <div id="cboxTitle" class="" style="display: block;">编辑案例信息</div>
		                <div id="cboxCurrent" class="" style="display: none;"></div>
		                <div id="cboxNext" class="" style="display: none;"></div>
		                <div id="cboxPrevious" class="" style="display: none;"></div>
		                <div id="cboxSlideshow" class="" style="display: none;"></div>
		                <div id="cboxClose" onclick="closeWin()" class="" style="">close</div>
		            </div>
		            <div id="cboxMiddleRight" style="float: left; height: 409px;"></div>
		        </div>
		        <div style="clear: left;">
		            <div id="cboxBottomLeft" style="float: left;"></div>
		            <div id="cboxBottomCenter" style="float: left; width: 725px;"></div>
		            <div id="cboxBottomRight" style="float: left;"></div>
		        </div>
	    	</div>
	    	<div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
		</div>
        <!--头部开始-->
        <div class="header">
            <div class="hea_top">
                <div class="hea_top_right">
                    <ul class="tp_node">
                        <li style="width:90px;" id="nav_login">
                            <span id="userName" class="name">
                                <a href="" class="bg1" id="bg" onblur="if(this.rel==1) {this.className='bg1'; $('caozuo').style.display='none'}" rel="1" hidefocus="">
                                    <span class="nick">设计机构</span>
                                    <em class="downAdrrow"></em>
                                </a>
                                <div class="caozuo" id="caozuo" style="display:none;" onmouseover="$('bg').rel=2;" onmouseout="$('bg').rel=1;">
                                    <div class="redArrow"></div>
                                    <ul class="cz " id="cz">
                                        <li>
                                            <a href="pc/org/index.action" class="my">个人中心</a>
                                        </li>
                                        <li>
                                            <a href="pc/designer/designer!personal.action" class="my_index_ad">我的主页</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">我的派单</a>
                                        </li>
                                        <li>
                                            <a href="" class="jy">我的交易</a>
                                        </li>
                                        <li>
                                            <a href="pc/org/case/case!list.action" >我的案例</a>
                                        </li>
                                        <li>
                                            <a href="" class="up">账号设置</a>
                                        </li>
                                        <li>
                                            <a href="" class="tc">退出</a>
                                        </li>
                                    </ul>
                                </div>
                            </span>
                        </li>
                        
                        
                        <li class="po">
                            |
                        </li>
                        <!--设计机构中心 -->
                        <li class="cur" style="width:92px;">
                            <a >设计机构中心
                                <span class="jt"></span>
                            </a>
                            <div class="sj_center" style="display:none;">
                                <ul>
                                    <li>
                                        <a href="pc/designer/designer!home.action">接单大厅</a>
                                    </li>
                                   
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 个人中心主导航-->
        <div class="sjs_nav">
            <div class="banner_cont">
                <div class="ban_cont_left">
                    <a href="<%=basePath %>pc/index.action">
                        <div class="logo"></div>
                    </a>
                    <span>机构中心</span>
                </div>
                <div class="ban_cont_right">
                    <ul>
                        <li class="cur">
                            <a href="pc/org/index.action">个人中心</a>
                        </li>
                        <li>
                            <a href="pc/designer/designer!personal.action" target="_blank">我的主页</a>
                        </li>
                        <li>
                            <a href="pc/designer/designer!home.action">
                                接单大厅
                            </a>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div>
        <!--头部结束-->
        <div class="dmato"></div>
        <div class="content_width" id="content">
            <div class="content_width ">
                <script type="text/javascript">
                    blogcheck();
                    greet_text();
                    var token = "";
                    var appid = "";
                    var openid = "";
                    var token_weibo = "";
                </script>
                <div class="menu_bar">
				    <div class="menu_list menu_list_last">
				        <p>交易管理</p>
				        <ul>
                            <li>
                                <a href="pc/org/demand/demand!list.action?state=1" target="_parent">我收到的预约</a>
                            </li><!--
                            <li>
                                <a href="pc/org/apply/apply!list.action" target="_parent">我的接单申请</a>
                            </li>
                            --><li>
                                <a href="pc/org/demand/demand!list.action?state=1" target="_parent">我收到的派单</a>
                            </li>
                            <li>
                                <a href="pc/org/demand/demand!list.action?state=4" target="_parent">我的签单项目</a>
                            </li>
                        </ul>
				        <div class="string_1"></div>
				    </div>
				    <div class="menu_list">
				        <p>主页管理</p>
				        <ul>
				            <li>
				                <a href="pc/org/case/case!list.action" target="_parent">我的案例</a>
				            </li>
				        </ul>
				        <div class="string_1"></div>
				    </div>
				    <div class="menu_list">
				        <p>我的帐号</p>
				        <ul>
				            <li >
				                <a href="pc/org/info/info!edit.action" target="_parent">个人资料</a>
				            </li>
				            <li>
				                <a href="pc/org/info/info!toChangePwd.action">帐号设置</a>
				            </li>
				        </ul>
				    </div>
				    <p class="clear"></p>
				</div>
                <!--end side_menu-->
                <script src="resources/pc/js/myUserCenter.js" type="text/javascript"></script>
                <div class="content peson_product_manage">
                    <div class="tal">
                        <label>我的接单申请</label>
                        <div class="btne pics_add">
                            <!-- <input type="button" class="btn_06" onclick="" value="案例排序"/> -->
                            <input type="button" class="btn_click" value="发布案例" onclick="addWorks()"/>
                        </div>
                    </div>
                    <div class="picts">
                       
                      <!--  --> 
      <div class="path">
		<!-- <a href="web/common/main.action">首页</a> » --> 我的接单申请 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="pc/org/apply/apply!list.action" method="post">                 
                       <table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="nickname">称呼</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="phoneNo">手机号码</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="areaName">地区</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="projectType">需求风格</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="areaSqm">项目面积</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="budgetName">设计预算</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="minAmt">预算最小值</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="maxAmt">预算最大值</a>
				</th>
				<th>
					<span>申请状态</span>
				</th>
			</tr>
			<s:iterator value="list" status="statu" >   
				<tr>
					<td>
						<input type="checkbox" name="ids" value="<s:property value="designDemand.id" />">
					</td>
					<td>
						<s:property value="designDemand.nickname" />
					</td>
					
					<td>
						<s:property value="designDemand.phoneNo" />
					</td>
					<td>
						<s:property value="designDemand.areaName" />
					</td>
					<td>
						<s:property value="designDemand.projectType" />
					</td>
					<td>
						<s:property value="designDemand.areaSqm" />
					</td>
					<td>
						<s:property value="designDemand.budgetName" />
					</td>
					<td>
						<s:property value="designDemand.minAmt" />
					</td>
					<td>
						<s:property value="designDemand.maxAmt" />
					</td>
					
					<td>
						<s:if test="state==0">申请中</s:if>
						<s:if test="state==2">已被拒</s:if>
					</td>
				</tr>
				</s:iterator>
		</tbody></table>
		
		<div class="pagination" pageNumber="<s:property value="#request.pager.pageNumber"/>" 
			pageSize="<s:property value="#request.pager.pageSize"/>"
			searchProperty="<s:property value="#request.pager.searchProperty"/>"
			orderProperty="<s:property value="#request.pager.orderProperty"/>"
			orderDirection="<s:property value="#request.pager.orderDirection"/>"/>
			</form>
		</div>
		<!-- 分页条 -->
		
              
          
            </div>
             
        </div>
       </div>
       
        <p class="clear"></p>
        <bgsound src="" autostart="true" loop="2" id="bgmusic"></bgsound>
        <div id='messagebox'></div>
        <script type="text/javascript">
            //短信提示使用(asilas添加) 
            var divTop, divLeft, divWidth, divHeight, docHeight, docWidth, objTimer, i = 0;
            //鼠标悬浮在用户头像或者名称上面时显示用户信息
            showUserInfo();
        </script>
        <div id="small_window"></div>
        <div class="none_f" id="goTop" style="display: block;">
            <a href="" rel="nofollow" target="_blank" class="my_collection" id="my_collection"></a>
            <a href="" rel="nofollow" target="_blank" class="my_option"></a>
            <a href="javascript:void(0)" class="backTop" id="backTop" onclick="backToTop()" style="display:none;"></a>
        </div>
        <p class="cl"></p>
	    <!--版权等-->
	    <div class="wrap wrap_cppyright">
	      <div class="cppyright_content">
	        <div class="string clear"></div>
	        <ul>
	           <li>
                <a href="resources/html/common/about_us.html" rel="nofollow" target="_blank">关于我们</a>
              </li>
              <li>
                <a href="resources/html/common/contact_us.html" rel="nofollow" target="_blank">联系我们</a>
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
	        <p class="statement">免责声明：本网站部分内容由用户自行上传，如权利人发现存在误传其案例情形，请及时与本站联系。</p>
	        <p class="bottom_bah">
	          ©2012shejiben.com,All Rights Reserved.(
	          <a hidefocus="" href="" rel="nofollow">粤ICP备0812558号-2</a>
	          )
	        </p>
	        <div class="bottom_icon">
	          <a href="" target="_blank" rel="nofollow" title="" alt="">
	            <label class="icon_gongan"></label>
	          </a>
	          <a rel="nofollow" href="" target="_blank">
	            <label class="icon_falv"></label>
	          </a>
	        </div>
	      </div>
	    </div>
	    <!--版权等 End-->
    </body>
</html>
<!--删除案例 -->
<div class="dialog_bg"></div>
<!--遮罩层 -->
<div class="qd_suc edit_prod_del">
    <div class="title">
        <label>删除案例</label>
        <span class="close"></span>
    </div>
    <div class="qd_cont">
        <div class="sure_del">
            <p class="sure_del_product">您确定要删除该案例么？</p>
            <p>删除案例后案例中的所有图片将被删除</p>
        </div>
        <div class="btne edit_prod del">
            <input type="hidden" id="delId" value="" />
            <input type="submit" class="btn_click" onclick="delZP(this)" value="确定"/>
            <input type="submit" class="btn_unclick" onclick="quitDelZP(this)" value="取消"/>
        </div>
    </div>
</div>
<script src="resources/pc/js/jquery.colorbox.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function delctbox(ids) {
        jq(".dialog_bg").show();
        jq(".edit_prod_del").show();
        jq("#delId").val(ids);
    }
    //删除案例
    function delZP(thisObj) {
        var id = jq("#delId").val();
        jq(thisObj).attr('disabled', 'disabled').val('删除中..');
    }
    //取消删除案例
    function quitDelZP(thisObj){
    	jq(thisObj).closest("div.edit_prod").find(".btn_click").removeAttr('disabled').val('确定');
    }
    //发布案例
    function addWorks(){
    	window.location.href="pc/org/case/case!toAdd.action";
    }
    //读取cat
    function editWorks(cid) {
    	jq(".overWindow").show();
    	jq(".worksContent").show();
    }
</script>