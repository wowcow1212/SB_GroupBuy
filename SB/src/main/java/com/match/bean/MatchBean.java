package com.match.bean;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="match")
@Component
public class MatchBean {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="matchno")
	private Integer matchNo;      //NOT NULL
	
	@Column(name="user1no")
	private Integer user1No;      //NOT NULL
		

	@Column(name="user2no")   
	private Integer user2No;      //NOT NULL
	
	@Column(name="matchstatus")   //0:配對中 1:配對成功 2:配對失敗
	private Integer matchStatus;  //NOT NULL
	
	@Column(name="matchedat")     //NOT NULL , 
	private LocalDateTime matchedAt;
	
	
	
	//Constructors from superclass
	public MatchBean() {
	}
	
	//構造函數,用於在 likeUser 方法中創建新的 MatchBean 實例
	public MatchBean(Integer user1No, Integer user2No, LocalDateTime matchedAt) {
	    this.user1No = user1No;
	    this.user2No = user2No;
	    this.matchedAt = matchedAt;
	    this.matchStatus = 0; // 初始狀態為 0 (配對中)
	}
	
	
	//getters and setters
	public Integer getMatchNo() {
		return matchNo;
	}


	public void setMatchNo(Integer matchNo) {
		this.matchNo = matchNo;
	}


	public Integer getUser1No() {
		return user1No;
	}


	public void setUser1No(Integer user1No) {
		this.user1No = user1No;
	}


	public Integer getUser2No() {
		return user2No;
	}


	public void setUser2No(Integer user2No) {
		this.user2No = user2No;
	}


	public Integer getMatchStatus() {
		return matchStatus;
	}


	public void setMatchStatus(Integer matchStatus) {
		this.matchStatus = matchStatus;
	}


	public LocalDateTime getMatchedAt() {
		return matchedAt;
	}


	public void setMatchedAt(LocalDateTime matchedAt) {
		this.matchedAt = matchedAt;
	}




}
