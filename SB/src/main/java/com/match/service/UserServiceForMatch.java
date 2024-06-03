package com.match.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.match.bean.GoalsBean;
import com.user.bean.UserBean;
import com.user.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserServiceForMatch implements IUserService {

    private final UserRepository userRepos;

    @Autowired
    public UserServiceForMatch(UserRepository userRepos) {
        this.userRepos = userRepos;
    }

    @Override
    public UserBean getById(int userNo) {
        // 實現從數據庫中根據userNo查詢UserBean的邏輯
        return userRepos.findById(userNo).orElse(null);
    }

    @Override
    public UserBean updateUser(UserBean uBean) {
    	// 實現更新UserBean的邏輯
        return userRepos.save(uBean);
    }
    
	@Override
	public List<UserBean> findAll() {
		return userRepos.findAll();
		
	}
	
	
}