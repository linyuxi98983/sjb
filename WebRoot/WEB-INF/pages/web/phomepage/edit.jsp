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
    <title>PC主页板块编辑</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
    <script type="text/javascript">
	$().ready(function() {
	
		// 初始化图片列表
		var $imageList = $("#imageList");
		$imageList.lImageList({
			data:[<s:iterator value="entity.picList" status="statu">{id:<s:property value="id"/>,imagePath:'<s:property value="imagePath"/>',orderNo:<s:property value="orderNo"/>},</s:iterator>]
		});
	});
	</script>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 编辑PC主页板块
	</div>
	<form id="inputForm" action="web/phomepage/phomepage!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="PC主页板块详情" class="current">
			</li>
			<li>
				<input type="button" class="moduleType moduleType3" value="商品列表" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<input type="hidden" name="entity.id" value="<s:property value="entity.id"/>"/>
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
			
			<tr >
				<th>图片链接：</th>
				<td>
					图片链接一：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[0].url"/>"><br/>
					图片链接二：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[1].url"/>"><br/>
					图片链接三：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[2].url"/>"><br/>
					图片链接四：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[3].url"/>"><br/>
					图片链接五：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[4].url"/>"><br/>
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
								<input type="hidden" name="entity.positionType" value="0"/>
								<input type="hidden" name="entity.moduleType" value="0"/>
								<input type="text" name="entity.height" class="text"  value="<s:property value="entity.height"/>">px
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>是否停用:
				</th>
				<td>
					<input type="radio" name="entity.closed" value="1" <s:if test='entity.closed == 1'>checked="checked"</s:if>/>是
		 			<input type="radio" name="entity.closed" value="0" <s:if test='entity.closed == 0'>checked="checked"</s:if>/>否
				</td>
			</tr>
		</tbody></table>
		<table class="tabContent" style="display: table;width:100%;">
			<tr>
				<td>
					<iframe class="iframe" src="web/phomepagegoods/phomepagegoods!list.action?searchProperties.phomepageId=<s:property value="entity.id"/>"></iframe>
				</td>
			</tr>
		</table>
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
