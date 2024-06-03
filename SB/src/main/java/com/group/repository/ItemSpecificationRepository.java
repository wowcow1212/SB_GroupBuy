package com.group.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.ItemSpecification;

public interface ItemSpecificationRepository extends JpaRepository<ItemSpecification, Integer> {
	
	@Query("SELECT i from ItemSpecification i where i.item.itemNo = :itemno")
	public List<ItemSpecification> findItemSpecByItemNo(Integer itemno);
	
}
