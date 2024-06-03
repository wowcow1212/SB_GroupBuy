package com.forum.frontdesk;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.service.LikesService;
import com.forum.service.PostsServiceInterface;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/likesFrontDesk")
public class FrontDeskLikesController {
	
	@Autowired
	private LikesService likesService;
	
	@Autowired
	private PostsServiceInterface postsService;
	
	// 前台 喜歡 及 收回
	@PostMapping("/likeOrUnlike")
	@ResponseBody
	public ResponseEntity<String> likeOrUnlike(@RequestParam("post_no") Integer post_no, HttpSession session) {
	    UserBean userData = (UserBean) session.getAttribute("userData");
	    PostsBean posts = postsService.getPostsNo(post_no);

	    // 如果已存在按讚紀錄，則刪除；否則插入新的按讚紀錄
	    LikesBean newLike = likesService.checkAndInsertLike(userData, posts);

	    // 根據操作結果返回相應的訊息
	    if (newLike != null) {
	        return ResponseEntity.ok("Liked");
	    } else {
	        return ResponseEntity.ok("Unliked");
	    }
	}
	
	// 判定按鈕狀態
	@GetMapping("/getUserLikes")
	@ResponseBody
	public ResponseEntity<String> getUserLikes(@RequestParam("post_no") Integer post_no, HttpSession session) {
	    UserBean userData = (UserBean) session.getAttribute("userData");
	    PostsBean posts = postsService.getPostsNo(post_no);

	    // 檢查使用者對該文章的按讚狀態
	    LikesBean existingLike = likesService.findByUserAndPost(userData, posts);

	    // 根據操作結果返回相應的訊息
	    if (existingLike != null) {
	        return ResponseEntity.ok("Liked");
	    } else {
	        return ResponseEntity.ok("Unliked");
	    }
	}
	
//		//前台 喜歡 及 收回
//				@PostMapping("/likeOrUnlike")
//				public String  likeOrUnlike(
//						 @RequestParam("user_no") Integer user_no,
//					     @RequestParam("post_no") Integer post_no,
//					     Model m,
//					     HttpSession session) {
//				    UserBean userData = (UserBean) session.getAttribute("userData");
//				    PostsBean posts = postsService.getPostsNo(post_no);
//
//				    // 檢查使用者對該文章的按讚狀態
//				    LikesBean existingLike = likesService.findByUserAndPost(userData, posts);
//
//				    if (existingLike != null) {
//				        // 如果已經按讚，則取消按讚
//				    	likesService.checkAndInsertLike(userData, posts); 
//				    } else {
//				        // 如果未按讚，則執行按讚
//				        likesService.checkAndInsertLike(userData, posts); 
//				    }
//				    
//					PostsBean post = postsService.getPostsNo(post_no);
//					
//					List<PostsBean> postsList = new ArrayList<>();
//					
//					postsList.add(post);
//					
//					m.addAttribute("updateSelect", postsList);
//					
//				    return "redirect:/postsFrontDesk/SelectPosts?postsNo="+post_no;
//				}
	}
