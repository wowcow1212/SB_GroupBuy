package com.forum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.dao.LikesDaoInterface;
import com.user.bean.UserBean;

@Service
public class LikesService implements LikesServiceInterface {

	@Autowired
	private LikesDaoInterface likesDao;

	// 查詢文章底下的檢舉
	@Override
	public List<LikesBean> findByPostNo(int postNo) {
		return likesDao.findByPostNo(postNo);
	}

	// 查詢全部
	@Override
	public List<LikesBean> getAllPostsLikes() {
		return likesDao.findAll();
	}

	// 檢查特定使用者是否已對特定文章按讚
	@Override
	public LikesBean findByUserAndPost(UserBean user, PostsBean post) {
		return likesDao.findByUserAndPost(user, post);
	}

	// 檢查是否以案讚過並回報或插入(檢舉資料庫是否有該名使用者檢案讚過該筆文章)
	@Override
	public LikesBean checkAndInsertLike(UserBean user, PostsBean post) {
		// 檢查是否已存在按讚記錄
		LikesBean existingLike = findByUserAndPost(user, post);

		// 如果已存在，則刪除該按讚記錄；否則，插入新的按讚記錄
		if (existingLike != null) {
			likesDao. delete(existingLike);
			return null;
		} else {
			LikesBean newLike = new LikesBean();
			newLike.setUserBean(user);
			newLike.setPostsBean(post);
			return likesDao.save(newLike);
		}
	}
}
