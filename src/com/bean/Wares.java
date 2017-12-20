package com.bean;

public class Wares {
    private Integer wId;
    private String wName;
    private String oneCatagoryName;
    private String twoCatagoryName;
    private Integer wPrice;
    private String wDescribe;
    private Integer wCount;
    private String wImage;

	public Integer getwId() {
		return wId;
	}
	public void setwId(Integer wId) {
		this.wId = wId;
	}
	public String getwName() {
		return wName;
	}
	public void setwName(String wName) {
		this.wName = wName;
	}
	public String getOneCatagoryName() {
		return oneCatagoryName;
	}
	public void setOneCatagoryName(String oneCatagoryName) {
		this.oneCatagoryName = oneCatagoryName;
	}
	public String getTwoCatagoryName() {
		return twoCatagoryName;
	}
	public void setTwoCatagoryName(String twoCatagoryName) {
		this.twoCatagoryName = twoCatagoryName;
	}
	public Integer getwPrice() {
		return wPrice;
	}
	public void setwPrice(Integer wPrice) {
		this.wPrice = wPrice;
	}
	public String getwDescribe() {
		return wDescribe;
	}
	public void setwDescribe(String wDescribe) {
		this.wDescribe = wDescribe;
	}
	public Integer getwCount() {
		return wCount;
	}
	public void setwCount(Integer wCount) {
		this.wCount = wCount;
	}
	public String getwImage() {
		return wImage;
	}
	public void setwImage(String wImage) {
		this.wImage = wImage;
	}
	public Wares(Integer wId, String wName, String oneCatagoryName,
			String twoCatagoryName, Integer wPrice, String wDescribe,
			Integer wCount, String wImage) {
		super();
		this.wId = wId;
		this.wName = wName;
		this.oneCatagoryName = oneCatagoryName;
		this.twoCatagoryName = twoCatagoryName;
		this.wPrice = wPrice;
		this.wDescribe = wDescribe;
		this.wCount = wCount;
		this.wImage = wImage;
	}
	public Wares() {
		super();
	}
	@Override
	public String toString() {
		return "Wares [wId=" + wId + ", wName=" + wName + ", oneCatagoryName="
				+ oneCatagoryName + ", twoCatagoryName=" + twoCatagoryName
				+ ", wPrice=" + wPrice + ", wDescribe=" + wDescribe
				+ ", wCount=" + wCount + ", wImage=" + wImage +"]\n";
	}

   
}