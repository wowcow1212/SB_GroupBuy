package com.group.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDto {

	private Integer userNo;
	private String userName;
	private Integer eventNo;
	private String eventTitle;
	private String eventStatus;
	private Integer paymentMethod;
	private List<OrderDetailsDto> orderDetail;
	private Date setTime;
	
	public String getEventStatus() {
		return eventStatus;
	}
	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
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
	public List<OrderDetailsDto> getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(List<OrderDetailsDto> orderDetail) {
		this.orderDetail = orderDetail;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public Date getSetTime() {
		return setTime;
	}
	public void setSetTime(Date setTime) {
		this.setTime = setTime;
	}


	

	
}
