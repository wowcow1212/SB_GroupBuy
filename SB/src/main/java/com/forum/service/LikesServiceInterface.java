package com.forum.service;

import java.util.List;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.user.bean.UserBean;

public interface LikesServiceInterface {
	
	// 用文章去找喜歡紀錄
	List<LikesBean> findByPostNo(int postNo);
    
	// 查詢全部
    List<LikesBean> getAllPostsLikes();
    
    // 檢查特定使用者是否已對特定文章按讚
    LikesBean findByUserAndPost(UserBean user, PostsBean post);
    
    // 檢查是否以案讚過並回報或插入(檢舉資料庫是否有該名使用者檢案讚過該筆文章)
    LikesBean checkAndInsertLike(UserBean user, PostsBean post);
    
}
