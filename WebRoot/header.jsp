<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="<%=path%>/H-ui/lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/clock.js"></script>
<script type="text/javascript" src="<%=path%>/H-ui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=path %>/js/index.js"></script>


<link href="<%=path%>/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path %>/H-ui/static/h-ui/css/H-ui.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/css/head.css" type="text/css">

</head>

<body>
	<!-- 顶部导航栏 -->
	<div class="mynavbar-wrapper">
		<div class="mynavbar mynavbar-black">
			<div class="container cl">
				<span class="logos mynavbar-slogan " style="margin-left: 20px;"
					id="clock"></span> <a
					class="logos mynavbar-logos f-l mr-10 hidden-xs"
					href="<%=path%>/index.jsp">君健航空</a> <span
					class="logos mynavbar-slogan f-l mr-10 hidden-xs">安全&middot;快捷
					&middot; 舒适</span>
				<nav class="mynav mynavbar-mynav mynav-collapse" role="mynavigation"
					id="Hui-mynavbar">

				<ul class="cl">
					<li ><a href="<%=path%>/index.jsp">首页</a></li>

					<li><a href="flightInfoAction!queryAll">机票查询</a></li>

					<li class="dropDown dropDown_hover"><a href="javascript:;">我的账户<i
							class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a onclick="showMyMsg('<s:property value="#session.userName"/>','个人信息','<%=path %>/user/userMsg.jsp','500','400')" href="javascript:;">我的信息</a></li>
							<li><a onclick="return isLogin('<s:property value="#session.userName"/>')" href="ordersManagerAction!queryUserOrdersListByUsersId">我的订单</a></li>
						</ul>	
					</li>

					<li class="dropDown dropDown_hover"><a href="#">关于我们<i
							class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" target="_blank">公司简介</a></li>
							<li><a href="javascript:;" target="_blank">免责条款</a></li>
							<li><a href="<%=path%>/html/privacy.html" target="_blank">隐私保护</a></li>
							<li><a href="<%=path%>/html/registerAgreement.html"
								target="_blank">用户注册协议</a></li>
						</ul></li>

					<s:if test="#session.userName!=null">
						<li class="dropDown dropDown_hover" style=" float:right; "><a
							href="javascript:;">欢迎您：<s:property value="#session.userName" /><i
								class="Hui-iconfont">&#xe6d5;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="userManagerAction!loginOut">退出</a></li>
							</ul></li>
					</s:if>
					<s:else>
						<li style=" float:right; "><a href="<%=path%>/register.jsp">注册</a></li>
						<li style=" float:right; "><a href="<%=path%>/login.jsp">登录</a></li>
					</s:else>

				</ul>

				</nav>
			</div>
		</div>
	</div>
</body>
<script type=text/javascript>
	var clock = new Clock();
	clock.display(document.getElementById("clock"));
</script>
</html>
