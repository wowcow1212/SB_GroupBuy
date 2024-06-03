package com.forum.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forum.bean.CategoriesBean;
import com.forum.dao.CategoriesDaointerface;

@Service
public class CategoriesService implements CategoriesServiceInterface {

	@Autowired
	private CategoriesDaointerface CategoriesDaointerDao;

	// 關鍵字查詢分類
	@Override
	public List<CategoriesBean> getCategoryKeyword(String categoryKeyword) {

		return CategoriesDaointerDao.findByTitleNameContaining(categoryKeyword);
	}

	// 編號查詢分類
	@Override
	public CategoriesBean getCategoryNo(Integer categoryNo) {
		Optional<CategoriesBean> categoryOptional = CategoriesDaointerDao.findById(categoryNo);
		return categoryOptional.orElse(null);
	}

	// 全部查詢
	@Override
	public List<CategoriesBean> getAllCategories() {
		return CategoriesDaointerDao.findAll();
	}

	// 新增分類
	@Override
	public void insertCategory(CategoriesBean Categories) {
		CategoriesDaointerDao.save(Categories);
	}

	// 刪除分類
	@Override
	public void deleteCategory(Integer categoryNo) {
		CategoriesDaointerDao.deleteById(categoryNo);
	}

}
