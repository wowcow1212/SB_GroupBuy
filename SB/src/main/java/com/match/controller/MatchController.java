package com.match.controller;
import java.util.Collections;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.match.bean.MatchBean;
import com.match.service.MatchService;
import com.user.bean.UserBean;
import com.user.service.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
public class MatchController {

    @Autowired
    private MatchService mService;
    
	@Autowired
	private UserService uService;
    
    
    @PostMapping("/like/{user2No}")
    public String likeUser(@PathVariable int user2No, HttpSession session,Model m) {
    	UserBean uBean = (UserBean)session.getAttribute("userData");

        int matchStatus = mService.likeUser(uBean.getUserNo(), user2No);
        
        System.out.println("配對數字 : " + matchStatus);
        if (matchStatus == 2) {
        	System.out.println("===================================配對成功=======================================");
        	
            // 如果 matchStatus 等於 2，代表這兩個用戶匹配成功，則執行相應的處理
            UserBean user1 = uService.getUserData(uBean.getUserNo());
            UserBean user2 = uService.getUserData(user2No);
            
            // 將用戶資料添加到 Model 對象中
            m.addAttribute("user1", user1);
            m.addAttribute("user2", user2);
            
            System.out.println("確保有執行導向success");
            return "match/jsp/SuccessPage.jsp";          // 成功的jsp
        }else {
        	System.out.println("確保有執行導向newMatch");
            return "redirect:/newMatchPage";
        }
    }

    @PostMapping("/dislike/{user2No}")
    public String dislikeUser(@PathVariable int user2No, HttpSession session) {
        UserBean uBean = (UserBean) session.getAttribute("userData");
        
        int matchStatus = mService.dislikeUser(uBean.getUserNo(), user2No);
        
        return "redirect:/newMatchPage";
    }
    
    
    
    // 指定id
    @PostMapping("/likePerson/{user2No}")
    public String likePerson(@PathVariable int user2No, HttpSession session, RedirectAttributes redirectAttributes) {
        UserBean uBean = (UserBean) session.getAttribute("userData");
        int matchStatus = mService.likeUser(uBean.getUserNo(), user2No);
        
        String id = "17"; 
        redirectAttributes.addAttribute("id", id);
        
        return "redirect:/specificMatch";
    }
    

    
    
    @GetMapping("/successful")
    public ResponseEntity<List<MatchBean>> getSuccessfulMatches() {
        List<MatchBean> successfulMatches = mService.getSuccessfulMatches();
        return ResponseEntity.ok(successfulMatches);
    }
    
    
    
    @GetMapping("/queryMatchNo")
    public String queryMatches(@RequestParam(required = false, name = "user1No") Integer user1No,
                               @RequestParam(required = false, name = "matchStatus") Integer matchStatus,
                               Model model) {
        List<MatchBean> matches;
        if (user1No != null && matchStatus != null) {
            matches = mService.findByUser1NoAndMatchStatus(user1No, matchStatus);
        } else if (user1No != null) {
            matches = mService.findByUser1No(user1No);
        } else if (matchStatus != null) {
            matches = mService.findByMatchStatus(matchStatus);
        } else {
            matches = mService.findAll();
        }
        model.addAttribute("matches", matches);
        return "match/jsp/MatchHP.jsp";
    }
    
    
    
    
    // 查詢全部
	@GetMapping("/matchHP")
	public String getAllMatches(Model model) {
	    List<MatchBean> matches = mService.findAll();
	    model.addAttribute("matches", matches);
	    return "match/jsp/MatchHP.jsp";
	}
    
	// 刷新全部頁面
	@GetMapping("/refreshMatches")
	public String refreshMatchesPage() {
	    return "redirect:/matchHP";
	}
	

	
	@GetMapping("/chatPage")
	public String chatPage() {
	    return "chat/ChatIndex.jsp";
	}
	
	
	
	
	
																								  		// session取資料
																								  		// service方法
																								  		// 找到跟自己配對成功的人
																								  		// 因為回傳是list所以要把資料取出來
																								  		// getAttribute  把資料傳出去
	// 配對成功好友頁面																							  // 導向到好友頁面
	@GetMapping("/matchFriends")
	public String getMatchFriends(HttpSession session, Model m) {                                 		// 從 HttpSession 中獲取當前用戶的資料 UserBean,並取出其 userNo 作為參數傳遞給 matchService.getMyMatchedUserBean() 方法
	    UserBean currentUser = (UserBean) session.getAttribute("userData");                       
	    int currentUserNo = currentUser.getUserNo();

	    List<UserBean> matchedUsers = mService.getMyMatchedUserBean(currentUserNo);               		// 調用matchService.getMyMatchedUserBean(currentUserNo) 方法，返回一個 List<UserBean>,其中包含了與當前用戶配對成功的所有用戶資料
	    List<Map<String, Object>> matchedUsersData = new ArrayList<>();                           		// 創建一個新的 List<Map<String, Object>> 列表,用於存放每個配對成功用戶的詳細資訊

	    for (UserBean user : matchedUsers) {                                                      		// 使用迴圈遍歷 matchedUsers 列表,對於每個 UserBean 對象,創建一個 Map<String, Object> 對象,並將需要的屬性值存入該 Map 中
	        Map<String, Object> userData = new HashMap<>();                                       
	        userData.put("nickName", user.getNickName());
	        userData.put("bloodType", user.getBloodType());
	        userData.put("MBTI", user.getMBTI());
	        userData.put("goalNo", user.getGoalNo());
	        userData.put("birthday", user.getBirthday());
	        userData.put("gender", user.getGender());
	        matchedUsersData.add(userData);                                                       		// 將填充好的 Map 對象添加到 matchedUsersData 列表中
	    }
	    m.addAttribute("matchedUsersData", matchedUsersData);                
	    m.addAttribute("localDateTimeDateFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    m.addAttribute("localDateTimeFormat", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));		// 最後,將 matchedUsersData 列表作為模型數據添加到 Model 中

	    return "match/jsp/SuccessPeoplePage.jsp";
	}
	
	
	
	


	
}