package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Orders;
import com.bean.OrdersItems;

public interface OrdersService {
	//添加订单
	public void addOrders(Orders orders);
	//修改订单
	public void updateOrders(Orders orders);
	//添加订单详情
	public void addOrdersItems(OrdersItems ordersItems);
	//修改订单详情
	public void updateOrdersItems(OrdersItems ordersItems);
	//分页查找订单
	public List<Orders> selectOrdersByPage(Map<String, Object> map);
	//查找订单条数
	public Integer selectOrdersCount(Orders orders);
	//删除订单
	public void deleteOrders(Orders orders);
	//删除订单详情
	public void deleteOrdersItems(OrdersItems ordersItems);
}
