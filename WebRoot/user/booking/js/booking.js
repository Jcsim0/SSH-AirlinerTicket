/**
 * 
 */
/* 弹出层 */
/*
 * 参数解释： title 标题 url 请求的url id 需要操作的数据id w 弹出层宽度（缺省调默认值） h 弹出层高度（缺省调默认值）
 */
function layer_show(title, url, w, h) {
	if (title == null || title == '') {
		title = false;
	}
	;
	if (url == null || url == '') {
		url = "404.html";
	}
	;
	if (w == null || w == '') {
		w = 800;
	}
	;
	if (h == null || h == '') {
		h = ($(window).height() - 50);
	}
	;
	layer.open({ // 参数设置 参考http://www.layui.com/doc/modules/layer.html#offset
		type : 2,
		area : [ w + 'px', h + 'px' ],
		offset : '5%',// 快捷设置顶部坐标
		fix : false, // 不固定
		move : false,// 禁止拖拽
		maxmin: false,
		shade : 0.4,
		title : title,
		content : url
	});
}
/* 关闭弹出框口 */
function layer_close() {
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[9]}// 制定列不参与排序
		]
	});
	
});

/*航班-查看*/
function booking_show(isLogin,title,url,w,h){
	if(isLogin.length<1){
			alert('您还没有登录，请登录后再查看！');
			window.location.href = "login.jsp";
	}else{
		layer_show(title,url,w,h);
	}	
}

/*航班详情-查看*/
function flightMsg_show(title,url,w,h){
	layer_show(title,url,w,h);	
}
    
