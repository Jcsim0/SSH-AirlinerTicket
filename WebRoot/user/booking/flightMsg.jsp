<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>航班详情-君健航空</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="我的订单详细信息">

<link rel="stylesheet" type="text/css" href="<%=path %>/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />

<style type="text/css">
a:link{
	font-size:20px;
	text-decoration: none;
}
a:hover {
	font-size:150px;
	color:brown;
	text-decoration: underline;
}
</style>

</head>
<body  style="background:url(img/bg-flightMsg.jpg) no-repeat;background-size:cover;">
	<div id="" style="text-align:center;">		 
			<s:if test="#request.getFlightInfo!=null">					
				<s:iterator value="#request.getFlightInfo" var="Info" >		
					<span style="color:#e33c3c;;font-size:30px;text-align: left;">航班详细信息</span>
					<s:set value="#Info[0]" name="flight" />
					<s:set value="#Info[1]" name="plane" />	
					<table style="font-size:20px;margin: 0 auto;padding:15px;color: #051111e6;">
						<tr><td>航班号：<s:property value="#flight.flightName" /></td></tr>
														
						<tr><td>机型：<s:property value="#plane.type" /></td></tr>
						
						<tr><td>客机编号：<s:property value="#plane.planeName" /></td></tr>
						
						<tr><td>出发城市/航站楼：<s:property value="#flight.fromCity" />  <s:property value="#flight.fromTerminal" /></td></tr>
							
						<tr><td>目的城市/航站楼：<s:property value="#flight.toCity" />  <s:property value="#flight.toTerminal" /></td></tr>
							
						<tr><td>出发时间：<s:date name="#flight.startDate" format="yyyy-MM-dd" /> <s:property value="#flight.startTime" /></td></tr>
							
						<tr><td>到达时间：<s:date name="#flight.arriveDate" format="yyyy-MM-dd" /> <s:property value="#flight.arriveTime" /></td></tr>
							
						<tr><td>行程时间：<s:property value="#flight.duration" /></td></tr>
							
						<tr><td>头等舱：￥<s:property value="#flight.firstClassPrice" />/张  剩余：<s:property value="#flight.firstClassRemain" /> 张</td></tr>
							
						<tr><td>商务舱：￥<s:property value="#flight.businessClassPrice" />/张  剩余：<s:property value="#flight.businessClassRemain" /> 张</td></tr>
							
						<tr><td>经济舱：￥<s:property value="#flight.touristClassPrice" />/张 剩余：<s:property value="#flight.touristClassRemain" /> 张</td></tr>
																				
						<tr><td>飞机状态：<s:property value="#flight.flightState" /></td></tr>
				</table>
				</s:iterator>
			</s:if>
			<s:else>
				<div style="font-size: 50px;">
					数据出错啦<i style="color: brown;font-size: 100px;" class="Hui-iconfont">&#xe657;</i><br/>
					刷新一下试试<a title="刷新" href="javascript:;"><i style="color: brown;font-size: 100px;" class="Hui-iconfont">&#xe68f;</i></a>
				</div>
			</s:else>				
	</div>
</body>
</html>
