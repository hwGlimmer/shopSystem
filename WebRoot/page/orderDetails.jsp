<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
<script type="text/javascript">
 $(function(){
	 $(".vipNav dd:eq(2)").show();
	 })
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
   <span class="topRight">
    <a href="${basePath}/jspChange/vipJsp">我的17</a>&nbsp;| 
    <a href="${basePath}/jspChange/orderJsp">我的订单</a>&nbsp;| 
    <a href="${basePath}/jspChange/vipJsp">会员中心</a>&nbsp;|
    <a href="${basePath}/jspChange/contactJsp">联系我们</a>
   </span>
  </div><!--top/-->
  <div class="lsg">
   <h1 class="logo"><a href="${basePath}/jspChange/indexJsp"><img src="images/logo.png" width="217" height="90" /></a></h1>
   <form action="#" method="get" class="subBox">
    <div class="subBoxDiv">
     <input type="text" class="subLeft" />
     <input type="image" src="images/subimg.png" width="63" height="34" class="sub" />
     <div class="hotWord">
           热门搜索：
      <a href="${basePath}/jspChange/productJsp?oneName=饮品杯配套系列">饮品杯配套系列</a>&nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸餐盒系列">纸餐盒系列</a> &nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸袋/环保打包袋">纸袋/环保打包袋</a>&nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸杯系列">纸杯系列</a>  &nbsp;
     </div><!--hotWord/-->
    </div><!--subBoxDiv/-->
   </form><!--subBox/-->
   <div class="gouwuche">
    <div class="gouCar">
     <img src="images/gouimg.png" width="19" height="20" style="position:relative;top:6px;" />&nbsp;|&nbsp;
     <strong class="red">     <c:if test="${sessionScope.cartNum == null || sessionScope.cartNum == 0}">0</c:if>
     <c:if test="${sessionScope.cartNum != null}">${sessionScope.cartNum}</c:if></strong>&nbsp;件&nbsp;|
     <a href="${basePath}/jspChange/orderJsp">去结算</a> <img src="images/youjian.jpg" width="5" height="8" />    
    </div><!--gouCar/-->
    <div class="myChunlv">
     <a href="${basePath}/jspChange/vipJsp"><img src="images/mychunlv.jpg" width="112" height="34" /></a>
    </div><!--myChunlv/-->
   </div><!--gouwuche/-->
  </div><!--lsg/-->
  <div class="pnt">
   <div class="pntLeft">
    <h2 class="Title">所有商品分类
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
    </ul><!--InPorNav/-->
    </h2>
   </div><!--pntLeft/-->
   <div class="pntRight">
       <ul class="nav">
     <li class="navCur"><a href="${basePath}/jspChange/indexJsp">商城首页</a></li>
     <li><a href="${basePath}/jspChange/productJsp">促销中心</a></li>
     <li><a href="${basePath}/jspChange/vipJsp">会员中心</a></li>
     <li><a href="${basePath}/jspChange/helpJsp">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/--> 
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  <div class="positions">
   当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="${basePath}/jspChange/vipJsp">会员中心</a>
    &gt; <a href="${basePath}/jspChange/orderJsp" class="posCur">我的订单</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="contLeft" id="contLeft">
    <h3 class="leftTitle">会员中心</h3>
    <dl class="helpNav vipNav">
     <dt>我的主页</dt>
      <dd>
       <a href="${basePath}/jspChange/vipJsp">个人中心</a>
       <a href="${basePath}/jspChange/vipOrderJsp">我的订单</a>
      </dd>
     <dt>账户设置</dt>
      <dd>
       <a href="${basePath}/jspChange/vipPwdJsp">密码修改</a>
       <a href="${basePath}/jspChange/vipAdressJsp">收货地址</a>
      </dd>
      <dt>客户服务</dt>
       <dd>
        <a href="${basePath}/jspChange/vipExitJsp">网站使用条款</a>
        <a href="${basePath}/jspChange/vipTuihuoJsp">网站免责声明</a>
       </dd>
    </dl><!--helpNav/-->
   </div><!--contLeft/-->
   <div class="contRight">
   <h2 class="oredrName">
    订单详情
   </h2>
   <table class="orderDeatils">
    <tr>
     <th>订单编号</th>
     <td>465489132154416</td>
    </tr>
    <tr>
     <th>商品名称</th>
     <td>妙捷 一次性纸杯</td>
    </tr>
    <tr>
     <th>订单价钱</th>
     <td>￥185.80</td>
    </tr>
    <tr>
     <th>订单信息</th>
     <td> 
张益达，13572607270，， 陕西省 汉中市 勉县 勉县东方眼科医院，724200</td>
    </tr>
    <tr>
     <th>支付状态</th>
     <td>成功</td>
    </tr>
   </table> 
   </div><!--contRight/-->
   <div class="clears"></div>
  </div><!--cont/-->
  <div class="inHelp">
   <div class="inHLeft">
    <h4>帮助中心</h4>
    <ul class="inHeList">
     <li><a href="${basePath}/jspChange/helpJsp">购物指南</a></li>
     <li><a href="${basePath}/jspChange/helpJsp">支付方式</a></li>
     <li><a href="${basePath}/jspChange/helpJsp">售后服务</a></li>
     <li><a href="${basePath}/jspChange/aboutJsp">企业简介</a></li>
     <div class="clears"></div>
    </ul><!--inHeList/-->
   </div><!--inHLeft/-->
   <div class="inHLeft">
    <h4>会员服务</h4>
    <ul class="inHeList">
     <li><a href="${basePath}/jspChange/regJsp">会员注册</a></li>
     <li><a href="${basePath}/jspChange/loginJsp">会员登录</a></li>
     <li><a href="${basePath}/jspChange/orderJsp">购物车</a></li>
     <li><a href="${basePath}/jspChange/orderJsp">我的订单</a></li>
     <div class="clears"></div>
    </ul><!--inHeList/-->
   </div><!--inHLeft/-->
   <div class="inHRight">
    <h4>全国统一免费服务热线</h4>
    <div class="telBox">400-0000-0000</div>
    <div class="weibo">
    <wb:follow-button uid="2991975565" type="red_1" width="67" height="24" ></wb:follow-button>
    </div>
   </div><!--inHRight/-->
   <div class="clears"></div>
  </div><!--inHelp/-->
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
    版权所有：上海17实业有限公司 版权所有  Copyright 2010-2015   沪ICP备00000000号   <a href="http://www.mycodes.net/" target="_blank">源码之家</a>   
   </p>
  </div><!--footer/-->
 </div><!--mianCont/-->
 <a href="#" class="backTop">&nbsp;</a>
</body>
</html>
