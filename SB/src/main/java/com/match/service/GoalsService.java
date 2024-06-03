package com.match.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.match.bean.GoalsBean;
import com.match.repository.GoalsRepository;

import jakarta.transaction.Transactional;
                                                        //..?
@Service                                                //該類別會被Spring容器自動偵測並實例化為一個單例bean
@Transactional                                          //確保了在該方法內執行的資料庫操作被視為單一交易
public class GoalsService implements IGoalsService {
 
	@Autowired                                          //使用構造注入
	private GoalsRepository goalsRepos;                 //有寫介面一定要帶入IGoalsDao

	
	//Generate Delegate Methods
	//用goalNo查詢
	@Override
	public GoalsBean getById(Integer goalNo) {
		Optional<GoalsBean> op1 = goalsRepos.findById(goalNo);
		
		if(op1.isPresent()) {
			return op1.get();
		}
		
		return null;
	}	
	
	
	//用goalName查詢
	@Override
	public List<GoalsBean> findByGoalName(String goalName){
		return goalsRepos.findByGoalName(goalName);
	}
	

	@Override
	public List<GoalsBean> findAll() {
		return goalsRepos.findAll();
		
	}

	@Override
	public GoalsBean insert(GoalsBean gBean) {
		return goalsRepos.save(gBean);             //JPA沒有支援insert()
	}                                              //sava()-沒id:新增

	@Override
	public void deleteById(Integer goalNo) {
		goalsRepos.deleteById(goalNo);            //?
	}

	@Override
	public GoalsBean update(GoalsBean gBean) {
		return goalsRepos.save(gBean);            //JPA沒有支援update()
	}	                                          //sava()-有id:更新

}