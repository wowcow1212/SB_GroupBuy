package com.group.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.dto.GroupDto;
import com.group.dto.OrderDetailsDto;
import com.group.dto.OrderDto;
import com.group.model.Group;
import com.group.model.Item;
import com.group.model.ItemSpecification;
import com.group.model.Order;
import com.group.model.OrderDetail;
import com.group.service.GroupService;
import com.group.service.ItemService;
import com.group.service.ItemSpecService;
import com.group.service.OrderService;
import com.user.bean.UserBean;
import com.user.service.UserService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService gService;
	
	@Autowired
	private ItemService iService;
	
	@Autowired
	private ItemSpecService itemSpecService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
//	全活躍活動
	@GetMapping(value = "/groups")
	public String findAllGroup(Model m, HttpServletRequest request, @RequestParam(defaultValue = "0") int page) {
		int pageSize = 9;
		
		PageRequest pageAble = PageRequest.of(page, pageSize);
		Page<Group> groups = gService.findAllGroupPage(pageAble);
		
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		m.addAttribute("groups", groups);
		m.addAttribute("userData", user);
		
		return "group/jsp/groups.jsp";
	}
	
//	個人開的活動
	@GetMapping(value = "/mygroups")
	public String findGroupByUser(HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		UserBean userbean = (UserBean)session.getAttribute("userData");
		int userNo = userbean.getUserNo();
		Integer totalPrice = 0;
		Integer totalAmount = 0;
//		Integer userNo = 1;
		
//		查詢我的團購
		List<Group> userGroups = gService.findGroupByUser(userNo);
		ArrayList<GroupDto> groupDtos = new ArrayList<GroupDto>();
		for (Group userGroup : userGroups) {
			String title = userGroup.getTitle();
			Integer paymentMethod = userGroup.getPaymentMethod();
			String description = userGroup.getDescription();
			Date endTime = userGroup.getEndTime();
			String account = userGroup.getAccount();
			String address = userGroup.getAddress();
			Integer eventNo = userGroup.getEventNo();
			Integer minAmount = userGroup.getMinTotalAmount();
			Integer minQuantity = userGroup.getMinTotalQuantity();
			
//			查詢我的團購裡的訂單
			List<Order> groupOrders = userGroup.getOrders();
			ArrayList<OrderDto> groupOrderDtos = new ArrayList<OrderDto>();
			for (Order groupOrder : groupOrders) {
				int groupOrderUserNo = groupOrder.getUserNo().getUserNo();
				String groupOrderUserName = groupOrder.getUserNo().getUserChineseName();
				Integer groupOrderPayment = groupOrder.getPaymentMethod();
				Date setTime = groupOrder.getSetTime();
				
//				查詢我的團購裡訂單的訂單細節
				List<OrderDetail> groupOrderDetails = groupOrder.getOrderDetails();
				ArrayList<OrderDetailsDto> groupOrderDetailDtos = new ArrayList<OrderDetailsDto>();
				for (OrderDetail groupOrderDetail : groupOrderDetails) {
					Integer itemNo = groupOrderDetail.getItem().getItemNo();
					String itemName = groupOrderDetail.getItem().getName();
					Integer itemQuantity = groupOrderDetail.getItemQuantity();
					String specValue = groupOrderDetail.getItemSpec().getSpecValue();
					Integer itemPrice = groupOrderDetail.getItem().getPrice();
					
					totalAmount += itemQuantity;
					totalPrice += itemPrice * itemQuantity;
					
					OrderDetailsDto orderDetailsDto = new OrderDetailsDto();
					orderDetailsDto.setItemNo(itemNo);
					orderDetailsDto.setItemName(itemName);
					orderDetailsDto.setItemQuantity(itemQuantity);
					orderDetailsDto.setSpecValue(specValue);
					orderDetailsDto.setItemPrice(itemPrice);
					
					groupOrderDetailDtos.add(orderDetailsDto);
				}
				
				OrderDto orderDto = new OrderDto();
				orderDto.setUserNo(groupOrderUserNo);
				orderDto.setUserName(groupOrderUserName);
				orderDto.setPaymentMethod(groupOrderPayment);
				orderDto.setOrderDetail(groupOrderDetailDtos);
				orderDto.setSetTime(setTime);
				
				groupOrderDtos.add(orderDto);
			}
			
			GroupDto groupDto = new GroupDto();
			
			groupDto.setAccount(account);
			groupDto.setAddress(address);
			groupDto.setgDescription(description);
			groupDto.setgTitle(title);
			groupDto.setPaymentMethod(paymentMethod);
			groupDto.setgEndTime(endTime);
			groupDto.setEventNo(eventNo);
			groupDto.setgMinTotalAmount(minAmount.toString());
			groupDto.setgMinTotalQuantity(minQuantity.toString());
			groupDto.setGroupOrders(groupOrderDtos);
			groupDto.setTotalAmount(totalAmount);
			groupDto.setTotalPrice(totalPrice);
			
			groupDtos.add(groupDto);
		}
		
		List<OrderDto> orders = orderService.findOrdersByUserNo(userNo);
		
		m.addAttribute("orders", orders);
		m.addAttribute("groups", groupDtos);
		
		return "group/jsp/mygroup.jsp";
	}
	
//	全活躍活動依開團時間升序
	@GetMapping(value = "/groupsbystimeasc")
	public String findAllGroupByStartTimeAsc(HttpServletRequest request, Model m, @RequestParam(defaultValue = "0") int page) {
		int pageSize = 9;
		
		PageRequest pageAble = PageRequest.of(page, pageSize);
		Page<Group> groups = gService.findAllGroupsByStartTimeAsc(pageAble);
		
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		m.addAttribute("groups", groups);
		m.addAttribute("userData", user);
		
		return "group/jsp/groups.jsp";
		
		
		
		
	}
	
//	全活躍活動依開團時間降序
	@GetMapping(value = "/groupsbystimedesc")
	@ResponseBody
	public List<Group> findAllGroupByStartTimeDesc(){
		List<Group> groups = gService.findAllGroupsByStartTimeDesc();
		return groups;
	}
	
//	全活躍活動依結團時間升序
	@GetMapping(value = "/groupsbyetimeasc")
	public String findAllGroupByEndTimeAsc(HttpServletRequest request, Model m, @RequestParam(defaultValue = "0") int page){
		int pageSize = 9;
		
		PageRequest pageAble = PageRequest.of(page, pageSize);
		Page<Group> groups = gService.findALLGroupsByEndTimeAsc(pageAble);
		
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		m.addAttribute("groups", groups);
		m.addAttribute("userData", user);
		
		return "group/jsp/groups.jsp";
		
		
		
	}
	
//	全活躍活動依結團時間降序
	@GetMapping(value = "/groupsbyetimedesc")
	public String findAllGroupByEndTimeDesc(HttpServletRequest request, Model m){
		List<Group> groups = gService.findALLGroupsByEndTimeDesc();
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		m.addAttribute("groups", groups);
		m.addAttribute("userData", user);
		
		return "group/jsp/groups.jsp";
	}
	
//	依搜尋找活躍活動
	@GetMapping("/groupsearch")
	@ResponseBody
	public List<GroupDto> findGroupBySearch(@RequestParam("search") String search){
		List<Group> groups = gService.findGroupBySearch(search);
		ArrayList<GroupDto> groupsDto = new ArrayList<GroupDto>();
		
		for (Group group : groups) {
			String title = group.getTitle();
			String description = group.getDescription();
			int userNo = group.getUser().getUserNo();
			String userName = group.getUser().getUserChineseName();
			Integer eventNo = group.getEventNo();
			
			GroupDto groupDto = new GroupDto();
			groupDto.setgTitle(title);
			groupDto.setgDescription(description);
			groupDto.setUserName(userName);
			groupDto.setUserNo(userNo);
			groupDto.setEventNo(eventNo);
			
			groupsDto.add(groupDto);
		}
		
		return groupsDto;
	}
	
//	後臺全活躍活動
	@GetMapping(value = "/backgroups")
	public String findAllGroupBack(Model m) {
		List<Group> groups = gService.findAllGroup();
		m.addAttribute("groups", groups);
		return "group/jsp/backallactivegroups.jsp";
	}
	
//	後臺結單活動
	@GetMapping(value = "/backdonegroups")
	public String findGroupsDoneBack(Model m) {
		List<Group> groups = gService.findGroupDoneBack();
		m.addAttribute("groups", groups);
		return "group/jsp/backdonegroups.jsp";
	}
	
//	後台下架團購活動
	@PostMapping(value = "/bannedgroup/{eventno}")
	public String bannedGroupByEventNo(@PathVariable("eventno") Integer eventno) throws MessagingException {
		Group group = gService.findGroupByEventNo(eventno);
		
		String userEmail = group.getUser().getEmail();
		String subject = "SocialBook 下架團購";
		String mailContext = "<h1>你開的團購已被下架</h1>";
		mailContext += "<p>你開的團購，團購標題為" + group.getTitle() + "</p>";
		mailContext += "<p>已違反網路社群規範，故已緊急下架。</p>";
		mailContext += "<p>請盡速處理後續的動作。</p>";
		
		gService.sendPlainText(userEmail, subject, mailContext);
		gService.deleteGroup(eventno);
		
		return "redirect:/group/backgroups";
	}
	
//	新增團購
	@PostMapping(value = "/insertgroup")
	public String insertGroup(@ModelAttribute GroupDto newGroup, HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		UserBean userbean = (UserBean)session.getAttribute("userData");
		Integer userNo = userbean.getUserNo();
//		Integer userNo = 1;
		
		String address = null;
		String account = null;
		String minTotalAmount = null;
		String minTotalQuantity = null;
		String bank = null;
		String area = null;
		String city = null;
		String saveAccount = null;
		String saveAddress = null;
		
		String title = newGroup.getgTitle();
		String description = newGroup.getgDescription();
		Date endTime = newGroup.getgEndTime();
		if(!newGroup.getgMinTotalAmount().isEmpty()) {
			minTotalAmount = newGroup.getgMinTotalAmount();
		} else {
			minTotalAmount = "0";
		}
		if(!newGroup.getgMinTotalQuantity().isEmpty()) {
			minTotalQuantity = newGroup.getgMinTotalQuantity();
		} else {
			minTotalQuantity = "0";
		}
		String[] payments = newGroup.getPayment();
		if(Arrays.asList(payments).contains("1")) {
			bank = newGroup.getBank();
			account = newGroup.getAccount();
			saveAccount = bank + "-" + account;
		}
		if (Arrays.asList(payments).contains("2")) {
			address = newGroup.getAddress();
			city = newGroup.getCity();
			area = newGroup.getArea();
			saveAddress = city + area + address ;
		}
		Group group = gService.insertGroup(userNo, title, description, endTime, payments, minTotalQuantity, minTotalAmount, saveAccount, saveAddress);
		
		session.setAttribute("eventno", group.getEventNo());
		m.addAttribute("group", group);
		
		return "group/jsp/insertitem.jsp";
	}
	
//	修改團購資訊
	@PostMapping(value = "/updategroup")
	public String updateGroup(@RequestBody GroupDto updateGroupDto) {
		Integer eventNo = updateGroupDto.getEventNo();
		String getgTitle = updateGroupDto.getgTitle();
		String getgDescription = updateGroupDto.getgDescription();
		Date getgEndTime = updateGroupDto.getgEndTime();
		String getgMinTotalAmount = updateGroupDto.getgMinTotalAmount();
		String getgMinTotalQuantity = updateGroupDto.getgMinTotalQuantity();
		
		gService.updateGroup(eventNo, getgTitle, getgDescription, getgEndTime, Integer.parseInt(getgMinTotalQuantity), Integer.parseInt(getgMinTotalAmount));
		return "redirect:/group/mygroups";
	}
//	查詢單筆團購
	@GetMapping("/eachgroup/{eventno}")
	public String findGroupByEventNo(@PathVariable("eventno") Integer eventno, Model m, HttpServletRequest request) {
		Group group = gService.findGroupByEventNo(eventno);
		List<Item> items = iService.findItemsByEventNo(eventno);
		HashMap<Integer, List<ItemSpecification>> specsmap = new HashMap<>();
		HttpSession session = request.getSession();
		
		for (Item item : items) {
			Integer itemno = item.getItemNo();
			List<ItemSpecification> itemspecs = itemSpecService.findItemSpecByItemNo(itemno);
			specsmap.put(itemno, itemspecs);
		}

		session.setAttribute("group", group);
		m.addAttribute("group", group);
		m.addAttribute("items", items);
		m.addAttribute("itemspecmap", specsmap);
		
		return "group/jsp/eachgroup.jsp";
	}
	
	@PostMapping("/groupdone/{eventno}")
	public String doneGroup(@PathVariable("eventno") Integer eventno, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);		
		Group group = gService.findGroupByEventNo(eventno);
		
		Integer userPoint = user.getPoint();		
		Integer groupPoint = group.getPoint();

		userPoint += groupPoint;
		user.setPoint(userPoint);
		group.setStatus("done");
		
		userService.updateUser(user);
		gService.updatePoint(group);
		return "ok";
	}
	
//	linepay金流
	@GetMapping("/groups100")
	public String getDirect100(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		userService.insertPoint100(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups300")
	public String getDirect300(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		userService.insertPoint300(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups500")
	public String getDirect500(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		userService.insertPoint500(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups1000")
	public String getDirect1000(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		userService.insertPoint1000(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups2000")
	public String getDirect2000(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		userService.insertPoint2000(user);
		
		return "redirect:/group/groups";
	}
	
	@GetMapping("/groups3000")
	public String getDirect3000(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("userData");
//		UserBean user = userService.getUserData(1);
		
		userService.insertPoint3000(user);
		
		return "redirect:/group/groups";
	}
	
}
