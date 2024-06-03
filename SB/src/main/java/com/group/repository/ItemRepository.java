package com.group.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {

	@Query("SELECT i FROM Item i WHERE i.group.eventNo = :eventno")
	public List<Item> findItemByEventNo(int eventno);
	
}
