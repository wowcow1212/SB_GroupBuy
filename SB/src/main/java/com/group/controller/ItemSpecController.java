package com.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.model.ItemSpecification;
import com.group.service.ItemSpecService;

@Controller
@RequestMapping("/itemspec")
public class ItemSpecController {

	@Autowired
	private ItemSpecService itemSpecService;
	
	@GetMapping("/itemno/{itemno}")
	@ResponseBody
	public List<ItemSpecification> findItemSpecByItemNo(@PathVariable("itemno") Integer itemno){
		List<ItemSpecification> itemspecs = itemSpecService.findItemSpecByItemNo(itemno);
		return itemspecs;
	}
}
