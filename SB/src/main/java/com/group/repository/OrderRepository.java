package com.group.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	
	@Query("SELECT o FROM Order o WHERE o.group.eventNo= :eventNo")
	public List<Order> findOrdersByEventNo(Integer eventNo);
	
	@Query("SELECT o FROM Order o WHERE o.userNo.userNo= :userNo")
	public List<Order> findOrdersByUserNo(Integer userNo);

}
