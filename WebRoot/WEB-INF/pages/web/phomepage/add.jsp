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
    <title>PC主页板块添加</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
    <script type="text/javascript" src="resources/web/js/mhomepage.js"></script>
    <script type="text/javascript">
	$().ready(function() {
	
		// 初始化图片列表
		var $imageList = $("#imageList");
		$imageList.lImageList({
			data:[]
		});
	});
	</script>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 添加PC主页板块
	</div>
	<form id="inputForm" action="web/phomepage/phomepage!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="PC主页板块详情" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			<tr>
				<th>
					展现标题:
				</th>
				<td>
					<input type="text" name="entity.title" class="text"  value="<s:property value="entity.title"/>"/>
				</td>
			</tr>
			<tr>
				<th>
					图片:
				</th>
				<td>
					<input type="hidden" id="imageList"/>
				</td>
			</tr>
			<tr class="moduleType moduleType0">
				<th>图片链接：</th>
				<td>
					图片链接一：<input type="text" name="entity.urls" class="text"  value="<s:property value="picList[0].url"/>"><br/>
					图片链接二：<input type="text" name="entity.urls" class="text"  value="<s:property value="picList[1].url"/>"><br/>
					图片链接三：<input type="text" name="entity.urls" class="text"  value="<s:property value="picList[2].url"/>"><br/>
					图片链接四：<input type="text" name="entity.urls" class="text"  value="<s:property value="picList[3].url"/>"><br/>
					图片链接五：<input type="text" name="entity.urls" class="text"  value="<s:property value="picList[4].url"/>">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>类型:
				</th>
				<td>
					<table>
						<tr>
							<td>
								<input type="radio" name="entity.moduleType" value="0" checked="checked"/>广告
								<input type="radio" name="entity.moduleType" value="1"/>促销与团购
								<input type="radio" name="entity.moduleType" value="2"/>商品分类
								<input type="radio" name="entity.moduleType" value="3"/>商品列表
								<input type="radio" name="entity.moduleType" value="4"/>纯HTML片段
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class="moduleType moduleType1">
				<th>促销与团购：</th>
				<td>
					<input type="hidden" class="filterList" id="ltSpPromotionId" name="entity.ltSpPromotionId" text_name="promotion_name" value="<s:property value="entity.ltSpPromotionId"/>" text_value="<s:property value="entity.promotionName"/>" value_path="id" text_path="name" filterType="PROMOTION"/>
				</td>
			</tr>
			<tr class="moduleType moduleType4">
				<th>html广告：</th>
				<td>
					<textarea id="editor" name="entity.html" class="editor" style="width:600px;height:250px;"><s:property value="entity.html"/></textarea>
				</td>
			</tr>
			<tr class="moduleType moduleType3">
				<th>
					<span class="required">*</span>主页显示商品数:
				</th>
				<td>
					<input type="text" name="entity.showGoodsCount" class="text"  value="6">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>位置:
				</th>
				<td>
					<table>
						<tr>
							<td>
								<input type="radio" name="entity.positionType" value="0" checked="checked"/>中
								<input type="radio" name="entity.positionType" value="1"/>左
								<input type="radio" name="entity.positionType" value="2"/>右
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>高度:
				</th>
				<td>
					<table>
						<tr>
							<td>
								<input type="text" name="entity.height" class="text"  value="<s:property value="entity.height"/>">px
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th>
					序号:
				</th>
				<td>
					<input type="text" name="entity.orderNo" class="text"  value="<s:property value="entity.orderNo"/>">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>是否停用:
				</th>
				<td>
					<input type="radio" name="entity.closed" value="1"/>是
		 			<input type="radio" name="entity.closed" value="0" checked="checked"/>否
				</td>
			</tr>
		</tbody></table>
		<table class="input">
			<tbody><tr>
				<th>&nbsp;
					
				</th>
				<td>
					<input type="submit" class="button" value="确 定">
					<input type="button" class="button" value="返 回" onclick="history.back(); return false;">
				</td>
			</tr>
		</tbody></table>
	</form>
</body>
</html>
