<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中餐厅-后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<jsp:include page="./meta.jsp" flush="true"></jsp:include>

<jsp:include page="./footer.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=path %>/js/clock.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
</head>

  <body>
    <header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="javascript:;">中餐厅后台管理系统</a> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.1</span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><span class="logos mynavbar-slogan " style="margin-left: 20px;color:white"id="clock"></span>				
				</li>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li><s:property value="#session.admin.job"/></li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A"><s:property value="#session.admin.adminName"/> <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
						<li><a href="adminManagerAction!changeAdmin">切换账户</a></li>
						<li><a href="adminManagerAction!loginOut">退出</a></li>
				</ul>
			</li>
				<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>

<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<s:if test="#session.admin.job=='系统管理员'">
			<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 餐单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ordersManagerAction!findAllOrders" data-title="餐单管理" href="javascript:void(0)">查看所有餐单</a></li>
					<li><a data-href="ordersManagerAction!queryUnpaidOrdes" data-title="未付费餐单管理" href="javascript:void(0)">未付费餐单</a></li>				
					<li><a data-href="ordersManagerAction!querySubmittedOrders" data-title="已提交餐单管理" href="javascript:void(0)">已提交餐单</a></li>
					<li><a data-href="ordersManagerAction!queryMakingOrdes" data-title="制作中餐单管理" href="javascript:void(0)">制作中餐单</a></li>
					<li><a data-href="ordersManagerAction!queryPaidOrdes" data-title="已完成餐单管理" href="javascript:void(0)">已完成餐单</a></li>
				</ul>
			</dd>
		</dl>	

		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe613;</i> 菜单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="categoryManagerAction!queryAllCategoryList" data-title="类别管理" href="javascript:void(0)">类别管理</a></li>
					<li><a data-href="menuManagerAction!queryAllMenuList" data-title="菜品管理" href="javascript:void(0)">菜品管理</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 制作管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ordersManagerAction!queryHaveToMakeOrders" data-title="制作列表" href="javascript:;">制作列表</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="admin-role.html" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
					<li><a data-href="admin-permission.html" data-title="权限管理" href="javascript:void(0)">权限管理</a></li>
					<li><a data-href="admin-list.html" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
			</ul>
			</dd>
		</dl>		
	</s:if>
	<s:elseif test="#session.admin.job=='前台服务员'">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 餐单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ordersManagerAction!findAllOrders" data-title="餐单管理" href="javascript:void(0)">查看所有餐单</a></li>
					<li><a data-href="ordersManagerAction!queryUnpaidOrdes" data-title="未付费餐单管理" href="javascript:void(0)">未付费餐单</a></li>				
					<li><a data-href="<%=path %>/admin/jsp/orders/submittedOrdersList.jsp" data-title="已提交餐单管理" href="javascript:void(0)">已提交餐单</a></li>
					<li><a data-href="ordersManagerAction!queryMakingOrdes" data-title="制作中餐单管理" href="javascript:void(0)">制作中餐单</a></li>
					<li><a data-href="ordersManagerAction!queryPaidOrdes" data-title="已完成餐单管理" href="javascript:void(0)">已完成餐单</a></li>
				</ul>
			</dd>
		</dl>	
	</s:elseif>
	<s:elseif test="#session.admin.job=='菜单管理员'">
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe613;</i> 菜单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="categoryManagerAction!queryAllCategoryList" data-title="类别管理" href="javascript:void(0)">类别管理</a></li>
					<li><a data-href="menuManagerAction!queryAllMenuList" data-title="菜品管理" href="javascript:void(0)">菜品管理</a></li>
				</ul>
			</dd>
		</dl>
	</s:elseif>
	<s:elseif test="#session.admin.job=='厨房管理员'">
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 制作管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ordersManagerAction!queryHaveToMakeOrders" data-title="制作列表" href="javascript:;">制作列表</a></li>
				</ul>
			</dd>
		</dl>
	</s:elseif>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="./admin/welcome.html">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="./admin/welcome.html"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<script type="text/javascript" src="<%=path %>/admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/
});
/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content: '<div>管理员信息</div>'
	});
}

/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
var clock = new Clock();
	clock.display(document.getElementById("clock")); 
</script> 
</body>
</html>
