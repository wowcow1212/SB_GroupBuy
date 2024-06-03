package com.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.RepliesBean;

public interface RepliesDaoInterface extends JpaRepository<RepliesBean, Integer>{
	
	// 模糊查詢回覆內容關鍵字
	 @Query( "SELECT r FROM RepliesBean r WHERE LOWER(r.content) LIKE LOWER(CONCAT('%', :keyword, '%'))")
	    List<RepliesBean> findByContentContaining(@Param("keyword") String keyword);
	 
	 // 用文章去找底下回覆
	 @Query("SELECT r FROM RepliesBean r WHERE r.postsBean.post_no = :postNo")
	   	List<RepliesBean> findByPostNo(@Param("postNo") int postNo);
}
