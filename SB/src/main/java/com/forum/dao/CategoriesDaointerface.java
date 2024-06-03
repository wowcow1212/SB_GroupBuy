package com.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.forum.bean.CategoriesBean;

public interface CategoriesDaointerface  extends JpaRepository<CategoriesBean, Integer>{
	
//	加@Query是因為 內建jpa的方法無法滿足需求 需額外使用JPQL 或者 SQL 就要加
//	搜尋c 將從CategoriesBean拿到的所有資料(未篩選)賦予c 篩選條件 LOWER(將屬性轉換為小寫來比較) 找尋titleName 像是 使用者輸入 的那筆資料 CONCAT負責連接'%', :keyword, '%'
    @Query("SELECT c FROM CategoriesBean c WHERE LOWER(c.title_name) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    //						按標題名稱尋找包含
    List<CategoriesBean> findByTitleNameContaining(@Param("keyword") String keyword);
}
