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
<script type="text/javascript" src="${basePath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${basePath}/css/jquery-ui.css"></script>
<script type="text/javascript" src="${basePath}/js/wb.js"  charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$("#kinMaxShow").kinMaxShow();
	});
	$(function(){
		var dataArray=[];
		$.ajax({
			url:"${basePath}userController/searchNameLike",
			type:"post",
			dataType:"json",
			success:function(data) {
				var wares = data.wares;
				for(var i=0; i<wares.length; i++){
					var ware = wares[i];
					dataArray.push({id :ware.wId, label: ware.wName});
				}
				$(".subLeft").autocomplete({
		    		 source: dataArray,
		  		});
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
                   alert("ajax失败");
                   console.log(XMLHttpRequest.status);//200客户端请求已成功
                   console.log(XMLHttpRequest.readyState);//4响应内容解析完成，可以在客户端调用了
                   console.log(textStatus);//parsererror
    		}
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
   <span class="topRight">
    <a href="${basePath}/jspChange/vipJsp">我的17</a>&nbsp;| 
    <a href="${basePath}/jspChange/orderJsp">我的订单</a>&nbsp;| 
    <a href="${basePath}/jspChange/vipJsp">会员中心</a>&nbsp;|
    <a href="${basePath}/jspChange/contactJsp">联系我们</a>
   </span>
  </div><!--top/-->
  <div class="lsg">
   <h1 class="logo"><a href="${basePath}/jspChange/indexJsp"><img src="${basePath}/images/logo.png" width="217" height="90" /></a></h1>
   <form action="${basePath}/jspChange/productJsp" method="get" class="subBox">
    <div class="subBoxDiv">
     	<input type="text" name="waresName" class="subLeft" />
     	<input type="image" src="${basePath}/images/subimg.png" width="63" height="34" class="sub" />
     <div class="hotWord">
      热门搜索：
      <a href="${basePath}/jspChange/productJsp?oneName=饮品杯配套系列">饮品杯配套系列</a>&nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸餐盒系列">纸餐盒系列</a> &nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸袋/环保打包袋">纸袋/环保打包袋</a>&nbsp;
      <a href="${basePath}/jspChange/productJsp?oneName=纸杯系列">纸杯系列</a>  &nbsp;
     </div><!--hotWord/-->
    </div><!--subBoxDiv/-->
    </form>
  <!--subBox/-->
   <div class="gouwuche">
    <div class="gouCar">
     <img src="${basePath}/images/gouimg.png" width="19" height="20" style="position:relative;top:6px;" />&nbsp;|&nbsp;
     <strong class="red">
     <c:if test="${sessionScope.cartNum == null || sessionScope.cartNum == 0}">0</c:if>
     <c:if test="${sessionScope.cartNum != null}">${sessionScope.cartNum}</c:if>
     </strong>&nbsp;件&nbsp;|
     
     <a href="${basePath}/jspChange/orderJsp">去结算</a> <img src="${basePath}/images/youjian.jpg" width="5" height="8" />    
    </div><!--gouCar/-->
    <div class="myChunlv">
     <a href="${basePath}/jspChange/vipJsp"><img src="${basePath}/images/mychunlv.jpg" width="112" height="34" /></a>
    </div><!--myChunlv/-->
   </div><!--gouwuche/-->
  </div><!--lsg/-->
  <div class="pnt">
   
   <div class="pntLeft">
    <h2 class="Title">所有商品分类</h2>
    <!-- 展示一级分类 --> 
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
   </div><!--pntLeft/-->
   
   <!--  导航栏 -->
   <div class="pntRight">
    <ul class="nav">
     <li class="navCur"><a href="${basePath}/jspChange/indexJsp">商城首页</a></li>
     <li><a href="${basePath}/jspChange/productJsp">促销中心</a></li>
     <li><a href="${basePath}/jspChange/vipJsp">会员中心</a></li>
     <li><a href="${basePath}/jspChange/helpJsp">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：021-12345678</div>
    </ul><!--nav/--> 
    
    <!-- 首页图片轮播展示 -->
    <div class="banner">
     <div id="kinMaxShow">
      <div>
       <a href="#"><img src="${basePath}/images/ban1.jpg" height="360"  /></a>
      </div> 		
      <div>
       <a href="#"><img src="${basePath}/images/ban2.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="#"><img src="${basePath}/images/ban3.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="#"><img src="${basePath}/images/ban4.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="#"><img src="${basePath}/images/ban5.jpg" height="360"  /></a>
      </div>      
     </div><!--kinMaxShow/-->
    </div><!--banner/-->
    
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
 
  <div class="rdPro">
   <div class="rdLeft">
    <ul class="rdList">
     <li>推荐产品</li>
     <li>促销产品</li>
     <div class="clears"></div>
    </ul><!--rdList/-->
   
    <!-- 推荐商品 -->
    <div class="rdProBox">
	    <c:forEach items="${listWTJ}" var="wtj">
	     <dl>
	       <dt><a href="${basePath}/jspChange/proinfoJsp?wId=${wtj.wId}"><img src="${basePath}/images/${wtj.wImage}" width="132" height="129" /></a></dt>
	       <dd>${wtj.wName}&nbsp;&nbsp;${wtj.wDescribe}&nbsp;&nbsp;当前数量${wtj.wCount}</dd>
	       <dd class="cheng">￥${wtj.wPrice}/袋</dd>
	     </dl>
	    </c:forEach>
     <div class="clears"></div>
    </div><!--rdPro/-->
   
    <!-- 促销商品 -->
    <div class="rdProBox">
    <c:forEach items="${listWCX}" var="wtj">
	     <dl>
	       <dt><a href="${basePath}/jspChange/proinfoJsp?wId=${wtj.wId}"><img src="${basePath}/images/${wtj.wImage}" width="132" height="129" /></a></dt>
	       <dd>${wtj.wName}&nbsp;&nbsp;${wtj.wDescribe}&nbsp;&nbsp;当前数量${wtj.wCount}</dd>
	       <dd class="cheng">￥${wtj.wPrice}/袋</dd>
	     </dl>
	    </c:forEach>
     <div class="clears"></div>
    </div><!--rdPro/-->
   </div><!--rdLeft/-->
   
   <div class="rdRight">
    <img src="${basePath}/images/rdRight.jpg" width="221" height="254" />
   </div><!--rdRight/-->
   <div class="clears"></div>
  </div><!--rdPro/-->
  
  <!--  按一级分类显示商品，首页只是显示前三个一级分类，3个楼层-->
  <div class="hengfu">
   <img src="${basePath}/images/hengfu1.jpg" width="979" height="97" />
  </div><!--hengfu/-->
 
   <!-- 展示第一个一级分类的商品 -->
  <div class="floor" id="floor1">
   <h3 class="floorTitle">
   1F&nbsp;&nbsp;&nbsp;&nbsp;${catagoryMap.catagory[0].oneName}
    <a href="${basePath}/jspChange/productJsp?oneName=${catagoryMap.catagory[0].oneName}" class="more">更多 &gt;</a>
   </h3>
   <div class="floorBox">
    <div class="floorLeft">
    <ul class="flList">
    <!-- 循环输出第一个一级分类下的前5个二级分类名 -->
     <c:forEach items="${catagoryMap.catagory[0].twoName}" var="two" end="4">
      		<li><a href="${basePath}/jspChange/indexJsp?oneName=${catagoryMap.catagory[0].oneName}&twoName=${two}">${two}</a></li>
     </c:forEach>
      <li><a href="${basePath}/jspChange/productJsp">更多&gt;&gt;</a></li>
    
     <div class="clears"></div>
     </ul><!--flList/-->
     <div class="flImg"><img src="${basePath}/images/flListimg.jpg" width="198" height="290" /></div>
    </div><!--floorLeft/-->
    <!-- 输出该二级分类下的商品,第一次进入显示该楼层一级分类的商品 -->
    <div class="floorRight">
     <div class="frProList">
     <c:forEach items="${listByT}" var="lbt" end="7">
     <dl>
      <dt><a href="${basePath}/jspChange/proinfoJsp?wId=${lbt.wId}"><img src="${basePath}/images/${lbt.wImage}" width="132" height="129" /></a></dt>
	       <dd>${lbt.wName}&nbsp;&nbsp;${lbt.wDescribe}&nbsp;&nbsp;当前数量${lbt.wCount}</dd>
	       <dd class="cheng">￥${lbt.wPrice}/袋</dd>
     </dl>
     </c:forEach>
      <div class="clears"></div>
     </div><!--frProList-->
    
    </div><!--floorRight/-->
    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
 
  <!--  第二个一级分类下的商品 -->
  <div class="hengfu">
   <img src="${basePath}/images/hengfu2.jpg" width="978" height="97" />
  </div><!--hengfu/-->
  <div class="floor" id="floor3">
   <h3 class="floorTitle">
   2F&nbsp;&nbsp;&nbsp;&nbsp;${catagoryMap.catagory[1].oneName}
    <a href="${basePath}/jspChange/productJsp?oneName=${catagoryMap.catagory[1].oneName}" class="more">更多 &gt;</a>
   </h3>
   <div class="floorBox">
    <div class="floorLeft">
     <ul class="flList">
      <!-- 循环输出第一个一级分类下的前5个二级分类名 -->
     <c:forEach items="${catagoryMap.catagory[1].twoName}" var="two" end="4">
      		<li><a href="${basePath}/jspChange/indexJsp?oneName=${catagoryMap.catagory[1].oneName}&twoName=${two}">${two}</a></li>
     </c:forEach>
      <li><a href="${basePath}/jspChange/productJsp">更多&gt;&gt;</a></li>
      <div class="clears"></div>
     </ul><!--flList/-->
     <div class="flImg"><img src="${basePath}/images/flListimg.jpg" width="198" height="290" /></div>
    </div><!--floorLeft/-->
    <div class="floorRight">
     <div class="frProList">
      <c:forEach items="${listByT}" var="lbt" end="7">
     <dl>
      <dt><a href="${basePath}/jspChange/proinfoJsp?wId=${lbt.wId}"><img src="${basePath}/images/${lbt.wImage}" width="132" height="129" /></a></dt>
	       <dd>${lbt.wName}&nbsp;&nbsp;${lbt.wDescribe}&nbsp;&nbsp;当前数量${lbt.wCount}</dd>
	       <dd class="cheng">￥${lbt.wPrice}/袋</dd>
     </dl>
     </c:forEach>
      <div class="clears"></div>
     </div><!--frProList-->
    </div><!--floorRight/-->
    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
  
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
   <a href="${basePath}/jspChange/managerLoginJsp">管理员登录</a>&nbsp;|&nbsp;
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
