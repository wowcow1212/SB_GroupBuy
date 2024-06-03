package com.user.bean;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "state")
@Component
public class StateBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "stateno")
	private Integer stateNo;
	
	@Column(name = "sname")
	private String stateName;
	
	@Column(name = "sdesc")
	private String stateDesc;
	
	public StateBean() {
	}

	public Integer getStateNo() {
		return stateNo;
	}

	public void setStateNo(Integer stateNo) {
		this.stateNo = stateNo;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getStateDesc() {
		return stateDesc;
	}

	public void setStateDesc(String stateDesc) {
		this.stateDesc = stateDesc;
	}
}
