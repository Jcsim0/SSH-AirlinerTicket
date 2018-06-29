<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="../meta.jsp" flush="true"></jsp:include>
  </head>
  
  <body>
    <nav class="breadcrumb">
    	<i class="Hui-iconfont">&#xe67f;</i> 
    	首页 <span class="c-gray en">&gt;</span> 
    	管理员管理 <span class="c-gray en">&gt;</span> 
    	管理员列表 
    	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
    		<i class="Hui-iconfont">&#xe68f;</i>
   		</a>
   </nav>
	<div class="page-container">
	
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="5">管理员列表</th>
			</tr>
			<tr class="text-c">
				<th width="40">ID</th>
				<th width="150">姓名</th>
				<th width="90">手机</th>
				<th width="120">角色</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<s:if test="#session.all_adminList!=null">
				<s:iterator value="#session.all_adminList" var="adminInfo" status="st">
					<tr class="text-c">
						<td><span id="adminId"><s:property value="#adminInfo.adminId"/></span></td>
						<td><span id="adminAccount"><s:property value="#adminInfo.account"/></span>	</td>
						
						<td>
							<span id="adminPhone"><s:property value="#adminInfo.adminPhone"/></span>
							<input id="adminPhoneInput" name="adminUser.adminPhone" style="display:none;width:150px;" class="input-text size-L radius">
						</td>
						
						<td><s:property value="#adminInfo.adminName"></s:property>
						
						<td class="td-manage">
							<a title="编辑" href="javascript:;"  id="edit" onclick="changeAdmin(this)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i>
							<a title="取消更改" href="javascript:;"  id="cancelEdit" onclick="cancelEdit(this)" class="ml-5" style="text-decoration:none;display:none"><i class="Hui-iconfont">&#xe706;</i></a> 
							<a title="提交" href="javascript:;"  id="submitt" onclick="submitAdmin(this,'<s:property value="#adminInfo.adminId"/>')" class="ml-5" style="text-decoration:none;display:none"><i class="Hui-iconfont">&#xe632;</i></a> 
						</td>
					</tr>
				</s:iterator>
			</s:if>
		</tbody>
	</table>
</div>
<jsp:include page="../footer.jsp" flush="true"></jsp:include>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=path %>/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=path %>/admin/jsp/manager_admin/js/admin.js"></script>

 </body>
</html>
