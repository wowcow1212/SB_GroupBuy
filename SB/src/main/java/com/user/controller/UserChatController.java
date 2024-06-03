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
import com.user.bean.UserChatBean;
import com.user.bean.UserImageBean;
import com.user.dto.LinePayDto;
import com.user.service.FriendStateService;
import com.user.service.StateService;
import com.user.service.UserChatService;
import com.user.service.UserImageService;
import com.user.service.UserService;
import com.user.util.UserUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserChatController {
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private FriendStateService fsService;
	
	@Autowired
	private StateService stateService;
	
	@Autowired
	private UserChatService ucService;

	@GetMapping("/userChat")
	public String userChatAction(Model m, HttpSession session) {
		UserBean uBean = (UserBean) session.getAttribute("userData");
		Optional<UserBean> dataById = uService.getDataById(uBean.getUserNo());
		UserBean userBean = dataById.get();
		
		StateBean state = stateService.findStateBystateName("好友");
		List<FriendStateBean> friendStateBeans = fsService.findSomeStateFriendState(userBean, state);
		List<UserBean> friendBeans = new ArrayList<UserBean>();
		for (FriendStateBean fsBean : friendStateBeans) {
			friendBeans.add(fsBean.getFriendBean());
		}
		
		System.out.println("friendBeans.size : " + friendBeans.size());
		
		m.addAttribute("userBean", userBean);
		m.addAttribute("userFriends", friendBeans);
		m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("HH:mm"));
		

		return "user/jsp/chat_FontSatge.jsp";
	}
	
	@GetMapping("/getChatContent/{friendNo}")
	@ResponseBody
	public List<UserChatBean> userChatAction(@PathVariable("friendNo") Integer friendNo, Model m, HttpSession session) {
		UserBean uBean = (UserBean) session.getAttribute("userData");
		
		List<UserChatBean> chatBeans = ucService.findUserChatBeanByUserNoAndFriendNo(uBean.getUserNo(), friendNo);
	
		return chatBeans;
	}
}
