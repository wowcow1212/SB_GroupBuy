package com.match.bean;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity  
@Table(name="socialphotos")
@Component
public class SocialPhotosBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="photono")
	private Integer photoNo;  //NOT NULL  ""
	
	@Column(name="fkuserno")
	private Integer userNo;   //NOT NULL  session
	
	@Column(name="photopath")
	private String photoPath;
	
    @Column(name="phototheme")
	private String photoTheme; //NOT NULL

	
	//Constructors from superclass
	public SocialPhotosBean() {
		
	}
	
	
	//根據所有屬性來初始化
	public SocialPhotosBean(Integer photoNo, Integer userNo, String photoPath) {
		this.photoNo = photoNo;
		this.userNo = userNo;
		this.photoPath = photoPath;
	}
	
	//根據除了photoNo以外的屬性來初始化
	public SocialPhotosBean(Integer userNo, String photoPath) {
		this.userNo = userNo;
		this.photoPath = photoPath;
	}



	//getters and setters
	public Integer getPhotoNo() {
		return photoNo;
	}


	public void setPhotoNo(Integer photoNo) {
		this.photoNo = photoNo;
	}


	public Integer getUserNo() {
		return userNo;
	}


	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}


	public String getPhotoPath() {
		return photoPath;
	}


	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}


	public String getPhotoTheme() {
		return photoTheme;
	}


	public void setPhotoTheme(String photoTheme) {
		this.photoTheme = photoTheme;
	}
	

}
