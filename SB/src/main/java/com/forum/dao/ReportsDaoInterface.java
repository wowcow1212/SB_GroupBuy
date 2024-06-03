package com.forum.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.PostsBean;
import com.forum.bean.ReportsBean;
import com.user.bean.UserBean;

public interface ReportsDaoInterface extends JpaRepository<ReportsBean, Integer> {
	
	// 用文章去找檢舉
	@Query("SELECT r FROM ReportsBean r WHERE r.postsBean.post_no = :postNo")
	List<ReportsBean> findByPostNo(@Param("postNo") int postNo);

	// 檢查特定使用者是否已對特定文章檢舉過
    @Query("SELECT l FROM ReportsBean l WHERE l.userBean = :user AND l.postsBean = :post")
    ReportsBean findByUserAndPost(@Param("user") UserBean user, @Param("post") PostsBean post);
    
    // 檢查是否以檢舉過並回報
    default ReportsBean checkAndInsertReports(UserBean user, PostsBean post, String reason) {
        // 檢查是否已存在檢舉記錄
    	ReportsBean existingReports = findByUserAndPost(user, post);
        
        // 如果已存在，返回null；否則，插入新的檢舉記錄
        if (existingReports != null) {
        	return null;
        } else {
        	ReportsBean newReports = new ReportsBean();
        	newReports.setUserBean(user);
        	newReports.setPostsBean(post);
        	newReports.setReason(reason);
        	newReports.setReport_date(new Date());
            return save(newReports);
        }
    }    
}