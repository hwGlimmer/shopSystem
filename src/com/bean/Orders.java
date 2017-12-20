package com.bean;

import java.util.List;

public class Orders {
	private Integer id;
	private String zhuangtai;
	private String time;
	private Integer userId;
	private Integer orderPrice;
	private String address;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Orders(Integer id, String zhuangtai, String time, Integer userId,
			Integer orderPrice, String address) {
		this.id = id;
		this.zhuangtai = zhuangtai;
		this.time = time;
		this.userId = userId;
		this.orderPrice = orderPrice;
		this.address = address;
	}
	public Orders() {
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", zhuangtai=" + zhuangtai + ", time="
				+ time + ", userId=" + userId + ", orderPrice=" + orderPrice
				+ ", address=" + address + "]\n";
	}
	
}
