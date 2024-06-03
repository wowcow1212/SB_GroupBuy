package com.activity.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.activity.bean.EventBean;
import com.activity.bean.EventRepository;

@Service
@Transactional
public class EventService {
	
	 @Autowired
	private EventRepository eRepos;
	 
	 public EventBean insert(EventBean event) {
		 return eRepos.save(event);
	 }
	 
	 public EventBean update(EventBean event) {
		 return eRepos.save(event);
	 }
	 
	 public void deleteEventByEventNo(Integer eventNo) {
		 eRepos.deleteById(eventNo);
	 }
	 

	 
	 public  EventBean findEventByEventNo(Integer eventNo) {
		 Optional<EventBean> op1 = eRepos.findEventByEventNo(eventNo);
		 
		 if (op1.isPresent()) {
			 return op1.get();
			
		}
		 return null;
	 }
	 
	 public List<EventBean> findAllEvents(){
		 return eRepos.findAll();
	 }

	


	}