package com.group.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.dto.BackToFrontOrder;
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
import com.group.service.OrderDetailService;
import com.group.service.OrderService;
import com.user.bean.UserBean;
import com.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ItemSpecService itemSpecService;
	
	@Autowired
	private OrderDetailService orderDetailService;

	@PostMapping("/insertorder")
	public String insertOrder(HttpServletRequest request,@RequestBody OrderDto submitOrder) {
		HttpSession session = request.getSession();
		UserBean userBean = (UserBean)session.getAttribute("userData");
//		UserBean userBean = userService.getUserData(1);
		
		Integer eventNo = submitOrder.getEventNo();
		Group group = groupService.findGroupByEventNo(eventNo);
		Integer paymentMethod = submitOrder.getPaymentMethod();
		List<OrderDetailsDto> orderDetailsDto = submitOrder.getOrderDetail();
		
		Order insertOrder = orderService.insertOrder(group, userBean, paymentMethod);
		
		Integer orderTotalPrice = 0;		
		
		for (OrderDetailsDto orderDetailDto : orderDetailsDto) {
			Integer itemNo = orderDetailDto.getItemNo();
			Integer itemQuantity = orderDetailDto.getItemQuantity();
			Integer itemSpecNo = orderDetailDto.getItemSpec();
			
			Item item = itemService.findItemById(itemNo);
			Integer selectItemPrice = item.getPrice() * itemQuantity;
			
			orderTotalPrice += selectItemPrice;
			
			ItemSpecification itemSpec = itemSpecService.findItemSpecById(itemSpecNo);
			
			orderDetailService.insertOrderDetail(insertOrder, item, itemQuantity, itemSpec);
		}
		
		if(paymentMethod == 3) {
			Integer userPoint = userBean.getPoint();
			Integer groupPoint = group.getPoint();
			
			if(userPoint >= orderTotalPrice) {
				userPoint = userPoint - orderTotalPrice;
				groupPoint = groupPoint + orderTotalPrice;
			}
			
			userBean.setPoint(userPoint);
			group.setPoint(groupPoint);
			
			userService.updateUser(userBean);
			groupService.updatePoint(group);
			
		}
		
		
		return "redirect:/group/mygroups";
	}
	
	@GetMapping("/groupbackorders/{eventno}")
	@ResponseBody
	public List<BackToFrontOrder> findOrdersByEventNoBack(@PathVariable("eventno") Integer eventNo) {
		List<BackToFrontOrder> orders = orderService.findOrdersByEventNo(eventNo);
		return orders;
	}
	
	@GetMapping("/orderdetails/{orderno}")
	@ResponseBody
	public List<OrderDetailsDto> getOrderDetails(@PathVariable("orderno") Integer orderNo) {
	    Order order = orderService.findOrderById(orderNo);
	    List<OrderDetail> orderDetails = order.getOrderDetails();
	    List<OrderDetailsDto> orderDetailsDtos = new ArrayList<>();

	    for (OrderDetail orderDetail : orderDetails) {
	        OrderDetailsDto dto = new OrderDetailsDto();
	        dto.setItemNo(orderDetail.getItem().getItemNo());
	        dto.setItemName(orderDetail.getItem().getName());
	        dto.setItemQuantity(orderDetail.getItemQuantity());
	        dto.setSpecValue(orderDetail.getItemSpec().getSpecValue());
	        dto.setItemPrice(orderDetail.getItem().getPrice());
	        orderDetailsDtos.add(dto);
	    }

	    return orderDetailsDtos;
	}
	
	@GetMapping("/groupfrontorders/{eventno}")
	public String findOrdersByEventNoFront(@PathVariable("eventno") Integer eventNo, Model m){
		List<OrderDto> orders = orderService.findOrdersByEventNoFront(eventNo);
		m.addAttribute("orders", orders);
		return "/group/jsp/grouporder.jsp";
	}
}
