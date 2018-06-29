<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/jsp/manager_plane/css/plane.css" />
	<jsp:include page="../meta.jsp" flush="true"></jsp:include>
  </head>
  
 <body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-plane-add">
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>客机编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text size-L radius" value="" onfocus="focusOnPlaneNameInput();" onblur="checkPlaneNameRepeat();" id="planeName" name="plane.planeName">
				<i class="Hui-iconfont " id="rightIcon" style="color:green;position: absolute;font-size:15px;display:none;right: 20px;bottom: 5px;z-index: 1;margin-bottom: 0;">&#xe6e1;</i>
				<i class="Hui-iconfont " id="repeatIcon" style="color:red;font-size:15px;display:none;position: absolute;right: 20px;bottom: 5px;z-index: 1;margin-bottom: 0;">&#xe6dd;</i>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>客机类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text size-L radius" value="" placeholder="" id="planeType" name="plane.type">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>购买日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="planeBuyDate" name="plane.buyDate" type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'planUseDate\')||\'%y-%M-%d\'}' })"  class="input-text size-L radius Wdate">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>使用日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="planUseDate" name="plane.useDate" type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'planeBuyDate\')}'})"  class="Wdate input-text size-L radius">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">经济舱座位数：</label>
			<div class="formControls col-xs-8 col-sm-9">  
				<input id="touristClassNum" name="plane.touristClassNum" type="number" value="0" min="0" max="1000" step="1">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">商务舱座位数：</label>
			<div class="formControls col-xs-8 col-sm-9">  
				<input id="businessClassNum" name="plane.businessClassNum" type="number" value="0" min="0" max="1000" step="1">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">头等舱座位数：</label>
			<div class="formControls col-xs-8 col-sm-9">  
				<input id="firstClassNum" name="plane.firstClassNum" type="number" value="0" min="0" max="1000" step="1">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="remark" name="plane.remark"  onkeyup="checkLength(this,80);" class="textarea radius inputstyle" cols="" rows=""></textarea>
				<span class="r count_txt textarea-numberbar">还能输入<strong id="currentLength">80</strong>字</span>
			</div>
		</div>
		
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
<script type="text/javascript" src="<%=path %>/admin/jsp/manager_plane/js/plane_add.js"></script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
