<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>君健航空</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
a:hover {
	text-decoration: underline;
}
</style>

</head>


<body>
	<jsp:include page="../header.jsp" flush="true" />
	<div style="width: 960px;margin: 32px auto;padding: 0 24px;">
		<div
			style="background:url(img/login-out-bg.jpg) no-repeat;background-size:cover;text-align: center;width:100%;height:80%;margin:2% auto;">
			<div style="margin:20px auto; padding:250px; font-size:25px;">
				您已成功退出君健航空官网 <a style=" color:#ff1818;" href="<%=path%>/login.jsp">重新登录</a>
			</div>
		</div>
	</div>
</body>
</html>
