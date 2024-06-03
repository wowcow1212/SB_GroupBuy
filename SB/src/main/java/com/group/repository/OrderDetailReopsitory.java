package com.group.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.OrderDetail;

public interface OrderDetailReopsitory extends JpaRepository<OrderDetail, Integer> {

	@Query("SELECT o FROM OrderDetail o WHERE o.order.id= :orderNo")
	public List<OrderDetail> findOrderDetailByOrderNo(Integer orderNo);
	
}
