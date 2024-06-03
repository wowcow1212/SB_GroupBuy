package com.forum.frontdesk;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forum.bean.PostsBean;
import com.forum.bean.RepliesBean;
import com.forum.service.PostsServiceInterface;
import com.forum.service.RepliesService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/repliesFrontDesk")
public class FrontDeskRepliesController {

	@Autowired
	private RepliesService repliesService;

	@Autowired
	private PostsServiceInterface postsService;

	// 前台 全部查詢
	@GetMapping("/AllReplies")
	public String getAllReplies(Model m) {

		List<RepliesBean> RepliesList = repliesService.getAllReplies();

		m.addAttribute("repliesM", RepliesList);

		return "/forum/frontdesk/replies/jsp/OnePosts.jsp";
	}
	
	// 前台 單筆查詢 查詢該篇文章的回覆用
	@GetMapping("/PostsReplies")
	public String getPostsReplies(@RequestParam("postsNo") int postsNo, Model m, HttpSession session) {
	   
		PostsBean post = postsService.getPostsNo(postsNo);
		
		UserBean userData = (UserBean) session.getAttribute("userData"); 
	   
		List<RepliesBean> replies = repliesService.findByPostNo(postsNo);
		
		m.addAttribute("userNo",userData.getUserNo());
	   
		m.addAttribute("post", post);
	    
	    m.addAttribute("repliesM", replies);
	    
	    return "/forum/frontdesk/posts/jsp/OnePosts.jsp";
	}

	// 前台 新增
	@PostMapping("/InsertReplies")
	@ResponseBody
	public String insertReplies(@RequestParam("post_no") int post_no, @RequestParam("user_no") int user_no,
			@RequestParam("content") String content, HttpSession session) {

		PostsBean posts = postsService.getPostsNo(post_no);
		UserBean userData = (UserBean) session.getAttribute("userData");

		RepliesBean replies = new RepliesBean();
		replies.setPostsBean(posts);
		replies.setUserBean(userData);
		replies.setContent(content);
		replies.setUpdate_date(new Date());
		System.out.println(replies);
		repliesService.insertReplies(replies);
		
		return "OK";
	}
	
	// 前台刪除
	@PostMapping("/DeleteReplies")
	@ResponseBody
	public String deleteReplies(@RequestParam("repliesNo") String repliesNo) {
	    repliesService.deleteReplies(Integer.parseInt(repliesNo));
	    return "OK"; 
	}

	// 前台 更新用查詢
	@GetMapping("/UpdateSelectReplies")
	public String getRepliesNo(@RequestParam("repliesNo") String repliesNo, Model m) {

		RepliesBean replies = repliesService.getRepliesNo(Integer.parseInt(repliesNo));

		m.addAttribute("updateSelect", replies);

		return "/forum/frontdesk/replies/jsp/UpdateReplies.jsp";

	}
	
	// 前台 更新
	@PutMapping("/UpdateReplies")
	public String updateReplies(@RequestParam("reply_no") int reply_no, @RequestParam("post_no") int post_no,
			@RequestParam("user_no") int user_no, @RequestParam("content") String content,
			@RequestParam("update_date") String update_date, HttpSession session) {

		UserBean userData = (UserBean) session.getAttribute("userData");

		PostsBean posts = postsService.getPostsNo(post_no);

		RepliesBean repliesToUpdate = repliesService.getRepliesNo(reply_no);

		repliesToUpdate.setUserBean(userData);
		repliesToUpdate.setPostsBean(posts);
		repliesToUpdate.setContent(content);
		repliesToUpdate.setUpdate_date(new Date());

		repliesService.updateReplies(repliesToUpdate);

		return "redirect:/postsFrontDesk/SelectPosts?postsNo=" + post_no;
	}

}
