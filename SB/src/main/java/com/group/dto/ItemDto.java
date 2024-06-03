package com.group.dto;

import java.util.List;

public class ItemDto {

	private String itemName;
	private String itemDesc;
	private Integer itemPrice;
	private String itemImgPath;
	private List<String> itemSpec;
	
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public Integer getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemImgPath() {
		return itemImgPath;
	}
	public void setItemImgPath(String itemImgPath) {
		this.itemImgPath = itemImgPath;
	}
	public List<String> getItemSpec() {
		return itemSpec;
	}
	public void setItemSpec(List<String> itemSpec) {
		this.itemSpec = itemSpec;
	}
	
	
}
