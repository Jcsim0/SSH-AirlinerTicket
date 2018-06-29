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

<title>订单详情-君健航空</title>

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
<body  style="background:url(img/bg-ordersMsg.jpg) no-repeat;background-size:cover;"> <!-- background:burlywood; --> 
	<div id="" style="text-align:center;">		 
			<s:if test="#session.ordersList!=null">			
 				<s:set value="#parameters.myOrderIndex" name="index"> </s:set>		
				<s:iterator value="#session.ordersList" var="ordersInfo" begin="#index" end="#index">		
					<s:set value="#ordersInfo[0]" name="flight" />
					<s:set value="#ordersInfo[1]" name="orders" />
						<s:if test="#orders.state=='待出行'">
							<span style="color:#e33c3c;;font-size:30px;text-align: left;" >请在飞机起飞前两小时带上证件到柜台办理登机手续</span>
						</s:if><!-- End 判断是否以出行 -->
						<s:else>
							<span style="color:#e33c3c;;font-size:30px;text-align: left;">欢迎您再次乘坐君健航空，祝您生活愉快！</span>
						</s:else>

						<table style="font-size:20px;margin: 0 auto;padding:15px;color: #008b8be6;">
							<tr><td>航班号：<s:property value="#flight.flightName" /></td></tr>
						
							<tr><td>出发城市/航站楼：<s:property value="#flight.fromCity" />  <s:property value="#flight.fromTerminal" /></td></tr>
							
							<tr><td>目的城市/航站楼：<s:property value="#flight.toCity" />  <s:property value="#flight.toTerminal" /></td></tr>
							
							<tr><td>出发时间：<s:date name="#flight.startDate" format="yyyy-MM-dd" /> <s:property value="#flight.startTime" /></td></tr>
							
							<tr><td>到达时间：<s:date name="#flight.arriveDate" format="yyyy-MM-dd" /> <s:property value="#flight.arriveTime" /></td></tr>
							
							<tr><td>行程时间：<s:property value="#flight.duration" /></td></tr>
							
							<tr><td>头等舱：<s:property value="#orders.firstClassNum" />张</td></tr>
							
							<tr><td>商务舱：<s:property value="#orders.businessClassNum" />张</td></tr>
							
							<tr><td>经济舱：<s:property value="#orders.touristClassNum" />张</td></tr>
							
							<tr><td>订单时间：<s:property value="#orders.ordersTime" /></td></tr>
							
							<tr><td>总费用：￥<s:property value="#orders.totalPrice" /></td></tr>
							
							<tr><td>订单状态：<s:property value="#orders.state" /></td></tr>
							
							<s:if test="#orders.refundOrConversion=='退票'">
								<tr><td>退票时间：<s:property value="#orders.refundTime" /></td></tr>
							</s:if>
							<s:elseif test="#orders.refundOrConversion=='改签'">
								<tr><td>改签时间：<s:property value="#orders.conversionTime" /></td></tr>
							</s:elseif>
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

<script type="text/javascript">

</script>
</html>
