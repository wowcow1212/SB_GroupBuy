package com.user.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.bean.StateBean;
import com.user.bean.UserChatBean;
import com.user.bean.UserImageBean;
import com.user.repository.StateRepository;
import com.user.repository.UserChatRepository;
import com.user.repository.UserImagesRepository;

import jakarta.el.StaticFieldELResolver;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserChatService {

	@Autowired
	private UserChatRepository ucRepository;

	public UserChatBean saveOrUpdateUserChat(UserChatBean userChatBean) {
		return ucRepository.save(userChatBean);
	}
	
	public List<UserChatBean> findUserChatBeanByUserNoAndFriendNo(Integer userNo1, Integer userNo2){
		return ucRepository.findUserChatBeanByUserNoAndFriendNo(userNo1, userNo2);
	}
}
