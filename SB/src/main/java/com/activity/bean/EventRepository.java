package com.activity.bean;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<EventBean, Integer> {

	
	Optional<EventBean> findEventByEventNo(Integer eventNo);

	
}
