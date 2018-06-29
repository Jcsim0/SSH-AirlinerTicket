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
    
    <title>My JSP 'plane_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="../meta.jsp" flush="true"></jsp:include>
  </head>
  
 <body>
<article class="page-container">
	<s:set value="#parameters.planeInfo" name="index"/><!-- 获取上一个页面传过来的迭代的下标 -->
	<form action="" onsubmit="" method="post" class="form form-horizontal" id="form-flight-add">
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>航班编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text"  id="flightName" name="flightInformation.flightName" class="input-text size-L radius" onfocus="focusOnFlightNameInput();" onblur="checkFlightNameRepeat();">
				<i class="Hui-iconfont " id="rightIcon" style="color:green;position: absolute;font-size:15px;display:none;right: 20px;bottom: 5px;z-index: 1;margin-bottom: 0;">&#xe6e1;</i>
				<i class="Hui-iconfont " id="repeatIcon" style="color:red;font-size:15px;display:none;position: absolute;right: 20px;bottom: 5px;z-index: 1;margin-bottom: 0;">&#xe6dd;</i>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出发城市：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text"  id="flightFromCity" name="flightInformation.fromCity" class="input-text size-L radius">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出发城市航站楼：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text"  id="flightFromTerminal" name="flightInformation.fromTerminal" class="input-text size-L radius">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>目的城市：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text"  id="flightToCity" name="flightInformation.toCity" class="input-text size-L radius">			
			</div>
		</div>			
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>目的城市航站楼：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text"  id="flightToTerminal" name="flightInformation.toTerminal" class="input-text size-L radius">			
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出发日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="flightStartDate" name="startDate" type="text"   class="input-text size-L radius Wdate">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出发时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="startTime" name="startTime" type="text"  class="input-text size-L radius">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>到达日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="flightArriveDate" name="arriveDate" onfocus="setArriveDate()" type="text"  class="Wdate input-text size-L radius">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>到达时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="arriveTime" name="arriveTime" type="text"  class="input-text size-L radius">
			</div>
		</div>
		
		<s:iterator value="#session.noFlying_planeList" var="planeInfo" status="st"  begin="#index" end="#index">
			<input type="hidden" name="planeId" value='<s:property value="#planeInfo.planeId"/>'>
			<s:if test="#planeInfo.touristClassNum!=0">					
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>经济舱座位数<br>(最多可设置&nbsp;&nbsp;<s:property value="#planeInfo.touristClassNum"/>&nbsp;&nbsp;张)：</label>
					<div class="formControls col-xs-8 col-sm-9">  
						<input id="touristClassRemain"  name="touristClassRemain" class="input-text size-L radius"  type="number" value="0" min="0" max='<s:property value="#planeInfo.touristClassNum"/>' step="1">
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>经济舱价格(单元：RMB)：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="touristClassPrice" name="touristClassPrice" type="text" value="0" class="input-text size-L radius">
					</div>
				</div>
			</s:if>
			
			<s:if test="#planeInfo.businessClassNum!=0">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商务舱座位数：<br>(最多可设置&nbsp;&nbsp;<s:property value="#planeInfo.businessClassNum"/>&nbsp;&nbsp;张)</label>
					<div class="formControls col-xs-8 col-sm-9">  
						<input id="businessClassNum" name="businessClassRemain" class="input-text size-L radius" type="number" value="0" min="0" max='<s:property value="#planeInfo.businessClassNum"/>' step="1">
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商务舱价格(单元：RMB)：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="businessClassPrice" name="businessClassPrice" type="text" value="0" class="input-text size-L radius">
					</div>
				</div>
			</s:if>
			
			<s:if test="#planeInfo.firstClassNum!=0">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>头等舱座位数：<br>(最多可设置&nbsp;&nbsp;<s:property value="#planeInfo.firstClassNum"/>&nbsp;&nbsp;张)</label>
					<div class="formControls col-xs-8 col-sm-9">  
						<input id="firstClassNum" name="firstClassRemain" type="number" class="input-text size-L radius" value="0" min="0" max='<s:property value="#planeInfo.firstClassNum"/>' step="1">
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>头等舱价格(单元：RMB)：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="firstClassPrice" name="firstClassPrice" type="text" value="0" class="input-text size-L radius">
					</div>
				</div>
			</s:if>
		</s:iterator>
				
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<jsp:include page="../footer.jsp" flush="true" />

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="<%=path %>/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path %>/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript" src="<%=path %>/admin/jsp/manager_flight/js/flight_add.js"></script>

</body>
</html>
