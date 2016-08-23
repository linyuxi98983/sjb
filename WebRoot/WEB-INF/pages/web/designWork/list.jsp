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
    <title>设计案例管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
     <script type="text/javascript" src="resources/pc/js/layer/layer.js"></script> 
	<script type="text/javascript">
	
		$(function(){
			  
		})
		
		function openDialog(o){
			
			var id = $(o).attr("cid");
			
			layer.confirm('序号：<input type="text" id="orderNoVal">', function(index){
			  var orderNo = $("#orderNoVal").val();
			  $.ajax({
		             type: "post",
		             url: "web/designWork/designWork!updateOrderNo.action",
		             data: {
		             	'entity.id':id,
		             	'entity.orderNo':orderNo
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
			  layer.close(index);
			  window.location.reload();
			});  
		}
	</script>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 设计案例列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/designWork/designWork!list.action" method="post">
		<div class="search">
			<table>
				<tr>
				
					<th>
						名称：
					</th>
					<td>
						<input type="text" name="searchProperties['name']" class="text"  value="<s:property value="searchProperties['name']"/>"/>
					</td>
					
					<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		<div class="bar">
			<a href="web/designWork/designWork!add.action" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/designWork/designWork!delete.action">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="menuWrap pageSizeMenu"></div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="orderNo">编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">标题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="costAmt">造价</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="sqm">面积</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="browseCount">浏览数</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="caseDescription">案例简介</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="memberName">设计师</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="designStyle">装修网咖风格</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="spaceType">电竞风格</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			<s:iterator value="list" status="statu" >   
				<tr>
					<td>
					<input type="checkbox" name="ids" value="<s:property value="id" />">
					</td>
					<td>
						<input name="orderNo" class="orderNo" type="text" value="<s:property value="orderNo" />" onclick="openDialog(this)" cid="<s:property value="id" />"/>
					</td>		
					
					<td>
						<s:property value="title" />
					</td>
					<td>
						<s:property value="costAmt" />
					</td>
					<td>
						<s:property value="sqm" />
					</td>
					<td>
						<s:property value="browseCount" />
					</td>
					<td>
						<s:property value="caseDescription" />
					</td>
					<td>
						<s:property value="memberName" />
					</td>
					<td>
						<s:property value="designStyle" />
					</td>
					<td>
						<s:property value="spaceType" />
					</td>
					<td>
						<a href="web/designWork/designWork!edit.action?id=<s:property value="id"/>">[编辑]</a>
						
					</td>
				</tr>
				</s:iterator>
		</tbody></table>
		<!-- 分页条 -->
		<div class="pagination" pageNumber="<s:property value="#request.pager.pageNumber"/>" 
			pageSize="<s:property value="#request.pager.pageSize"/>"
			searchProperty="<s:property value="#request.pager.searchProperty"/>"
			orderProperty="<s:property value="#request.pager.orderProperty"/>"
			orderDirection="<s:property value="#request.pager.orderDirection"/>"/>
	</form>

</body>
</html>
