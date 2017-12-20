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
				<a href="index.html"><img src="${basePath}/images/loginLogo.jpg"
					width="241" height="71" /></a>
			</h1>
			<div class="loginReg">
				还没有会员账号?&nbsp;<a href="${basePath}/jspChange/regJsp">免费注册</a>
			</div>
			<!--loginReg/-->
		</div>
		<!--logoMid/-->
	</div>
	<!--loginLogo/-->
	<div class="loginBox">
		<div class="loginLeft">
			<img src="${basePath}/images/logoinimg.jpg" width="716" height="376" />
		</div>
		<!--loginLeft/-->
		<form action="${basePath}/managerController/managerLogin" method="post" class="loginRight">
			<h2>管理员登录</h2>
			<h3>用户名</h3>
			<input type="text" class="name" name="name"/>
			<h3>密码</h3>
			<input type="password" class="pwd" name="password"/>
			<h3>${error}</h3>
			<div>
				<h3><span class="red">*</span> 验证码</h3>
					<input class="yzm" type="text" class="yanzheng" id="inputCode" autocomplete="off"/>
					<a href="${basePath}/managerController/loginGetVerifyImg"> 
					<input type="hidden" value="${verifyCode}" class="trueCode"><br><br>
					<img alt="获取验证码" src="${basePath}/${codeImgPath}" width="105" height="33"/>
				</a>
			</div>
			<div class="zhuangtai">
				<input type="checkbox" checked="checked" /> 下次自动登录
			</div>
			<!--zhuangtai/-->
			<div class="subs">
				<input type="image" src="${basePath}/images/sub.jpg" class="submit" />
			</div>
		</form>
		<!--loginRight/-->
		<div class="clears"></div>
	</div>
	<!--loginBox/-->
</body>
</html>
