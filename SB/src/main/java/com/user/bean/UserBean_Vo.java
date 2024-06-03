package com.user.bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.match.bean.TagsBean;
import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.bean.RepliesBean;
import com.forum.bean.ReportsBean;
import com.group.model.Group;
import com.group.model.Order;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


public class UserBean_Vo implements Serializable{
	
	private Integer userNo; //not null
	
	private String userAccount; //not null
	
	private String userPassword; //not null
	
	private String userChineseName;

	private String userEnglishName;
	
	private String nickName;
	
	private String avatar;
	
	private String email;
	
	private LocalDateTime birthday;
	
	private String phone;
	
	private String userAddress;
	
	private LocalDateTime creationDatetime;
	
	private LocalDateTime lastLoginDatetime;
	
	private Integer gender; //0：生理女 1：生理男 not null
	
	private Integer goalNo;
	
	private String bloodType;
	
	private String MBTI;
	
	private Integer suspension; //0：未停權 1：已停權 Not Null
	
	private Integer verify; //0：未驗證 1：已驗證 Not Null
	
	private Integer isDelete; //0：未刪除 1：已刪除 Not Null
	
	private Integer isManager;
	
	private Integer point;
	
	
	public UserBean_Vo() {
	}

	public int getUserNo() {return userNo;}
	public String getUserAccount() {return userAccount;}
	public String getUserPassword() {return userPassword;}
	public String getUserChineseName() {return userChineseName;}
	public String getUserEnglishName() {return userEnglishName;}
	public String getNickName() {return nickName;}
	public String getAvatar() {return avatar;}
	public String getEmail() {return email;}
	public LocalDateTime getBirthday() {return birthday;}
	public String getPhone() {return phone;}
	public String getUserAddress() {return userAddress;}
	public LocalDateTime getCreationDatetime() {return creationDatetime;}
	public LocalDateTime getLastLoginDatetime() {return lastLoginDatetime;}
	public int getGender() {return gender;}
	public Integer getGoalNo() {return goalNo;}
	public String getBloodType() {return bloodType;}
	public String getMBTI() {return MBTI;}
	public int getSuspension() {return suspension;}
	public int getVerify() {return verify;}
	public int getIsDelete() {return isDelete;}
	public Integer getIsManager() {return isManager;}
	public Integer getPoint() {return point;}
	
	
	public void setUserNo(int userNo) {this.userNo = userNo;}
	public void setUserAccount(String userAccount) {this.userAccount = userAccount;}
	public void setUserPassword(String userPassword) {this.userPassword = userPassword;}
	public void setUserChineseName(String userChineseName) {this.userChineseName = userChineseName;}
	public void setUserEnglishName(String userEnglishName) {this.userEnglishName = userEnglishName;}
	public void setNickName(String nickName) {this.nickName = nickName;}
	public void setAvatar(String avatar) {this.avatar = avatar;}
	public void setEmail(String email) {this.email = email;}
	public void setBirthday(LocalDateTime birthday) {this.birthday = birthday;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setUserAddress(String userAddress) {this.userAddress = userAddress;}
	public void setCreationDatetime(LocalDateTime creationDatetime) {this.creationDatetime = creationDatetime;}
	public void setLastLoginDatetime(LocalDateTime lastLoginDatetime) {this.lastLoginDatetime = lastLoginDatetime;}
	public void setGender(int gender) {this.gender = gender;}
	public void setGoalNo(Integer goalNo) {this.goalNo = goalNo;}
	public void setBloodType(String bloodType) {this.bloodType = bloodType;}
	public void setMBTI(String mBTI) {MBTI = mBTI;}
	public void setSuspension(int suspension) {this.suspension = suspension;}
	public void setVerify(int verify) {this.verify = verify;}
	public void setIsDelete(int isDelete) {this.isDelete = isDelete;}
	public void setIsManager(Integer isManager) {this.isManager = isManager;}
	public void setPoint(Integer point) {this.point = point;}

}

