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
	<script type="text/javascript">
	</script>
  </head>
<body>
	<div class="path">
		<a href="web/common/main.action">首页</a> » 设计机构列表 <span>(共<span id="pageTotal"><s:property value="#request.pager.pageCount" /></span>条记录)</span>
	</div>
	<form id="listForm" action="web/org/org!list.action" method="post">
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
				</tr>
				<tr>
					<th>
						状态：
					</th>
					<td>
						<input type="radio" name="searchProperties['closed']" value="2" <s:if test='searchProperties == null || searchProperties["closed"] == "2"'>checked="checked"</s:if>/>全部
				 		<input type="radio" name="searchProperties['closed']" value="0" <s:if test='searchProperties["closed"] == "0"'>checked="checked"</s:if>/>运行中
				 		<input type="radio" name="searchProperties['closed']" value="1" <s:if test='searchProperties["closed"] == "1"'>checked="checked"</s:if>/>已冻结
					</td>
					<th>
						注册时间：
					</th>
					<td>
						从<input type="text" class="Wdate" name="searchProperties['startDate']" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'})" value="<s:property value="searchProperties['startDate']"/>"/>
						至<input type="text" class="Wdate" name="searchProperties['endDate']" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'})" value="<s:property value="searchProperties['endDate']"/>"/>
					</td>
					<td>
						<input type="button" class="button" value="搜 索" onclick="$.pageSkip(1)">
					</td>
				</tr>
			</table>
		</div>
		<div class="bar">
			<a href="web/org/org!add.action" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled" url="web/org/org!delete.action">
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
					<a href="javascript:;" class="sort" name="nickname">昵称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="phoneNo">手机号码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="closed">状态</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="registerTime">注册时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="loginTime">最后登录时间</a>
				</th>
				
				<th>
					<a href="javascript:;" class="sort" name="point">当前积分</a>
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
						<s:if test='closed == 0'>
							运行中
						</s:if>
						<s:else>
							已冻结
						</s:else>
					</td>
					<td>
						<s:property value="registerTime" />
					</td>
					<td>
						<span title="<s:property value="loginTime"/>"><s:property value="loginTime"/></span>
					</td>
					
					<td>
						<s:property value="point" />
					</td>
					<td>
						<a href="web/org/org!edit.action?id=<s:property value="id"/>">[编辑]</a>
						<s:if test='closed == 0'>
							<a href="#" onclick="updateField('org',{'entity.id':<s:property value="id"/>,'entity.closed':1}); return false;">[冻结]</a>
						</s:if>
						<s:else>
							<a href="#" onclick="updateField('org',{'entity.id':<s:property value="id"/>,'entity.closed':0}); return false;">[解冻]</a>
						</s:else>
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
