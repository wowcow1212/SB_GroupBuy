package com.user.bean;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "userimage")
@Component
public class UserImageBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userimageno")
	private Integer userImageNo;
	
	@JoinColumn(name = "userno")
	@ManyToOne
	private UserBean userBean; 
	
	
	@Column(name = "imagepath")
	private String imagePath;
	
	public UserImageBean() {
	}
	
	

	public UserImageBean(Integer userImageNo, UserBean userBean, String imagePath) {
		this.userImageNo = userImageNo;
		this.userBean = userBean;
		this.imagePath = imagePath;
	}

	public UserImageBean(UserBean userBean, String imagePath) {
		this.userBean = userBean;
		this.imagePath = imagePath;
	}



	public Integer getUserImageNo() {
		return userImageNo;
	}

	public void setUserImageNo(Integer userImageNo) {
		this.userImageNo = userImageNo;
	}

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	

}
