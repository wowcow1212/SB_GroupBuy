package com.match.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.bean.UserBean;
import com.match.service.IUserService;

@Controller
public class UserControllerForMatch {

    @Autowired
    private IUserService iUService;

    // 查詢全部 for GoalsHP.jsp
    @GetMapping("/userHP")
    public String showUserEditPage(Model model) {
        List<UserBean> user = iUService.findAll();
        model.addAttribute("users", user); // UserHP.jsp : List<UserBean> users = (List<UserBean>) request.getAttribute("users");
        System.out.println("usersize" + user.size());
        return "match/user/UserHP.jsp";
    }

    // 刷新全部頁面
    @GetMapping("/refreshuser")
    public String refreshUserPage() {
        return "redirect:userHP";
    }

    // 查詢欲修改的資料
    @GetMapping("/updateUser/{userno}")
    public String processQueryUpdateDataById(@PathVariable("userno") int userNo, Model model) {
        UserBean resultBean = iUService.getById(userNo);
        model.addAttribute("userBean", resultBean);
        return "user/jsp/UserHP.jsp"; // 或其他適當的視圖名稱
    }

    // 修改
    @PutMapping("/updateUser/{userno}")
    public String processUpdateUser(@PathVariable("userno") int userNo,
                                    @RequestParam(required = false) String nickName,
                                    @RequestParam(required = false) Integer goalNo,
                                    @RequestParam(required = false) String bloodType,
                                    @RequestParam(required = false) String mbti) {

        UserBean existingUser = iUService.getById(userNo);

        if (nickName != null) {
            existingUser.setNickName(nickName);
        }
        if (goalNo != null) {
            existingUser.setGoalNo(goalNo);
        }
        if (bloodType != null) {
            existingUser.setBloodType(bloodType);
        }
        if (mbti != null) {
            existingUser.setMBTI(mbti);
        }

        iUService.updateUser(existingUser);

        return "redirect:/userHP";
    }
    
    
    
    
    
    
    
}