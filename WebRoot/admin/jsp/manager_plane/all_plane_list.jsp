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

<title>客机列表-君健航空</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<jsp:include page="../meta.jsp" flush="true"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=path %>/admin/jsp/manager_plane/css/plane.css" />
</head>

<body>
	<nav class="breadcrumb"> 
		<i class="Hui-iconfont">&#xe67f;</i> 
		首页
		<span class="c-gray en">&gt;</span> 
		客机管理
		<span class="c-gray en">&gt;</span>
		客机列表
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"> 
			<i class="Hui-iconfont">&#xe68f;</i>
		</a> 
	</nav>
	
	<div class="page-container">
	
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l">
				<a href="javascript:;"onclick="plane_add('添加客机','<%=path %>/admin/jsp/manager_plane/plane_add.jsp','','510')"class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加客机</a>
			</span> 
		</div>
	
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			
				<thead>
					<tr class="text-c">
						<th width="80">客机编号</th>
						<th width="80">客机类型</th>
						<th width="100">购买日期</th>
						<th width="100">使用日期</th>
						<th width="120">经济舱座位数</th>
						<th width="120">商务舱座位数</th>
						<th width="120">头等舱座位数</th>
						<th width="200">备注</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				
				<tbody>
					<s:if test="#session.all_planeList!=null">
						<s:iterator value="#session.all_planeList" var="planeInfo"
							status="st">
							<tr class="text-c">
								<td>
									<input type="hidden" id="planeId" value=''>		
									<span id="planeName"><s:property value="#planeInfo.planeName"/></span>
									<input id="planeNameInput" type="text" style="width:120px;display:none" class="input-text size-L radius">									
								</td>
								
								<td>
									<span id="planeType"><s:property value="#planeInfo.type" /></span>
									<input id="planeTypeInput" type="text" style="width:120px;display:none;" class="input-text size-L radius"> 									
								</td>
								
								<td>
									<span id="planeBuyDate"><s:date name="#planeInfo.buyDate" format="yyyy-MM-dd" /></span>
									<input id="planeBuyDateInput" type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'planUseDateInput\')||\'%y-%M-%d\'}' })"  class="input-text size-L radius Wdate" style="width:120px;display:none;">
								</td>
								
								<td>
									<span id="planeUseDate"><s:date name="#planeInfo.useDate" format="yyyy-MM-dd" /></span>
									<input id="planUseDateInput" type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'planeBuyDateInput\')}',maxDate:'%y-%M-%d' })"  class="Wdate input-text size-L radius" style="width:120px;display:none;">
								</td>
								
								<td>
									<span id="planeTouristClassNum"><s:property value="#planeInfo.touristClassNum"/></span>
									<input id="planeTouristClassNumInput" type="text" style="width:120px;display:none" class="input-text size-L radius">
								</td>
								
								<td>
									<span id="planeBusinessClassNum"><s:property value="#planeInfo.businessClassNum"/></span>
									<input id="planeBusinessClassNumInput" type="text" style="width:120px;display:none" class="input-text size-L radius">
								</td>
								
								<td>
									<span id="planeFirstClassNum"><s:property value="#planeInfo.firstClassNum"/></span>
									<input id="planeFirstClassNumInput" type="text" style="width:120px;display:none" class="input-text size-L radius">
								</td>
								<td>
									<span id="planeRemark"><s:property value="#planeInfo.remark"/></span>
									<div id="planeRemarkInputDiv" class="cl share_category_wp" style="display:none;">
										<div class="cl">
											<span class="r count_txt">还能输入<strong id='currentLength<s:property value="#planeInfo.planeId"/>'>80</strong>字</span>
										</div>
										<textarea id="planeRemarkInputVal" onkeyup='checkLength(this,80,<s:property value="#planeInfo.planeId"/>);' class="textarea radius inputstyle" name="" cols="" rows=""></textarea>
									</div>
								</td>
								<td class="f-14 td-manage">
									<a style="text-decoration:none" id="edit" onclick="changePlane(this);" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
									<a style="text-decoration:none;display:none;" id="cancel" onclick="cancel(this);" href="javascript:;" title="取消"><i class="Hui-iconfont">&#xe706;</i></a>  
									<a style="text-decoration:none;display:none;" id="submitt" onclick="submitPlane(this,'<s:property value="#planeInfo.planeId"/>');" href="javascript:;" title="提交"><i class="Hui-iconfont">&#xe632;</i></a>  
									<a style="text-decoration:none" class="ml-5" id="delect" onClick="delPlane(this,'<s:property value="#planeInfo.planeId"/>')" href="javascript:;" title="删除">
										<i class="Hui-iconfont">&#xe6e2;</i>
									</a>
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp" flush="true" />

	<script type="text/javascript" src="<%=path%>/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=path%>/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=path%>/admin/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="<%=path %>/admin/jsp/manager_plane/js/plane.js"></script>
</body>
</html>
