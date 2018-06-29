/**
 * 
 */
$(function(){
	$("#form-plane-add").validate({
		rules:{
			'plane.planeName':{
				required:true,
				minlength:2,
				maxlength:10
			},
			'plane.type':{
				required:true,
			},
			'plane.buyDate':{
				required:true,
				dateISO:true
			},
			'plane.useDate':{
				required:true,
				dateISO:true
			},
			'plane.touristClssNum':{
				required:true,
				digits:true
			},
			'plane.businessClssNum':{
				required:true,
				digits:true
			},
			'plane.firstClssNum':{
				required:true,
				digits:true
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var options = {   
	            type: 'POST',  
	            url: 'planeAjaxAction!saveNewPlane',                 
	            dataType: 'json', 
	            success:function(data){
					console.debug("data="+data);
					parent.layer.msg('保存成功!', {icon:6,time:1000});	
					var index = parent.layer.getFrameIndex(window.name);
					parent.setTimeout('location.replace(location.href)',1500); //延迟刷新父窗口
					parent.layer.close(index);
				},
	            error : function(data) {              
	               	console.debug("data="+data);
	               	parent.layer.msg('保存失败，稍后再试试吧！', {icon:5,time:1000});
	            }  
        	}; 			
        	$(form).ajaxSubmit(options);
		}
	});
});

/**
 * 判断可输入字数
 * @param which
 * @param max
 */
function checkLength(which, max) {
	var maxChars = max;
	if (which.value.length > maxChars)
		which.value = which.value.substring(0, maxChars);
	var curr = maxChars - which.value.length;
	document.getElementById("currentLength").innerHTML = curr.toString();
}

function checkPlaneNameRepeat(){
	if($("#planeName").val()==''){
		layer.msg('客机编号不可及为空', {icon : 0,time : 1000});
	}else{
		$.ajax({
			type : 'POST',
			url : "planeAjaxAction!checkPlaneNameRepeat",
			data : {'newPlaneName' : $("#planeName").val()},
			success : function(data) {
				console.debug("data=" + data);
				if(data=='notRepeat'){
					//layer.msg('客机编号可以使用', {icon : 1,time : 1000});
					$("#rightIcon").show();
					$("#repeatIcon").hide();
					return true;
				}else{
					layer.msg('客机编号已被占用，请重新输入!', {icon : 0,time : 1000});
					 $("#planeName").focus();
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

function focusOnPlaneNameInput(){
	$("#rightIcon").hide();
	$("#repeatIcon").hide();
}