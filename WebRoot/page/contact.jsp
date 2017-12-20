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
				<a href="${basePath}/jspChange/vipJsp">会员中心</a>&nbsp;| <a href="${basePath}/jspChange/contactJsp">联系我们</a>
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
     <c:if test="${sessionScope.cartNum != null}">${sessionScope.cartNum}</c:if></strong>&nbsp;件&nbsp;|<a href="order.html">去结算</a> <img
						src="${basePath}/images/youjian.jpg" width="5" height="8" />
				</div>
				<!--gouCar/-->
				<div class="myChunlv">
					<a href="vip.html"><img src="${basePath}/images/mychunlv.jpg"
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
			当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="${basePath}/jspChange/helpJsp" class="posCur">帮助中心</a>
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
						<a href="${basePath}/jspChange/contactJsp" class="helpCur">联系方式</a>
					</dd>
					<dd>
						<a href="${basePath}/jspChange/aboutJsp">企业简介</a>
					</dd>
				</dl>
				<!--helpNav/-->
			</div>
			<!--contLeft/-->
			<div class="contRight">
				<h4 class="gouLiu">联系我们</h4>
				<div class="contactBox">
					<ul class="contactLeft">
						<li><strong>上海17纸制品有限公司 </strong></li>
						<li>地址：上海市浦东新区民生路1403号1012室</li>
						<li>邮箱：sales@chunlv.com</li>
						<li>网址：http://test.webqin.net/chunlv</li>
						<li>电话：+86 21 3392 6945 / +86 21 3392 6947</li>
					</ul>
					<!--contactLeft/-->
					<!--引用百度地图API-->
					<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
}

.iw_poi_title {
	color: #CC5522;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	padding-right: 13px;
	white-space: nowrap
}

.iw_poi_content {
	font: 12px arial, sans-serif;
	overflow: visible;
	padding-top: 4px;
	white-space: -moz-pre-wrap;
	word-wrap: break-word
}
</style>
					<script type="text/javascript"
						src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
					<!--百度地图容器-->
					<div style="width:501px;height:361px;border:#ccc solid 1px;"
						id="dituContent"></div>
					<script type="text/javascript">
						//创建和初始化地图函数：
						function initMap() {
							createMap();//创建地图
							setMapEvent();//设置地图事件
							addMapControl();//向地图添加控件
							addMarker();//向地图中添加marker
						}

						//创建地图函数：
						function createMap() {
							var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
							var point = new BMap.Point(121.416056, 31.251181);//定义一个中心点坐标
							map.centerAndZoom(point, 17);//设定地图的中心点和坐标并将地图显示在地图容器中
							window.map = map;//将map变量存储在全局
						}

						//地图事件设置函数：
						function setMapEvent() {
							map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
							map.enableScrollWheelZoom();//启用地图滚轮放大缩小
							map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
							map.enableKeyboard();//启用键盘上下左右键移动地图
						}

						//地图控件添加函数：
						function addMapControl() {
							//向地图中添加缩放控件
							var ctrl_nav = new BMap.NavigationControl({
								anchor : BMAP_ANCHOR_TOP_LEFT,
								type : BMAP_NAVIGATION_CONTROL_LARGE
							});
							map.addControl(ctrl_nav);
							//向地图中添加缩略图控件
							var ctrl_ove = new BMap.OverviewMapControl({
								anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
								isOpen : 1
							});
							map.addControl(ctrl_ove);
							//向地图中添加比例尺控件
							var ctrl_sca = new BMap.ScaleControl({
								anchor : BMAP_ANCHOR_BOTTOM_LEFT
							});
							map.addControl(ctrl_sca);
						}

						//标注点数组
						var markerArr = [ {
							title : "上海市秦王网络科技有限公司",
							content : "地址：上海市普陀区曹杨路1040弄一号楼中友大厦19楼<br/>电话：181-1726-8273<br/>传真：021-62098853&nbsp;<br/>客服电话：021-62098853<br/>销售邮箱：sales@webqin.net<br/>客服邮箱：kefu@webqin.net&nbsp;<br/>公司网址：http://www.webqin.net",
							point : "121.415831|31.251281",
							isOpen : 0,
							icon : {
								w : 21,
								h : 21,
								l : 0,
								t : 0,
								x : 6,
								lb : 5
							}
						} ];
						//创建marker
						function addMarker() {
							for (var i = 0; i < markerArr.length; i++) {
								var json = markerArr[i];
								var p0 = json.point.split("|")[0];
								var p1 = json.point.split("|")[1];
								var point = new BMap.Point(p0, p1);
								var iconImg = createIcon(json.icon);
								var marker = new BMap.Marker(point, {
									icon : iconImg
								});
								var iw = createInfoWindow(i);
								var label = new BMap.Label(json.title, {
									"offset" : new BMap.Size(json.icon.lb
											- json.icon.x + 10, -20)
								});
								marker.setLabel(label);
								map.addOverlay(marker);
								label.setStyle({
									borderColor : "#808080",
									color : "#333",
									cursor : "pointer"
								});

								(function() {
									var index = i;
									var _iw = createInfoWindow(i);
									var _marker = marker;
									_marker.addEventListener("click",
											function() {
												this.openInfoWindow(_iw);
											});
									_iw.addEventListener("open", function() {
										_marker.getLabel().hide();
									})
									_iw.addEventListener("close", function() {
										_marker.getLabel().show();
									})
									label.addEventListener("click", function() {
										_marker.openInfoWindow(_iw);
									})
									if (!!json.isOpen) {
										label.hide();
										_marker.openInfoWindow(_iw);
									}
								})()
							}
						}
						//创建InfoWindow
						function createInfoWindow(i) {
							var json = markerArr[i];
							var iw = new BMap.InfoWindow(
									"<b class='iw_poi_title' title='" + json.title + "'>"
											+ json.title
											+ "</b><div class='iw_poi_content'>"
											+ json.content + "</div>");
							return iw;
						}
						//创建一个Icon
						function createIcon(json) {
							var icon = new BMap.Icon(
									"http://app.baidu.com/map/images/us_mk_icon.png",
									new BMap.Size(json.w, json.h), {
										imageOffset : new BMap.Size(-json.l,
												-json.t),
										infoWindowOffset : new BMap.Size(
												json.lb + 5, 1),
										offset : new BMap.Size(json.x, json.h)
									})
							return icon;
						}

						initMap();//创建和初始化地图
					</script>
				</div>
				<!--contactBox/-->
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
