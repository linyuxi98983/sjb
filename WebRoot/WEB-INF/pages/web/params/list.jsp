<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>系统参数</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
	<script type="text/javascript">
	var validator;
	$().ready(function() {
	
		var $inputForm = $("#inputForm");
		
		// 表单验证
		validator = $inputForm.validate({
			
		});
		
		$("select").each(function(){
			createSelects(this);
		});
		
		// 重新生成图片
		$(".recreateimg").click(function(){
			$.ajax({
				url: "web/params/params!recreateimg.action",
				type: "POST",
				data: {},
				dataType: "json",
				cache: false,
				success: function(message) {
					if(message.success){
						alert('生成成功！');
					}else{
						alert('生成失败！'+message.errorMsg);
					}
				}
			});
		});
	});
	
	function createSelects(o){
		var $this = $(o);
		var data = $this.attr("data");
		var selectvalue = $this.attr("selectvalue");
		var list = data.split(",");
		$this.append('<option value="">--请选择--</option>');
		for(var i=0;i<list.length;i++){
			var v = list[i];
			var n = list[i];
			var selected = (v == value || n == value) ? 'selected="selected"' : '';
			$this.append('<option value="'+v+'" '+selected+'>'+n+'</option>');
		}
	}
	
	function saveform(){
		if(!tipbeforesubmit(validator)) return;
		$("#inputForm").submit();
	}
	</script>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 系统参数管理
	</div>
	<form id="inputForm" action="web/params/params!save.action" method="post" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="系统参数管理" class="current">
			</li>
		</ul>
		<table class="input tabContent" style="display: table;">
			<tbody>
			<tr style="display:none">
				<th>重新生成缩略图：</th>
				<td>
					<input type="button" class="button recreateimg" value="生成">
				</td>
			</tr>
			<s:iterator value="list" status="statu" var="param"> 
				<!-- 只显示110开头的是电商参数 -->
				<tr>
					<th>
						<s:if test="#param.notNull == 1">
							<span style="color:red">*</span>
						</s:if>
						<s:property value="#param.description"/>:
					</th>
					<td>
						<input type="hidden" name="list[<s:property value="#statu.index"/>].id" value="<s:property value="#param.id"/>"/>
						<input type="hidden" name="list[<s:property value="#statu.index"/>].editType" value="<s:property value="#param.editType"/>"/>
						<!-- 0:字符型 3:整数 4:浮点数-->
						<s:if test="#param.editType == 0 || #param.editType == 3 || #param.editType == 4">
							<input type="text" name="list[<s:property value="#statu.index"/>].value" class="text" <s:if test="#param.notNull == 1">required="true"</s:if> <s:if test="#param.readonly == 1">readonly="readonly"</s:if> value="<s:property value="#param.value"/>"  tip="请输入<s:property value="#param.description"/>" <s:if test="#param.editType == 3">digits="true"</s:if><s:elseif test="#param.editType == 4">number="true"</s:elseif>>
						</s:if>
						<!-- 勾选 -->
						<s:elseif test="#param.editType == 1">
							<input type="checkbox" name="list[<s:property value="#statu.index"/>].value" <s:if test="#param.readonly == 1">readonly="readonly"</s:if> <s:if test="#param.value == 1">checked="checked"</s:if> tip="请输入<s:property value="#param.description"/>"> 
						</s:elseif>
						<!-- 选择项 -->
						<s:elseif test="#param.editType == 2">
							 <select name="list[<s:property value="#statu.index"/>].value" <s:if test="#param.readonly == 1">readonly="readonly"</s:if> selectvalue="<s:property value="#param.value"/>" data="<s:property value="#param.pickItems"/>"></select>
						</s:elseif>
						<!-- 多行文本 -->
						<s:elseif test="#param.editType == 5">
							 <textarea class="text" name="list[<s:property value="#statu.index"/>].value" <s:if test="#param.notNull == 1">required="true"</s:if> <s:if test="#param.readonly == 1">readonly="readonly"</s:if>><s:property value="#param.value"/></textarea>
						</s:elseif>
					</td>
				</tr>
			</s:iterator>
		</tbody></table>
		<table class="input">
			<tbody><tr>
				<th>&nbsp;
					
				</th>
				<td>
					<input type="button" class="button" value="保 存" onclick="saveform()">
				</td>
			</tr>
		</tbody></table>
	</form>
</body>
</html>
