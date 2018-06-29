<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录 - 中餐厅</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--[if lt IE 9]>
<script type="text/javascript" src="<%=path %>/admin/lib/html5shiv.js"></script>
<script type="text/javascript" src="<%=path %>/admin/lib/respond.min.js"></script>
<![endif]-->
<link href="<%=path %>/admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/admin/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/admin/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path %>/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=path %>/admin/login/js/admin_login.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<%=path %>/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

  </head>
  
  <body onload="createCode();">
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
  
    <form class="form form-horizontal"  method="post" onsubmit="return check();">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="account" name="adminUser.account" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="adminUser.password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="codeNum"class="input-text size-L" type="text" placeholder="验证码" onblur="checkCodeNum()" style="width:150px;">
     		<span id="checkCode" style="color:red;font-size:20px;"></span>		
          <a id="kanbuq" href="javascript:createCode();">看不清，换一张</a>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            	使我保持登录状态
            </label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 君健航空 by H-ui.admin v3.1</div>

</body>
</html>
