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
    <title>设计机构管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
     <script type="text/javascript" src="resources/pc/js/util.js"></script>
	<script type="text/javascript">
		function checkRecord(){
	    var $checkedIds = $("#listTable input[name='ids']:enabled:checked");
	    	if($checkedIds.length > 1){
	    		parent.layer.alert("只能分配一个设计师或者设计机构！");
	    		return;
	    	}
	    	
	    	if($checkedIds.length == 0){
	    		parent.layer.alert("请选择一个设计师或者设计机构进行分配！");
	    		return;
	    	}
	    	//console.log($checkedIds.parent().next().text().trim())
	    	var checkId = $checkedIds.val();
	    	var	checkName = $checkedIds.parent().next().text().trim();
	    	parent.test(checkId,checkName);
	    	parent.layer.closeAll();
	    }
		
		
		$(function(){
			//alert(queryUrlParam("checkVal"))
			$("#quxiao").on("click",function(){
				parent.layer.closeAll();
			});
			$("#queding").on("click",function(){
				checkRecord();				
			});
		})
	</script>
  </head>
<body>
	<div class="path">
		(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/common/member!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						设计机构名称：
					</th>
					<td>
						<input type="text" name="searchProperties['nickname']" class="text"  value="<s:property value="searchProperties['nickname']"/>"/>
					</td>
					<th>
						手机号码：
					</th>
					<td>
						<input type="text" name="searchProperties['phoneNo']" class="text"  value="<s:property value="searchProperties['phoneNo']"/>"/>
					</td>
					<th>类型：</th>
					<td>
						<select name="searchProperties['selectType']" style="width:200px;height:25px;">
						  <option selected="selected" value="">请选择</option>
						  <option value="1">设计师</option>
						  <option value="2">设计机构</option>
						</select>
					</td>
					<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		
		<table id="listTable" class="list">
			<tbody><tr>
				<th class="check">
					<input type="checkbox" id="selectAll">
				</th>
				<th>
					<a href="javascript:;" class="sort" name="nickname">昵称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="phoneNo">手机号码</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="type">类型</a>
				</th>
				
			</tr>
			<s:iterator value="list" status="statu" >   
				<tr>
					<td>
						<input type="checkbox" name="ids" value="<s:property value="id" />">
					</td>
					<td>
						<s:property value="nickname" />
					</td>
					<td>
						<s:property value="phoneNo" />
					</td>
					<td>
						<s:if test='memberType == 1'>设计师</s:if>
						<s:if test='memberType == 2'>设计机构</s:if>
					</td>
				</tr>
				</s:iterator>
		</tbody></table>
		<!-- 分页条 -->
		<div class="pagination" pageNumber="<s:property value="#request.pager.pageNumber"/>" 
			pageSize="<s:property value="#request.pager.pageSize"/>"
			searchProperty="<s:property value="#request.pager.searchProperty"/>"
			orderProperty="<s:property value="#request.pager.orderProperty"/>"
			orderDirection="<s:property value="#request.pager.orderDirection"/>"></div>
	</form>


	<div style="margin:0px auto;margin-top:50px;text-align: center">
		<input type="button" class="button" value="确定" style="width:100px;" id="queding"/><input id="quxiao" type="button" class="button" value="取消" style="width:100px;"/>
	</div>
</body>
</html>
