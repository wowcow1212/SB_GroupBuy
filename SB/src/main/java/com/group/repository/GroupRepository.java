package com.group.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group.model.Group;

public interface GroupRepository extends JpaRepository<Group, Integer> {

	@Query("SELECT g FROM Group g  WHERE g.status = 'active' AND g.endTime > CURRENT_TIMESTAMP")
	public Page<Group> findAllGroupPage(Pageable pageable);
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' AND g.endTime > CURRENT_TIMESTAMP")
	public List<Group> findAllGroup();
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' AND g.endTime > CURRENT_TIMESTAMP ORDER BY g.startTime DESC")
	public List<Group> findAllGroupsByStartTimeDesc();
	
	@Query("SELECT g FROM Group g WHERE g.status = 'active' AND g.endTime > CURRENT_TIMESTAMP ORDER BY g.startTime ASC")
	public Page<Group> findAllGroupsByStartTimeAsc(Pageable pageable);

	@Query("SELECT g FROM Group g WHERE g.title like concat('%',?1,'%') AND g.status = 'active' AND g.endTime > CURRENT_TIMESTAMP")
	public List<Group> findGroupBySearch(String title);
	
	@Query("SELECT g FROM Group g WHERE g.status = 'active' AND g.user.userNo = :user")
	public List<Group> findGroupByUser(int user) ;
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'active' AND g.endTime > CURRENT_TIMESTAMP ORDER BY g.endTime DESC")
	public List<Group> findAllGroupByEndTimeDesc();
	
	@Query("SELECT g FROM Group g WHERE g.status = 'active' AND g.endTime > CURRENT_TIMESTAMP ORDER BY g.endTime ASC")
	public Page<Group> findAllGroupByEndTimeAsc(Pageable pageable);
	
	@Query("SELECT g FROM Group g LEFT JOIN FETCH g.items WHERE g.status = 'done'")
	public List<Group> findGroupDoneBack();
}
