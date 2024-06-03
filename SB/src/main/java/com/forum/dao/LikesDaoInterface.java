package com.forum.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.user.bean.UserBean;

public interface LikesDaoInterface extends JpaRepository<LikesBean, Integer> {
	
	// 用文章去找喜歡紀錄
	@Query("SELECT l FROM LikesBean l WHERE l.postsBean.post_no = :postNo")
	List<LikesBean> findByPostNo(@Param("postNo") int postNo);
	
	//檢查特定使用者是否已對特定文章按讚
    @Query("SELECT l FROM LikesBean l WHERE l.userBean = :user AND l.postsBean = :post")
    LikesBean findByUserAndPost(@Param("user") UserBean user, @Param("post") PostsBean post);
    
    //檢查並插入按讚記錄
    default LikesBean checkAndInsertLike(UserBean user, PostsBean post) {
        // 檢查是否已存在按讚記錄
        LikesBean existingLike = findByUserAndPost(user, post);
        
        // 如果已存在，返回null；否則，插入新的按讚記錄
        if (existingLike != null) {
        	delete(existingLike);
        	return null;
        } else {
            LikesBean newLike = new LikesBean();
            newLike.setUserBean(user);
            newLike.setPostsBean(post);
            return save(newLike);
        }
    }
    //刪除喜歡紀錄
    void delete(LikesBean like);
}