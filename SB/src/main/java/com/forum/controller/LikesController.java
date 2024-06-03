package com.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.service.LikesService;
import com.forum.service.PostsServiceInterface;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/likes")
public class LikesController {

	@Autowired
	private LikesService likesService;
	
	@Autowired
	private PostsServiceInterface postsService;

	//後台 所有紀錄
	@GetMapping("/AllPostslikes")
	public String getAllPostsLikes(Model m) {

		List<LikesBean> PostsLikesList = likesService.getAllPostsLikes();

		m.addAttribute("PostsLikesListM", PostsLikesList);

		return "/forum/backstage/likes/jsp/SelectLikes.jsp";
	}
	
	//後台 單筆查詢 查詢該篇文章的喜歡紀錄用
	@GetMapping("/PostsLikes")
	public String getPostsLikes(@RequestParam("postsNo") int postsNo, Model m) {

		PostsBean post = postsService.getPostsNo(postsNo);

		List<LikesBean> Likes = likesService.findByPostNo(postsNo);

		m.addAttribute("post", post);

		m.addAttribute("PostsLikesListM", Likes);

		return "/forum/backstage/likes/jsp/SelectLikes.jsp";
	}
	
	//前台 喜歡 及 收回
	@PostMapping("/likeOrUnlike")
	public String  likeOrUnlike(
			 @RequestParam("user_no") Integer user_no,
		     @RequestParam("post_no") Integer post_no, 			
			HttpSession session) {
	    UserBean userData = (UserBean) session.getAttribute("userData");
	    PostsBean posts = postsService.getPostsNo(post_no);

	    // 檢查使用者對該文章的按讚狀態
	    LikesBean existingLike = likesService.findByUserAndPost(userData, posts);

	    if (existingLike != null) {
	        // 如果已經按讚，則取消按讚
	    	likesService.checkAndInsertLike(userData, posts); 
	    } else {
	        // 如果未按讚，則執行按讚
	        likesService.checkAndInsertLike(userData, posts); 
	    }
	    return"redirect:/posts/AllPosts(要跳回該篇文章)";
	}
}
