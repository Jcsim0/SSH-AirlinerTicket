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


<script type="text/javascript" src="<%=path%>/H-ui/lib/jquery/1.9.1/jquery.js"></script>

<script type="text/javascript" src="<%=path%>/H-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/InputSpinner.js"></script>
<script type="text/javascript" src="<%=path%>/user/booking/js/bookingMsg.js"></script>

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
	<!--    <s:set name="index" value="#request.index"/> -->
<div id="wrapper">
	<div id="left-side">
		 <ul id="left-side-ul">
			<s:if test="#request.flightInfo!=null">
					<form action="ordersManagerAction!saveOrder" method="get" onsubmit="return isZero();">
						<input type="hidden" name="flightId" value='<s:property value="#request.flightInfo.flightId" />'>
						<input type="hidden" name="usersId" value='<s:property value="#session.users.usersId" />'> 
						<li>头等舱：￥<s:property value="#request.flightInfo.firstClassPrice" />/张  剩余：<s:property value="#request.flightInfo.firstClassRemain" />张</li>
						<input type="hidden" id="firstClassP" value="<s:property value='#request.flightInfo.firstClassPrice' />">
						<input type="hidden" id="firstClassR" value="<s:property value='#request.flightInfo.firstClassRemain' />">
						
						<li><div id="num">预订数量：</div>
							<div>
								<input id="firstClassNum" name="orders.firstClassNum" type="number" value="0" min="0" max="<s:property value='#request.flightInfo.firstClassRemain' />" step="1">
							</div>
						</li>
						
						<li>商务舱：￥<s:property value="#request.flightInfo.businessClassPrice" />/张  剩余：<s:property value="#request.flightInfo.businessClassRemain" />张</li>
						<input type="hidden" id="businessClassP" value="<s:property value='#request.flightInfo.businessClassPrice' />">
						<input type="hidden" id="businessClassR" value="<s:property value='#request.flightInfo.businessClassRemain' />">
						<li><div id="num">预订数量：</div>
							<div>
								<input id="businessClassNum" name="orders.businessClassNum" type="number" value="0" min="0" max="<s:property value='#request.flightInfo.businessClassRemain'/>" step="1">
							</div>
						</li>
						
						<li>经济舱：￥<s:property value="#request.flightInfo.touristClassPrice" />/张  剩余：<s:property value="#request.flightInfo.touristClassRemain" />张</li>
						<input type="hidden" id="touristClassP" value="<s:property value='#request.flightInfo.touristClassPrice' />">
						<input type="hidden" id="touristClassR" value="<s:property value='#request.flightInfo.touristClassRemain' />">
						<li><div id="num">预订数量：</div>
							<div>
								<input id="touristClassNum" name="orders.touristClassNum" type="number" value="0" min="0" max="<s:property value='#request.flightInfo.touristClassRemain' />" step="1">
							</div>
						</li>
						
 						<li>
 							<input type="submit" value="确    认" style="width:200px;margin-left: 52px;" class=" btn btn-secondary radius size-L" > 
 						</li> 
					</form>
			</s:if>
		</ul> 

	</div>

	<!-- 中间顺序条 -->
	<div id="border"></div>
	
	<div id="right-side">		
	 	<table id="right-side-table">
			<s:if test="#request.flightInfo!=null">
				<div id="right-title">尊敬的<s:property value="#session.userName" />您正在订购的是：</div>
					<thead>
						<tr>
							<th id="flight-name" rowspan="1" colspan="5" >
								<i  class="Hui-iconfont" style="color: #fe4a4a;">&#xe603;</i>
								<s:property value="#request.flightInfo.flightName" />航班
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="1" colspan="2"><s:property value="#request.flightInfo.fromCity" /> <s:property value="#request.flightInfo.fromTerminal" /></td> 
							<td rowspan="1" colspan="1"><i  class="Hui-iconfont" style="color: #fe4a4a;">&#xe67a;</i></td>
							<td rowspan="1" colspan="2"><s:property value="#request.flightInfo.toCity" /> <s:property value="#request.flightInfo.toTerminal" /></td>
						</tr>
						<tr>
							<td rowspan="1" colspan="2"><s:date name="#request.flightInfo.startDate" format="MM-dd" />  <s:property value="#request.flightInfo.startTime" /></td>
							<td rowspan="1" colspan="1"><i  class="Hui-iconfont" style="color: #fe4a4a;">&#xe690;</i></td>
							<td rowspan="1" colspan="2"><s:date name="#request.flightInfo.arriveDate" format="MM-dd" />  <s:property value="#request.flightInfo.arriveTime" /></td>
						</tr>
					</tbody>
			</s:if>
				
		</table> 
		<div id="total">
			<ul>
				<li>
					<div>已选数量：<span id="totalNum">0</span></div>
				</li>
				<li>
					<div>总计：￥<span id="moneyNum">0</span></div>
				</li>
			</ul>
		</div>
	</div>
</div>
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
