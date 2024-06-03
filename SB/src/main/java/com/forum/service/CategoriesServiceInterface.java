package com.forum.service;

import java.util.List;

import com.forum.bean.CategoriesBean;

public interface CategoriesServiceInterface {
	
	// 關鍵字查詢分類
	List<CategoriesBean> getCategoryKeyword(String categoryKeyword);
	
	// 編號查詢分類
	CategoriesBean getCategoryNo(Integer categoryNo);
	
	// 全部查詢
	List<CategoriesBean> getAllCategories();
    
	// 新增分類
	void insertCategory(CategoriesBean category);
	
	// 刪除分類
	void deleteCategory(Integer categoryNo);
	
    
}
