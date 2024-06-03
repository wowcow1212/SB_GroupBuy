package com.user.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.apache.http.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.match.bean.TagsBean;
import com.user.bean.FriendStateBean;
import com.user.bean.StateBean;
import com.user.bean.UserBean;
import com.user.bean.UserBean_Vo;
import com.user.bean.UserImageBean;
import com.user.dto.LinePayDto;
import com.user.service.FriendStateService;
import com.user.service.StateService;
import com.user.service.UserImageService;
import com.user.service.UserService;
import com.user.util.UserUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FriendStateController {
	
	@Autowired
	private FriendStateService fsService;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private StateService stateService;

	@GetMapping("/addFriend/{userNo}")
	public String processAddFriendAction(@PathVariable("userNo") Integer friendNo, Model m, HttpSession session) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		Optional<UserBean> dataById2 = uService.getDataById(friendNo);
		UserBean friendUserBean = dataById2.get();
		
		StateBean currentUserState = stateService.findStateBystateName("申請中");
		FriendStateBean userToFriendState = new FriendStateBean(userBean, friendUserBean, currentUserState);
		fsService.saveOrUpdateFriendState(userToFriendState);
		
		StateBean friendState = stateService.findStateBystateName("待回覆");
		FriendStateBean friendToUserState = new FriendStateBean(friendUserBean, userBean, friendState);
		fsService.saveOrUpdateFriendState(friendToUserState);
		
		return "redirect:/otherAboutMe";
	}
	
	@GetMapping("/cancelApplication/{userNo}")
	public String processCancelApplicationAction(@PathVariable("userNo") Integer friendNo, Model m, HttpSession session) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		Optional<UserBean> dataById2 = uService.getDataById(friendNo);
		UserBean friendUserBean = dataById2.get();
		
		FriendStateBean userToFriendState = fsService.findFriendState(userBean, friendUserBean);
		fsService.deleteFriendState(userToFriendState);
		
		FriendStateBean friendToUserState = fsService.findFriendState(friendUserBean, userBean);
		fsService.deleteFriendState(friendToUserState);
		
		UserBean otherUserBean = uService.getUserData(friendUserBean.getUserNo());
		session.setAttribute("otherUserData", otherUserBean);
		
		return "redirect:/otherAboutMe";
	}
	
	@GetMapping("/agreeApplication/{userNo}")
	public String processAgreeApplicationAction(@PathVariable("userNo") Integer friendNo, Model m, HttpSession session) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		Optional<UserBean> dataById2 = uService.getDataById(friendNo);
		UserBean friendUserBean = dataById2.get();
		
		StateBean agreeUserState = stateService.findStateBystateName("好友");
		
		FriendStateBean userToFriendState = fsService.findFriendState(userBean, friendUserBean);
		userToFriendState.setStateBean(agreeUserState);
		fsService.saveOrUpdateFriendState(userToFriendState);
		
		FriendStateBean friendToUserState = fsService.findFriendState(friendUserBean, userBean);
		friendToUserState.setStateBean(agreeUserState);
		fsService.saveOrUpdateFriendState(friendToUserState);
		
		
		UserBean otherUserBean = uService.getUserData(friendUserBean.getUserNo());
		session.setAttribute("otherUserData", otherUserBean);
		
		return "redirect:/otherAboutMe";
	}
	
	@GetMapping("/findWaitAgreeFriend")
	@ResponseBody
	public List<UserBean_Vo> findWaitAgreeFriendAction(Model m, HttpSession session) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		StateBean state = stateService.findStateBystateName("待回覆");
		
		List<FriendStateBean> waitAgreeFriendState = fsService.findSomeStateFriendState(userBean, state);
		
		List<UserBean_Vo> waitAgreeUserBeans = new ArrayList<UserBean_Vo>();
		
		for(FriendStateBean fsb : waitAgreeFriendState) {
			waitAgreeUserBeans.add(fsb.getFriendBean().getUserBean_Vo());
		}
		
		return waitAgreeUserBeans;
	}
	
	@GetMapping("/deleteFriend/{userNo}")
	public String processDeleteFriendAction(@PathVariable("userNo") Integer friendNo, Model m, HttpSession session) {
		UserBean uBean = (UserBean)session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		Optional<UserBean> dataById2 = uService.getDataById(friendNo);
		UserBean friendUserBean = dataById2.get();
		
		FriendStateBean userToFriendState = fsService.findFriendState(userBean, friendUserBean);
		fsService.deleteFriendState(userToFriendState);
		
		FriendStateBean friendToUserState = fsService.findFriendState(friendUserBean, userBean);
		fsService.deleteFriendState(friendToUserState);
		
		return "redirect:/userFriends";
	}
	
	
	
	
}








