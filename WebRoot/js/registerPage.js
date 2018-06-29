
function check()
{
	if(checkUserName()&&checkPassword()&&confirmPwd()&&checkEmail()&&isPhone&&checkPhone()&&checkCodeNum()&&checkIdCard())
		{
			return true;
		}
	else 
		{
			checkUserName();
			checkPassword();
			confirmPwd();
			checkEmail();
			checkPhone();
			checkCodeNum();
			checkIdCard();
			return false;
		}
	
}
function checkUserName() //校验用户名
{
	var name=$("#username").val();
	
	if(name=='')
		{
			$("#usernameDiv").next().css("display","block");
			$("#LoginSpan").html("* 姓名不能为空");
			$("#username").focus();
			$("#username").attr("class","input-text valid error");
			return false;
		}
	else{
		$("#usernameDiv").next().css("display","none");
		$("#username").attr("class","input-text valid");
		return true;
	}
}


function checkPassword()//校验是否输入密码以及密码格式是否准确
{
	var myPwd=$("#password").val();
		if(myPwd==''){
			$("#passwordDiv").next().css("display","block");
			$("span[name='PwdError']").text("* 请输入密码！！");
			$("#password").attr("class","input-text valid error");
			return false;
		}
		else if(myPwd.length<6||myPwd.length>20){
			$("#passwordDiv").next().css("display","block");
			$("span[name='PwdError']").text("* 密码不合法,请输入6-20位由英文,数字或字符组成的密码");
			$("#password").attr("class","input-text valid error");
			return false;
		}
		else{
			$("#passwordDiv").next().css("display","none");
			$("#password").attr("class","input-text valid");
			return true;
		}
	}

function confirmPwd()//校验两次密码是否一致
{
	var confirm = false;
	var myPwd=document.getElementById("password").value;
	var cPwd=document.getElementById("confirmPassword").value;
	 
	if(myPwd!=cPwd)
		{
			document.getElementById("confirmPasswordDiv").nextElementSibling.style.display='block';
				comfirm = false;
		}
	else
	{
		document.getElementById("confirmPasswordDiv").nextElementSibling.style.display='none';
		comfirm = true;
	}
	if(!comfirm){
		$("#confirmPassword").attr("class","input-text valid error");
	}else{
		$("#confirmPassword").attr("class","input-text valid");
	}
		return comfirm;	
}


function checkEmail()//校验E-mail
{
	var isEmail = false;
    var myEmail = $("#Use_Email");
    //对电子邮件的验证
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if(myEmail.val()=='')
    	{
    		$("#Use_EmailDiv").next().css("display","block");
    		$("span[name='EmailError']").text("* 请输入电子邮箱地址！！");
    		isEmail = false;
    	}
    else if(!$("#Use_Email").val().match(myreg))
    	{
    		$("#Use_EmailDiv").next().css("display","block");
    		$("span[name='EmailError']").text("* 电子邮箱地址不合法");
    			isEmail = false;
    	}
    else
		{
	    	$("#Use_EmailDiv").next().css("display","none");
	    	isEmail = true;
		}
    
    if(!isEmail){
		$("#Use_Email").attr("class","input-text valid error");
	}else{
		$("#Use_Email").attr("class","input-text valid");
	}
    return isEmail;
}



var code; //在全局 定义验证码  
function createCode() //生成验证码
{
  code = "";
  var codeLength = 4;//验证码的长度  
  var checkCode = document.getElementById("checkCode");
  var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
		  'A','B','C','D','E','F','G','H','I','J','K','L','M','N',
		  'O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符 
  
  for (var i = 0; i < codeLength; i++) {
    var charIndex = Math.floor(Math.random() * 36);
    code += selectChar[charIndex];
  }
  //alert(code);
  if (checkCode) {
    checkCode.className = "code";
    checkCode.value = code;
  }
}
  
function checkCodeNum() //校验验证码是否正确
{
	var isRight = false;
	  var inputCode = $("#CodeNum");
	  if (inputCode.val()=='') 
	  	{ 	
		  $("span[name='CodeErrorSpan']").text("* 请输入验证码");
		  $("#CodeNumDiv").next().css("display","block");
		  createCode();//刷新验证码  
		  isRight = false;
	    //alert("请输入验证码！");
	  	} 
	  else if ((inputCode.val()).toLowerCase() != code.toLowerCase()) 
	  	{
		  $("span[name='CodeErrorSpan']").text("* 验证码不正确");
		  $("#CodeNumDiv").next().css("display","block");
		  createCode();//刷新验证码  
		  isRight = false;
	  	} 
	  else 
	  	{
		  $("#CodeNumDiv").next().css("display","none");
		  isRight = true;
	  	}
	  
	  if(!isRight){
			$("#CodeNum").attr("class","input-text valid error");
		}else{
			$("#CodeNum").attr("class","input-text valid");
		}
	  
	  return isRight;
}


var isPhone=false;//全局变量 定义是否输入了手机号码

function checkPhone() //检验手机号码
{  
	var phonestr=$("#PhoneNum");
    var bValidate = RegExp(/^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/).test(phonestr.val());  
    
    if(phonestr.val()=='')
    	{
    		$("span[id='PhoneNumError']").text("* 请输入手机号码");
    		$("#PhoneNumDiv").next().css("display","block");
    		isPhone=false;
    	}
   else if(bValidate){
    	console.debug("bValidate="+bValidate);
    	$.post(
    			"userAjaxAction!checkRepeat",
    			{'user.phone':phonestr.val()},
    			
    			function(data){
					console.debug("data="+data);
			 		console.debug(data=="repeat");
			 		if(data=="repeat"){
			    		$("span[id='PhoneNumError']").html("* 很抱歉，该用户名已经被注册");
			        	$("#PhoneNumDiv").next().css("display","block");
			    		isPhone=false;
			    	}
			    	else{
			    		$("#PhoneNum").attr("class","input-text valid");
			    		$("span[id='PhoneNumError']").html("* 恭喜您，该用户名没有被注册！");
			        	$("#PhoneNumDiv").next().css("display","block");
			    		isPhone=true;
			    	}
    	}
    			);
    }
    else if(!bValidate){
    	$("span[id='PhoneNumError']").text("* 手机号码不合法！！！");
		$("#PhoneNumDiv").next().css("display","block");
		isPhone=false;
    }
   
    if(!isPhone){
		$("#PhoneNum").attr("class","input-text valid error");
	}else{
		$("#PhoneNum").attr("class","input-text valid");
	}
    
    return isPhone;
}  


function checkIdCard() { 
    var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    var tip = "";
    var pass= true;
    //验证身份证格式（6个地区编码，8位出生日期，3位顺序号，1位校验位）
    var code=$("#idCard").val();
    if(code==''){
    	$("#idCardDiv").next().css("display","block");
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
    	$("span[name='idCardError']").text("*  "+tip);
		$("#idCardDiv").next().css("display","block");
		$("#idCard").attr("class","input-text valid error");
    }else{
    	$("#idCardDiv").next().css("display","none");
    	$("#idCard").attr("class","input-text valid");
    }
  
    return pass;
}

/*function error(id){
	$(id).css({
		"background-color":"#fbe2e2",
		"border-color": "#c66161",
		"color":"#c00"
	});
}*/

function isCheckbox(){
	var box = false;
	if($("input[type='checkbox']").is(':checked')){
		 document.getElementById("submitBtn").disabled = false;
		 $("#submitBtn").attr("class","btn btn-primary radius ");
		 box=true;
	}else{
		 document.getElementById("submitBtn").disabled = true;
		 $("#submitBtn").attr("class","btn btn-primary radius disabled");
		 box=false;
	}
	return box;
}
