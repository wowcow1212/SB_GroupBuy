package com.user.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.user.bean.StateBean;
import com.user.bean.UserChatBean;

public interface UserChatRepository extends JpaRepository<UserChatBean, Integer> {
	
	
	@Query(value = "from UserChatBean ucb where (ucb.userNo = ?1 AND ucb.friendNo = ?2) OR (ucb.userNo = ?2 AND ucb.friendNo = ?1) ORDER BY ucb.contentTime")
	public List<UserChatBean> findUserChatBeanByUserNoAndFriendNo(Integer userNo1, Integer userNo2);
}
