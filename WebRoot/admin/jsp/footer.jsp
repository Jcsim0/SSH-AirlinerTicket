<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script type="text/javascript" src="<%=path %>/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=path %>/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=path %>/admin/static/h-ui.admin/js/H-ui.admin.js"></script> 