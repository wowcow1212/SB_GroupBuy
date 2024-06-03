package com.forum.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.forum.bean.PostsBean;
import com.user.bean.UserBean;

public interface PostsServiceInterface {
	
	// 用分類去找文章
	List<PostsBean> findBycategoryNo(int categoryNo);
	
	// 關鍵字模糊查詢標題
	List<PostsBean> getPostsBeanKeyword(String postsBeanKeyword);
	
	// 查詢全部
	List<PostsBean> getAllPosts();
	
	// 新增
	void insertPosts(PostsBean posts);
	
	// 依照編號刪除
	void deletePosts(Integer postsNo);
	
	// 編號查詢單筆
	PostsBean getPostsNo(Integer postsNo);
	
	// 更新
	void updatePosts(PostsBean posts);
	
	// 刪除文章的相關回覆
    void deletePostAndReplies(int postNo);
    
    // 更新瀏覽次數
    void updateViewCount(Integer postId, int viewCount);
    
    // 新到舊排序
    List<PostsBean> findAllOrderByCreatedAtDesc();
    
    // 舊到新排序
    List<PostsBean> findAllOrderByUpdateDateAsc();
    
    // 依照瀏覽次數排序
    List<PostsBean> findAllByOrderByViewCountDesc();
    
    List<PostsBean> findByUserBeanOrderByCreatedAtDesc(UserBean userBean);
    
}