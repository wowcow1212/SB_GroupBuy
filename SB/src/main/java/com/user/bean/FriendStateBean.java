package com.user.bean;

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
@Table(name = "friendstate")
@Component
public class FriendStateBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "friendstateno")
	private Integer FriendStateNo;
	
	@JoinColumn(name = "userno")
	@ManyToOne
	private UserBean userBean; 

	@JoinColumn(name = "friendno")
	@ManyToOne
	private UserBean friendBean;
	
	@JoinColumn(name = "stateno")
	@OneToOne
	private StateBean stateBean;
	
	public FriendStateBean() {
	}

	public FriendStateBean(UserBean userBean, UserBean friendBean, StateBean stateBean) {
		this.userBean = userBean;
		this.friendBean = friendBean;
		this.stateBean = stateBean;
	}
	
	public FriendStateBean(Integer friendStateNo, UserBean userBean, UserBean friendBean, StateBean stateBean) {
		super();
		FriendStateNo = friendStateNo;
		this.userBean = userBean;
		this.friendBean = friendBean;
		this.stateBean = stateBean;
	}

	public Integer getFriendStateNo() {
		return FriendStateNo;
	}

	public void setFriendStateNo(Integer friendStateNo) {
		FriendStateNo = friendStateNo;
	}

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public UserBean getFriendBean() {
		return friendBean;
	}

	public void setFriendBean(UserBean friendBean) {
		this.friendBean = friendBean;
	}

	public StateBean getStateBean() {
		return stateBean;
	}

	public void setStateBean(StateBean stateBean) {
		this.stateBean = stateBean;
	}

}
