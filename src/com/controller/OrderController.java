package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.ListCart;
import com.bean.Orders;
import com.bean.OrdersItems;
import com.bean.ShopAddress;
import com.bean.User;
import com.bean.Wares;
import com.service.OrdersService;
import com.service.UserService;
import com.service.WaresService;


@RequestMapping("/orderController")
@Controller
public class OrderController {
	@Autowired
	private WaresService waresService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private UserService userService;
	
	Map<Integer, Object> waresCart = new HashMap<Integer, Object>();
	//购物车添加商品
	@RequestMapping("/addWaresCart")
	public String addWaresCart(Integer wId,Model model,HttpServletRequest request){
		Wares wares = waresService.selectWaresById(wId);
		List<Wares> waresList = new ArrayList<Wares>();
		waresCart.put(wId, wares);
		for(Integer key : waresCart.keySet()) {
	        waresList.add((Wares) waresCart.get(key));
	    }
		int cartNum = waresCart.size();
		request.getSession().setAttribute("cartNum", cartNum);
		request.getSession().setAttribute("waresCart", waresList);
		return "order";
	}
	//购物车删除商品
	@RequestMapping("/deleteWaresCart")
	public String deleteWaresCart(Integer wId,HttpServletRequest request,Model model){
		waresCart.remove(wId);
		List<Wares> waresList = new ArrayList<Wares>();
		for(Integer key : waresCart.keySet()) {
	        waresList.add((Wares) waresCart.get(key));
	    }
		int cartNum = waresCart.size();
		request.getSession().setAttribute("cartNum", cartNum);
		request.getSession().setAttribute("waresCart", waresList);
		return "order";
	}
	//生成订单
	@RequestMapping("/addOrderItems")
	public String addOrderItems(ListCart listCart,HttpServletRequest request,Model model){
		Orders orders = new Orders();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		String time = date.format(new Date());
		User user = (User) request.getSession().getAttribute("user");
		Integer userId = user.getId();
		orders.setTime(time);
		orders.setUserId(userId);
		orders.setZhuangtai("未支付");
		ordersService.addOrders(orders);
		Integer ordersId = orders.getId();
		Integer ordersPrice = 0;
		
		List<OrdersItems> orderItemsList = new ArrayList<OrdersItems>();
		OrdersItems orderItems = new OrdersItems();
		for (int i=0;i<listCart.getwId().size();i++){
			orderItems.setOrderId(ordersId);
			orderItems.setWaresId(listCart.getwId().get(i));
			orderItems.setWaresNum(listCart.getWaresNum().get(i));
			orderItems.setWaresPrice(listCart.getWaresPrice().get(i));
			ordersService.addOrdersItems(orderItems);
			ordersPrice = ordersPrice + (listCart.getWaresNum().get(i)*listCart.getWaresPrice().get(i));
			orderItemsList.add(orderItems);
		}
		orders.setOrderPrice(ordersPrice);
		ordersService.updateOrders(orders);
		List<ShopAddress> addressList = userService.selectAddressByUserId(userId);
		
		model.addAttribute("addressList", addressList);
		model.addAttribute("ordersPrice", ordersPrice);
		model.addAttribute("ordersId", ordersId);
		return "order2";
	}
	//支付成功
	@RequestMapping("/zhifu")
	public String zhifu(Integer ordersId,String address){
		Orders orders = new Orders();
		orders.setId(ordersId);
		orders.setZhuangtai("已支付");
		orders.setAddress(address);
		ordersService.updateOrders(orders);
		return "success";
	}
	//删除订单以及订单详情
	@RequestMapping("/deleteOrders")
	public String deleteOrders(Integer ordersId){
		Orders orders = new Orders();
		orders.setId(ordersId);
		OrdersItems ordersItems = new OrdersItems();
		ordersItems.setOrderId(ordersId);
		ordersService.deleteOrders(orders);
		ordersService.deleteOrdersItems(ordersItems);
		return "redirect:/jspChange/vipOrderJsp";
	}
	
}
