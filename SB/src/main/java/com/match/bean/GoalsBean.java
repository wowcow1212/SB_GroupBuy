package com.match.bean;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity                         //@Entity把Bean實體化  //JPA實體
@Table(name="Goals")
@Component                      //標記一個類別為 Spring 的組件
public class GoalsBean{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="goalno")
	private Integer goalNo;
	
	@Column(name="goalname")
	private String goalName;
	
	
	//Constructors from superclass
	public GoalsBean() {
		//super();
	}
	
	//根據編號和目標名稱來初始化  ..?    //Controller
	public GoalsBean(Integer goalNo,String goalName) {
		this.goalNo = goalNo;
		this.goalName = goalName;
	}
	


	//根據目標名稱來初始化  ..?         //Controller
	public GoalsBean(String goalName) {
		this.goalName = goalName;
	}
	
	
	//下面getters and setters
	public Integer getGoalNo() {
		return goalNo;
	}

	public void setGoalNo(Integer goalNo) {
		this.goalNo = goalNo;
	}

	public String getGoalName() {
		return goalName;
	}

	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	
}
