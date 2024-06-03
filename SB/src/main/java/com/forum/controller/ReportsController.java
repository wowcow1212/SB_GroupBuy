package com.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
@RequestMapping("/reports")
public class ReportsController {

	@Autowired
	private ReportsService reportsService;

	@Autowired
	private PostsService postsService;

	//後台 全部查詢
	@GetMapping("/AllReports")
	public String getAllReports(Model m) {
		
		
		List<ReportsBean> reportsList = reportsService.getAllReports();

		m.addAttribute("reportsM", reportsList);

		return "/forum/backstage/reports/jsp/SelectAllReports.jsp";
	}

	//後台 單筆查詢 查詢該篇文章的檢舉用
	@GetMapping("/PostsReports")
	public String getPostsReports(@RequestParam("postsNo") int postsNo, Model m) {

		PostsBean post = postsService.getPostsNo(postsNo);

		List<ReportsBean> reports = reportsService.findByPostNo(postsNo);

		m.addAttribute("post", post);

		m.addAttribute("reportsM", reports);

		return "/forum/backstage/reports/jsp/SelectReports.jsp";
	}

	//後台 刪除
	@DeleteMapping("/DeleteReports")
	public String deleteReports(
			@RequestParam("reportNo") String reportNo, 
			@RequestParam("postNo") String postNo,
			@RequestParam("categoryNo") String categoryNo
			) {

		reportsService.deleteReports(Integer.parseInt(reportNo));

		postsService.deletePostAndReplies(Integer.parseInt(postNo));
		
		System.out.println(categoryNo);

		return "redirect:/posts/CategoriesPosts?categoryNo="+categoryNo;

	}
	
	@DeleteMapping("/DeleteReportsForAll")
	public String deleteReportsForAll(
			@RequestParam("reportNo") String reportNo, 
			@RequestParam("postNo") String postNo,
			@RequestParam("categoryNo") String categoryNo
			) {

		reportsService.deleteReports(Integer.parseInt(reportNo));

		postsService.deletePostAndReplies(Integer.parseInt(postNo));
		
		System.out.println(categoryNo);

		return "redirect:/reports/AllReports";

	}
	
	//前台 新增查詢
	@GetMapping("/SelectReportsPosts")
	public String getPostsNo(@RequestParam("postsNo") String postsNo, HttpSession session, Model model) {
		PostsBean posts = postsService.getPostsNo(Integer.parseInt(postsNo));
		UserBean userData = (UserBean) session.getAttribute("userData");
		model.addAttribute("reportsPosts", posts);
		model.addAttribute("userData", userData);
		return "/forum/backstage/reports/jsp/InsertReports.jsp";
	}
	
	//前台 新增檢舉
	@PostMapping("/InsertReports")
	public String insertReports(@RequestParam("post_no") Integer post_no, @RequestParam("reason") String reason,
			HttpSession session, Model m) {

		// 從 session 中獲取當前用訊息
		UserBean userData = (UserBean) session.getAttribute("userData");

		// 獲取文章信息
		PostsBean posts = postsService.getPostsNo(post_no);

		// 檢查是否以檢舉過
		ReportsBean existingReports = reportsService.findByUserAndPost(userData, posts);

		if (existingReports != null) {
			return "/forum/backstage/reports/jsp/RepeatedReports.jsp";
		} else {
			// 未檢舉過 執行檢舉
			reportsService.checkAndInsertReports(userData, posts, reason);
			return "redirect:/posts/detail?post_no=(要跳回該篇文章)" + post_no;
		}
	}
}
