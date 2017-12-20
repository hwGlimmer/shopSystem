package com.bean;

public class ShopAddress {
	private int id;
	private String recipients;
	private String tel;
	private String address;
	private int userId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRecipients() {
		return recipients;
	}
	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public ShopAddress(int id, String recipients, String tel, String address,
			int userId) {
		super();
		this.id = id;
		this.recipients = recipients;
		this.tel = tel;
		this.address = address;
		this.userId = userId;
	}
	public ShopAddress() {
		super();
	}
	@Override
	public String toString() {
		return "shopAddress [id=" + id + ", recipients=" + recipients
				+ ", tel=" + tel + ", address=" + address + ", userId="
				+ userId + "]\n";
	}
}
