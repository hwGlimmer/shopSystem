<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="${basePath}/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="${basePath}/js/jquery.js"></script>
<script type="text/javascript" src="${basePath}/js/js.js"></script>

</head>

<body style=" background:#FFF;">
	<div class="loginLogo">
		<div class="logoMid">
			<h1 class="logo" style="height:71px;padding-top:10px;">
				<a href="${basePath}/jspChange/indexJsp"><img src="${basePath}/images/loginLogo.jpg"
					width="241" height="71" /></a>
			</h1>
			<div class="loginReg">
				已经有会员账号?&nbsp;<a href="${basePath}/jspChange/loginJsp">登录</a>
			</div>
			<!--loginReg/-->
		</div>
		<!--logoMid/-->
	</div>
	<!--loginLogo/-->
	<div class="loginBox">
		<img src="${basePath}/images/chengnuo.jpg" width="295" height="393"
			class="chengnuo" />
		<form action="${basePath}/userController/addUser" method="post"
			class="reg" id="regform">
			<div class="regList">
				<label><span class="red">*</span> 用户名</label> <input type="text" class="userName" name="userName"/>
				<span style="color:#999;">${error}</span><br>
				<span style="color:#999;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				请输入邮箱/用户名/手机号</span>
			</div>
			<!--regList/-->
			<div class="regList">
				<label><span class="red">*</span> 请设置密码</label> <input
					type="password" class="pwd" name="userPwd"/>
			</div>

			<div class="regList">
				<label><span class="red">*</span> 真实姓名</label> <input type="text" class="trueName" name="trueName"/>
			</div>
			<!--regList/-->

			<div class="regList">
				<label><span class="red">*</span> 证件号码</label> <input type="text" class="idNumber" name="idNumber"/>
			</div>
			<!--regList/-->

			<div class="regList">
				<label><span class="red">*</span> 验证码</label> 
					<input type="text" class="yanzheng" id="inputCode"/>
					<a href="${basePath}/userController/regGetVerifyImg"> 
					<input type="hidden" value="${verifyCode}" class="trueCode">
					<img alt="获取验证码" src="${basePath}/${codeImgPath}" width="105" height="33"/>
				</a>
			</div>
			<!--regList/-->
			<div class="xieyi">
				<input type="checkbox" class="regXieyi"/>我已经阅读并同意<a href="#">《17用户注册协议》</a>
			</div>
			<!--xieyi/-->
			<div class="reg">
				<input type="image" class="regSubmit"  src="${basePath}/images/reg.jpg"
					width="284" height="34"/>
			</div>
			<!--reg/-->
		</form>
		<!--reg/-->
		<div class="clears"></div>
	</div>
	<!--loginBox/-->
</body>
</html>
