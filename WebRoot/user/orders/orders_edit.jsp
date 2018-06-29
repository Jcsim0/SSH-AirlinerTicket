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

<title>填写信息-君健航空</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"  href="<%=path%>/user/booking/css/booking.css" type="text/css">
<link href="<%=path%>/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"  href="<%=path%>/user/orders/css/orders.css" type="text/css">

<script type="text/javascript" src="<%=path%>/H-ui/lib/jquery/1.9.1/jquery.js"></script>

<script type="text/javascript" src="<%=path%>/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=path%>/H-ui/static/h-ui/js/H-ui.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/InputSpinner.js"></script>
<script type="text/javascript" src="<%=path%>/user/booking/js/bookingMsg.js"></script>
<script type="text/javascript" src="<%=path%>/user/orders/js/orders.js"></script>

<style type="text/css">

.btn-secondary:hover {
    color: #fff;
    background-color: #2f7fbb;
    border-color: #f2eaa1;
}
</style>

</head>

<%-- <!--   <% -->
<!--    		 int findex = Integer.valueOf(request.getParameter("index")) ; -->
<!-- 	%> --> --%>

<body>
	<s:set value="#parameters.indexs" name="index"></s:set>
	<s:iterator value="#session.ordersList" var="ordersInfo" status="st" begin="#index" end="#index">
		<s:set value="#ordersInfo[0]" name="flight" />
		<s:set value="#ordersInfo[1]" name="orders" />	
	
<div id="wrapper">
	<div id="left-side">
		 <ul id="left-side-ul">
					<form action="javascript:;" method="get" onsubmit="return isZero();">
						<input type="hidden" name="flightId" value='<s:property value="#flight.flightId" />'>
						<input type="hidden" name="usersId" value='<s:property value="#session.users.usersId" />'> 
						<li>头等舱：￥<s:property value="#flight.firstClassPrice" />/张  剩余：<s:property value="#flight.firstClassRemain" />张</li>
						<input type="hidden" id="firstClassP" value="<s:property value='#flight.firstClassPrice' />">
						<input type="hidden" id="firstClassR" value="<s:property value='#flight.firstClassRemain' />">
						
						<li><div id="num">预订数量：</div>
							<div>
								<input id="firstClassNum" name="orders.firstClassNum" value='<s:property value="#orders.firstClassNum"/>' type="number" value="0" min="0" max="<s:property value='#flight.firstClassRemain' />" step="1">
							</div>
						</li>
						
						<li>商务舱：￥<s:property value="#flight.businessClassPrice" />/张  剩余：<s:property value="#flight.businessClassRemain" />张</li>
						<input type="hidden" id="businessClassP" value="<s:property value='#flight.businessClassPrice' />">
						<input type="hidden" id="businessClassR" value="<s:property value='#flight.businessClassRemain' />">
						<li><div id="num">预订数量：</div>
							<div>
								<input id="businessClassNum" name="orders.businessClassNum" value='<s:property value="#orders.businessClassNum"/>' type="number" value="0" min="0" max="<s:property value='#flight.businessClassRemain'/>" step="1">
							</div>
						</li>
						
						<li>经济舱：￥<s:property value="#flight.touristClassPrice" />/张  剩余：<s:property value="#flight.touristClassRemain" />张</li>
						<input type="hidden" id="touristClassP" value="<s:property value='#flight.touristClassPrice' />">
						<input type="hidden" id="touristClassR" value="<s:property value='#flight.touristClassRemain' />">
						<li><div id="num">预订数量：</div>
							<div>
								<input id="touristClassNum" name="orders.touristClassNum" value='<s:property value="#orders.touristClassNum"/>' type="number" value="0" min="0" max="<s:property value='#flight.touristClassRemain' />" step="1">
							</div>
						</li>
						
 						<li>
 							<input type="button" value="确    认" onclick="updateOrder();" style="width:200px;margin-left: 52px;" class=" btn btn-secondary radius size-L" > 
 						</li> 
					</form>
		</ul> 

	</div>

	<!-- 中间顺序条 -->
	<div id="border"></div>
	
	<div id="right-side">		
	 	<table id="right-side-table">
		 			
					<div id="right-title">尊敬的<s:property value="#session.userName" />您正在修改的是：</div>
					<input type="hidden" value="<s:property value="#orders.ordersId" />" id="orderId">
						<thead>
							<tr>
								<th id="flight-name" rowspan="1" colspan="5" >
									<i  class="Hui-iconfont" style="color: #fe4a4a;">&#xe603;</i>
									<s:property value="#flight.flightName" />航班
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="1" colspan="2"><s:property value="#flight.fromCity" /> <s:property value="#flight.fromTerminal" /></td> 
								<td rowspan="1" colspan="1"><i  class="Hui-iconfont" style="color: #fe4a4a;">&#xe67a;</i></td>
								<td rowspan="1" colspan="2"><s:property value="#flight.toCity" /> <s:property value="#flight.toTerminal" /></td>
							</tr>
							<tr>
								<td rowspan="1" colspan="2"><s:date name="#flight.startDate" format="MM-dd" />  <s:property value="#flight.startTime" /></td>
								<td rowspan="1" colspan="1"><i  class="Hui-iconfont" style="color: #fe4a4a;">&#xe690;</i></td>
								<td rowspan="1" colspan="2"><s:date name="#flight.arriveDate" format="MM-dd" />  <s:property value="#flight.arriveTime" /></td>
							</tr>
						</tbody>
				
				
		</table> 
		<div id="total">
			<ul>
				<li>
					<div>已选数量：<span id="totalNum"><s:property value="#orders.totalNum"/></span></div>
				</li>
				<li>
					<div>总计：￥<span id="moneyNum"><s:property value="#orders.totalPrice"/></span></div>
				</li>
			</ul>
		</div>
	</div>
</div>
</s:iterator>
</body>

<script type="text/javascript">
	function isZero() {
		if ($("#totalNum").text() == "0") {
			$.Huimodalalert("预订张数不能为0", 2000);
			return false;
		} else {
			return true;
		}
	}
	
	
</script>
</html>
