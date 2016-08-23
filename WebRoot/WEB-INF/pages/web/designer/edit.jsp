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
    <title>设计师编辑</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 编辑设计师
	</div>
	<form id="inputForm" action="web/designer/designer!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate">
		<input type="hidden" name="entity.id" value="<s:property value="entity.id"/>">
		
		<table class="input tabContent" style="display: table;">
			<tbody>
			<tr>
				<th>
					头像：
				</th>
				<td>
					<input type="hidden" name="entity.otSpPictureId" value="<s:property value="entity.otSpPictureId"/>"/>
					<table class="imgtable"><tbody><tr><td><img class="inputImg" src="<s:property value="entity.imagePath"/>"/></td></tr></tbody></table>
					<br/>
					<input type="file" name="entity.image">
				</td>
			</tr>
			<tr>
				<th>
					身份证正面图片：
				</th>
				<td>
					<input type="hidden" name="entity.idFrontPictureId" value="<s:property value="entity.idFrontPictureId"/>"/>
					<table class="imgtable"><tbody><tr><td><img class="inputImg" src="<s:property value="entity.idFrontPictureImagePath"/>"/></td></tr></tbody></table>
					<br/>
					<input type="file" name="entity.idFrontPictureImage">
				</td>
			</tr>
			<tr>
				<th>
					身份证背面图片：
				</th>
				<td>
					<input type="hidden" name="entity.idBackPictureId" value="<s:property value="entity.idBackPictureId"/>"/>
					<table class="imgtable"><tbody><tr><td><img class="inputImg" src="<s:property value="entity.idBackPictureImagePath"/>"/></td></tr></tbody></table>
					<br/>
					<input type="file" name="entity.idBackPictureImage">
				</td>
			</tr>
			<tr>
				<th>
					设计经验:
				</th>
				<td>
					<input type="text" name="entity.designExperience" class="text"  value="<s:property value="entity.designExperience"/>">
				</td>
			</tr>
			<tr>
				<th>
					擅长空间:
				</th>
				<td>
					<input type="text" name="entity.goodsAtSpace" class="text"  value="<s:property value="entity.goodsAtSpace"/>">
				</td>
			</tr>
			<tr>
				<th>
					证书与奖励:
				</th>
				<td>
					<input type="text" name="entity.awards" class="text"  value="<s:property value="entity.awards"/>">
				</td>
			</tr>
			<tr>
				<th>
					设计最低收费:
				</th>
				<td>
					<input type="text" name="entity.minDesignAmt" class="text"  value="<s:property value="entity.minDesignAmt"/>">
				</td>
			</tr>
			
			<tr>
				<th>
					人气:
				</th>
				<td>
					<input type="text" name="entity.browseCount" class="text"  value="<s:property value="entity.browseCount"/>">
				</td>
			</tr>
			<tr>
				<th>
					粉丝数:
				</th>
				<td>
					<input type="text" name="entity.fansCount" class="text"  value="<s:property value="entity.fansCount"/>">
				</td>
			</tr>
			<tr>
				<th>
					关注数:
				</th>
				<td>
					<input type="text" name="entity.followCount" class="text"  value="<s:property value="entity.followCount"/>">
				</td>
			</tr>
			<tr>
				<th>
					需求数:
				</th>
				<td>
					<input type="text" name="entity.demandCount" class="text"  value="<s:property value="entity.demandCount"/>">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>手机号码:
				</th>
				<td>
					<input type="text" name="entity.phoneNo" class="text"  value="<s:property value="entity.phoneNo"/>">
				</td>
			</tr>
			<tr>
				<th>
					密码:
				</th>
				<td>
					<input type="password" name="entity.password" class="text"  value="<s:property value="entity.password"/>">
					<input type="hidden" name="entity.designerType" value="<s:property value="entity.designerType"/>"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>设计师等级:
				</th>
				<td>
					<s:iterator value="designerLevelList" status="statu">
					<input type="radio" name="entity.designerLevel" value="<s:property value="#statu.index + 1"/>" <s:if test='entity.designerLevel == #statu.index + 1'>checked="checked"</s:if>/><s:property value="value"/>
					</s:iterator>
				</td>
			</tr>
			<tr>
				<th>
					昵称:
				</th>
				<td>
					<input type="text" name="entity.nickname" class="text"  value="<s:property value="entity.nickname"/>">
				</td>
			</tr>
			<tr>
				<th>
					真实姓名:
				</th>
				<td>
					<input type="text" name="entity.realName" class="text"  value="<s:property value="entity.realName"/>">
				</td>
			</tr>
			<tr>
				<th>
					当前积分:
				</th>
				<td>
					<s:property value="entity.point"/>
				</td>
			</tr>
			<tr>
				<th>
					邮箱:
				</th>
				<td>
					<input type="text" name="entity.email" class="text"  value="<s:property value="entity.email"/>">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>性别:
				</th>
				<td>
					<input type="radio" name="entity.sex" value="0" <s:if test='entity.sex == 0'>checked="checked"</s:if>/>男
		 			<input type="radio" name="entity.sex" value="1" <s:if test='entity.sex == 1'>checked="checked"</s:if>/>女
				</td>
			</tr>
			<tr>
				<th>
					生日:
				</th>
				<td>
					<input type="text" class="Wdate" name="entity.birthday" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'})" value="<s:property value="entity.birthday"/>"/>
				</td>
			</tr>
			
			<tr>
				<th>
					地区:
				</th>
				<td>
					<input type="hidden" class="lselect" lselectType="AREA_NODES" id="sysSpAreaId" name="entity.sysSpAreaId" value="<s:property value="entity.sysSpAreaId"/>" treePath="<s:if test="null != entity.area.parent.parent.id">,<s:property value="entity.area.parent.parent.id"/></s:if>,<s:property value="entity.area.parent.id"/>,<s:property value="entity.area.id"/>,"/>
				</td>
			</tr>
			
			<tr>
				<th>
					<span class="required">*</span>状态:
				</th>
				<td>
					<input type="radio" name="entity.closed" value="0" <s:if test='entity.closed == 0'>checked="checked"</s:if>/>运行中
		 			<input type="radio" name="entity.closed" value="1" <s:if test='entity.closed == 1'>checked="checked"</s:if>/>冻结
				</td>
			</tr>
		</tbody></table>
		<table class="input tabContent" style="display: none;">
			<tr>
				<td>
					<iframe class="iframe" src="web/designerticket/designerticket!list.action?searchProperties.designerId=<s:property value="entity.id"/>"></iframe>
				</td>
			</tr>
		</table>
		<table class="input tabContent" style="display: none;">
			<tr>
				<td>
					<iframe class="iframe" src="web/designeraddress/designeraddress!list.action?searchProperties.designerId=<s:property value="entity.id"/>"></iframe>
				</td>
			</tr>
		</table>
		<table class="input tabContent" style="display: none;">
			<tr>
				<td>
					<iframe class="iframe" src="web/getpoint/getpoint!list.action?searchProperties.designerId=<s:property value="entity.id"/>"></iframe>
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
