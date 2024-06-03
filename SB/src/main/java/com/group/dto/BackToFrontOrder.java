package com.group.dto;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BackToFrontOrder {

	private Integer userNo;
	private Integer orderNo;
	private String userName;
	private Integer payment;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date setTime;
	private List<OrderDetailsDto> orderDetailsDto;
	
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
	public Integer getPayment() {
		return payment;
	}
	public void setPayment(Integer payment) {
		this.payment = payment;
	}
	public Date getSetTime() {
		return setTime;
	}
	public void setSetTime(Date setTime) {
		this.setTime = setTime;
	}
	public List<OrderDetailsDto> getOrderDetailsDto() {
		return orderDetailsDto;
	}
	public void setOrderDetailsDto(List<OrderDetailsDto> orderDetailsDto) {
		this.orderDetailsDto = orderDetailsDto;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
}
