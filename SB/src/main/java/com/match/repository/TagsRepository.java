package com.match.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.match.bean.TagsBean;

public interface TagsRepository extends JpaRepository<TagsBean, Integer> {
	
	
	// 模糊查詢tagName
    @Query(value="from TagsBean where tagName like %:tagName%")
    public List<TagsBean> findByTagName(@Param("tagName") String tagName);
    
    
    // 根據用戶編號（userNo）查找相關的標籤
    @Query(value="SELECT t FROM TagsBean t JOIN t.userBeans u WHERE u.userNo = :userNo")
    List<TagsBean> findTagsByUserNo(@Param("userNo") Integer userNo);
    

    //根據標籤名稱列表批量查詢標籤實體
    @Query("SELECT t FROM TagsBean t WHERE t.tagName IN (:tagNames)")
    List<TagsBean> findByTagNameIn(@Param("tagNames") List<String> tagNames);
    
    
    
    
    
    /*定義了自定義查找方法：

    findUserBeansByTagNo()：返回與輸入 tagNo 相關的所有 userBeans。
    findTagsByUserNo()：返回與輸入 userId 相關的所有 Tags。
    Spring Data JPA 自動插入了實現。*/
}
