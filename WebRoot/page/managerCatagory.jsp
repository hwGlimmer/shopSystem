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
<script src="${basePath}/js/wb.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
	<div class="mianCont">
		<div class="top">
			<span>17商城管理系统</span> <span class="topRight"> <a
				href="${basePath}/jspChange/indexJsp">联系经理</a>&nbsp;|
				<a href="${basePath}/managerController/managerLoginOut">退出登录</a>
			</span>
		</div>

		<div class="lsg">
			<h1 class="logo">
				<a href="${basePath}/jspChange/indexJsp"><img src="${basePath}/images/logo.png"
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
					<li class="navCur"><a href="${basePath}/jspChange/managerCatagoryJsp">商品分类管理</a></li>
					<li><a href="${basePath}/jspChange/managerWaresJsp">商品管理</a></li>
					<li><a href="${basePath}/jspChange/managerOrders">订单管理</a></li>
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
			当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="#" class="posCur">商品分类管理</a>
		</div>
		
		<c:if test="${flag == 'update'}">
					<form action="${basePath}/managerController/updateCatagory" method="post">
						<input type="hidden" name="id" value="${catagory.id}">
							<div>
								<label><span class="red">* </span>一级分类:</label> <input
									type="text" name="oneName" value="${catagory.oneName}"/>
							</div>
							<!--addList-->
							<div>
								<label><span class="red">* </span>二级分类:</label><br>
								<c:forEach items="${catagory.twoName}" var="twoName">
									<input type="text" name="twoName" value="${twoName}"/><br>
								</c:forEach>
							</div>

							<!--addList-->
							<div class="addList2">
								<input type="image" src="${basePath}/images/baocun.png"
									width="100" height="32" />
							</div>
							<!--addList2/-->
						<!--address/-->
					</form>
				</c:if>
		
		
				<c:if test="${flag == 'addTwoCatagory'}">
					<form action="${basePath}/managerController/addTwoCatagory" method="post">
						<input type="hidden" name="oneCatagoryId" value="${oneCatagoryId}">
							<div>
								<label><span class="red">* </span>二级分类:</label> <input
									type="text" name="twoCatagoryName"/>
							</div>
							<div class="addList2">
								<input type="image" src="${basePath}/images/baocun.png"
									width="100" height="32" />
							</div>
					</form>
				</c:if>
		
				<c:if test="${flag == 'addOneCatagory'}">
					<form action="${basePath}/managerController/addOneCatagory" method="post">
							<div>
								<label><span class="red">* </span>添加一级分类:</label> <input
									type="text" name="oneCatagoryName"/>
							</div>
							<div class="addList2">
								<input type="image" src="${basePath}/images/baocun.png"
									width="100" height="32" />
							</div>
					</form>
				</c:if>
		
		<!--positions/-->
		<c:if test="${flag != 'update' && flag != 'addTwoCatagory' && flag != 'addOneCatagory'}">
		<div class="cont">
			<table class="orderList">
				<tr>
					<th width="135">一级分类</th>
					<th width="135">所属二级分类</th>
					<th width="300">操作</th>
				</tr>
				
				<c:forEach items="${catagoryMap.catagory}" var="one">
					<tr>
						<td>${one.oneName}</td>
						<td><c:forEach items="${one.twoName}" var="two">
										${two}
									</c:forEach></td>
						<td colspan="3">
							<button>
								<a href="${basePath}/managerController/flagAddTwoCatagory?oneCatagoryId=${one.id}">添加</a>
							</button>
							<button>
								<a href="${basePath}/managerController/catagoryUpdateFlag?oneCatagoryId=${one.id}">修改</a>
							</button>
							<button>
								<a href="${basePath}/managerController/deleteCatagory?oneCatagoryId=${one.id}">删除</a>
							</button>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
				</tr>
			</table>
			<button>
					<a href="${basePath}/managerController/flagAddOneCatagory">添加一级分类</a>
				</button>
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
				<a href="${basePath}/jspChange/indexJsp">进入17官网</a>&nbsp;|&nbsp; <a href="index.html">商城首页</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/productJsp">促销中心</a>&nbsp;|&nbsp; <a href="order.html">我的订单</a>&nbsp;|&nbsp;
				<a href="${basePath}/jspChange/newJsp">新闻动态</a>&nbsp;|&nbsp; <a href="login.html">会员中心</a>&nbsp;|&nbsp;
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
