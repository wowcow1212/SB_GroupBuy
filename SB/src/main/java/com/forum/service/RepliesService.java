package com.forum.service;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.RepliesBean;
import com.forum.dao.RepliesDaoInterface;

@Service
public class RepliesService implements RepliesServiceInterface {

	@Autowired
	private RepliesDaoInterface repliesDao;

	// 關鍵字模糊查詢回覆內容
	@Override
	public List<RepliesBean> getRepliesBeanKeyword(String repliesBeanKeyword) {

		return repliesDao.findByContentContaining(repliesBeanKeyword);
	}

	// 查詢全部
	@Override
	public List<RepliesBean> getAllReplies() {
		return repliesDao.findAll();
	}

	// 新增
	@Override
	public void insertReplies(RepliesBean replies) {
		repliesDao.save(replies);
	}

	// 依照編號刪除
	@Override
	public void deleteReplies(Integer repliesNo) {
		repliesDao.deleteById(repliesNo);
	}

	// 依照編號單筆查詢
	@Override
	public RepliesBean getRepliesNo(Integer repliesNo) {
		Optional<RepliesBean> repliesOptional = repliesDao.findById(repliesNo);
		return repliesOptional.orElse(null);
	}

	// 更新
	@Override
	public void updateReplies(RepliesBean replies) {
		repliesDao.save(replies);
	}

	// 查詢文章底下的回覆
	@Override
	public List<RepliesBean> findByPostNo(int postNo) {
		return repliesDao.findByPostNo(postNo);
	}

}
