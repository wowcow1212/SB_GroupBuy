package com.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.PostsBean;
import com.user.bean.UserBean;

public interface PostsDaoInterface extends JpaRepository<PostsBean, Integer> {

	// 用分類去找文章
	@Query("SELECT p FROM PostsBean p WHERE p.categoriesBean.category_no = :categoryNo")
	List<PostsBean> findBycategoryNo(@Param("categoryNo") int categoryNo);
	
	// 模糊查詢關鍵字標題
	@Query("SELECT p FROM PostsBean p WHERE LOWER(p.title) LIKE LOWER(CONCAT('%', :keyword, '%'))")
	List<PostsBean> findByTitleContaining(@Param("keyword") String keyword);
	
	// 更新瀏覽次數
	@Query("UPDATE PostsBean p SET p.view_count = :viewCount WHERE p.post_no = :postId")
	void updateViewCount(@Param("postId") Integer postId, @Param("viewCount") int viewCount);

	// 依照瀏覽次數排序
	@Query("SELECT p FROM PostsBean p ORDER BY p.view_count DESC")
	List<PostsBean> findAllByOrderByViewCountDesc();
	
	
	// 新到舊排序
	@Query("SELECT p FROM PostsBean p ORDER BY p.update_date DESC")
	List<PostsBean> findAllOrderByCreatedAtDesc();
	
	// 舊到新排序
	@Query("SELECT p FROM PostsBean p ORDER BY p.update_date ASC")
	List<PostsBean> findAllOrderByUpdateDateAsc();

	
	// 新到舊排序與使用者No
    @Query("SELECT p FROM PostsBean p WHERE p.userBean = :userBean ORDER BY p.update_date DESC")
    List<PostsBean> findByUserBeanOrderByCreatedAtDesc(@Param("userBean") UserBean userBean);
}
