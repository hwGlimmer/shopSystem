package com.bean;

public class OrdersItems {
	private Integer id;
	private Integer waresId;
	private Integer waresNum;
	private Integer waresPrice;
	private Integer orderId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getWaresId() {
		return waresId;
	}
	public void setWaresId(Integer waresId) {
		this.waresId = waresId;
	}
	public Integer getWaresNum() {
		return waresNum;
	}
	public void setWaresNum(Integer waresNum) {
		this.waresNum = waresNum;
	}
	public Integer getWaresPrice() {
		return waresPrice;
	}
	public void setWaresPrice(Integer waresPrice) {
		this.waresPrice = waresPrice;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public OrdersItems(Integer id, Integer waresId, Integer waresNum,
			Integer waresPrice, Integer orderId) {
		super();
		this.id = id;
		this.waresId = waresId;
		this.waresNum = waresNum;
		this.waresPrice = waresPrice;
		this.orderId = orderId;
	}
	public OrdersItems() {
		super();
	}
	@Override
	public String toString() {
		return "OrdersItems [id=" + id + ", waresId=" + waresId + ", waresNum="
				+ waresNum + ", waresPrice=" + waresPrice + ", orderId="
				+ orderId + "]\n";
	}
}
