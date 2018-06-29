<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
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

<title>航班列表-君健航空</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<jsp:include page="../meta.jsp" flush="true"></jsp:include>
</head>

<body>
	<nav class="breadcrumb"> 
		<i class="Hui-iconfont">&#xe67f;</i> 
		首页
		<span class="c-gray en">&gt;</span> 
		航班管理
		<span class="c-gray en">&gt;</span>
		航班列表
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"> 
			<i class="Hui-iconfont">&#xe68f;</i>
		</a> 
	</nav>
	
	<div class="page-container">
	
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l">
				<a href="javascript:;"onclick="flight_add('添加航班','adminManagerAction!queryNoFlyingPlane','1000','')"class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加航班</a>
			</span> 
		</div>
	
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			
				<thead>
					<tr class="text-c">
						<th width="80">航班编号</th>
						<th width="80">客机类型</th>
						<th width="80">出发城市</th>
						<th width="80">目的城市</th>
						<th width="130">出发时间</th>
						<th width="130">到达时间</th>
						<th width="50">行程时间</th>
						<th width="100">头等舱<br>剩余座位数</th>
						<th width="80">头等舱<br>价格</th>
						<th width="100">商务舱<br>剩余座位数</th>
						<th width="80">商务舱<br>价格</th>
						<th width="100">经济舱<br>剩余座位数</th>					
						<th width="80">经济舱<br>价格</th>
						<th width="80">状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				
				<tbody>
					<s:if test="#session.taking_off_flightList!=null">
						<s:iterator value="#session.taking_off_flightList" var="flightInfo" status="st">
							<tr class="text-c">
								<td><s:property value="#flightInfo.flightName"/></td>
								
								<td><s:property value="#flightInfo.plane.type" /></td>
								
								<td><s:property value="#flightInfo.fromCity" />  <s:property value="#flightInfo.fromTerminal" /></td>
								
								<td><s:property value="#flightInfo.toCity" />  <s:property value="#flightInfo.toTerminal" /></td>
								
								<td><s:date name="#flightInfo.startDate" format="yyyy-MM-dd" />  <s:property value="#flightInfo.startTime" /></td>
								
								<td><s:date name="#flightInfo.arriveDate" format="yyyy-MM-dd" />  <s:property value="#flightInfo.arriveTime" /></td>
								
								<td><s:property value="#flightInfo.duration"/></td>
								
								<td>
									<span id="firstClassRemain"><s:property value="#flightInfo.firstClassRemain"/></span>
									<input id="firstClassRemainInput" type="number" max='<s:property value="#flightInfo.firstClassRemain"/>' style="width:120px;display:none" class="input-text size-L radius">
								</td>

								<td>
									<span id="firstClassPrice"><s:property value="#flightInfo.firstClassPrice" /></span> 
									<input id="firstClassPriceInput"  type="number" style="width:120px;display:none" class="input-text size-L radius">
								</td>

								<td>
									<span id="businessClassRemain"><s:property value="#flightInfo.businessClassRemain"/></span>
									<input id="businessClassRemainInput" type="number" max='<s:property value="#flightInfo.businessClassRemain"/>' style="width:120px;display:none" class="input-text size-L radius">
								</td>
								
								<td>
									<span id="businessClassPrice"><s:property value="#flightInfo.businessClassPrice"/></span>
									<input id="businessClassPriceInput" type="number" style="width:120px;display:none" class="input-text size-L radius">
								</td>
								
								<td>
									<span id="touristClassRemain"><s:property value="#flightInfo.touristClassRemain"/></span>
									<input id="touristClassRemainInput" type="number" max='<s:property value="#flightInfo.touristClassRemain"/>' style="width:120px;display:none" class="input-text size-L radius">
								</td>
									
								<td>
									<span id="touristClassPrice"><s:property value="#flightInfo.touristClassPrice"/></span>
									<input id="touristClassPriceInput" type="number" style="width:120px;display:none" class="input-text size-L radius">
								</td>

								<td class="td-status">
									<span class="label label-success radius">
										<s:property value="#flightInfo.flightState"/>
									</span>
									</td>
								<td></td>										
							</tr>
						</s:iterator>
					</s:if> <!-- End 判断列表是否为空 -->
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp" flush="true" />

	<script type="text/javascript" src="<%=path%>/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=path%>/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=path%>/admin/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="<%=path %>/admin/jsp/manager_flight/js/flight.js"></script>
</body>
</html>
