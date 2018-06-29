<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">

<title>君健航空</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="<%=path %>/css/index.css" type="text/css">
<link href="<%=path %>/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path %>/H-ui/static/h-ui/css/H-ui.css" type="text/css">
<link rel="stylesheet" href="<%=path %>/css/head.css" type="text/css">

<script type="text/javascript" src="<%=path %>/H-ui/lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.SuperSlide.2.1.2.source.js"></script>
<script type="text/javascript" src="<%=path %>/js/from_to/fixdiv.js"></script>
<script type="text/javascript" src="<%=path %>/js/from_to/address.js"></script>
<script type="text/javascript" src="<%=path %>/H-ui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=path %>/H-ui/lib/layer/2.4/layer.js"></script>
	
<script type="text/javascript" src="<%=path %>/js/index.js"></script>
<script type="text/javascript" src="<%=path %>/js/clock.js"></script>
<script type="text/javascript" src="<%=path %>/js/judgeLogin.js"></script>

</head>

<body>
	<!-- 顶部导航栏 -->
	<div class="mynavbar-wrapper">
		<div class="mynavbar mynavbar-black">
			<div class="container cl">
				<span class="logos mynavbar-slogan " style="margin-left: 20px;"
					id="clock"></span> <a
					class="logos mynavbar-logos f-l mr-10 hidden-xs" href="<%=path %>/index.jsp">君健航空</a>
				<span class="logos mynavbar-slogan f-l mr-10 hidden-xs">安全&middot;快捷 &middot; 舒适</span>
				<nav class="mynav mynavbar-mynav mynav-collapse" role="mynavigation"id="Hui-mynavbar">

				<ul class="cl">
					<li class="current"><a href="<%=path %>/index.jsp">首页</a></li>
					
					<li><a href="flightInfoAction!queryAll">机票查询</a></li>
					
					<li class="dropDown dropDown_hover">
						<a href="javascript:;">我的账户<i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a onclick="showMyMsg('<s:property value="#session.userName"/>','个人信息','<%=path %>/user/userMsg.jsp','500','400')" href="javascript:;">我的信息</a></li>
							<li><a onclick="return isLogin('<s:property value="#session.userName"/>')" href="ordersManagerAction!queryUserOrdersListByUsersId">我的订单</a></li>
						</ul>	
					</li>
					
					<li class="dropDown dropDown_hover">
						<a href="#">关于我们<i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" target="_blank">公司简介</a></li>
							<li><a href="javascript:;" target="_blank">免责条款</a></li>
							<li><a href="<%=path %>/html/privacy.html" target="_blank">隐私保护</a></li>
							<li><a href="<%=path %>/html/registerAgreement.html" target="_blank">用户注册协议</a></li>
						</ul>
					</li>
					
					<s:if test="#session.userName!=null">
						<li class="dropDown dropDown_hover" style=" float:right; ">
							<a href="javascript:;">欢迎您：<s:property value="#session.userName"/><i class="Hui-iconfont">&#xe6d5;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">					
									<li><a  href="userManagerAction!loginOut">退出</a></li>
								</ul>
						</li>
					</s:if>
					<s:else>
						<li style=" float:right; "><a href="<%=path %>/register.jsp">注册</a></li>
						<li style=" float:right; "><a href="<%=path %>/login.jsp">登录</a></li>
					</s:else>
					
				</ul>

				</nav>
			</div>
		</div>
	</div>

	<!-- 图标logo -->
	<div style="margin: 5px auto;">
		<img alt="logo" src="<%=path %>/img/logo-login.png">
	</div>

	<!-- 幻灯片 -->
	<div class="fullSlide">
		<div class="bd">
			<ul>
				<li><a target="_blank" href="javascript:;"><img src="<%=path %>/img/slide/img1.jpg" /></a></li>
				<li><a target="_blank" href="javascript:;"><img src="<%=path %>/img/slide/img2.jpg" /></a></li>
				<li><a target="_blank" href="javascript:;"><img src="<%=path %>/img/slide/img3.jpg" /></a></li>
				<li><a target="_blank" href="javascript:;"><img src="<%=path %>/img/slide/img4.jpg" /></a></li>
				<li><a target="_blank" href="javascript:;"><img src="<%=path %>/img/slide/img5.jpg" /></a></li>
				<li><a target="_blank" href="javascript:;"><img src="<%=path %>/img/slide/img6.jpg" /></a></li>
			</ul>
		</div>

		<div class="hd">
			<ul></ul>
		</div>

		<a class="prev" href="javascript:void(0)"></a> 
		<a class="next" href="javascript:void(0)"></a>
	</div>


	<!-- 选项卡 -->
	<div id="wrapper-bg">
		<div id="wrapper">
			<!-- 左边消息栏 -->
			<div id="left-side">
				<ul>
					<!-- 订购机票 -->
					<li class="booking active">
						<div class="icon active">
							<i class="Hui-iconfont">&#xe603;</i>
						</div> 订购机票
					</li>

					<!-- 搜索航班 -->
					<li class="search">
						<div class="icon">
							<i class="Hui-iconfont">&#xe709;</i>
						</div> 搜索航班
					</li>

					<!-- 浏览航班信息 -->
					<li class="browse">
						<div class="icon">
							<i class="Hui-iconfont">&#xe667;</i>
						</div> 浏览航班信息
					</li>
					
				</ul>
			</div>
			<!-- end left-side -->

			<!-- 中间顺序条 -->
			<div id="border">
				<div id="line" class="one"></div>
			</div>

			<!-- 右边消息栏 -->
			<div id="right-side">
				<div id="first" class="active">
						<div class="icon big">
							<i  class="Hui-iconfont">&#xe603;</i> 机票
						</div>
					<form action="flightInfoAction!bookingSearch" method="get" onsubmit="return check();">
						<div class="from_to">
							<div id="fromCity">
								出发城市： <input onblur="checkStartCity()"class="input-text radius" style="width: 200px;"
									type="text" value="" size="15" id="homecity_name"
									name="flightInfo.fromCity" mod="address|notice"
									mod_address_source="hotel"
									mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@"
									mod_address_reference="cityid" mod_notice_tip="中文/拼音" /> 
									<input id="cityid" name="cityid" type="hidden" value="{$cityid}" />
							</div>

							<div id="toCity">
								目的城市： <input class="input-text radius" type="text"
									style="width: 200px;" value="" size="15" id="getcity_name"
									name="flightInfo.toCity" mod="address|notice"
									mod_address_source="hotel"
									mod_address_suggest="@Beijing|北京|53@Shanghai|上海|321@Shenzhen|深圳|91@Guangzhou|广州|80@Qingdao|青岛|292@Chengdu|成都|324@Hangzhou|杭州|383@Wuhan|武汉|192@Tianjin|天津|343@Dalian|大连|248@Xiamen|厦门|61@Chongqing|重庆|394@"
									mod_address_reference="getcityid" mod_notice_tip="中文/拼音" /> 
									<input id="getcityid" name="getcityid" type="hidden" value="{$getcityid}" />
							</div>

						</div>

						<div class="date">
							<div class="startDate">
								出发日期： <input type="text" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"  name="flightInfo.startDate" class="input-text radius" placeholder="出发日期" id="startDate">
							</div>
						</div>

						<div class="booking-submit">
							<input type="submit" value="搜    索" style="width:200px" class=" btn btn-secondary radius size-L">
						</div>
					</form>
				</div><!-- End first -->

				<div id="second">
					<div class="icon big">
						<i  class="Hui-iconfont">&#xe709;</i>
					</div>

					<form action="flightInfoAction!queryFlightByFlightName" method="get" onsubmit="return check();">
						<div class="from_to">
							<ul style="list-style:none;">
								<li>
									&nbsp;&nbsp;&nbsp;航班号： <input class="input-text radius" id="flightName" name="flightInfo.flightName" onblur="checkFlightName();" placeholder="航班号" style="width: 200px;" type="text"  size="15" >
								</li>
								
								<li>
									出发日期： <input type="text" id="flightstartDate"  name="flightInfo.startDate" onblur="checkStartDate2();" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" style="width: 200px;""  class="input-text radius" placeholder="出发日期">
								</li>
							</ul>
						</div>
					<div class="booking-submit">
							<input type="submit" value="搜    索" style="width:200px"  class=" btn btn-secondary radius size-L">
						</div>
					</form>

				</div><!-- End second -->

				<div id="third">
					<div class="icon big">
						<i class="Hui-iconfont">&#xe667;</i>
					</div>

					<h1>Browse information</h1>

				</div><!-- End third -->

			</div><!-- end right-side -->
		</div><!-- end wrapper -->
	</div>

	<jsp:include page="./html/foot.html" flush="true" />
	
<!-- 订购机票拼音中文搜索候选框 -->
	<div id="jsContainer" class="jsContainer" style="height:0">
		<div id="tuna_alert" style="display:none;position:absolute;z-index:999;overflow:hidden;"></div>
		<div id="tuna_jmpinfo" style="visibility:hidden;position:absolute;z-index:120;"></div>
	</div>

</body>
<script type=text/javascript>
	var clock = new Clock();
	clock.display(document.getElementById("clock"));
    lay('#version').html('-v'+ laydate.v);
    laydate.render({
      elem: '#startDate'
      ,theme: '#393D49'
    });
     laydate.render({
      elem: '#flightstartDate'
      ,theme: '#393D49'
    });
</script>
</html>
