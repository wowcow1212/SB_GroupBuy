package com.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.user.bean.UserBean;

public interface UserRepository extends JpaRepository<UserBean, Integer> {

	@Query(value = "from UserBean where userAccount = ?1 and userPassword = ?2")
	public UserBean getLoginUserData(String userAccount, String userPassword);
	
	@Query(value = "from UserBean where (userChineseName like concat('%',?1,'%') OR userEnglishName like concat('%',?1,'%')) AND isManager = 0 AND suspension = 0")
	public List<UserBean> findUserBySearch(String searchName);
	
	@Query(value = "from UserBean where email = ?1 and userAccount = ?2")
	public UserBean findForgetUserBean(String email, String account);
	
	@Query(value = "from UserBean where userPassword = ?1")
	public UserBean checkVerificationCode(String verificationCode);
	
	@Query(value = "from UserBean where userAccount = ?1")
	public UserBean getGoogleLoginUserData(String googleID);
	
	//查詢指定欄位的資料，查詢將會返回一個List<Object[]>，其中每個Object[]都包含了查詢結果的各個欄位值
	@Query("SELECT u.nickName, u.goalNo, u.MBTI, u.bloodType, u.userNo FROM UserBean u")
    List<Object[]> findUserFields();
    
    
    //根據標籤編號查詢相關的使用者。查詢會返回符合標籤編號的使用者列表
    @Query("SELECT u FROM UserBean u JOIN u.tagsBeans t WHERE t.tagNo = ?1")
    List<UserBean> findUserBeansByTagNo(Integer tagNo);


	public UserBean findByUserNo(Integer userNo);
	
	
    @Query("SELECT u FROM UserBean u WHERE u.userNo > :currentUserNo ORDER BY u.userNo ASC")
    List<UserBean> findNextUsers(@Param("currentUserNo") Integer currentUserNo);



}
