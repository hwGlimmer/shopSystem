package com.bean;

public class OneCatagory {
	private int oneCatagoryId;
	private String oneCatagoryName;
	public int getOneCatagoryId() {
		return oneCatagoryId;
	}
	public void setOneCatagoryId(int oneCatagoryId) {
		this.oneCatagoryId = oneCatagoryId;
	}
	public String getOneCatagoryName() {
		return oneCatagoryName;
	}
	public void setOneCatagoryName(String oneCatagoryName) {
		this.oneCatagoryName = oneCatagoryName;
	}
	public OneCatagory(int oneCatagoryId, String oneCatagoryName) {
		super();
		this.oneCatagoryId = oneCatagoryId;
		this.oneCatagoryName = oneCatagoryName;
	}
	public OneCatagory() {
		super();
	}
	@Override
	public String toString() {
		return "OneCatagory [oneCatagoryId=" + oneCatagoryId
				+ ", oneCatagoryName=" + oneCatagoryName + "]\n";
	}
	
}
