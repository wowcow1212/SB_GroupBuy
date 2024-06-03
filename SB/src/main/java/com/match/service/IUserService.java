package com.match.service;

import java.util.List;

import com.user.bean.UserBean;

public interface IUserService {
	
    UserBean getById(int userNo);
    
	UserBean updateUser(UserBean uBean);

	List<UserBean> findAll();

}
