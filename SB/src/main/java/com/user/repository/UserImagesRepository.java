package com.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.user.bean.UserImageBean;

public interface UserImagesRepository extends JpaRepository<UserImageBean, Integer> {
	
}
