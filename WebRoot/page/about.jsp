<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="${basePath}/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="${basePath}/js/jquery.js"></script>
<script type="text/javascript" src="${basePath}/js/js.js"></script>
<script src="${basePath}/js/wb.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body>
	<div class="mianCont">
		<div class="top">
			<span>您好！欢迎来到17商城 请&nbsp;<a
				href="${basePath}/jspChange/loginJsp">[登录]</a> &nbsp;<a
				href="${basePath}/jspChange/regJsp">[注册]</a></span> <span class="topRight">
				<a href="${basePath}/jspChange/vipJsp">我的17</a>&nbsp;| <a
				href="${basePath}/jspChange/orderJsp">我的订单</a>&nbsp;| <a
				href="${basePath}/jspChange/vipMyJsp">会员中心</a>&nbsp;| <a
				href="${basePath}/jspChange/contactJsp">联系我们</a>
			</span>
		</div>
		<!--top/-->
		<div class="lsg">
			<h1 class="logo">
				<a href="${basePath}/jspChange/indexJsp"><img
					src="${basePath}/images/logo.png" width="217" height="90" /></a>
			</h1>
			<form action="#" method="get" class="subBox">
				<div class="subBoxDiv">
					<input type="text" class="subLeft" /> <input type="image"
						src="${basePath}/images/subimg.png" width="63" height="34"
						class="sub" />
					<div class="hotWord">
						      热门搜索：
      <a href="${basePath}/jspChange/productJsp?oneName=饮品杯配套系列">饮品杯配套系列</a>&nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸餐盒系列">纸餐盒系列</a> &nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸袋/环保打包袋">纸袋/环保打包袋</a>&nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸杯系列">纸杯系列</a>  &nbsp;
					</div>
					<!--hotWord/-->
				</div>
				<!--subBoxDiv/-->
			</form>
			<!--subBox/-->
			<div class="gouwuche">
				<div class="gouCar">
					<img src="${basePath}/images/gouimg.png" width="19" height="20"
						style="position:relative;top:6px;" />&nbsp;|&nbsp; <strong
						class="red">     <c:if test="${sessionScope.cartNum == null || sessionScope.cartNum == 0}">0</c:if>
     <c:if test="${sessionScope.cartNum != null}">${sessionScope.cartNum}</c:if></strong>&nbsp;件&nbsp;|<a href="order.html">去结算</a> <img
						src="${basePath}/images/youjian.jpg" width="5" height="8" />
				</div>
				<!--gouCar/-->
				<div class="myChunlv">
					<a href="${basePath}/jspChange/vipJsp"><img src="${basePath}/images/mychunlv.jpg"
						width="112" height="34" /></a>
				</div>
				<!--myChunlv/-->
			</div>
			<!--gouwuche/-->
		</div>
		<!--lsg/-->
		<div class="pnt">
			<div class="pntLeft">
				<h2 class="Title">
					所有商品分类
					<ul class="InPorNav">
						<c:forEach items="${catagoryMap.catagory}" var="one">
    	<li><a href="${basePath}/jspChange/productJsp?oneName=${one.oneName}">${one.oneName}</a>
    		 <!-- 展示一级分类 --> 
    		 <div class="chilInPorNav">
    		 <c:forEach items="${one.twoName}" var="two">
      		 <a href="${basePath}/jspChange/productJsp?twoName=${two}">${two}</a>
      	     </c:forEach>
      		 </div>
    	</li>
    	</c:forEach>
					</ul>
					<!--InPorNav/-->
				</h2>
			</div>
			<!--pntLeft/-->
			<div class="pntRight">
			   <ul class="nav">
			   <li class="navCur"><a href="${basePath}/jspChange/indexJsp">商城首页</a></li>
			   <li><a href="${basePath}/jspChange/productJsp">促销中心</a></li>
			   <li><a href="${basePath}/jspChange/vipJsp">会员中心</a></li>
			   <li><a href="${basePath}/jspChange/helpJsp">帮助中心</a></li>
			   <div class="clears"></div>
			   <div class="phone">TEL：021-12345678</div>
			  </ul><!--nav/--> 
				
			</div>
			<!--pntRight/-->
			<div class="clears"></div>
		</div>
		<!--pnt/-->
		<div class="positions">
			当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="#"
				class="posCur">帮助中心</a>
		</div>
		<!--positions/-->
		<div class="cont">
			<div class="contLeft" id="contLeft">
				<h3 class="leftTitle">帮助中心</h3>
				<dl class="helpNav">
					<dt class="help4">关于我们</dt>
					<dd>
						<a href="${basePath}/jspChange/indexJsp">17官网</a>
					</dd>
					<dd>
						<a href="${basePath}/jspChange/contactJsp">联系方式</a>
					</dd>
					<dd>
						<a href="${basePath}/jspChange/aboutJsp" class="helpCur">企业简介</a>
					</dd>
				</dl>
				<!--helpNav/-->
			</div>
			<!--contLeft/-->
			<div class="contRight">
				<h4 class="gouLiu">企业简介</h4>
				<div class="helpPar">
					&nbsp;&nbsp;&nbsp;&nbsp;上海17实业有限公司是一家集设计、开发、生产于一体的企业，主要生产一次性纸餐具、一次性纸杯（广告纸杯、咖啡
					杯、奶茶杯、雪糕杯）等产品。几年来，公司在全体200多位员工共同努力下，本着“以信为本、以诚待人、以新拓展、以质
					取胜”的企业宗旨，大胆创新，不断进取，逐渐成为引领一次性纸制品发展潮流中的领先企业。 <br />
					&nbsp;&nbsp;&nbsp;&nbsp;目前公司拥有德国海德堡CP2000四色胶印机、宽幅柔版印刷机、进口全自动高速纸杯成型机、台湾模切机等一系列具有国
					际先进水平的生产设备，以满足不同客户的需要。本公司本着“诚信为本、质量第一、开创新品、精益求精”的企业精神，致
					力为用户提供至善至美的服务，欢迎垂询。 <br /> 公司的承诺： &nbsp;&nbsp;&nbsp;&nbsp;
					对工作：提供高质量的产品，传播优质理念，迅速反应，马上行动。 &nbsp;&nbsp;&nbsp;&nbsp;
					对客户：合作双赢，共同发展。 &nbsp;&nbsp;&nbsp;&nbsp; 对员工：教育培训，成就人生。
					&nbsp;&nbsp;&nbsp;&nbsp; 对社会：依法经营，保护生态，回馈大众。 <br />
					&nbsp;&nbsp;&nbsp;&nbsp;环保，是我们最关注的问题之一！远传在生产应用中，大量采购使用环保纸张，环保型油墨。并在生产中重点对废料、回料进
					行有效处理。保证产品符合国家环保标准，符合食品卫生标准。
				</div>
				<!--helpPar-->
			</div>
			<!--contRight/-->
			<div class="clears"></div>
		</div>
		<!--cont/-->
		<div class="inHelp">
			<div class="inHLeft">
				<h4>帮助中心</h4>
				<ul class="inHeList">
					<li><a href="${basePath}/jspChange/helpJsp">购物指南</a></li>
					<li><a href="${basePath}/jspChange/helpJsp">支付方式</a></li>
					<li><a href="${basePath}/jspChange/helpJsp">售后服务</a></li>
					<li><a href="${basePath}/jspChange/aboutJsp">企业简介</a></li>
					<div class="clears"></div>
				</ul>
				<!--inHeList/-->
			</div>
			<!--inHLeft/-->
			<div class="inHLeft">
				<h4>会员服务</h4>
				<ul class="inHeList">
					<li><a href="${basePath}/jspChange/regJsp">会员注册</a></li>
					<li><a href="${basePath}/jspChange/loginJsp">会员登录</a></li>
					<li><a href="${basePath}/jspChange/orderJsp">购物车</a></li>
					<li><a href="${basePath}/jspChange/orderJsp">我的订单</a></li>
					<div class="clears"></div>
				</ul>
				<!--inHeList/-->
			</div>
			<!--inHLeft/-->
			<div class="inHRight">
				<h4>全国统一免费服务热线</h4>
				<div class="telBox">400-0000-0000</div>
				<div class="weibo">
					<wb:follow-button uid="2991975565" type="red_1" width="67"
						height="24"></wb:follow-button>
				</div>
			</div>
			<!--inHRight/-->
			<div class="clears"></div>
		</div>
		<!--inHelp/-->
		<div class="footer">
			<p>
				<a href="${basePath}/jspChange/indexJsp">进入17官网</a>&nbsp;|&nbsp; <a href="${basePath}/jspChange/indexJsp">商城首页</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/productJsp">促销中心</a>&nbsp;|&nbsp; <a href="${basePath}/jspChange/orderJsp">我的订单</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/indexJsp">新闻动态</a>&nbsp;|&nbsp; <a href="${basePath}/jspChange/vipJsp">会员中心</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/helpJsp">帮助中心</a>
			</p>
			<p>
				版权所有：上海17实业有限公司 版权所有 Copyright 2010-2015 沪ICP备00000000号 <a
					href="http://www.mycodes.net/" target="_blank">源码之家</a>
			</p>
		</div>
		<!--footer/-->
	</div>
	<!--mianCont/-->
	<a href="#" class="backTop">&nbsp;</a>
</body>
</html>
