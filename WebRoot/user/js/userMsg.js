/**
 * 
 */



function checkUserName() //校验用户名
{
	var name=$("#nameInput").val();
	
	if(name=='')
		{
			/*$("#usernameDiv").next().css("display","block");
			$("#LoginSpan").html("* 姓名不能为空");
			$("#username").focus();
			$("#username").attr("class","input-text valid error");*/
			$.Huimodalalert('姓名不能为空',1000);
			return false;
		}
	else{
/*		$("#usernameDiv").next().css("display","none");
		$("#username").attr("class","input-text valid");*/
		return true;
	}
}

function checkEmail()//校验E-mail
{
	var isEmail = false;
    var myEmail = $("#emailInput");
    //对电子邮件的验证
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if(myEmail.val()=='')
    	{
    		/*$("#Use_EmailDiv").next().css("display","block");
    		$("span[name='EmailError']").text("* 请输入电子邮箱地址！！");*/
    		$.Huimodalalert('请输入电子邮箱',1000);
    		isEmail = false;
    	}
    else if(!$("#emailInput").val().match(myreg))
    	{
    		/*$("#Use_EmailDiv").next().css("display","block");
    		$("span[name='EmailError']").text("* 电子邮箱地址不合法");*/
    		$.Huimodalalert('电子邮箱地址不合法',1000);
    			isEmail = false;
    	}
    else
		{
	    	//$("#Use_EmailDiv").next().css("display","none");
	    	isEmail = true;
		}
    
    /*if(!isEmail){
		$("#Use_Email").attr("class","input-text valid error");
	}else{
		$("#Use_Email").attr("class","input-text valid");
	}*/
    return isEmail;
}

var isPhone=false;//全局变量 定义是否输入了手机号码

function checkPhone() //检验手机号码
{  
	var phonestr=$("#phoneInput");
    var bValidate = RegExp(/^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/).test(phonestr.val());  
    
    if(phonestr.val()=='')
    	{
    		/*$("span[id='PhoneNumError']").text("* 请输入手机号码");
    		$("#PhoneNumDiv").next().css("display","block");*/
    		$.Huimodalalert('请输入手机号码',1000);
    		isPhone=false;
    	}
   else if(bValidate){
    	console.debug("bValidate="+bValidate);
    	console.debug("newPhone="+$("#phoneInput").val());
    	if($("#phoneInput").val()==phonestr.val()){
    		isPhone = true;
    	}else{
    	  	$.post(
        			"userAjaxAction!checkRepeat",
        			{'user.phone':phonestr.val()},
        			
        			function(data){
    					console.debug("data="+data);
    			 		console.debug(data=="repeat");
    			 		if(data=="repeat"){
    			    		/*$("span[id='PhoneNumError']").html("* 很抱歉，该用户名已经被注册");
    			        	$("#PhoneNumDiv").next().css("display","block");*/
    			 			$.Huimodalalert('很抱歉，该手机号已被使用',1000);
    			    		isPhone=false;
    			    	}
    			    	else{
    			    		/*$("#PhoneNum").attr("class","input-text valid");
    			    		$("span[id='PhoneNumError']").html("* 恭喜您，该用户名没有被注册！");
    			        	$("#PhoneNumDiv").next().css("display","block");*/
    			    		$.Huimodalalert('恭喜您，该手机号可以使用',1000);
    			    		isPhone=true;
    			    	}
        	});
    	}
  
    }
    else if(!bValidate){
    	/*$("span[id='PhoneNumError']").text("* 手机号码不合法！！！");
		$("#PhoneNumDiv").next().css("display","block");*/
    	$.Huimodalalert('手机号码不合法',1000);
		isPhone=false;
    }
   /*
    if(!isPhone){
		$("#PhoneNum").attr("class","input-text valid error");
	}else{
		$("#PhoneNum").attr("class","input-text valid");
	}*/
    
    return isPhone;
}  

function checkIdCard() { 
    var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    var tip = "";
    var pass= true;
    //验证身份证格式（6个地区编码，8位出生日期，3位顺序号，1位校验位）
    var code=$("#idCardInput").val();
    if(code==''){
    	//$("#idCardDiv").next().css("display","block");
    	tip = "身份证号不能为空";
    	pass = false;
    }else if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
        tip = "身份证号格式错误";
        pass = false;
    }
    
   else if(!city[code.substr(0,2)]){
        tip = "身份证号格式错误";
        pass = false;
    }
    else{
        //18位身份证需要验证最后一位校验位
        if(code.length == 18){
            code = code.split('');
            //∑(ai×Wi)(mod 11)
            //加权因子
            var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
            //校验位
            var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
            var sum = 0;
            var ai = 0;
            var wi = 0;
            for (var i = 0; i < 17; i++)
            {
                ai = code[i];
                wi = factor[i];
                sum += ai * wi;
            }
            var last = parity[sum % 11];
            if(parity[sum % 11] != code[17]){
                tip = "身份证号格式错误";
                pass =false;
            }
        }
    }
    if(!pass) {
    	/*$("span[name='idCardError']").text("*  "+tip);
		$("#idCardDiv").next().css("display","block");
		$("#idCard").attr("class","input-text valid error");*/
    	$.Huimodalalert(tip,1000);
    }else{
    	/*$("#idCardDiv").next().css("display","none");
    	$("#idCard").attr("class","input-text valid");*/
    }
  
    return pass;
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



function checkInfo(){
	if(checkUserName&&checkEmail()&&checkPhone()&&checkIdCard()){
		submitMenu();
		return true;
	}		
	else
		return false;
}

/*修改类别*/

function changeMenu(){
	
	$("#Mymsg").show();
	$("#pwd").hide();
	
	var o=$("table");
	
	//显示姓名输入框
    var name = $("#nameSpan").text();
    o.find("#nameInput").val(name);
    o.find("#nameTr").show();
    
    //显示性别单选框
    var sex = o.find("#sex").text();
    console.debug("sex="+sex);
    if(sex=='男'){
    	$("#sexInput1").prop("checked",true);
    	$("#sexInput2").prop("checked",false);
    }else if(sex=='女'){
    	$("#sexInput1").prop("checked",false);
    	$("#sexInput2").prop("checked",true);
    }
    o.find("#sexDiv").show();
    o.find("#sex").hide();		//隐藏性别
    
    //显示手机输入框
    var phone = o.find("#phone").text();
    o.find("#phoneInput").val(phone);
    o.find("#phoneInput").show();
    o.find("#phone").hide();		//隐藏手机
    
  //显示邮箱输入框
    var email = o.find("#email").text();
    o.find("#emailInput").val(email);
    o.find("#emailInput").show();
    o.find("#email").hide();		//隐藏邮箱
    
    //显示地区输入框
    o.find("#countrySelect").show();
    o.find("#country").hide();		//隐藏地区

    
  //显示证件输入框
    var idCard = o.find("#idCard").text();
    o.find("#idCardInput").val(idCard);
    o.find("#idCardInput").show();
    o.find("#idCard").hide();		//隐藏证件
   
    $("#edit").hide();
    $("#submitt").show();
}


function submitMenu(){
	var o=$("table");
	
	var name = o.find("#nameInput").val();
	var sex = o.find(".radio:checked").val();
	var phone = o.find("#phoneInput").val();
	var email = o.find("#emailInput").val();
	var country = o.find("#countrySelect").val();
	var idCard = o.find("#idCardInput").val();
	
	console.debug(name);
	
	userInfo_change(name,sex,phone,email,country,idCard);   
	 
	$("#nameSpan").text(name);  //更新 新姓名
    o.find("#sex").text(sex);  //更新 性别    		
    o.find("#phone").text(phone);		//更新 手机
    o.find("#email").text(email);	//更新 email
    o.find("#country").text(country); //更新地区
    o.find("#idCard").text(idCard);  //更新证件号码

	o.find("#nameTr").hide();
	o.find("#sexDiv").hide(); 
	o.find("#phoneInput").hide();
    o.find("#emailInput").hide();
    o.find("#countrySelect").hide();
    o.find("#idCardInput").hide();
    
    o.find("#sex").show();
	o.find("#phone").show(); 
	o.find("#email").show();
    o.find("#country").show();
    o.find("#idCard").show();

    $("#submitt").hide();
    $("#edit").show();   
}

function userInfo_change(name,sex,phone,email,country,idCard){
	layer.confirm('确认更改吗？', {
		btn: ['确认','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
			$.ajax({
			type: 'POST',
			url: 'userAjaxAction!updateUserInfo',
			data : {
				'name' : name,
				'sex' : sex,
				'phone':phone,
				'email':email,
				'country':country,
				'idCard':idCard,
				'usersId':parseInt($("#userId").val(),'10')
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

function checkPassword()//校验是否输入密码以及密码格式是否准确
{
	var myPwd=$("#new-pwd").val();
		if(myPwd==''){
			/*$("#passwordDiv").next().css("display","block");
			$("span[name='PwdError']").text("* 请输入密码！！");
			$("#password").attr("class","input-text valid error");*/
			$.Huimodalalert('请输入新密码',1000);
			return false;
		}
		else if(myPwd.length<6||myPwd.length>20){
			$.Huimodalalert('密码格式错误，密码长度应大于6小于20',1000);
			return false;
		}
		else{
			return true;
		}
}

function confirmPwd()//校验两次密码是否一致
{
	var confirm = false;
	var myPwd=document.getElementById("new-pwd").value;
	var cPwd=document.getElementById("confirm-pwd").value;
	 
	if(myPwd!=cPwd)
		{
			/*document.getElementById("confirmPasswordDiv").nextElementSibling.style.display='block';*/
				$.Huimodalalert('密码不匹配，请重新出入',1000);
				comfirm = false;
		}
	else
	{
		comfirm = true;
	}
	/*if(!comfirm){
		$("#confirmPassword").attr("class","input-text valid error");
	}else{
		$("#confirmPassword").attr("class","input-text valid");
	}*/
		return comfirm;	
}

function updatePwd(){
	$("#Mymsg").hide();
	$("#pwd").show();
	$("#submitt").hide();
	$("#edit").show();
}

function checkPwd(){
	if(checkPassword()&&confirmPwd()){
			$.ajax({
			type: 'POST',
			url: 'userAjaxAction!updatePwd',
			data : {
				'oldPwd':$("#old-pwd").val(),
				'newPwd':$("#new-pwd").val(),
				'usersId':parseInt($("#myId").val(),'10')
			},
			dataType: 'json',
			success: function(data){
			console.debug("data="+data);
				if(data=='updatePasswordSuccess')
					layer.msg('修改密码成功!', {icon:6,time:1000});
				else
					layer.msg('原密码错误，请重新输入!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.debug(data);
				layer.msg('修改密码失败，稍后再试试吧!',{icon: 5,time:1000});
			},
		});
		return true;
	}else{
		checkPassword();
		confirmPwd();
		return false;
	}
}