package com.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.user.bean.StateBean;
import com.user.bean.UserBean;

public interface StateRepository extends JpaRepository<StateBean, Integer> {
	
	
	@Query(value = "from StateBean where stateName = ?1")
	public StateBean findStateBystateName(String stateName);
}
