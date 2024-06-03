package com.user.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.bean.StateBean;
import com.user.bean.UserImageBean;
import com.user.repository.StateRepository;
import com.user.repository.UserImagesRepository;

import jakarta.el.StaticFieldELResolver;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class StateService {

	@Autowired
	private StateRepository sRepository;

	public StateBean findStateBystateName(String stateName) {
		return sRepository.findStateBystateName(stateName);
	}
}
