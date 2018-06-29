/**
 * 
 */

$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[7,8]}// 制定列不参与排序
		]
	});
	
});
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

/*订单详情-查看*/
function orders_show(title,url,w,h){
		layer_show(title,url,w,h);	
}

//修改订单
function updateOrder(obj){
	$.ajax({
		type: 'POST',
		url: 'ordersAjaxAction!updateMyOrder',
		data : {
			'firstClassNum':$("#firstClassNum").val(),
			'businessClassNum':$("#businessClassNum").val(),
			'touristClassNum':$("#touristClassNum").val(),
			'orderId':$("#orderId").val()
		},
		dataType: 'json',
		success: function(data){
		console.debug("data="+data);
				//layer.msg('订单修改成功!', {icon:6,time:1000});
				$.Huimodalalert("<i class=\'Hui-iconfont\'style=\'color:green;font-size:20px;\'>&#xe68e;</i><i style='color:black;'>订单修改成功!</i>",1000);
				parent.setTimeout('location.replace(location.href)',1500);
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index); 
		},
		error:function(data) {
			console.debug(data);
			//layer.msg('订单修改失败，稍后再试试吧!',{icon: 5,time:1000});
			$.Huimodalalert("<i class=\'Hui-iconfont\'style=\'color:red;font-size:20px;\'>&#xe691;</i><br>订单修改失败，稍后再试试吧!",1000);
		},
	});
	
}

function delOrder(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				type: 'POST',
				url: 'ordersAjaxAction!delMyOrder',
				data:{'orderId':id},
				dataType: 'json',
				success: function(data){
					console.debug(data);
					$(obj).parents("tr").remove();
					parent.$.Huimodalalert("<i class=\'Hui-iconfont\'style=\'color:green;font-size:20px;\'>&#xe68e;</i><i style='color:black;'>已删除!</i>",1000);
					//parent.location.replace(parent.location.href);
					var index = parent.layer.getFrameIndex(window.name);
					//parent.$('.btn-refresh').click();
					parent.layer.close(index); 
				},
				error:function(data) {
					console.log(data);
					$.Huimodalalert("<i class=\'Hui-iconfont\'style=\'color:red;font-size:20px;\'>&#xe691;</i><br>订单删除失败，稍后再试试吧!",1000);
				},
			});		
		});
}


/* =======================================================================
 * jQuery.Huimodalalert.js alert
 * ========================================================================*/
!function($) {
	$.Huimodalalert = function(info, speed) {
		if ($(".modal-alert").length > 0) {
			$(".modal-alert").remove();
		}
		if (speed == 0 || typeof(speed) == "undefined") {
			$(document.body).append('<div id="modal-alert" class="modal modal-alert radius">' + '<div class="modal-alert-info">' + info + '</div>' + '<div class="modal-footer"> <button class="btn btn-primary radius" onClick="$.Huimodalalert.hide()">确定</button></div>' + '</div>');
			$("#modal-alert").fadeIn();
		} else {
			$(document.body).append('<div id="modal-alert" class="modal modal-alert radius" >' + '<div style="color:red;font-size:20px;" class="modal-alert-info">' + info + '</div>' + '</div>');
			$("#modal-alert").fadeIn();
			setTimeout($.Huimodalalert.hide, speed);
		}
	}
	$.Huimodalalert.hide = function() {
		$("#modal-alert").fadeOut("normal",
		function() {
			$("#modal-alert").remove();
		});
	}
} (window.jQuery);

