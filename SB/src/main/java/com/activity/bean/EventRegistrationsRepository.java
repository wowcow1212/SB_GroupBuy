package com.activity.bean;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EventRegistrationsRepository extends JpaRepository<EventRegistrationsBean, Integer> {
	
	@Query(value = "from EventRegistrationsBean where eventNo = ?1 and userNo = ?2")
    List<EventRegistrationsBean> findByEventNoAndUserNo(Integer eventNo, Integer userNo);
}

