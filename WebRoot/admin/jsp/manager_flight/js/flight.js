/**
 * 
 */
$(function() {
	$('.table-sort').dataTable({
		"aaSorting" : [ [ 13, "desc" ] ],// 默认第几个排序
		"bStateSave" : true,// 状态保存
		"pading" : false,
		"aoColumnDefs" : [
		// {"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
			"orderable" : false,
			"aTargets" : [ 14 ]
		} // 不参与排序的列
		]
	});	
});

/*客机-添加*/
function flight_add(title, url, w, h) {
	layer_show(title, url, w, h);
}

/*修改航班价格和座位数*/
function changeFlight(obj){
	var o=$(obj).parents("tr");
	
	//显示头等舱价格输入框
    var fp = o.find("#firstClassPrice").text();
    o.find("#firstClassPriceInput").val(fp);
    o.find("#firstClassPriceInput").show();
    
    //显示头等舱剩余座位数输入框
    var fr = o.find("#firstClassRemain").text();
    o.find("#firstClassRemainInput").val(fr);
    o.find("#firstClassRemainInput").show();
    
    //显示商务舱价格输入框
    var bp = o.find("#businessClassPrice").text();
    o.find("#businessClassPriceInput").val(bp);
    o.find("#businessClassPriceInput").show();
    
    //显示商务舱座位数输入框
    var br = o.find("#businessClassRemain").text();
    o.find("#businessClassRemainInput").val(br);
    o.find("#businessClassRemainInput").show();
    
    //显示经济舱价格输入框
    var tp = o.find("#touristClassPrice").text();
    o.find("#touristClassPriceInput").val(tp);
    o.find("#touristClassPriceInput").show();
 
    //显示经济舱座位数输入框
    var tr = o.find("#touristClassRemain").text();
    o.find("#touristClassRemainInput").val(tr);
    o.find("#touristClassRemainInput").show();
    
 
     
    o.find("#firstClassPrice").hide();  //隐藏头等舱价格Span
    o.find("#firstClassRemain").hide();		//隐藏头等舱剩余量Span
    
    o.find("#businessClassPrice").hide();		//隐藏商务舱价格Span
    o.find("#businessClassRemain").hide();		//隐藏商务舱座位数Span
    
    o.find("#touristClassPrice").hide();	//隐藏经济舱价格Span
    o.find("#touristClassRemain").hide();	//隐藏经济舱座位数Span

    
    o.find("#edit").hide();
    o.find("#submitt").show();
    o.find("#cancelEdit").show();
    o.find("#cancelFlight").hide();
    o.find("#flying").hide();
}

/**
 * 提交编辑后的航班信息*/
function submitFlight(obj,id){
	var o=$(obj).parents("tr");
	
	var fp = o.find("#firstClassPriceInput").val();
	var bp = o.find("#businessClassPriceInput").val();
	var tp = o.find("#touristClassPriceInput").val();
	
	var fr = o.find("#firstClassRemainInput").val();
	var br = o.find("#businessClassRemainInput").val();
	var tr = o.find("#touristClassRemainInput").val();
	
	flight_update(fp,bp,tp,fr,br,tr,id);   
	 
	o.find("#firstClassPrice").text(fp); 
    o.find("#businessClassPrice").text(bp);  
    o.find("#touristClassPrice").text(tp);
    
    o.find("#firstClassRemain").text(fr);
    o.find("#businessClassRemain").text(br);
    o.find("#touristClassRemain").text(tr);
    
   

	o.find("#firstClassPriceInput").hide();
	o.find("#businessClassPriceInput").hide(); 
	o.find("#touristClassPriceInput").hide();
    o.find("#firstClassRemainInput").hide();
    o.find("#businessClassRemainInput").hide();
    o.find("#touristClassRemainInput").hide();

    
    o.find("#firstClassPrice").show();
	o.find("#businessClassPrice").show(); 
	o.find("#touristClassPrice").show();
    o.find("#firstClassRemain").show();
    o.find("#businessClassRemain").show();
    o.find("#touristClassRemain").show();


    o.find("#edit").show();
    o.find("#cancelFlight").show();
    o.find("#flying").show();
    o.find("#submitt").hide(); 
    o.find("#cancelEdit").hide();
}

/*
 * 异步执行数据库更新航班信息*/
function flight_update(fp,bp,tp,fr,br,tr,id){
	layer.confirm('确认更改吗？', {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'adminAjaxAction!updateNewFlight',
			data:{
				'flightId':id,
				'fp':fp,
				'bp':bp,
				'tp':tp,
				'fr':fr,	
				'br':br,
				'tr':tr
				},
			dataType: 'json',
			success: function(data){
				console.debug("data="+data);
				layer.msg('更新成功!', {icon:6,time:1000});
			},
			error:function(data) {
				console.debug(data);
				layer.msg('更新失败，稍后再试试吧!',{icon: 5,time:1000});
			},
		});
		
	});	
}

/**
 * 取消更新
 * @param obj
 */
function cancelEdit(obj){
	var o=$(obj).parents("tr");
	 o.find("#edit").show();
	 o.find("#cancelFlight").show();
	 o.find("#flying").show();
	 o.find("#submitt").hide(); 
	 o.find("#cancelEdit").hide();
	 
	 o.find("#firstClassPriceInput").hide();
	 o.find("#businessClassPriceInput").hide(); 
	 o.find("#touristClassPriceInput").hide();
	 o.find("#firstClassRemainInput").hide();
	 o.find("#businessClassRemainInput").hide();
	 o.find("#touristClassRemainInput").hide();

	    
	 o.find("#firstClassPrice").show();
	 o.find("#businessClassPrice").show(); 
	 o.find("#touristClassPrice").show();
	 o.find("#firstClassRemain").show();
	 o.find("#businessClassRemain").show();
	 o.find("#touristClassRemain").show();
}

/*
 * 异步执行数据库更新航班状态*/
function flight_cancel(obj,id){
	layer.confirm("确定取消航班吗？", {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'adminAjaxAction!updateFlightState',
			data:{
				'flightId':id,
				'state':'已取消',
				},
			dataType: 'json',
			success: function(data){
				console.debug("data="+data);				
				$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已取消</span>');
				$(obj).parents("tr").find("#flying").hide();
				$(obj).parents("tr").find("#fly").show();
				//$(obj).parents("tr").find("#cancelFlight").show();
				$(obj).remove();
				layer.msg('航班取消成功!', {icon:6,time:1000});
			},
			error:function(data) {
				console.debug(data);
				layer.msg('航班取消失败，稍后再试试吧!',{icon: 5,time:1000});
			},
		});
		
	});	
}


function flight_flying(obj,id){
	layer.confirm("确定起飞航班吗？", {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'adminAjaxAction!updateFlightState',
			data:{
				'flightId':id,
				'state':'已起飞',
				},
			dataType: 'json',
			success: function(data){
				console.debug("data="+data);
				
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已起飞</span>');
				$(obj).parents("tr").find("#flying").hide();
				$(obj).parents("tr").find("#edit").hide();
				$(obj).parents("tr").find("#cancelFlight").hide();
				$(obj).remove();
				layer.msg('发布航班起飞任务完成!', {icon:6,time:1000});
			},
			error:function(data) {
				console.debug(data);
				layer.msg('发布航班起飞任务失败，稍后再试试吧!',{icon: 5,time:1000});
			},
		});
		
	});	
}

function flight_readyFly(obj,id){
	layer.confirm("确定发布航班吗？", {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'adminAjaxAction!updateFlightState',
			data:{
				'flightId':id,
				'state':'未起飞',
				},
			dataType: 'json',
			success: function(data){
				console.debug("data="+data);
				$(obj).parents("tr").find(".td-status").html('<span class="label label-warning radius">未起飞</span>');
				//$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="ml-5" id="cancelFlight" onClick="flight_cancel('+obj+','+id+')" href="javascript:;" title="取消航班任务"><i class="Hui-iconfont">&#xe6de;</i></a>');
				//$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none;" id="flying" onclick="flight_flying('+obj+','+id+')" href="javascript:;" title="航班起飞"><i class="Hui-iconfont">&#xe603;</i></a>');
				$(obj).parents("tr").find("#flying").show();
				$(obj).parents("tr").find("#edit").show();
				$(obj).parents("tr").find("#cancelFlight").show();
				$(obj).parents("tr").find("#fly").hide();
				$(obj).remove();
				layer.msg('发布航班成功!', {icon:6,time:1000});
			},
			error:function(data) {
				console.debug(data);
				layer.msg('发布航班失败，稍后再试试吧!',{icon: 5,time:1000});
			},
		});
		
	});	
}
/*function flight_cancel(obj,id){
	flight_state_change('取消航班',obj,id,'已取消');
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已取消</span>');
	$(obj).parents("tr").find("#fly").show();
	$(obj).remove();
}
*/
/*function flight_fabu(obj,id){
		$(obj).parents("tr").find("#fly").hide();
		$(obj).remove();
		layer.msg('已重新发布航班!',{icon: 6,time:1000});
	};*/

/*function flight_start(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已起飞</span>');
	$(obj).parents("tr").find("#flying").hide();
	$(obj).parents("tr").find("#edit").hide();
	$(obj).parents("tr").find("#cancelFlight").hide();
	$(obj).remove();
	layer.msg('航班已起飞!',{icon: 6,time:1000});
};*/
