package com.activity.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.activity.bean.EventBean;
import com.activity.bean.EventRegistrationsBean;
import com.activity.service.EventRegistrationsService;
import com.activity.service.EventService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class EventRegistrationsController {

    @Autowired
    private EventRegistrationsService eventRegistrationsService;

    @Autowired
    private EventService eventService;

    // 查詢單筆註冊
    @GetMapping("/OneRegistration")
    public ModelAndView findByRegistrationID(@RequestParam("eventNo") int eventNo) {
        ModelAndView mav = new ModelAndView("activity/EventDetail.jsp");
        try {
        	System.out.println(eventNo);
            Optional<EventRegistrationsBean> registrationOptional = eventRegistrationsService.findByRegistration(eventNo);
            if (registrationOptional.isPresent()) {
                EventRegistrationsBean registration = registrationOptional.get();
                List<EventRegistrationsBean> registrations = new ArrayList<>();
                registrations.add(registration);
                mav.addObject("registrations", registrations);
                mav.addObject("event", registration.getEvent());
            } else {
                mav.addObject("errorMessage", "No registration found with ID " + eventNo);
            }
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 查詢所有註冊
    @GetMapping("/AllRegistrations")
    public ModelAndView findRegistrations() {
        ModelAndView mav = new ModelAndView("activity/DisplayAllRegistrations.jsp");
        try {
            List<EventRegistrationsBean> registrations = eventRegistrationsService.findAllRegistrations();
            System.out.println("Registrations size: " + registrations.size()); 
            mav.addObject("registrations", registrations);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    
    // 處理我要報名按鈕 - InsertRegistrations.jsp
    @GetMapping("/activityInsertRegistrations")
    public ModelAndView insertRegistrations(@RequestParam("eventNo") int eventNo) {
        ModelAndView mav = new ModelAndView("activity/InsertRegistrations.jsp");
        try {
            // 根據 eventNo 獲取相關數據
            EventBean event = eventService.findEventByEventNo(eventNo);

            // 將數據添加到 ModelAndView 中
            mav.addObject("event", event);
            mav.addObject("hostUserNo", event.getHostUserNo());
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

 // 新增註冊
    @PostMapping("/InsertRegistrations")
    public ModelAndView insert(
            @RequestParam("eventNo") int eventNo,
            @RequestParam("participantName") String participantName,
            @RequestParam("contactInfo") String contactInfo,
            @RequestParam("registrationTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime registrationTime,
            HttpServletRequest request) {
    	System.out.println(participantName);
    	System.out.println(contactInfo);
        ModelAndView mav = new ModelAndView();
        try {
            // 從 session 中獲取 userNo
            HttpSession session = request.getSession();
            UserBean userBean = (UserBean) session.getAttribute("userData");
//            if (userBean == null) {
//                mav.setViewName("activity/DisplayAllRegistrations.jsp");
//                mav.addObject("errorMessage", "您尚未登入。");
//                return mav;
//            }
            int userNo = userBean.getUserNo();
//            int userNo = 1;
//            System.out.println(userNo);
            // 檢查是否已註冊
            List<EventRegistrationsBean> existingRegistrations = eventRegistrationsService.findByEventNoAndUserNo(eventNo, userNo);
            System.out.println(existingRegistrations);
            if (existingRegistrations != null && !existingRegistrations.isEmpty()) {
                mav.setViewName("activity/DisplayAllRegistrations.jsp");
                mav.addObject("errorMessage", "您已經報名過此活動。");
            } else {
                EventRegistrationsBean registration = new EventRegistrationsBean();
                registration.setEventNo(eventNo);
                registration.setUserNo(userNo);
                registration.setParticipantName(participantName);
                registration.setContactInfo(contactInfo);
                registration.setRegistrationTime(registrationTime);
                eventRegistrationsService.insert(registration);
                mav.setViewName("redirect:AllRegistrations");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }


    
    
    // 刪除註冊
    @DeleteMapping("/DeleteRegistrations")
    public ModelAndView deleteRegistrationByRegistrationID(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView();
        try {
            eventRegistrationsService.deleteEventByEventNo(registrationID);
            mav.setViewName("redirect:/AllRegistrations");
        } catch (Exception e) {
            e.printStackTrace();
            mav.setViewName("error");
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }


    // 查詢欲更新的資料
    @GetMapping("/getRegistrationsDataForUpdate")
    public ModelAndView getRegistrationDataForUpdate(@RequestParam("registrationID") int registrationID) {
        ModelAndView mav = new ModelAndView("activity/UpdateRegistration.jsp");
        try {
            Optional<EventRegistrationsBean> registrationOptional = eventRegistrationsService.findByRegistration(registrationID);
            if (registrationOptional.isPresent()) {
                mav.addObject("registration", registrationOptional.get());
                mav.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
            } else {
                mav.addObject("errorMessage", "No registration found with ID " + registrationID);
            }
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 更新註冊
    @PutMapping("/UpdateRegistrations")
    public ModelAndView updateRegistrations(
            @RequestParam("registrationID") int registrationID,
            @RequestParam("participantName") String participantName,
            @RequestParam("contactInfo") String contactInfo,
            @RequestParam("registrationTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime registrationTime) {

        ModelAndView mav = new ModelAndView("redirect:/AllRegistrations");
        try {
            Optional<EventRegistrationsBean> registrationOptional = eventRegistrationsService.findByRegistration(registrationID);
            if (registrationOptional.isPresent()) {
                EventRegistrationsBean registration = registrationOptional.get();
                registration.setParticipantName(participantName);
                registration.setContactInfo(contactInfo);
                registration.setRegistrationTime(registrationTime);
                eventRegistrationsService.update(registration);
            } else {
                mav.addObject("errorMessage", "No registration found with ID " + registrationID);
            }
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "An error occurred: " + e.getMessage());
        }
        return mav;
    }

    // 返回所有活動和註冊資料的API，避免和EventController衝突
    @GetMapping("/EventRegistrationsList")
    public List<Map<String, Object>> getAllEventsWithRegistrations() {
        List<EventRegistrationsBean> registrations = eventRegistrationsService.findAllRegistrations();
        List<Map<String, Object>> response = new ArrayList<>();

        for (EventRegistrationsBean registration : registrations) {
            Map<String, Object> map = new HashMap<>();
            map.put("registrationID", registration.getRegistrationID());
            map.put("eventNo", registration.getEventNo());
            
            if (registration.getEvent() != null) {
                map.put("title", registration.getEvent().getTitle());
                map.put("description", registration.getEvent().getDescription());
                map.put("location", registration.getEvent().getLocation());
                map.put("imagePath", registration.getEvent().getImagePath());
                map.put("activityTime", registration.getEvent().getActivityTime());
                map.put("signupStartTime", registration.getEvent().getSignupStartTime());
                map.put("signupEndTime", registration.getEvent().getSignupEndTime());
                map.put("status", registration.getEvent().getStatus());
            } else {
                map.put("title", null);
                map.put("description", null);
                map.put("location", null);
                map.put("imagePath", null);
                map.put("activityTime", null);
                map.put("signupStartTime", null);
                map.put("signupEndTime", null);
                map.put("status", null);
            }

            response.add(map);
        }

        return response;
    }

   
    
}
