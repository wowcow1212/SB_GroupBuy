package com.forum.service;

import java.util.List;

import com.forum.bean.PostsBean;
import com.forum.bean.ReportsBean;
import com.user.bean.UserBean;

public interface ReportsServiceInterface {
	
	// 用文章去找檢舉
	List<ReportsBean> findByPostNo(int postNo);
	
	// 查詢全部
	List<ReportsBean> getAllReports();
	
	// 依照編號刪除
	void deleteReports(Integer reportsNo);
	
	// 檢查特定使用者是否已對特定文章檢舉過
	ReportsBean findByUserAndPost(UserBean user, PostsBean post);
	
	// 檢查是否以檢舉過並回報或插入(檢舉資料庫是否有該名使用者檢舉過該筆文章以及原因)
	ReportsBean checkAndInsertReports(UserBean user, PostsBean post, String reason);
	
}