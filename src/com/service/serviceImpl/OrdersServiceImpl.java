package com.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Orders;
import com.bean.OrdersItems;
import com.mapper.OrdersMapper;
import com.service.OrdersService;


@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrdersMapper ordersMapper;
	
	//添加订单
	@Override
	public void addOrders(Orders orders) {
		ordersMapper.addOrders(orders);
	}
	//修改订单
	@Override
	public void updateOrders(Orders orders) {
		ordersMapper.updateOrders(orders);
	}
	//添加订单详情
	@Override
	public void addOrdersItems(OrdersItems ordersItems) {
		ordersMapper.addOrdersItems(ordersItems);
	}
	//修改订单详情
	@Override
	public void updateOrdersItems(OrdersItems ordersItems) {
		ordersMapper.updateOrdersItems(ordersItems);
	}
	//查找订单
	@Override
	public List<Orders> selectOrdersByPage(Map<String, Object> map) {
		List<Orders> ordersList = ordersMapper.selectOrdersByPage(map);
		return ordersList;
	}
	//查找订单条数
	@Override
	public Integer selectOrdersCount(Orders orders) {
		Integer count = ordersMapper.selectOrdersCount(orders);
		return count;
	}
	//删除订单
	@Override
	public void deleteOrders(Orders orders) {
		ordersMapper.deleteOrders(orders);
	}
	//删除订单详情
	@Override
	public void deleteOrdersItems(OrdersItems ordersItems) {
		ordersMapper.deleteOrdersItems(ordersItems);
	}
	
}
