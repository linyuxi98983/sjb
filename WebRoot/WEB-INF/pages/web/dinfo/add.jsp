<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.jshop.common.Global"%>
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
    <title>行业咨询添加</title>
    <link href="resources/web/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/web/css/jqModal.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/web/js/jquery.js"></script>

<script type="text/javascript" src="resources/web/js/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="resources/web/baidu_editor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="resources/web/baidu_editor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="resources/web/baidu_editor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
	var ue = UE.getEditor('editor');
	
	function saveform(){
	
	$("#html_id").val(UE.getEditor('editor').getContent());
			 $.ajax({
		             type: "post",
		             url: "web/dinfo/dinfo!save.action",
		             data: {
		             	"entity.id":"",
		             	"entity.title":$("#title").val()
		             },
		             dataType: "json",
		             success: function(data){
		                        if(data.success){
		                        	layer.alert("修改成功");
		                        }else{
		                        	layer.alert("修改失败")
		                        }
		                      }
		         });
	}
	function check(){
		var ue = UE.getEditor('editor'); //UE.getEditor('editor').getContent()
		if(ue.getContent() != ""){
			$("#html_id").val(ue.getContent());
		}
	}
	</script>
	<style type="text/css">
		.text{
			width:350px!important;
		}
	</style>
  </head>
  
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 添加行业咨询
	</div>
	<form id="inputForm" action="web/dinfo/dinfo!save.action" method="post" enctype="multipart/form-data" novalidate="novalidate" onsubmit="return check();">
		
		<table class="input tabContent" style="display: table;">
			<tbody>
			<tr>
				<th>
					序号:
				</th>
				<td>
				<input type="hidden" name="entity.id" class="text" value="<s:property value="entity.id"/>">
					<input type="text" name="entity.orderNo" class="text" value="<s:property value="entity.orderNo"/>" tip="序号">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required"></span>预览文:
				</th>
				<td>
					<input type="text" name="entity.preview" class="text" value="<s:property value="entity.preview"/>" tip="预览文">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required"></span>标题:
				</th>
				<td>
					<input type="text" name="entity.title" class="text" value="<s:property value="entity.title"/>" tip="标题">
				</td>
			</tr>
			<tr>
				<th>
					<span class="required">*</span>HTML:
				</th>
				<td>
					<script id="editor"  type="text/plain" style="width:800px;height:500px;"></script>
					<input type="hidden" name="entity.html" id="html_id" class="text" value="<s:property value="entity.html"/>" tip="">
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
