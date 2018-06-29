/**
 * 
 */

/*修改航班价格和座位数*/
function changeAdmin(obj){
	var o=$(obj).parents("tr");
	
	//显示头等舱价格输入框
    var ap = o.find("#adminPhone").text();
    o.find("#adminPhoneInput").val(ap);
    o.find("#adminPhoneInput").show();

    o.find("#adminPhone").hide();  //隐藏Span
 
    o.find("#edit").hide();
    o.find("#submitt").show();
    o.find("#cancelEdit").show();
}

/**
 * 提交编辑后的航班信息*/
function submitAdmin(obj,id){
	var o=$(obj).parents("tr");
	
	var ap = o.find("#adminPhoneInput").val();
	
	admin_update(ap,id);   
	 
	o.find("#adminPhone").text(ap); 

	o.find("#adminPhoneInput").hide();

    o.find("#adminPhone").show();

    o.find("#edit").show();
    o.find("#submitt").hide();
    o.find("#cancelEdit").hide();
}

/*
 * 异步执行数据库更新管理员信息*/
function admin_update(ap,id){
	layer.confirm('确认更改手机号码吗？', {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'adminAjaxAction!updateAdminPhone',
			data:{
				'adminId':id,
				'adminPhone':ap,
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
	o.find("#adminPhoneInput").hide();

    o.find("#adminPhone").show();

    o.find("#edit").show();
    o.find("#submitt").hide();
    o.find("#cancelEdit").hide();
}
