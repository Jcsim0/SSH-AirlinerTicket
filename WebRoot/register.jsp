<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>君健航空-安全，快捷</title>
			<script type="text/javascript" src="<%=path %>/js/registerPage.js"></script>
			<link rel="stylesheet" href="<%=path %>/css/base.css" type="text/css">
			<link rel="stylesheet" href="<%=path %>/css/register.css" type="text/css">
			<link rel="stylesheet" href="<%=path %>/css/head.css" type="text/css">
			
			<script type="text/javascript" src="<%=path %>/H-ui/lib/jquery/1.9.1/jquery.js"></script>
			<script type="text/javascript" src="<%=path %>/H-ui/static/h-ui/js/H-ui.js"></script>
			<script type="text/javascript" src="<%=path %>/js/index.js"></script>
				
			
			<link rel="stylesheet" href="<%=path %>/H-ui/static/h-ui/css/H-ui.css" type="text/css" >
			<link href="<%=path %>/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
			
			<style type="text/css">
				a:hover{
					text-decoration:underline;
					color:#FF0000
				}
			</style>
	</head>

<body onload="createCode()">	

<div class="mp-home-page-wrapper">
	<!-- 顶部导航栏 -->
	<div class="mynavbar-wrapper">
		<div class="mynavbar mynavbar-black">
			<div class="container cl">
				<span class="logos mynavbar-slogan " style="margin-left: 20px;"
					id="clock"></span> <a
					class="logos mynavbar-logos f-l mr-10 hidden-xs" href="<%=path %>/index.jsp">君健航空</a>
				<span class="logos mynavbar-slogan f-l mr-10 hidden-xs">安全&middot;快捷 &middot; 舒适</span>
				<nav class="mynav mynavbar-mynav mynav-collapse" role="mynavigation"id="Hui-mynavbar">

				<ul class="cl">
					<li ><a href="<%=path %>/index.jsp">首页</a></li>
					
					<li><a href="flightInfoAction!queryAll">机票查询</a></li>
					
					<li class="dropDown dropDown_hover">
						<a href="javascript:;">我的账户<i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a onclick="showMyMsg('<s:property value="#session.userName"/>','个人信息','<%=path %>/user/userMsg.jsp','500','300')" href="javascript:;">我的信息</a></li>
							<li><a onclick="return isLogin('<s:property value="#session.userName"/>')" href="ordersManagerAction!queryUserOrdersListByUsersId">我的订单</a></li>
						</ul>	
					</li>
					
					<li class="dropDown dropDown_hover">
						<a href="#">关于我们<i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" target="_blank">公司简介</a></li>
							<li><a href="javascript:;" target="_blank">免责条款</a></li>
							<li><a href="<%=path %>/html/privacy.html" target="_blank">隐私保护</a></li>
							<li><a href="<%=path %>/html/registerAgreement.html" target="_blank">用户注册协议</a></li>
						</ul>
					</li>
					
					<s:if test="#session.userName!=null">
						<li class="dropDown dropDown_hover" style=" float:right; ">
							<a href="javascript:;">欢迎您：<s:property value="#session.userName"/><i class="Hui-iconfont">&#xe6d5;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<li><a  href="userManagerAction!loginOut">退出</a></li>
								</ul>
						</li>
					</s:if>
					<s:else>
						<li class="current" style=" float:right; "><a href="<%=path %>/register.jsp">注册</a></li>
						<li style=" float:right; "><a href="<%=path %>/login.jsp">登录</a></li>
					</s:else>
					
				</ul>

				</nav>
			</div>
		</div>
	</div>


	<div class="from-div">
		<div class="register-div">
			<p style="margin-left:60px;margin-top:50px;">填写账户信息，以下信息均为必填:</p>
				<form action="userManagerAction!register" method="post"  onSubmit="return check();">
					<ul class="register-info">
						<li>
							<div class="reg-col-1 fl" style="margin:0 0 0 10%">姓名：</div>
							<div id="usernameDiv" class="reg-col-2 fl">	
								<input class="input-text valid " type="text" id="username" name="user.name" autocomplete="off"
								style="height: 36px; width: 253px; size:20" onblur="checkUserName();">	
							</div>
							<span id="LoginSpan" class="error-con">* 姓名不能为空</span>	
						</li>
						
						<li>
							<div class="reg-col-1 fl" style="margin:0 0 0 10%">手机：</div>
							<div id="PhoneNumDiv" class="reg-col-2 fl">
									<input type="text" id="PhoneNum" name="user.phone" autocomplete="off"
									style="height: 36px; width: 253px; size:20" onblur="checkPhone(); " >
							</div>
							<span id="PhoneNumError" class="error-con">* 手机号码不合法</span>
						</li>
				
						<li>
							<div class="reg-col-1 fl" style="margin:0 0 0 10%">登录密码：</div>
							<div id="passwordDiv" class="reg-col-2 fl">
									<input type="password" id="password" name="user.password" placeholder="6-20位字符,可由大小写英文,数字,字符组成"autocomplete="off"size="20" style="height: 36px; width: 253px;" onblur="checkPassword();">
							</div>
								<span name="PwdError" class="error-con">* 密码不合法</span>
						</li>
					
						<li>
							<div class="reg-col-1 fl" style="margin:0 0 0 10%">确认密码：</div>
							<div id="confirmPasswordDiv" class="reg-col-2 fl" >
									<input type="password" id="confirmPassword" name="confirmPassword" autocomplete="off"
									style="height: 36px; width: 253px;"  onblur="confirmPwd();">
							</div>
							<span  class="error-con">* 两次密码输入不一致</span>
						</li>
					
						<li>
							<div class="reg-col-1 fl" style="margin:0 0 0 10%">性别：</div>
								<div class="skin-minimal">
									  <div class="radio-box">
									    <input type="radio" id="radio-1" name="user.sex" value="男" checked="checked">
									    <label for="radio-1">男</label>
									  </div>
									  <div class="radio-box">
									    <input type="radio" id="radio-2" name="user.sex" value="女">
									    <label for="radio-2">女</label>
									  </div>
								</div>
							<span class="error-con">* 请选择性别</span>
						</li>
		
						<li>
							<div  class="reg-col-1 fl" style="margin:0 0 0 10%">身份证号:</div>
							<div id="idCardDiv" class="reg-col-2 fl"   >
								<input type="text" id="idCard" name="user.idCard" 
									style="height: 36px; width: 253px; size:20" onblur="checkIdCard()">	
							</div>
							<span name="idCardError" class="error-con">* 请输入身份证</span>
						</li>			
					
						<li>
							<div  class="reg-col-1 fl" style="margin:0 0 0 10%">电子邮箱：</div>
							<div  id="Use_EmailDiv" class="reg-col-2 fl">
									<input type="email" id="Use_Email" name="user.email" autocomplete="off"
									style="height: 36px; width: 253px; size:20"  onblur="checkEmail()">
							</div>
								<span name="EmailError" class="error-con">* 电子邮件地址不合法</span>
						</li>
						
						<li>
							<div  class="reg-col-1 fl" style="margin:0 0 0 10%">国家：</div>
							<div  id="countryDiv" class="reg-col-2 fl " style="height: 36px; width: 253px;">
								<span class="select-box"> <select class="select"
									name="user.country">
										<option value="中国">中国</option>
										<option value="阿尔巴尼亚">阿尔巴尼亚</option>
										<option value="阿尔及利亚">阿尔及利亚</option>
										<option value="美属萨摩亚">美属萨摩亚</option>
										<option value="安道尔共和国">安道尔共和国</option>
										<option value="安哥拉">安哥拉</option>
										<option value="安圭拉">安圭拉</option>
										<option value="南极洲">南极洲</option>
										<option value="安提瓜和巴布达">安提瓜和巴布达</option>
										<option value="阿根廷">阿根廷</option>
										<option value="亚美尼亚">亚美尼亚</option>
										<option value="阿鲁巴">阿鲁巴</option>
										<option value="澳大利亚">澳大利亚</option>
										<option value="奥地利">奥地利</option>
										<option value="阿塞拜疆">阿塞拜疆</option>
										<option value="奥兰群岛">奥兰群岛</option>
										<option value="16">巴哈马</option>
										<option value="17">巴林</option>
										<option value="18">孟加拉</option>
										<option value="19">巴巴多斯</option>
										<option value="20">白俄罗斯</option>
										<option value="21">比利时</option>
										<option value="22">伯利兹</option>
										<option value="23">贝宁</option>
										<option value="24">百慕大</option>
										<option value="25">不丹</option>
										<option value="26">玻利维亚</option>
										<option value="27">波斯尼亚</option>
										<option value="28">博茨瓦纳</option>
										<option value="29">布维岛</option>
										<option value="30">巴西</option>
										<option value="31">英属印度洋领地</option>
										<option value="32">文莱达鲁萨兰国</option>
										<option value="33">保加利亚</option>
										<option value="34">布基纳法索</option>
										<option value="35">布隆迪</option>
										<option value="36">柬埔寨</option>
										<option value="37">喀麦隆</option>
										<option value="38">加拿大</option>
										<option value="39">佛得角</option>
										<option value="40">开曼群岛</option>
										<option value="41">中非</option>
										<option value="42">乍得</option>
										<option value="43">智利</option>
										<option value="44">中国香港</option>
										<option value="45">中国澳门</option>
										<option value="46">中国台湾</option>
										<option value="47">圣诞岛</option>
										<option value="48">科科斯（基林）群岛</option>
										<option value="49">哥伦比亚</option>
										<option value="50">科摩罗</option>
										<option value="51">刚果</option>
										<option value="52">库克群岛</option>
										<option value="53">哥斯达黎加</option>
										<option value="54">克罗地亚</option>
										<option value="55">古巴</option>
										<option value="56">塞浦路斯</option>
										<option value="57">捷克共和国</option>
										<option value="58">刚果</option>
										<option value="59">丹麦</option>
										<option value="60">吉布提</option>
										<option value="61">多米尼加</option>
										<option value="62">多米尼加共和国</option>
										<option value="63">东帝汶</option>
										<option value="64">厄瓜多尔</option>
										<option value="65">埃及</option>
										<option value="66">萨尔瓦多</option>
										<option value="67">赤道几内亚</option>
										<option value="68">厄立特里亚</option>
										<option value="69">爱沙尼亚</option>
										<option value="70">埃塞俄比亚</option>
										<option value="71">东帝汶</option>
										<option value="72">福克兰群岛</option>
										<option value="73">法罗群岛</option>
										<option value="74">斐济</option>
										<option value="75">芬兰</option>
										<option value="76">原捷克斯洛伐克</option>
										<option value="77">法国</option>
										<option value="78">法国(欧洲领土)</option>
										<option value="79">法属圭亚那</option>
										<option value="80">法属南半球领地</option>
										<option value="81">法国圣·马丁</option>
										<option value="82">加蓬</option>
										<option value="83">冈比亚</option>
										<option value="84">格鲁吉亚</option>
										<option value="85">德国</option>
										<option value="86">加纳</option>
										<option value="87">直布罗陀</option>
										<option value="88">英国</option>
										<option value="89">希腊</option>
										<option value="90">格陵兰</option>
										<option value="91">格林纳达</option>
										<option value="92">瓜德罗普岛</option>
										<option value="93">美国关岛</option>
										<option value="94">危地马拉</option>
										<option value="95">几内亚</option>
										<option value="96">几内亚</option>
										<option value="97">圭亚那</option>
										<option value="98">根西岛</option>
										<option value="99">海地</option>
										<option value="100">几内亚比绍</option>
										<option value="101">圣座</option>
										<option value="102">洪都拉斯</option>
										<option value="103">匈牙利</option>
										<option value="104">冰岛</option>
										<option value="105">印度</option>
										<option value="106">印度尼西亚</option>
										<option value="107">伊朗</option>
										<option value="108">伊拉克</option>
										<option value="109">爱尔兰</option>
										<option value="110">以色列</option>
										<option value="111">意大利</option>
										<option value="112">象牙海岸</option>
										<option value="113">马恩岛</option>
										<option value="114">牙买加</option>
										<option value="115">日本</option>
										<option value="116">约旦</option>
										<option value="117">新泽西州</option>
										<option value="118">哈萨克斯坦</option>
										<option value="119">肯尼亚</option>
										<option value="120">基里巴斯</option>
										<option value="121">科威特</option>
										<option value="122">吉尔吉斯斯坦共和国</option>
										<option value="123">老挝</option>
										<option value="124">拉脱维亚</option>
										<option value="125">黎巴嫩</option>
										<option value="126">莱索托</option>
										<option value="127">利比里亚</option>
										<option value="128">利比亚</option>
										<option value="129">列支敦士登</option>
										<option value="130">立陶宛</option>
										<option value="131">卢森堡</option>
										<option value="132">马其顿</option>
										<option value="133">马达加斯加</option>
										<option value="134">马拉维</option>
										<option value="135">马来西亚</option>
										<option value="136">马尔代夫</option>
										<option value="137">马里</option>
										<option value="138">马耳他</option>
										<option value="139">马绍尔群岛</option>
										<option value="140">马提尼克</option>
										<option value="141">毛里塔尼亚</option>
										<option value="142">毛里求斯</option>
										<option value="143">马约特</option>
										<option value="144">墨西哥</option>
										<option value="145">密克罗尼西亚</option>
										<option value="146">摩尔达维亚人</option>
										<option value="147">摩纳哥</option>
										<option value="148">蒙古</option>
										<option value="149">蒙特塞拉特</option>
										<option value="150">摩洛哥</option>
										<option value="151">莫桑比克</option>
										<option value="152">缅甸</option>
										<option value="153">黑山</option>
										<option value="154">纳米比亚</option>
										<option value="155">瑙鲁</option>
										<option value="156">尼泊尔</option>
										<option value="157">荷兰</option>
										<option value="158">荷属安的列斯</option>
										<option value="159">新喀里多尼亚</option>
										<option value="160">新西兰</option>
										<option value="161">尼加拉瓜</option>
										<option value="162">尼日尔</option>
										<option value="163">尼日利亚</option>
										<option value="164">纽埃</option>
										<option value="165">诺福克岛</option>
										<option value="166">北马里亚纳群岛</option>
										<option value="167">挪威</option>
										<option value="168">朝鲜</option>
										<option value="169">阿曼</option>
										<option value="170">巴基斯坦</option>
										<option value="171">帕劳</option>
										<option value="172">巴拿马</option>
										<option value="173">巴布亚新几内亚</option>
										<option value="174">巴拉圭</option>
										<option value="175">秘鲁</option>
										<option value="176">菲律宾</option>
										<option value="177">皮特克恩岛</option>
										<option value="178">波兰</option>
										<option value="179">玻里尼西亚</option>
										<option value="180">葡萄牙</option>
										<option value="181">波多黎各</option>
										<option value="182">巴勒斯坦</option>
										<option value="183">木瓜新几内亚</option>
										<option value="184">卡塔尔</option>
										<option value="185">留尼汪岛</option>
										<option value="186">罗马尼亚</option>
										<option value="187">俄罗斯联邦</option>
										<option value="188">卢旺达</option>
										<option value="189">圣赫勒拿</option>
										<option value="190">圣卢西亚</option>
										<option value="191">圣皮埃尔和密克隆群岛</option>
										<option value="192">圣文斯</option>
										<option value="193">萨摩亚</option>
										<option value="194">圣马力诺</option>
										<option value="195">圣多美和普林西比</option>
										<option value="196">沙特阿拉伯</option>
										<option value="197">塞内加尔</option>
										<option value="198">塞舌尔</option>
										<option value="199">塞拉利昂</option>
										<option value="200">新加坡</option>
										<option value="201">斯洛伐克共和国</option>
										<option value="202">斯洛文尼亚</option>
										<option value="203">所罗门群岛</option>
										<option value="204">索马里</option>
										<option value="205">南非</option>
										<option value="206">韩国</option>
										<option value="207">西班牙</option>
										<option value="208">斯里兰卡</option>
										<option value="209">圣基茨和尼维斯联邦</option>
										<option value="210">苏丹</option>
										<option value="211">苏里南</option>
										<option value="212">斯瓦尔巴群岛</option>
										<option value="213">斯威士兰</option>
										<option value="214">瑞典</option>
										<option value="215">瑞士</option>
										<option value="216">叙利亚</option>
										<option value="217">塞尔维亚</option>
										<option value="218">南乔治亚岛和南桑威奇群岛</option>
										<option value="219">圣巴托洛缪</option>
										<option value="220">无国籍</option>
										<option value="221">塔吉克斯坦</option>
										<option value="222">坦桑尼亚</option>
										<option value="223">泰国</option>
										<option value="224">多哥</option>
										<option value="225">托克劳</option>
										<option value="226">汤加</option>
										<option value="227">特立尼达和多巴哥</option>
										<option value="228">突尼斯</option>
										<option value="229">土耳其</option>
										<option value="230">土库曼斯坦</option>
										<option value="231">特克斯和凯科斯群岛</option>
										<option value="232">图瓦卢</option>
										<option value="233">乌干达</option>
										<option value="234">乌克兰</option>
										<option value="235">阿拉伯联合酋长国</option>
										<option value="236">英国</option>
										<option value="美国">美国</option>
										<option value="238">乌拉圭</option>
										<option value="239">美国小岛屿</option>
										<option value="240">乌兹别克斯坦</option>
										<option value="241">未知</option>
										<option value="242">瓦努阿图</option>
										<option value="243">委内瑞拉</option>
										<option value="244">越南</option>
										<option value="245">英属维尔京群岛</option>
										<option value="246">维尔京群岛（美国）</option>
										<option value="247">瓦利斯群岛和富图纳群岛</option>
										<option value="248">西撒哈拉</option>
										<option value="249">也门</option>
										<option value="250">南斯拉夫</option>
										<option value="251">扎伊尔</option>
										<option value="252">赞比亚</option>
										<option value="253">津巴布韦</option>
								</select>
								</span>
							</div>
								<span name="countryError" class="error-con">* 请选择国家</span>
						</li>
		
						<li>
							<div class="reg-col-1 fl" style="margin:0 0 0 10%">验证码：</div>
							
							<div  class="reg-col-2 fl">
								<input type="text" id="CodeNum" name="CodeNum" autocomplete="off" onblur="checkCodeNum();"
								style="height: 36px; width: 253px; size:20">			
							</div>
							
							<div id="CodeNumDiv" class="reg-col-2 fl">
								<input type="text" onclick="createCode()" readonly="readonly" id="checkCode" 
											class="unchanged" style='width: 78px; height: 36px;  color: #FF0000; border-color: #FFFFFF; 
											font-style: normal; font-size: 16px; font-family: "Trebuchet MS", Sans-Serif; font-weight: bold; 
											border-style: none'>
											<img alt="换一张" onclick="createCode()" style="cursor:pointer;">
							</div>						
								<span name="CodeErrorSpan" class="error-con">* 验证码不正确</span>			
						</li>
					</ul>
				
		
				<div style="margin:2% 0 0 22%">
					<table>
						<tr>
							<td><input id="checkbox" type="checkbox" name="Agreement" value="Agreement"
								backgroundcolor="#FF8C00" onclick="isCheckbox()" /> <a alt="用户注册协议" href="./html/registerAgreement.html"><font face=" Microsoft YaHei"
								color="#FF8C00" size="3"> &nbsp;我已阅读并同意 《用户注册协议》 </font></a></td>
						</tr>
					</table>
				</div>
		
				<div style="margin:4% 0 0 28%;border-radius: 5px 5px 5px 5px;">		
					<input id="submitBtn"  class="btn btn-primary radius disabled" type="submit" value="注           册" style="height: 55px; width: 170px;"  >	
				</div>
		
				<div style="margin:2% 0 0 22%;border-radius: 5px 5px 5px 5px;">
					<font color="#C0C0C0" size="3"> <a href="javascript:;"> 你忘记密码了吗？</a> 
					<a href="<%=path %>/login.jsp">我已有账号，我要登录</a>
					</font>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="./html/foot.html" flush="true"/>
</div>	
</body>
</html>
