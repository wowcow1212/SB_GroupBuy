package com.group.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class GroupDto {

	private String gTitle;
	private String gDescription;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date gEndTime;
	private String[] payment;
	private String gMinTotalAmount;
	private String gMinTotalQuantity;
	private String address;
	private String account;
	private String userName;
	private Integer userNo;
	private Integer eventNo;
	private Integer paymentMethod;
	private Integer totalPrice;
	private Integer totalAmount;
	private List<OrderDto> groupOrders;
	private String bank;
	private String city;
	private String area;
	
	public String getgTitle() {
		return gTitle;
	}
	public void setgTitle(String gTitle) {
		this.gTitle = gTitle;
	}
	public String getgDescription() {
		return gDescription;
	}
	public void setgDescription(String gDescription) {
		this.gDescription = gDescription;
	}
	public Date getgEndTime() {
		return gEndTime;
	}
	public void setgEndTime(Date gEndTime) {
		this.gEndTime = gEndTime;
	}
	public String[] getPayment() {
		return payment;
	}
	public void setPayment(String[] payment) {
		this.payment = payment;
	}
	
	public String getgMinTotalAmount() {
		return gMinTotalAmount;
	}
	public void setgMinTotalAmount(String gMinTotalAmount) {
		this.gMinTotalAmount = gMinTotalAmount;
	}
	public String getgMinTotalQuantity() {
		return gMinTotalQuantity;
	}
	public void setgMinTotalQuantity(String gMinTotalQuantity) {
		this.gMinTotalQuantity = gMinTotalQuantity;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public Integer getEventNo() {
		return eventNo;
	}
	public void setEventNo(Integer eventNo) {
		this.eventNo = eventNo;
	}
	public Integer getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public List<OrderDto> getGroupOrders() {
		return groupOrders;
	}
	public void setGroupOrders(List<OrderDto> groupOrders) {
		this.groupOrders = groupOrders;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	
	
	
}
