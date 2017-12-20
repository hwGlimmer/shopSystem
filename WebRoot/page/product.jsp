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
<script type="text/javascript" src="${basePath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${basePath}/css/jquery-ui.css"></script>
<script src="${basePath}/js/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
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
   </form><!--subBox/-->
   <div class="gouwuche">
    <div class="gouCar">
     <img src="${basePath}/images/gouimg.png" width="19" height="20" style="position:relative;top:6px;" />&nbsp;|&nbsp;
     <strong class="red">     <c:if test="${sessionScope.cartNum == null || sessionScope.cartNum == 0}">0</c:if>
     <c:if test="${sessionScope.cartNum != null}">${sessionScope.cartNum}</c:if></strong>&nbsp;件&nbsp;|
     <a href="${basePath}/jspChange/orderJsp">去结算</a> <img src="${basePath}/images/youjian.jpg" width="5" height="8" />    
    </div><!--gouCar/-->
    <div class="myChunlv">
     <a href="${basePath}/jspChange/vipJsp"><img src="${basePath}/images/mychunlv.jpg" width="112" height="34" /></a>
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
     <li><a href="${basePath}/jspChange/indexJsp">商城首页</a></li>
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
   当前位置：<a href="${basePath}/jspChange/indexJsp">首页</a> &gt; <a href="${basePath}/jspChange/productJsp" class="posCur">促销商品</a>
  </div><!--positions/-->
  <div class="cont">
  <div class="jilu">
    总计 <span>${jilu}</span> 个记录
   </div><!--jilu/-->
   <div class="contLeft">
    <ul class="leftPorNav">
     <c:forEach items="${catagoryMap.catagory}" var="one">
		<li><a href="${basePath}/jspChange/productJsp?oneName=${one.oneName}">${one.oneName}</a> <!-- 展示一级分类 -->
			<div class="chilInPorNav">
				<c:forEach items="${one.twoName}" var="two">
					<a href="${basePath}/jspChange/productJsp?twoName=${two}">${two}</a>
				</c:forEach>
			</div>
			</li>
	  </c:forEach>
    </ul><!--InPorNav/-->
   </div><!--contLeft/-->
   <div class="contRight">
    <div class="frProList">
     <c:forEach items="${listWAll}" var="wal">
	     <dl>
	       <dt><a href="${basePath}/jspChange/proinfoJsp?wId=${wal.wId}"><img src="${basePath}/images/${wal.wImage}" width="132" height="129" /></a></dt>
	       <dd>${wal.wName}&nbsp;&nbsp;${wal.wDescribe}&nbsp;&nbsp;</dd>
	       <dd class="cheng">￥${wal.wPrice}/袋</dd>
	     </dl>
	    </c:forEach>
      <div class="clears"></div>
     </div><!--frProList-->
     <!--分页开始 -->
     <table align="right">
       <tr>
	     <td><a style="color:blue;font-weight:bold;" 
	     href="${basePath}/jspChange/productJsp?curPage=1
	     &oneName=${oneName}&twoName=${twoName}&waresName=${waresName}">首页</a>&nbsp;</td>
		 
		 <td><a style="color:blue;font-weight:bold;" 
		 href="${basePath}/jspChange/productJsp?&curPage=${curPage - 1}
		 &oneName=${oneName}&twoName=${twoName}&waresName=${waresName}">上一页</a>&nbsp;</td>
		
		 <td><a style="color:blue;font-weight:bold;" 
		 href="${basePath}/jspChange/productJsp?curPage=${curPage + 1}
		 &oneName=${oneName}&twoName=${twoName}&waresName=${waresName}">下一页</a>&nbsp;</td>
		
		 <td><a style="color:blue;font-weight:bold;" 
		 href="${basePath}/jspChange/productJsp?curPage=${totalPage}
		 &oneName=${oneName}&twoName=${twoName}&waresName=${waresName}">尾页</a></td>
         
         <td style="color:blue;font-weight:bold;"> &nbsp; &nbsp;共${curPage}/${totalPage}页 &nbsp;&nbsp;</td>
       </tr> 
     </table>
     <!--分页结束 -->
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
