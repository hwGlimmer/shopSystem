package com.bean;

import java.util.List;

public class ListCart {
	private List<Integer> wId;
	private List<Integer> waresNum;
	private List<Integer> waresPrice;
	public List<Integer> getwId() {
		return wId;
	}
	public void setwId(List<Integer> wId) {
		this.wId = wId;
	}
	public List<Integer> getWaresNum() {
		return waresNum;
	}
	public void setWaresNum(List<Integer> waresNum) {
		this.waresNum = waresNum;
	}
	public List<Integer> getWaresPrice() {
		return waresPrice;
	}
	public void setWaresPrice(List<Integer> waresPrice) {
		this.waresPrice = waresPrice;
	}
	public ListCart(List<Integer> wId, List<Integer> waresNum,
			List<Integer> waresPrice) {
		super();
		this.wId = wId;
		this.waresNum = waresNum;
		this.waresPrice = waresPrice;
	}
	public ListCart() {
		super();
	}
	@Override
	public String toString() {
		return "ListCart [wId=" + wId + ", waresNum=" + waresNum
				+ ", waresPrice=" + waresPrice + "]\n";
	}
}
