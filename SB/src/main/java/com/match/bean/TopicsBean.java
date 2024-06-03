package com.match.bean;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.user.bean.UserBean;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity                               //定義這個 Class 為一個實體(Entity)
@Table(name="chattopics")
@Component  
public class TopicsBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="topicNo")
	private Integer topicNo;
	
	@Column(name="topicname")
	private String topicName;
	
	@Transient
	private Integer userNo;
	
	public Integer getUserNo() {
		return userBeans.iterator().next().getUserNo();
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	
	@JsonIgnore                             
//	@ManyToMany(mappedBy = "tagsBeans")                                                      
	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="usertopics",                                                              
	joinColumns = {@JoinColumn(name="fktopicno", referencedColumnName = "topicno")},              
	inverseJoinColumns = {@JoinColumn(name="fkuserno", referencedColumnName = "userno")})   
	private Set<UserBean> userBeans = new HashSet<>();   //getters and setters
	
	
	public TopicsBean() {
	}
	
	public TopicsBean(Integer topicNo, String topicName) {
		this.topicNo = topicNo;
		this.topicName = topicName;
	}
	

	public Integer getTopicNo() {
		return topicNo;
	}

	public void setTopicNo(Integer topicNo) {
		this.topicNo = topicNo;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}  
	

}
