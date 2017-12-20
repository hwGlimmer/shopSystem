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
<script type="text/javascript">
	$(function(){
		$(".zhifucheng").click(function() {
			//获取a标签的href
			var href = $(this).attr("href");
			//将href给form表单的action，并提交表单
			$(".form").attr("action", href).submit();
			//如果想a标签的点击事件不生效，直接return false；
			return false;
		});
	});
</script>	

</head>

<body>
	<div class="mianCont">
		<div class="top">
			<c:if test="${sessionScope.user.userName != null}">
   		您好！欢迎来到17商城,会员 ${sessionScope.user.userName}
   		<a href="${basePath}/userController/userLoginOut">[注销]</a>
   	</c:if>
   	<c:if test="${sessionScope.user.userName == null}">
   		<span>您好！欢迎来到17商城 请&nbsp;<a href="${basePath}/jspChange/loginJsp">[登录]</a>&nbsp;
   		<a href="${basePath}/jspChange/regJsp">[注册]</a></span>
   	</c:if>
				
				<span class="topRight"> <a
				href="${basePath}/jspChange/vipJsp">我的17</a>&nbsp;| <a href="${basePath}/jspChange/orderJsp">我的订单</a>&nbsp;|
				<a href="${basePath}/jspChange/loginJsp">会员中心</a>&nbsp;| <a href="${basePath}/jspChange/contactJsp">联系我们</a>
			</span>
		</div>
		<!--top/-->
		<div class="lsg">
			<h1 class="logo">
				<a href="${basePath}/jspChange/indexJsp"><img src="${basePath}/images/logo.png"
					width="217" height="90" /></a>
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
     <c:if test="${sessionScope.cartNum != null}">${sessionScope.cartNum}</c:if></strong>&nbsp;件&nbsp;|<a href="orderJsp">去结算</a> <img
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
				</ul>
				<!--nav/-->
			</div>
			<!--pntRight/-->
			<div class="clears"></div>
		</div>
		<!--pnt/-->
		<div class="positions">
			当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="#" class="posCur">填写核对订单</a>
		</div>
		<!--positions/-->
		<div class="cont">
			<div class="carImg">
				<img src="${basePath}/images/car2.jpg" width="961" height="27" />
			</div>
			<h4 class="orderTitle">收货地址</h4>
			<form action="" class="form">
			<input type="hidden" name="ordersId" value="${ordersId}">
			<c:forEach items="${addressList}" var="address">
				<table class="ord">
					<tr>
						<td width="30%"><input type="radio" name="address" value="${address.address}"/>${address.recipients}
						</td>
						<td width="50%">${address.address},${address.tel}</td>
						<td></td>
					</tr>
				</table>
				<!--ord/-->
			</c:forEach>
			</form>
			<h4 class="orderTitle">支付方式</h4>
			<ul class="zhiList">
				<li>网银支付-借记卡</li>
				<li>网银支付-信用卡</li>
				<li>财付通-余额支付</li>
				<li>支付宝-余额支付</li>
				<div class="clears"></div>
			</ul>
			<!--zhiList/-->
			<div class="zhifufangshi">
				<ul class="yinhang">
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin1.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin2.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin3.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin4.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin5.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin6.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin7.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin8.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin9.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin1.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin2.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin3.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin4.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin5.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin6.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin7.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin8.gif" /></li>
					<div class="clears"></div>
				</ul>
			</div>
			<!--zhzhifufangshii/-->
			<div class="zhifufangshi">
				<ul class="yinhang">
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin7.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin8.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin9.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin1.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin2.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin3.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin4.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin5.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin6.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin7.gif" /></li>
					<li><input type="radio" name="zhifu" /><img
						src="${basePath}/images/yin8.gif" /></li>
					<div class="clears"></div>
				</ul>
			</div>
			<!--zhzhifufangshii/-->
			<div class="zhifufangshi">
				<ul class="yinhang">
					<li><input type="radio" /><img
						src="${basePath}/images/caifutong.jpg" /></li>
					<div class="clear"></div>
				</ul>
			</div>
			<!--zhzhifufangshii/-->
			<div class="zhifufangshi">
				<ul class="yinhang">
					<li><input type="radio" /><img
						src="${basePath}/images/zhifubao.jpg" /></li>
					<div class="clear"></div>
				</ul>
			</div>
			<!--zhzhifufangshii/-->
			<table class="zongjia" align="right">
				<tr>
					<td width="120" align="left">合计：</td>
					<td><strong class="red">￥${ordersPrice}</strong></td>
				</tr>
				<tr>
					<td colspan="2" style="height:50px;"><a
						href="${basePath}/orderController/zhifu" class="zhifucheng"><img
							src="${basePath}/images/zhifu.png" width="142" height="32" /></a></td>
				</tr>
			</table>
			<!--zongjia/-->
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
				<a href="${basePath}/jspChange/indexJsp">进入17官网</a>&nbsp;|&nbsp; 
				<a href="${basePath}/jspChange/indexJsp">商城首页</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/productJsp">促销中心</a>&nbsp;|&nbsp; 
				<a href="${basePath}/jspChange/orderJsp">我的订单</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/newJsp">新闻动态</a>&nbsp;|&nbsp; 
				<a href="${basePath}/jspChange/vipJsp">会员中心</a>&nbsp;|&nbsp;
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
