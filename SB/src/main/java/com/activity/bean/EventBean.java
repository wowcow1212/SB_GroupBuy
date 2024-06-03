package com.activity.bean;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Component
@Entity
@Table(name = "event")
public class EventBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "eventno")
	private Integer eventNo;
	
	@Column(name = "hostuserno")
	private Integer hostUserNo;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "activitytime")
	private LocalDateTime activityTime;

	@Column(name = "signupstarttime")
	private LocalDateTime signupStartTime;
	
	@Column(name = "signupendtime")
	private LocalDateTime signupEndTime;
	
	@Column(name = "location")
	private String location;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "imagepath")
	private String imagePath;
	
	public EventBean() {
	}
	
	

	public EventBean(Integer eventNo, Integer hostUserNo, String title, String description,
			LocalDateTime activityTime, LocalDateTime signupStartTime, LocalDateTime signupEndTime, String location,
			String status, String imagePath) {
		this.eventNo = eventNo;
		this.hostUserNo = hostUserNo;
		this.title = title;
		this.description = description;
		this.activityTime = activityTime;
		this.signupStartTime = signupStartTime;
		this.signupEndTime = signupEndTime;
		this.location = location;
		this.status = status;
		this.imagePath = imagePath;
	}
	
	

	public EventBean(Integer hostUserNo, String title, String description, LocalDateTime activityTime,
			LocalDateTime signupStartTime, LocalDateTime signupEndTime, String location, String status, String imagePath) {
		this.hostUserNo = hostUserNo;
		this.title = title;
		this.description = description;
		this.activityTime = activityTime;
		this.signupStartTime = signupStartTime;
		this.signupEndTime = signupEndTime;
		this.location = location;
		this.status = status;
		this.imagePath = imagePath;
	}



	public Integer getEventNo() {
		return eventNo;
	}



	public void setEventNo(Integer eventNo) {
		this.eventNo = eventNo;
	}



	public Integer getHostUserNo() {
		return hostUserNo;
	}



	public void setHostUserNo(Integer hostUserNo) {
		this.hostUserNo = hostUserNo;
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



	public LocalDateTime getActivityTime() {
		return activityTime;
	}



	public void setActivityTime(LocalDateTime activityTime) {
		this.activityTime = activityTime;
	}



	public LocalDateTime getSignupStartTime() {
		return signupStartTime;
	}



	public void setSignupStartTime(LocalDateTime signupStartTime) {
		this.signupStartTime = signupStartTime;
	}



	public LocalDateTime getSignupEndTime() {
		return signupEndTime;
	}



	public void setSignupEndTime(LocalDateTime signupEndTime) {
		this.signupEndTime = signupEndTime;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
	
	

//	@Override
//	public String toString() {
//		return "SpringEventBean [eventNo=" + eventNo + ", hostUserNo=" + hostUserNo + ", title=" + title
//				+ ", description=" + description + ", activityTime=" + activityTime + ", signupStartTime="
//				+ signupStartTime + ", signupEndTime=" + signupEndTime + ", location=" + location + ", status=" + status
//				+ "]";
//	}
	
	
	
}