package com.group.service;


import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group.model.Group;
import com.group.repository.GroupRepository;
import com.user.bean.UserBean;
import com.user.repository.UserRepository;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class GroupService {

	@Autowired
	private GroupRepository groupRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private JavaMailSender mailSender;
	
//	查詢單筆活動
	public Group findGroupByEventNo(Integer eventno) {
		Optional<Group> groupoptional = groupRepository.findById(eventno);
		
		if(groupoptional.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		
		Group group = groupoptional.get();
	
		return group;
	}
	
//	查詢前台活躍活動
    public Page<Group> findAllGroupPage(PageRequest  pageRequest) {
        return groupRepository.findAllGroupPage(pageRequest);
    }
    
//  查詢後台活躍活動
    public List<Group> findAllGroup(){
    	return groupRepository.findAllGroup();
    }
	
//	更新團購點數
	public Group updatePoint(Group group) {
		return groupRepository.save(group);
	}
	
//	查詢活躍活動依照開活動時間升序
	public Page<Group> findAllGroupsByStartTimeAsc(PageRequest  pageRequest){
		return groupRepository.findAllGroupsByStartTimeAsc(pageRequest);
	}
	
//	查詢活躍活動依照開活動時間降序
	public List<Group> findAllGroupsByStartTimeDesc(){
		return groupRepository.findAllGroupsByStartTimeDesc();
	}
	
//	查詢活躍活動依照結束時間升序
	public Page<Group> findALLGroupsByEndTimeAsc(PageRequest  pageRequest){
		return groupRepository.findAllGroupByEndTimeAsc(pageRequest);
	}
	
//	查詢活躍活動依照結束時間降序
	public List<Group> findALLGroupsByEndTimeDesc(){
		return groupRepository.findAllGroupByEndTimeDesc();
	}
	
//	查詢活躍活動依照搜尋
	public List<Group> findGroupBySearch(String search){
		return groupRepository.findGroupBySearch(search);
	}
	
//	查詢活動依照開創人
	public List<Group> findGroupByUser(int user){
		return groupRepository.findGroupByUser(user);
	}
	
//	後臺查詢結單團購
	public List<Group> findGroupDoneBack(){
		return groupRepository.findGroupDoneBack();
	}
	
//	新增活動
	public Group insertGroup(Integer user, String title, String description, Date endtime,
							String[] pay, String minquantity, String minamount, String account, String address) {
		LocalDateTime startDateTime = LocalDateTime.now();
		Date startTime = Date.from(startDateTime.atZone(ZoneId.systemDefault()).toInstant());
	    
	    String paymentMethod = null;
		if(pay != null) {
			if(Arrays.asList(pay).containsAll(Arrays.asList("1","2","3"))) {
				paymentMethod = "123";
			}else if (Arrays.asList(pay).containsAll(Arrays.asList("1","2"))) {
				paymentMethod = "12";
			}else if (Arrays.asList(pay).containsAll(Arrays.asList("1","3"))) {
				paymentMethod = "13";
			}else if (Arrays.asList(pay).containsAll(Arrays.asList("2","3"))) {
				paymentMethod = "23";
			}else if (Arrays.asList(pay).contains("1")) {
				paymentMethod = "1";
			}else if (Arrays.asList(pay).contains("2")) {
				paymentMethod = "2";
			}else if (Arrays.asList(pay).contains("3")) {
				paymentMethod = "3";
			}
		}else {
			paymentMethod = "0";
		}
		
		Optional<UserBean> useroptional = userRepository.findById(user);
		if(useroptional.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + user);
		}
		
		UserBean userBean = useroptional.get();
		
		int point = 0;
		
	
		Group group = new Group();
		group.setUser(userBean);
		group.setTitle(title);
		group.setDescription(description);
		group.setStartTime(startTime);
		group.setEndTime(endtime);
		group.setMinTotalAmount(Integer.parseInt(minamount));
		group.setMinTotalQuantity(Integer.parseInt(minquantity));
		group.setStatus("active");
		group.setPaymentMethod(Integer.parseInt(paymentMethod));
		group.setAccount(account);
		group.setAddress(address);
		group.setPoint(point);
		
		return groupRepository.save(group);
	}
	
//	刪除活動
	public Group deleteGroup(int eventno) {
		Optional<Group> groupOptonal = groupRepository.findById(eventno);
		if(groupOptonal.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		Group group = groupOptonal.get();
		
		group.setStatus("banned");
		
		return groupRepository.save(group);
	}
	
//	更改活動
	public Group updateGroup(Integer eventno, String grouptitle, String groupdescription, Date endtime,
			int mintotalquantity, int mintotalamount) {
		Optional<Group> resultgroup = groupRepository.findById(eventno);
		
		if(resultgroup.isEmpty()) {
			throw new EntityNotFoundException("Group not found with id: " + eventno);
		}
		Group group = resultgroup.get();
		
		group.setTitle(grouptitle);
		group.setDescription(groupdescription);
		group.setEndTime(endtime);
		group.setMinTotalAmount(mintotalamount);
		group.setMinTotalQuantity(mintotalquantity);
		
		return groupRepository.save(group);
	}
	
//	寄下架信
	public void sendPlainText(String receicer, String subject, String context) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		
		helper.setTo(receicer);
		helper.setSubject(subject);
		helper.setText(context, true);
		helper.setFrom("SocialBook 官方<eeit179socialbook@gmail.com>");
		
		mailSender.send(message);
	}
}
