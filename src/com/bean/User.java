package com.bean;

public class User {
	private int id;
	private String userName;
	private String userPwd;
	private String trueName;
	private String tel;
	private String idNumber;
	private String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User(int id, String userName, String userPwd, String trueName,
			String tel, String idNumber, String address) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPwd = userPwd;
		this.trueName = trueName;
		this.tel = tel;
		this.idNumber = idNumber;
		this.address = address;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", userPwd="
				+ userPwd + ", trueName=" + trueName + ", tel=" + tel
				+ ", idNumber=" + idNumber + ", address=" + address + "]\n";
	}
}
