package com.forum.frontdesk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.PostsBean;
import com.forum.bean.ReportsBean;
import com.forum.service.PostsService;
import com.forum.service.ReportsService;
import com.user.bean.UserBean;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/reportsFrontDesk")
public class FrontDeskReportsController {

	@Autowired
	private ReportsService reportsService;

	@Autowired
	private PostsService postsService;

	// 前台 新增查詢
	@GetMapping("/SelectReportsPosts")
	public String getPostsNo(@RequestParam("postsNo") String postsNo, HttpSession session, Model model) {
		PostsBean posts = postsService.getPostsNo(Integer.parseInt(postsNo));
		UserBean userData = (UserBean) session.getAttribute("userData");
		model.addAttribute("reportsPosts", posts);
		model.addAttribute("userData", userData);
		return "/forum/frontdesk/reports/jsp/InsertReports.jsp";
	}

	// 前台 新增檢舉
	@PostMapping("/InsertReports")
	public String insertReports(
			@RequestParam("post_no") Integer post_no, 
			@RequestParam("reason") String reason,
			Model m,		
			HttpSession session) {

		// 從 session 中獲取當前用訊息
		UserBean userData = (UserBean) session.getAttribute("userData");

		// 獲取文章信息
		PostsBean posts = postsService.getPostsNo(post_no);

		// 檢查是否以檢舉過
		ReportsBean existingReports = reportsService.findByUserAndPost(userData, posts);

		if (existingReports != null) {
			 m.addAttribute("postNo", posts);
			return "/forum/frontdesk/reports/jsp/RepeatedReports.jsp";
		} else {
			// 未檢舉過 執行檢舉
			reportsService.checkAndInsertReports(userData, posts, reason);
			return "redirect:/postsFrontDesk/SelectPosts?postsNo=" + post_no;
		}
	}
}
