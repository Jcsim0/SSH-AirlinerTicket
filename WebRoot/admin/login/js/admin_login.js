/**
 * 
 */

function check(){
	if(loginCheck()&&checkCodeNum()){
		return true;
	}else{
		return false;
	}
}
function loginCheck(){
	var account = $("#account");
	var password = $("#password");
	
	if(account.val()==''){
		$.Huimodalalert('请输入登录帐号',1000);
		return false;
	}else if(password.val()==''){
		$.Huimodalalert('请输入密码',1000);
		return false;
	}else{
		if(checkCodeNum()){
			$.post(
	    			"adminAjaxAction!userLogin",
	    			{
	    				'adminUser.account':account.val(),
	    				'adminUser.adminPassword':password.val()
	    			},
	    			
	    			function(data){
						console.debug("data="+data);
				 		console.debug(data=="logiinSuccess");
				 		if(data=="passwordError"){
				 			$.Huimodalalert('密码错误',1000);
				 			createCode();
				    		return false;
				    	}else if(data=="accountError"){
				    		$.Huimodalalert('帐号错误',1000);
				    		createCode();
				    		return false;
				    	}else if(data=="unknowError"){
				    		$.Huimodalalert('系统出差啦，稍后再试一下',1000);
				    		createCode();
				    		return false;
				    	}
				    	else if(data=="loginSuccess"){
				    		window.location.href='./admin/jsp/index.jsp';
				    		return true;
				    	}
	    		});	
		}else{
			return false;
		}
    	
	}
}
var code; //在全局 定义验证码  
function createCode() //生成验证码
{
  code = "";
  var codeLength = 4;//验证码的长度  
  var checkCode = $("#checkCode");
  var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
		  'A','B','C','D','E','F','G','H','I','J','K','L','M','N',
		  'O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符 
  
  for (var i = 0; i < codeLength; i++) {
    var charIndex = Math.floor(Math.random() * 36);
    code += selectChar[charIndex];
  }

  if (checkCode) {
    checkCode.className = "code";
    checkCode.text(code);
  }
}
  
function checkCodeNum() //校验验证码是否正确
{
	var isRight = false;
	  var inputCode = $("#codeNum");
	  if (inputCode.val()=='') 
	  	{ 	
		  $.Huimodalalert('请输入验证码',1000);
		  createCode();//刷新验证码  
		  isRight = false;
	  	} 
	  else if ((inputCode.val()).toLowerCase() != code.toLowerCase()) 
	  	{
		  $.Huimodalalert('验证码错误',1000);
		  createCode();//刷新验证码  
		  isRight = false;
	  	} 
	  else {
		  isRight = true;
	  	}	  
	  return isRight;
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