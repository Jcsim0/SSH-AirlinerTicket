/**
 * 
 */
/**
 * 
 */
$(function(){
	$("#form-flight-add").validate({
		rules:{
			'flight.flightName':{
				required:true,
				minlength:2,
				maxlength:10
			},
			'flight.fromCity':{
				required:true,
				minlength:2
			},
			'flight.toCity':{
				required:true,
				minlength:2
			},
			'fromTerminal':{
				required:true,
				minlength:2
			},
			'toTerminal':{
				required:true,
				minlength:2
			},
			'startDate':{
				required:true,
				dateISO:true
			},
			'startTime':{
				required:true,
			},
			'arriveDate':{
				required:true,
				dateISO:true
			},
			'arriveTime':{
				required:true
			},
			'touristClassRemain':{
				required:true,
				digits:true
			},
			'touristClassPrice':{
				required:true,
				number:true
			},
			'businessClassRemain':{
				required:true,
				digits:true
			},
			'businessClassPrice':{
				required:true,
				number:true
			},'firstClassRemain':{
				required:true,
				digits:true
			},
			'firstClassPrice':{
				required:true,
				number:true
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var options = {   
	            type: 'POST',  
	            url: 'adminAjaxAction!saveNewFlight',                 
	            dataType: 'json', 
	            success:function(data){
					console.debug("data="+data);
					console.debug("data=123456789");
					parent.layer.msg('保存成功!', {icon:6,time:1000});
					parent.setTimeout('location.replace(location.href)',1500);
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);	
					//parent.setTimeout('location.replace(location.href)',1500);
				},
	            error : function(data) {              
	               	console.debug("data="+data);
	               	console.debug("data=UIUIUIUIUIUIUIUIUI");
	               	parent.layer.msg('保存失败!', {icon:5,time:1000});	
	               	//parent.setTimeout('location.replace(location.href)',1500);
	            }  
        	};   
        	$(form).ajaxSubmit(options);
        	//console.debug("suceed="+succeed);
			//parent.layer.close(index);			
		}
	});
});

/*function submitNewFlight(){
	$.ajax({
		type:"POST",
		url: 'adminAjaxAction!saveNewFlight',                 
        dataType: 'json', 
        success:function(data){
			console.debug("data="+data);
			console.debug("data=123456789");
			parent.layer.msg('保存成功!', {icon:6,time:1000});			
			parent.setTimeout('location.replace(location.href)',1500);
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);	
		},
        error : function(data) {              
           	console.debug("data="+data);
           	parent.layer.msg('保存失败!', {icon:5,time:1000});	
           //	parent.setTimeout('location.replace(location.href)',1500);
           	//var index = parent.layer.getFrameIndex(window.name);
           //	parent.layer.close(index);	
        }  
	});
}*/

function checkFlightNameRepeat(){
	if($("#flightName").val()==''){
		layer.msg('航班编号不可及为空', {icon : 0,time : 1000});
	}else{
		$.ajax({
			type : 'POST',
			url : "adminAjaxAction!checkFlightNameRepeat",
			data : {'flightName' : $("#flightName").val()},
			success : function(data) {
				console.debug("data=" + data);
				if(data=='noRepeat'){
					//layer.msg('客机编号可以使用', {icon : 1,time : 1000});
					$("#rightIcon").show();
					$("#repeatIcon").hide();
					return true;
				}else{
					layer.msg('航班编号已被占用，请重新输入!', {icon : 0,time : 1000});
					 $("#flightName").focus();
					 $("#repeatIcon").show();
					 $("#rightIcon").hide();
					return false;
				}
				
			},
			error : function(data) {
				console.debug(data);
				layer.msg('系统出错了，稍后再试试吧!', {icon : 5,time : 1000});
				return false;
			},
		});
	}
	
}

function focusOnFlightNameInput(){
	$("#rightIcon").hide();
	$("#repeatIcon").hide();
}

/*起飞日期*/
laydate.render({
	elem : '#flightStartDate',
	theme: '#393D49',
	min: new Date().toLocaleDateString()
});
/*起飞日期*/
laydate.render({
	elem : '#flightArriveDate',
	theme: '#393D49',
	min: new Date().toLocaleDateString()
});
/*起飞时间*/
laydate.render({
	elem : '#startTime',
	theme: '#393D49',
	type:'time',
});

/*到达时间*/
laydate.render({
	elem : '#arriveTime',
	theme: '#393D49',
	type:'time',
});

function setArriveDate(){
	if($("#flightStartDate").val()!=''){
		$("#flightArriveDate").val($("#flightStartDate").val());
	}
}