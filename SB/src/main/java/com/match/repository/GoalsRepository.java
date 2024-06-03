package com.match.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.match.bean.GoalsBean;

public interface GoalsRepository extends JpaRepository<GoalsBean, Integer> {   //注意GoalsBean必須為JPA實體(@Entity)
	                                                                           //Integer 是實體主鍵的類型
    @Query(value="from GoalsBean where goalName like %:goalName%")
    public List<GoalsBean> findByGoalName(@Param("goalName") String goalName);
}
