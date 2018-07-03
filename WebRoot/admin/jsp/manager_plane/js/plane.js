$(function() {
	$('.table-sort').dataTable({
		"aaSorting" : [ [ 0, "asc" ] ],// 默认第几个排序
		"bStateSave" : true,// 状态保存
		"pading" : false,
		"aoColumnDefs" : [
		// {"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{
			"orderable" : false,
			"aTargets" : [ 8 ]
		} // 不参与排序的列
		]
	});
	
	
});

/**
 * 判断可输入字数
 * @param which
 * @param max
 */
function checkLength(which, max,id) {
	var maxChars = max;
	if (which.value.length > maxChars)
		which.value = which.value.substring(0, maxChars);
	var curr = maxChars - which.value.length;
	document.getElementById("currentLength"+id).innerHTML = curr.toString();
}

/*编辑客机信息*/

function changePlane(obj){
	var o=$(obj).parents("tr");
	
	//显示客机输入框
    var planeName = o.find("#planeName").text();
    o.find("#planeNameInput").val(planeName);
    o.find("#planeNameInput").show();
    
    //显示客机类型输入框
    var planeType = o.find("#planeType").text();
    o.find("#planeTypeInput").val(planeType);
    o.find("#planeTypeInput").show();
    
    //显示购买日期输入框
    var planeBuyDate = o.find("#planeBuyDate").text();
    o.find("#planeBuyDateInput").val(planeBuyDate);
    o.find("#planeBuyDateInput").show();
    
  //显示使用日期输入框
    var planeUseDate = o.find("#planeUseDate").text();
    o.find("#planUseDateInput").val(planeUseDate);
    o.find("#planUseDateInput").show();
    
    //显示经济舱座位数输入框
    var planeTN = o.find("#planeTouristClassNum").text();
    o.find("#planeTouristClassNumInput").val(planeTN);
    o.find("#planeTouristClassNumInput").show();
    
    //显示商务舱座位数输入框
    var planeBN = o.find("#planeBusinessClassNum").text();
    o.find("#planeBusinessClassNumInput").val(planeBN);
    o.find("#planeBusinessClassNumInput").show();
    
    //显示头等舱座位数输入框
    var planeFN = o.find("#planeFirstClassNum").text();
    o.find("#planeFirstClassNumInput").val(planeFN);
    o.find("#planeFirstClassNumInput").show();
    
    //显示备注输入框
    var planeRemark = o.find("#planeRemark").text();
    o.find("#planeRemarkInputVal").val(planeRemark);
    o.find("#planeRemarkInputDiv").show();
     
    o.find("#planeName").hide();  //隐藏客机编号Span
    o.find("#planeType").hide();		//隐藏客机类型Span
    o.find("#planeBuyDate").hide();		//隐藏客机购买日期
    o.find("#planeUseDate").hide();		//隐藏客机使用日期
    o.find("#planeTouristClassNum").hide();	//隐藏经济舱座位数
    o.find("#planeBusinessClassNum").hide();
    o.find("#planeFirstClassNum").hide();
    o.find("#planeRemark").hide();
    
    o.find("#edit").hide();
    o.find("#delect").hide();
    o.find("#submitt").show();
    o.find("#cancel").show();
}
/**
 * 提交编辑后的客机信息*/
function submitPlane(obj,id){
	var o=$(obj).parents("tr");
	
	var planeName = o.find("#planeNameInput").val();
	var planeType = o.find("#planeTypeInput").val();
	var planeBuyDate = o.find("#planeBuyDateInput").val();
	var planeUseDate = o.find("#planUseDateInput").val();
	var planeTN = o.find("#planeTouristClassNumInput").val();
	var planeBN = o.find("#planeBusinessClassNumInput").val();
	var planeFN = o.find("#planeFirstClassNumInput").val();
	var planeRemark = o.find("#planeRemarkInputVal").val();
	
	plane_change(planeName,planeType,planeBuyDate,planeUseDate,planeTN,planeBN,planeFN,planeRemark,id);   
	 
	o.find("#planeName").text(planeName); 
    o.find("#planeType").text(planeType);  
    o.find("#planeBuyDate").text(planeBuyDate);
    o.find("#planeUseDate").text(planeUseDate);
    o.find("#planeTouristClassNum").text(planeTN);
    o.find("#planeBusinessClassNum").text(planeBN);
    o.find("#planeFirstClassNum").text(planeFN);
    o.find("#planeRemark").text(planeRemark);
    
   

	o.find("#planeNameInput").hide();
	o.find("#planeTypeInput").hide(); 
	o.find("#planeBuyDateInput").hide();
    o.find("#planUseDateInput").hide();
    o.find("#planeTouristClassNumInput").hide();
    o.find("#planeBusinessClassNumInput").hide();
    o.find("#planeFirstClassNumInput").hide();
    o.find("#planeRemarkInputDiv").hide();
    
    o.find("#planeName").show();
	o.find("#planeType").show(); 
	o.find("#planeBuyDate").show();
    o.find("#planeUseDate").show();
    o.find("#planeTouristClassNum").show();
    o.find("#planeBusinessClassNum").show();
    o.find("#planeFirstClassNum").show();
    o.find("#planeRemark").show();

    o.find("#edit").show();
    o.find("#delect").show();
    o.find("#submitt").hide(); 
    o.find("#cancel").hide();
}
/*
 * 异步执行数据库更新客机信息*/
function plane_change(name,type,buyDate,useDate,TN,BN,FN,remark,id){
	layer.confirm('确认更改吗？', {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'planeAjaxAction!updatePlane',
			data:{
				'plane.planeId':id,
				'plane.planeName':name,
				'plane.type':type,
				'buyDate':buyDate,
				'useDate':useDate,
				'plane.touristClassNum':TN,
				'plane.businessClassNum':BN,
				'plane.firstClassNum':FN,
				'plane.remark':remark				
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
function cancel(obj){
	var o=$(obj).parents("tr");
	
	o.find("#planeNameInput").hide();
	o.find("#planeTypeInput").hide(); 
	o.find("#planeBuyDateInput").hide();
    o.find("#planUseDateInput").hide();
    o.find("#planeTouristClassNumInput").hide();
    o.find("#planeBusinessClassNumInput").hide();
    o.find("#planeFirstClassNumInput").hide();
    o.find("#planeRemarkInputDiv").hide();
    
    o.find("#planeName").show();
	o.find("#planeType").show(); 
	o.find("#planeBuyDate").show();
    o.find("#planeUseDate").show();
    o.find("#planeTouristClassNum").show();
    o.find("#planeBusinessClassNum").show();
    o.find("#planeFirstClassNum").show();
    o.find("#planeRemark").show();

    o.find("#edit").show();
    o.find("#delect").show();
    o.find("#submitt").hide(); 
    o.find("#cancel").hide();
}

/**
 * 删除客机信息
 * @param obj
 * @param id
 */
function delPlane(obj,id){
	layer.confirm('确认删除吗？所有和该客机有关联的信息都将被删除哦', {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'planeAjaxAction!delPlane',
			data:{
				'plane.planeId':id,	
				},
			dataType: 'json',
			success: function(data){
			console.debug("data="+data);
				$(obj).parents("tr").remove();
				layer.msg('删除成功!', {icon:6,time:1000});
			},
			error:function(data) {
				console.debug(data);
				layer.msg('删除失败，稍后再试试吧!',{icon: 5,time:1000});
			},
		});
		
	});	
}

/*客机-添加*/
function plane_add(title, url, w, h) {
	layer_show(title, url, w, h);
}