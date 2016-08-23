
<%@page import="com.jshop.entity.LtSpOperator"%>
<%@page import="com.jshop.common.Global"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object loginer = request.getSession().getAttribute(Global.SESSION_KEY_LOGINER);
LtSpOperator operator = null;
//LtSpShop shop = null;
String name = "";
String identity;
if(loginer instanceof LtSpOperator){
	identity = "管理员";
	operator = (LtSpOperator)loginer;
	name = operator.getName();
}else{
	identity = "店主";
	//shop = (LtSpShop)loginer;
	//name = shop.getName();
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="resources/web/css/common.css" rel="stylesheet" type="text/css" />
	<link href="resources/web/css/main.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resources/web/js/jquery.js"></script>
	<style type="text/css">
*{
	font: 12px tahoma, Arial, Verdana, sans-serif;
}
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $nav = $("#nav a");
	var $menu = $("#menu dl");
	var $menuItem = $("#menu a");
	
	$("#nav a").each(function(){
		if($($(this).attr("href")).find("a").length <= 0){
			$(this).hide();
		}
	});
	
	$nav.click(function() {
	
		var $this = $(this);
		$nav.removeClass("current");
		$this.addClass("current");
		var $currentMenu = $($this.attr("href"));
		var href = $($this.attr("href") + " a:first").attr('href');
		document.getElementById('iframe').src = href;
		$menu.hide();
		$currentMenu.show();
		return false;
	});
	
	$menuItem.click(function() {
		var $this = $(this);
		$menuItem.removeClass("current");
		$this.addClass("current");
	});

});
</script>
  </head>
  
<body>
	<script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		}
	</script>
	<table class="main">
		<tbody><tr>
			<th class="logo" style="width: 220px;">
				<a href="/">
					<div style="    height: 100px;
    background-image: url('resources/pc/images/back.png');
    background-position: 5 20px;
    background-size: 100%;
    background-repeat: no-repeat;
    margin-top: -50px;"></div>
				</a>
			</th>
			<th>
				<div id="nav" class="nav">
					<ul>
						<li>
							<a href="#infomation">资料管理</a>
						</li>
						<li>
							<a href="#designer">设计管理</a>
						</li>
						<li>
							<a href="#member">会员管理</a>
						</li>
						<li>
							<a href="#system">系统管理</a>
						</li>
					</ul>
				</div>
				<div class="link">
					<a href="#" target="_blank">官方网站</a>|
					<a href="#" target="_blank">交流论坛</a>|
					<a href="#" target="_blank">关于我们</a>
				</div>
				<div class="link">
					<strong><%=name %></strong>
					您好!
					<strong>当前身份：<%=identity %></strong>
					<!-- <a href="../profile/edit.jhtml" target="iframe">[账号设置]</a> -->
					<a href="web/login/login!clean.action" target="_top">[注销]</a>
				</div>
			</th>
		</tr>
		<tr>
			<td id="menu" class="menu">
				<%if(operator != null){ %>
				<dl id="infomation" class="default">
					<dt>设计列表</dt>
					<dd>
						
						<a href="web/budget/budget!list.action" target="iframe">设计预算</a>
						<a href="web/houseType/houseType!list.action" target="iframe">地段列表</a>
						<a href="web/projectType/projectType!list.action" target="iframe">需求风格</a>
						<a href="web/renovationStage/renovationStage!list.action" target="iframe">装修阶段列表</a>
						<a href="web/renovationStyle/renovationStyle!list.action" target="iframe">装修网咖风格列表</a>						
						<a href="web/areaMeasure/areaMeasure!list.action" target="iframe">项目面积列表</a>
						<a href="web/spaceType/spaceType!list.action" target="iframe">电竞风格列表</a>
					</dd>
				</dl>
				<dl id="designer">
					<dt>设计列表</dt>
					<dd>						
						<a href="web/designWork/designWork!list.action" target="iframe">设计案例列表</a>
						<a href="web/designDemand/designDemand!list.action" target="iframe">设计需求列表</a>
						<a href="web/dinfo/dinfo!list.action" target="iframe">行业资讯</a>
						<a href="web/eva/eva!list.action" target="iframe">评论问答列表</a>
					</dd>
				</dl>
				<dl id="member">
					<dt>会员列表</dt>
					<dd>
						<a href="web/mb/mb!list.action" target="iframe">业主</a>
						<a href="web/designer/designer!list.action" target="iframe">设计师</a>
						<a href="web/org/org!list.action" target="iframe">设计机构</a>
					</dd>
				</dl>
				<dl id="system">
					<dt>系统列表</dt>
					<dd>
						<a href="web/operator/operator!list.action" target="iframe">管理员列表</a>
					</dd>
					<dd>
						
						<a href="web/phomepage/phomepage!list.action" target="iframe">主页广告轮播设置</a>
					</dd>
					<!--<dd>
						<a href="web/params/params!list.action" target="iframe">系统参数管理</a>
					</dd>
					<dd>
						<a href="web/log/log!list.action" target="iframe">系统日志管理</a>
					</dd>
				--></dl>
				<%}else{ %>
					
				<%} %>
			</td>
			<td>
				<iframe id="iframe" name="iframe" src="web/budget/budget!list.action" frameborder="0"></iframe>
			</td>
		</tr>
	</tbody></table>
</body>
</html>
