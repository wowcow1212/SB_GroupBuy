package com.group.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.Item;
import com.group.model.ItemSpecification;
import com.group.repository.ItemSpecificationRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
@Transactional
public class ItemSpecService {

	@Autowired
	private ItemSpecificationRepository itemSpecificationRepository;
	
//	查詢規格依照商品編號
	public List<ItemSpecification> findItemSpecByItemNo(Integer itemno){
		List<ItemSpecification> itemspecs = itemSpecificationRepository.findItemSpecByItemNo(itemno);
		return itemspecs;
	}
	
//	查詢規格依照ID
	public ItemSpecification findItemSpecById(Integer itemSpecNo) {
		Optional<ItemSpecification> itemSpecOptional = itemSpecificationRepository.findById(itemSpecNo);
		if(itemSpecOptional.isEmpty()) {
			throw new EntityNotFoundException("ItemSpec not found with id: " + itemSpecNo);
		}
		
		ItemSpecification itemSpecification = itemSpecOptional.get();
		
		return itemSpecification;
	}

//	新增規格
	public ItemSpecification insertItemSpec(Item item, String specValue) {
		ItemSpecification itemSpecification = new ItemSpecification();
		
		itemSpecification.setItem(item);
		itemSpecification.setSpecValue(specValue);
		
		return itemSpecificationRepository.save(itemSpecification);
	}
	
}
