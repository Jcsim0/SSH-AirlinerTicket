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
    
    <title>My JSP 'plane_select.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="../meta.jsp" flush="true"></jsp:include>
	<style type="text/css">
		.btn-primary{color:#fff;background-color:#5a98de; border-color:#5a98de}
		.btn-primary:hover,
		.btn-primary:focus,
		.btn-primary:active,
		.btn-primary.active{color:#fff;background-color:#0a6999;border-color:#0a6999}
	</style>
  </head>
  
  <body style="background:url(./admin/jsp/manager_flight/img/bg-plane_selete.jpg) no-repeat;background-size:cover;min-height:auto;">
  	<form action="<%=path %>/admin/jsp/manager_flight/flight_add.jsp" onsubmit="return checkPlane();">
	    <div style="text-align:center;margin-top:30%;">
			<label style="font-size:45px;color:#2ebc98;">客机类型：</label>
			<select id="plane" name="planeInfo" style="border-radius: 150px;font-size: 30px;text-align: center;color: #219e88;background: beige;">
				<option value="no">请选择执行该航班的客机</option>
				<s:iterator value="#session.noFlying_planeList" var="planeInfo" status="st">
	       			 <option value='<s:property value="#st.index"/>'><s:property value="#planeInfo.planeName"/></option>
				</s:iterator>
			</select>
		</div>
		
		<div style="text-align: center;">
			<div style="margin-top: 35px;">
				<input type="submit" class="btn-primary" value="&nbsp;&nbsp;确认&nbsp;&nbsp;" style="border-radius: 150px;font-size:35px;cursor:pointer ;">
			</div>
		</div>
	</form>	
  </body>
  <jsp:include page="../footer.jsp" flush="true" />
  
  <script type="text/javascript">
  	function checkPlane(){
  		if($("#plane").val()=='no'){
  			layer.msg('请选择执行该航班的客机编号!',{icon: 0,time:1000});
  			return false; 			
  		}else{
  			return true;
  		}
  	}
  </script>
</html>
