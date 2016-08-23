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
    <title>设计需求管理</title>
    <%@ include file="/WEB-INF/pages/web/common/public.jsp" %>
    
    <script type="text/javascript" src="resources/pc/js/util.js"></script>
    <script type="text/javascript" src="resources/pc/js/layer/layer.js"></script>
	<script type="text/javascript">
		$(function(){
			
		})
		var checkId = 0;
		var zhipaiId;
	function test(checkId,checkName){
	
		checkId = checkId;
		console.log(checkId)
		console.log(checkName)
		$.ajax({
			url:'<%=basePath%>web/designDemand/designDemand!save.action',
			method:'post',
			dataType:'json',
			data:{
				"entity.id":zhipaiId,
				"entity.designMemberId":checkId,
				"entity.state":1,
				"result":"json"
			},
			success:function(data){
				if(data.success){
					window.location.href="<%=basePath%>web/designDemand/designDemand!list.action";
				}
			},
			error:function(){
				alert("error")
			}
		});
	}
		function zhipai(id){
			zhipaiId = id;
			layer.open({
		    type: 2,
		    //skin: 'layui-layer-lan',
		    title: '指派设计师/设计机构',
		    fix: false,
		    shadeClose: true,
		    style:"top:0",
		    maxmin: true,
		    area: ['1200px', '800px'],
		   // content: 'http://layer.layui.com/?form=local',
		   	content:getRootPath()+'/web/common/member!list.action',
		    end: function(){
		      layer.tips('试试相册模块？', '#photosDemo', {tips: 1})
		    }
		  });
		}
		
		function quxiao(){
			alert("1421")
			layer.close();
		}
		
		function reason(reason){
			layer.alert("拒绝原因：" + reason +"!");
		}
	</script>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 设计需求列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/designDemand/designDemand!list.action" method="post">
		<div class="search">
			<table>
				<tr>
					<th>
						名称：
					</th>
					<td>
						<input type="text" name="searchProperties['nickname']" class="text"  value="<s:property value="searchProperties['nickname']"/>"/>
					</td>
				<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		<div class="bar">
			<a href="web/designDemand/designDemand!add.action" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/designDemand/designDemand!delete.action">
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
					<a href="javascript:;" class="sort" name="state">状态</a>
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
						<s:property value="nickname" />
					</td>
					
					<td>
						<s:property value="phoneNo" />
					</td>
					<td>
						<s:property value="areaName" />
					</td>
					<td>
						<s:property value="projectType" />
					</td>
					<td>
						<s:property value="areaSqm" />
					</td>
					<td>
						<s:property value="budgetName" />
					</td>
					<td>
						<s:property value="minAmt" />
					</td>
					<td>
						<s:property value="maxAmt" />
					</td>
					<td>
						<s:if test="state==0"><a style="">[待指派]</a></s:if>
						<s:if test="state==1"><a style="color:red;">[已指派]</a></s:if>
						<s:if test="state==2"><a style="color:red;">[进行中]</a></s:if>
						<s:if test="state==3"><a style="color:red;">[已完成]</a></s:if>
						<s:if test="state==4"><a style="color:red;">[已拒绝]</a></s:if>
						<s:if test="state==-1"><a style="color:red;">[已作废]</a></s:if>
					</td>
					<td>
						<a href="web/designDemand/designDemand!edit.action?id=<s:property value="id"/>">[编辑]</a>
						<s:if test="state==0"><!--<a href="web/designDemand/designDemand!zhipai.action?id=<s:property value="id"/>">[指派]</a>-->
							<a onclick="zhipai('<s:property value="id"/>');">[指派]</a>
							
						</s:if>
						<s:if test="state==1"><a style="color:red;">[已指派]</a></s:if>
						<s:if test="state==2"><a style="color:red;">[进行中]</a></s:if>
						<s:if test="state==3"><a style="color:red;">[已完成]</a></s:if>
						<s:if test="state==4"><a style="color:red;">[已拒绝]</a><a id="reason" onclick="reason('<s:property value="reason"/>')">[查看]</a></s:if>
						<s:if test="state==-1"><a style="color:red;">[已作废]</a></s:if>
						<a href="web/designDemand/designDemand!delete.action?ids=<s:property value="id"/>">[删除]</a>
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
