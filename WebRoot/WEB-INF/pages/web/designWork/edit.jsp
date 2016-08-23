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
    <title>设计案例编辑</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
    <script type="text/javascript" src="resources/web/js/mhomepage.js"></script>
    <script type="text/javascript">
	$().ready(function() {
	
		// 初始化图片列表
		var $imageList = $("#imageList");
		$imageList.lImageList({
			picCount:10,
			data:[<s:iterator value="entity.picList" status="statu">{id:<s:property value="id"/>,imagePath:'<s:property value="imagePath"/>',orderNo:<s:property value="orderNo"/>},</s:iterator>]
		});
		$("#memberType_radio").find("input[type=radio]").each(function(){
			$(this).on("change",function(o,v){
				if($(this).val()==1){
					$("#MEMBER_TYPE_DESIGN").show();
					$("#MEMBER_TYPE_ORG").hide();
					$("#MEMBER_TYPE_DESIGN").find("select").attr("name","entity.ltSpMemberId");
					$("#MEMBER_TYPE_ORG").find("select").attr("name","");
				}else{
					$("#MEMBER_TYPE_ORG").show();
					$("#MEMBER_TYPE_DESIGN").hide();
					$("#MEMBER_TYPE_ORG").find("select").attr("name","entity.ltSpMemberId");
					$("#MEMBER_TYPE_DESIGN").find("select").attr("name","");
				}
				
			});
			if($(this).prop("checked")){
				if($(this).val()==1){
					$("#MEMBER_TYPE_DESIGN").show();
					$("#MEMBER_TYPE_ORG").hide();
					$("#MEMBER_TYPE_DESIGN").find("select").attr("name","entity.ltSpMemberId");
					$("#MEMBER_TYPE_ORG").find("select").attr("name","");
				}else{
					$("#MEMBER_TYPE_ORG").show();
					$("#MEMBER_TYPE_DESIGN").hide();
					$("#MEMBER_TYPE_ORG").find("select").attr("name","entity.ltSpMemberId");
					$("#MEMBER_TYPE_DESIGN").find("select").attr("name","");
				}
			}
		})
		
		
		$("#worksKind_radio").find("input[type=radio]").each(function(){
			$(this).on("change",function(o,v){
				if($(this).val()==1){
					$("#DESIGN_STYLE_SELECT").hide();
					$("#SPACE_TYPE_SELECT").show();
					$("#HOUSE_TYPE_SELECT").hide();
				}else{
					$("#HOUSE_TYPE_SELECT").show();
					$("#SPACE_TYPE_SELECT").hide();
					$("#DESIGN_STYLE_SELECT").show();
				}
				
			});
			if($(this).prop("checked")){
				if($(this).val()==1){
					$("#DESIGN_STYLE_SELECT").hide();
					$("#SPACE_TYPE_SELECT").show();
					$("#HOUSE_TYPE_SELECT").hide();
				}else{
					$("#HOUSE_TYPE_SELECT").show();
					$("#SPACE_TYPE_SELECT").hide();
					$("#DESIGN_STYLE_SELECT").show();
				}
			}
		})
	});
	</script>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 编辑设计案例
	</div>
	<form id="inputForm" action="web/designWork/designWork!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="详情" class="current">
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
					<span class="required">*</span>设计师?设计机构:
				</th>
				<td id="memberType_radio">
					<input type="radio" name="entity.memberType" value="1" <s:if test='entity.memberType == 1'>checked="checked"</s:if>/>设计师
		 			<input type="radio" name="entity.memberType" value="2" <s:if test='entity.memberType == 2'>checked="checked"</s:if>/>设计机构
				</td>
			</tr>
			<tr id="MEMBER_TYPE_DESIGN">
				<th>
					设计师:
				</th>
			<td>
					<select class="select" value_path="nickname" name="entity.ltSpMemberId" selectType="MEMBER_TYPE_DESIGN" selectvalue="<s:property value="entity.ltSpMemberId"/>"></select>
				</td>
			</tr>	
			<tr id="MEMBER_TYPE_ORG">
				<th>
					机构:
				</th>
			<td>
					<select class="select" value_path="nickname"  name="entity.ltSpMemberId" selectType="MEMBER_TYPE_ORG" selectvalue="<s:property value="entity.ltSpMemberId"/>"></select>
				</td>
			</tr>	
			<tr>
				<th>
					标题:
				</th>
				<td>
					<input type="text" name="entity.title" class="text"  value="<s:property value="entity.title"/>"/>
				</td>
			</tr>
			<tr>
				<th>
					造价:
				</th>
				<td>
					<input type="text" name="entity.costAmt" class="text"  value="<s:property value="entity.costAmt"/>"/>
				</td>
			</tr>
			<tr>
				<th>
					面积:
				</th>
				<td>
					<input type="text" name="entity.sqm" class="text"  value="<s:property value="entity.sqm"/>"/>
				</td>
			</tr>
			<tr>
				<th>
					案例简介:
				</th>
				<td>
					<input type="text" name="entity.caseDescription" class="text"  value="<s:property value="entity.caseDescription"/>"/>
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
					图片链接一：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[0].url"/>"><br/>
					图片链接二：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[1].url"/>"><br/>
					图片链接三：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[2].url"/>"><br/>
					图片链接四：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[3].url"/>"><br/>
					图片链接五：<input type="text" name="entity.urls" class="text"  value="<s:property value="entity.picList[4].url"/>">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>网咖案例?电竞案例:
				</th>
				<td id="worksKind_radio">
					<input type="radio" name="entity.worksKind" value="0" <s:if test='entity.worksKind == 0'>checked="checked"</s:if>/>网咖案例
		 			<input type="radio" name="entity.worksKind" value="1" <s:if test='entity.worksKind == 1'>checked="checked"</s:if> />电竞案例
				</td>
			</tr>
			<tr id="DESIGN_STYLE_SELECT">
				<th>
					网咖风格:
				</th>
				<td>
					<select class="select"  name="entity.ltDnRenovationStyleId" selectType="DESIGN_STYLE" selectvalue="<s:property value="entity.ltDnRenovationStyleId"/>"></select>
				</td>
			</tr>
				
			<tr id="HOUSE_TYPE_SELECT">
				<th>
					地段:
				</th>
				<td>
					<select class="select"  name="entity.ltDnHouseTypeID" selectType="HOUSE_TYPE" selectvalue="<s:property value="entity.ltDnHouseTypeID"/>"></select>
				</td>
			</tr>	
			
			<tr id="SPACE_TYPE_SELECT">
				<th>
					电竞风格:
				</th>
				<td>
					<select class="select" name="entity.ltDnSpaceTypeId" selectType="SPACE_TYPE" selectvalue="<s:property value="entity.ltDnSpaceTypeId"/>"></select>
				</td>
			</tr>	
			
			
		</tbody></table>
		<table class="tabContent" style="display: table;width:100%;">
			<tr>
				<td>
					<iframe class="iframe" src="web/designWorkgoods/designWorkgoods!list.action?searchProperties.id=<s:property value="entity.id"/>"></iframe>
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
