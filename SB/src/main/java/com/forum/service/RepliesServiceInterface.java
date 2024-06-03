package com.forum.service;

import java.util.List;


import com.forum.bean.RepliesBean;

public interface RepliesServiceInterface {
	
	// 關鍵字模糊查詢回覆內容
	List<RepliesBean> getRepliesBeanKeyword(String repliesBeanKeyword);
	
	// 查詢全部
	List<RepliesBean> getAllReplies();
	
	// 新增
	void insertReplies(RepliesBean replies);
	
	// 依照編號刪除
	void deleteReplies(Integer repliesNo);
	
	// 依照編號單筆查詢
	RepliesBean getRepliesNo(Integer repliesNo);
	
	// 更新
	void updateReplies(RepliesBean replies);
	
	// 找文章底下的回覆
	List<RepliesBean> findByPostNo(int postNo);
}
