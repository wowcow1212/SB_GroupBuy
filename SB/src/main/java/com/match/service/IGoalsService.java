package com.match.service;

import java.util.List;

import com.match.bean.GoalsBean;

public interface IGoalsService {
	
	GoalsBean getById(Integer goalNo);
	
	List<GoalsBean> findByGoalName(String goalName);
	
	List<GoalsBean> findAll();
	
	GoalsBean insert(GoalsBean gBean);
	
	void deleteById(Integer goalNo);
	
	GoalsBean update(GoalsBean gBean);

}