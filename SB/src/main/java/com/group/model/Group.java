package com.group.model;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.user.bean.UserBean;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="groupevent")
@Component
public class Group {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "eventno")
	private Integer eventNo;
	
	@JoinColumn(name = "hostuserno")
	@ManyToOne
	private UserBean user;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "starttime")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date startTime;
	
	@Column(name = "endtime")
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
	private Date endTime;
	
	@Column(name = "mintotalamount")
	private Integer minTotalAmount;
	
	@Column(name = "mintotalquantity")
	private Integer minTotalQuantity;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "paymentmethod")
	private Integer paymentMethod;
	
	@Column(name = "account")
	private String account;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "point")
	private Integer point;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "group", cascade = CascadeType.ALL)
	@JsonManagedReference
	private List<Item> items ;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "group", cascade = CascadeType.ALL)
	private List<Order> orders;

	
	public Integer getEventNo() {
		return eventNo;
	}

	public void setEventNo(Integer eventNo) {
		this.eventNo = eventNo;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getMinTotalAmount() {
		return minTotalAmount;
	}

	public void setMinTotalAmount(Integer minTotalAmount) {
		this.minTotalAmount = minTotalAmount;
	}

	public Integer getMinTotalQuantity() {
		return minTotalQuantity;
	}

	public void setMinTotalQuantity(Integer minTotalQuantity) {
		this.minTotalQuantity = minTotalQuantity;
	}

	public Integer getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public UserBean getUser() {
		return user;
	}

	public void setUser(UserBean user) {
		this.user = user;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

}
