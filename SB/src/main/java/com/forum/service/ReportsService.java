package com.forum.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.PostsBean;
import com.forum.bean.ReportsBean;
import com.forum.dao.ReportsDaoInterface;
import com.user.bean.UserBean;

@Service
public class ReportsService implements ReportsServiceInterface {

	@Autowired
	private ReportsDaoInterface reportsDaoInterface;

	// 查詢文章底下的檢舉
	@Override
	public List<ReportsBean> findByPostNo(int postNo) {
		return reportsDaoInterface.findByPostNo(postNo);
	}

	// 查詢全部
	@Override
	public List<ReportsBean> getAllReports() {
		return reportsDaoInterface.findAll();
	}

	// 依照編號刪除
	@Override
	public void deleteReports(Integer reportsNo) {
		reportsDaoInterface.deleteById(reportsNo);
	}

	// 檢查特定使用者是否已對特定文章檢舉過
	@Override
	public ReportsBean findByUserAndPost(UserBean user, PostsBean post) {
		return reportsDaoInterface.findByUserAndPost(user, post);
	}

	// 檢查是否以檢舉過並回報或插入(檢舉資料庫是否有該名使用者檢舉過該筆文章以及原因)
	@Override
	public ReportsBean checkAndInsertReports(UserBean user, PostsBean post, String reason) {
		// 檢查是否已存在檢舉記錄
		ReportsBean existingReports = findByUserAndPost(user, post);

		// 如果已存在，則刪除該檢舉記錄；否則，插入新的檢舉記錄
		if (existingReports != null) {
			return null;
		} else {
			ReportsBean newReports = new ReportsBean();
			newReports.setUserBean(user);
			newReports.setPostsBean(post);
			newReports.setReason(reason);
			newReports.setReport_date(new Date());
			return reportsDaoInterface.save(newReports);
		}
	}
}
