package com.user.bean;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "userchat")
@Component
public class UserChatBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userchatno")
	private Integer FriendStateNo;
	
	@Column(name = "userno")
	private Integer userNo; 

	@Column(name = "friendno")
	private Integer friendNo; 
	
	@Column(name = "chatcontent")
	private String chatContent; 
	
	@Column(name = "contenttime")
	private LocalDateTime contentTime; 
	
	public UserChatBean() {
	}
	
	
	
	public UserChatBean(Integer userNo, Integer friendNo, String chatContent, LocalDateTime contentTime) {
		this.userNo = userNo;
		this.friendNo = friendNo;
		this.chatContent = chatContent;
		this.contentTime = contentTime;
	}



	public Integer getFriendStateNo() {
		return FriendStateNo;
	}

	public void setFriendStateNo(Integer friendStateNo) {
		FriendStateNo = friendStateNo;
	}

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public Integer getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(Integer friendNo) {
		this.friendNo = friendNo;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public LocalDateTime getContentTime() {
		return contentTime;
	}

	public void setContentTime(LocalDateTime contentTime) {
		this.contentTime = contentTime;
	}

	
}
