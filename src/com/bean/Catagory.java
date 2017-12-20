package com.bean;

import java.util.List;

public class Catagory {
	private int id;
	private String oneName;
	private List<String> twoName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOneName() {
		return oneName;
	}
	public void setOneName(String oneName) {
		this.oneName = oneName;
	}
	public List<String> getTwoName() {
		return twoName;
	}
	public void setTwoName(List<String> twoName) {
		this.twoName = twoName;
	}
	public Catagory(int id, String oneName, List<String> twoName) {
		super();
		this.id = id;
		this.oneName = oneName;
		this.twoName = twoName;
	}
	public Catagory() {
		super();
	}
	@Override
	public String toString() {
		return "Catagory [id=" + id + ", oneName=" + oneName + ", twoName="
				+ twoName + "]\n";
	}
	
}
