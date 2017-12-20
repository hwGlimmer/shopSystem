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
				href="${basePath}/jspChange/loginJsp">联系经理</a>&nbsp;| <a href="${basePath}/managerController/managerLoginOut">退出登录</a>
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
					<li><a href="${basePath}/jspChange/managerCatagoryJsp">商品分类管理</a></li>
					<li class="navCur"><a href="${basePath}/jspChange/managerWaresJsp">商品管理</a></li>
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
			当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="#" class="posCur">商品管理</a>
		</div>
		
		<form action="${basePath}/managerController/selectWaresByNameAndPage">
			<input type="hidden" name="curPage" value="1">
			根据商品名字模糊搜索：<input type="text" name="waresName">
			<input type="submit" value="提交">
		</form>
		
		<c:if test="${flag == 'updateWares'}">
					<form:form action="${basePath}/managerController/updateWares" modelAttribute="wares" method="post" enctype="multipart/form-data">
						<form:hidden path="wId"/>
							<div>
								<label><span class="red">* </span>商品名字:</label><br>
								<form:input path="wName"/>
							</div>
							<!--addList-->
							<div>
								
								<label><span class="red">* </span>所属一级分类:</label><br>
								<form:select path="oneCatagoryName">
									<form:options items="${oneName}"></form:options>
								</form:select><br>
							</div>
							<div>
								<label><span class="red">* </span>所属二级分类:</label><br>
								<form:select path="twoCatagoryName">
									<form:options items="${twoName}"></form:options>
								</form:select><br>
							</div>
							<div>
								<label><span class="red">* </span>价格:</label><br>
								<form:input path="wPrice"/><br>
							</div>
							<div>
								<label><span class="red">* </span>描述:</label><br>
								<form:input path="wDescribe"/><br>
							</div>
							<div>
								<label><span class="red">* </span>所剩数量:</label><br>
								<form:input path="wCount"/><br>
							</div>
							<div>
								<label><span class="red">* </span>商品图片:</label><br>
								<input type="image" name="wImage" src="${basePath}/images/${wares.wImage}" width="150px" height="80px"/><br>
							</div>
							<div>
								<label><span class="red">* </span>修改图片:</label><br>
								<input type="file" name="imageFile" /><br>
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
		
		
				<c:if test="${flag == 'addWares'}">
					<form action="${basePath}/managerController/addWares" method="post" enctype="multipart/form-data">
							<div>
								<label><span class="red">* </span>商品名字:</label><br>
								<input name="wName"/>
							</div>
							<!--addList-->
							<div>
								
								<label><span class="red">* </span>所属一级分类:</label><br>
								<select name="oneCatagoryName">
									<c:forEach items="${oneName}" var="one">
										<option value="${one}">${one}</option>
									</c:forEach>
								</select>
								<br>
							</div>
							<div>
								<label><span class="red">* </span>所属二级分类:</label><br>
								<select name="twoCatagoryName">
									<c:forEach items="${twoName}" var="two">
										<option value="${two}">${two}</option>
									</c:forEach>
								</select>
								<br>
							</div>
							<div>
								<label><span class="red">* </span>价格:</label><br>
								<input name="wPrice"/><br>
							</div>
							<div>
								<label><span class="red">* </span>描述:</label><br>
								<input name="wDescribe"/><br>
							</div>
							<div>
								<label><span class="red">* </span>所剩数量:</label><br>
								<input name="wCount"/><br>
							</div>
							<div>
								<label><span class="red">* </span>添加图片:</label><br>
								<input type="file" name="imageFile" /><br>
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
				
		<!--positions/-->
		<c:if test="${flag != 'updateWares' && flag != 'addWares'}">
		<div class="cont">
			<table class="orderList">
				<tr>
					<th width="135">商品名字</th>
					<th width="135">所属一级分类</th>
					<th width="135">所属二级分类</th>
					<th width="135">价格</th>
					<th width="135">描述</th>
					<th width="135">所剩数量</th>
					<th width="135">商品图片</th>
					<th width="135">操作</th>
				</tr>
				
				<c:forEach items="${waresList}" var="ware">
					<tr>
							<td>${ware.wName}</td>
							<td>${ware.oneCatagoryName}</td>
							<td>${ware.twoCatagoryName}</td>
							<td>${ware.wPrice}</td>
							<td>${ware.wDescribe}</td>
							<td>${ware.wCount}</td>
							<td><img alt="" src="${basePath}/images/${ware.wImage}" width="110" height="70"></td>
						<td colspan="3">
							<button>
								<a href="${basePath}/managerController/flagUpdateWares?wId=${ware.wId}&oneCatagoryName=${ware.oneCatagoryName}">修改</a>
							</button>
							<button>
								<a href="${basePath}/managerController/deleteWares?wId=${ware.wId}">删除</a>
							</button>
						</td>
					</tr>
				</c:forEach>
			
				<tr>
					<td></td>
				</tr>
			</table>
				<button>
					<a href="${basePath}/managerController/flagAddWares">添加商品</a>
				</button>
			<a href="${basePath}/managerController/selectWaresByNameAndPage?curPage=1&waresName=${waresName}">首页</a>
			<a href="${basePath}/managerController/selectWaresByNameAndPage?curPage=${curPage-1}&waresName=${waresName}">上一页</a>
			<a href="${basePath}/managerController/selectWaresByNameAndPage?curPage=${curPage+1}&waresName=${waresName}">下一页</a>
			<a href="${basePath}/managerController/selectWaresByNameAndPage?curPage=${totalPage}&waresName=${waresName}">尾页</a>
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
