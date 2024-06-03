package com.activity.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.activity.bean.EventBean;
import com.activity.service.EventService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
//@Controller
public class EventController {

	private final EventService eventService;
	
	 public EventController(EventService eventService) {
	        this.eventService = eventService;
	
	 }
//    @Autowired
//    private EventService eventService;

    // 查询單筆事件
    @GetMapping("/OneEvent")
    public ModelAndView findEventByEventNo(@RequestParam("eventNo") int eventNo) {
        ModelAndView mav = new ModelAndView("activity/DisplayAllEvent.jsp");
        try {
        	EventBean event = eventService.findEventByEventNo(eventNo);
            List<EventBean> events = new ArrayList<>();
            events.add(event);
            mav.addObject("events", events);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 前端使用者介面 - EventDetail.jsp
    @GetMapping("/EventDetail")
    public ModelAndView getEventDetail(@RequestParam("eventNo") int eventNo) {
        ModelAndView mav = new ModelAndView("activity/EventDetail.jsp");
        try {
            EventBean event = eventService.findEventByEventNo(eventNo);
            mav.addObject("event", event);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 活動列表
    @GetMapping("/EventList")
    public ResponseEntity<?> getEventList(HttpServletRequest request) {
        try {
            List<EventBean> events = eventService.findAllEvents();
            List<Map<String, String>> eventsWithImages = new ArrayList<>();

            for (EventBean event : events) {
                Map<String, String> eventMap = new HashMap<>();
                String imagePath = event.getImagePath();
                String fullImageUrl = request.getContextPath() + "/localimages/" + imagePath;
                eventMap.put("eventNo", event.getEventNo().toString());
                eventMap.put("title", event.getTitle());
                eventMap.put("description", event.getDescription());
                eventMap.put("imageUrl", fullImageUrl);
                eventsWithImages.add(eventMap);
            }

            return ResponseEntity.ok(eventsWithImages);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
        }
    }
    
    
//    // 處理我要報名按鈕 - InsertRegistrations.jsp
//    @GetMapping("/activityInsertRegistrations")
//    public String insertRegistrations(@RequestParam("eventNo") int eventNo, Model model) {
//        // 根據 eventNo 獲取相關數據
//        EventBean event = eventService.findEventByEventNo(eventNo);
//
//        // 將數據添加到模型中
//        model.addAttribute("event", event);
//        model.addAttribute("hostUserNo", event.getHostUserNo()); 
//
//        // 返回 InsertRegistrations.jsp
//        return "activity/InsertRegistrations";
//    }

    
    
    // 查询所有事件
    @GetMapping("/AllEvents")
    public ModelAndView findAllEvents() {
        ModelAndView mav = new ModelAndView("activity/DisplayAllEvent.jsp");
        try {
            List<EventBean> events = eventService.findAllEvents();
            mav.addObject("events", events);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 新增事件
    @PutMapping("/InsertEvent")
    @ResponseBody
    public ModelAndView insertEvent(
			@RequestParam("title") String title,
			@RequestParam("description") String description,
			@RequestParam("activityTime") LocalDateTime activityTime,
			@RequestParam("signupStartTime") LocalDateTime signupStartTime,
			@RequestParam("signupEndTime") LocalDateTime signupEndTime,
			@RequestParam("location") String location,
			@RequestParam("status") String status,
			@RequestParam("imagePath") MultipartFile mf,
			HttpServletRequest request
    		) {
        ModelAndView mav = new ModelAndView("redirect:AllEvents");
        try {
        	  String filename = mf.getOriginalFilename();
              String extension = filename.substring(filename.lastIndexOf('.'));
              String fileDir = "C:/temp/upload/";
              String newFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + new Random().nextInt(10000) + extension;
              File pathexist = new File(fileDir);
              if(!pathexist.exists()) {
                  pathexist.mkdirs();
              }
              File fileDirPath = new File(fileDir, newFileName);
              mf.transferTo(fileDirPath);
        	
        	EventBean event = new EventBean();
        	
        	HttpSession session = request.getSession();
    		UserBean userbean = (UserBean)session.getAttribute("userData");
        	
        	event.setHostUserNo(userbean.getUserNo());
        	event.setTitle(title);
        	event.setDescription(description);						
        	event.setActivityTime(activityTime);
        	event.setSignupStartTime(signupStartTime);	       	        	        
			event.setSignupEndTime(signupEndTime);
			event.setLocation(location);
			event.setStatus(status);
			event.setImagePath(newFileName);
			eventService.insert(event);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 删除事件
    @DeleteMapping("/DeleteEvent")
    public ModelAndView deleteEventByEventNo(@RequestParam("eventNo") int eventNo) {
        ModelAndView mav = new ModelAndView("redirect:/AllEvents");
        try {
            eventService.deleteEventByEventNo(eventNo);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 查询欲更新得資料
    @GetMapping("/getEventDataForUpdate")
    public ModelAndView getEventDataForUpdate(@RequestParam("eventNo") Integer eventNo) {
        ModelAndView mav = new ModelAndView("activity/UpdateEvent.jsp");
        try {
        	EventBean event = eventService.findEventByEventNo(eventNo);

            mav.addObject("event", event);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }
    
    // 更新事件
   
    @PutMapping("/UpdateEvent")
    public ModelAndView updateEvent(

    		@RequestParam("eventNo") Integer eventNo,
    		@RequestParam("hostUserNo") Integer hostUserNo, 
    		@RequestParam("title") String title,
    		@RequestParam("description") String description,
    		@RequestParam("activityTime") LocalDateTime activityTime,
    		@RequestParam("signupStartTime") LocalDateTime signupStartTime,
    		@RequestParam("signupEndTime") LocalDateTime signupEndTime,
    		@RequestParam("location") String location,
    		@RequestParam("status") String status,	
    		@RequestParam("imagePath") MultipartFile mf,
    		HttpServletRequest request
    		) {
        ModelAndView mav = new ModelAndView("redirect:/AllEvents");
       
        try {
        	EventBean event = eventService.findEventByEventNo(eventNo);
        	if(!mf.isEmpty())
        	{
        		
        		String filename = mf.getOriginalFilename();
        		String extension = filename.substring(filename.lastIndexOf('.'));
        		String fileDir = "C:/temp/upload/";
        		String newFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + new Random().nextInt(10000) + extension;
        		File pathexist = new File(fileDir);
        		if (!pathexist.exists()) {
        			pathexist.mkdirs();
        		}
        		File fileDirPath = new File(fileDir, newFileName);
        		mf.transferTo(fileDirPath);
        		
        		
        		event.setImagePath(newFileName);
        	}
             
             
            HttpSession session = request.getSession();
             
        	event.setTitle(title);
        	event.setDescription(description);
        	event.setActivityTime(activityTime);
        	event.setSignupStartTime(signupStartTime);
        	event.setSignupEndTime(signupEndTime);
        	event.setLocation(location);
        	event.setStatus(status);
        	eventService.update(event);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

}
