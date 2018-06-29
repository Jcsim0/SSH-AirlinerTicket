<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'all_ordersList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<jsp:include page="../meta.jsp" flush="true"></jsp:include>
<title>餐单列表</title>

  </head>
  
  <body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 
		首页 <span class="c-gray en">&gt;</span> 
		用户管理 <span class="c-gray en">&gt;</span> 
		所有用户
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		<i class="Hui-iconfont">&#xe68f;</i>
	</a>
</nav>
<div class="page-container">	
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="80">姓名</th>
					<th width="80">性别</th>
					<th width="80">证件号</th>
					<th width="80">手机</th>				
					<th width="80">邮箱</th>
					<th width="80">地区</th>
				</tr>
			</thead>
			<tbody>
			<s:if test="#session.all_usersList!=null">
				<s:iterator value="#session.all_usersList" var="usersInfo" status="st">
				<tr class="text-c">
					<td><s:property value="#usersInfo.name"/></td>
					<td><s:property value="#usersInfo.sex"/></td>
					<td><s:property value="#usersInfo.idCard"/></td>		
					<td><s:property value="#usersInfo.phone"/></td>
					<td><s:property value="#usersInfo.email"/></td>
					<td><s:property value="#usersInfo.country"/></td>
				</tr>
				</s:iterator>
			</s:if>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="../footer.jsp" flush="true" />

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=path %>/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 0, "asc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"pading":false,
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  //{"orderable":false,"aTargets":[5]}// 不参与排序的列
	]
});
</script> 
</body>
</html>
