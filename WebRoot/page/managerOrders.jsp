<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>17商城</title>
<link type="text/css" href="${basePath}/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="${basePath}/js/jquery.js"></script>
<script type="text/javascript" src="${basePath}/js/js.js"></script>
<script src="${basePath}/js/wb.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
	<div class="mianCont">
		<div class="top">
			<span>17商城管理系统</span> <span class="topRight"> <a
				href="login.html">联系经理</a>&nbsp;| <a href="${basePath}/managerController/managerLoginOut">退出登录</a>
			</span>
		</div>

		<div class="lsg">
			<h1 class="logo">
				<a href="index.html"><img src="${basePath}/images/logo.png"
					width="217" height="90" /></a>
			</h1>
		</div>
		<!--lsg/-->
		<div class="pnt">
			<div class="pntLeft">
				<h2 class="Title">管理后台</h2>
			</div>
			<!--pntLeft/-->
			<div class="pntRight">
				<ul class="nav">
					<li><a href="${basePath}/jspChange/managerUserJsp">用户管理</a></li>
					<li><a href="${basePath}/jspChange/managerCatagoryJsp">商品分类管理</a></li>
					<li><a href="${basePath}/jspChange/managerWaresJsp">商品管理</a></li>
					<li class="navCur"><a href="${basePath}/jspChange/">订单管理</a></li>
					<!-- <div class="clears"></div> -->
					<div class="phone">TEL：021-12345678</div>
				</ul>
				<!--nav/-->
			</div>
			<!--pntRight/-->
			<div class="clears"></div>
		</div>
		<!--pnt/-->
		<div class="positions">
			当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="#" class="posCur">订单管理</a>
		</div>
		
		<c:if test="${flag == 'updateOrders'}">
					<form:form action="${basePath}/managerController/updateOrders" modelAttribute="orders" method="post">
						<form:hidden path="id"/>
							<div>
								<label><span class="red">* </span>订单时间:</label><br>
								<form:input path="time"/>
							</div>
							<!--addList-->
							<div>
								
								<label><span class="red">* </span>订单状态:</label><br>
								<form:select path="zhuangtai">
									<form:option value="已支付">已支付</form:option>
									<form:option value="未支付">未支付</form:option>
								</form:select><br>
							</div>
							<div>
								<label><span class="red">* </span>用户id:</label><br>
								<form:input path="userId"/>
							</div>
							<div>
								<label><span class="red">* </span>订单价格:</label><br>
								<form:input path="orderPrice"/><br>
							</div>
							<div>
								<label><span class="red">* </span>订单地址:</label><br>
								<form:input path="address"/><br>
							</div>
							<!--addList-->
							<div class="addList2">
								<input type="image" src="${basePath}/images/baocun.png"
									width="100" height="32" />
							</div>
							<!--addList2/-->
						<!--address/-->
					</form:form>
				</c:if>
		<!--positions/-->
		<c:if test="${flag != 'updateOrders'}">
		<div class="cont">
			<table class="orderList">
				<tr>
					<th width="135">订单时间</th>
					<th width="135">订单状态</th>
					<th width="135">用户id</th>
					<th width="135">订单价格</th>
					<th width="135">订单地址</th>
					<th width="135">操作</th>
				</tr>
				
				<c:forEach items="${ordersList}" var="orders">
					<tr>
							<td>${orders.time}</td>
							<td>${orders.zhuangtai}</td>
							<td>${orders.userId}</td>
							<td>${orders.orderPrice}</td>
							<td>${orders.address}</td>
						<td colspan="3">
							<button>
								<a href="${basePath}/managerController/flagUpdateOrders?ordersId=${orders.id}">修改</a>
							</button>
							<button>
								<a href="${basePath}/managerController/deleteOrders?ordersId=${orders.id}">删除</a>
							</button>
						</td>
					</tr>
				</c:forEach>
			
				<tr>
					<td></td>
				</tr>
			</table>
			<a href="${basePath}/jspChange/managerOrders?curPage=1">首页</a>
			<a href="${basePath}/jspChange/managerOrders?curPage=${curPage-1}">上一页</a>
			<a href="${basePath}/jspChange/managerOrders?curPage=${curPage+1}">下一页</a>
			<a href="${basePath}/jspChange/managerOrders?curPage=${totalPage}">尾页</a>
			页数：${curPage}/${totalPage}页
			<!--orderList/-->
		</div>

		</c:if>
		<!--jiesuan/-->
		<div class="clears"></div>
	</div>
	<!--cont/-->
	<div class="inHelp">
		<div class="footer">
			<p>
				<a href="${basePath}/jspChange/indexJsp">进入17官网</a>&nbsp;|&nbsp; 
				<a href="${basePath}/jspChange/indexJsp">商城首页</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/productJsp">促销中心</a>&nbsp;|&nbsp;
				 <a href="${basePath}/jspChange/orderJsp">我的订单</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/newJsp">新闻动态</a>&nbsp;|&nbsp; 
				<a href="${basePath}/jspChange/loginJsp">会员中心</a>&nbsp;|&nbsp;
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
