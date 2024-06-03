package com.forum.frontdesk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forum.bean.CategoriesBean;
import com.forum.service.CategoriesServiceInterface;

@Controller
@RequestMapping("/categoriesFrontDesk")
public class FrontDeskCategoriesController {

	@Autowired
	private CategoriesServiceInterface categoriesService;

	//前台 單筆查詢
	@GetMapping("/OneCategories")
	public String getCategoryKeyword(@RequestParam("categoryKeyword") String categoryKeyword, Model m) {
		List<CategoriesBean> categoriesList = categoriesService.getCategoryKeyword(categoryKeyword);
		if (categoriesList != null && !categoriesList.isEmpty()) {
			m.addAttribute("CategoriesM", categoriesList);
		} else {
			m.addAttribute("noData", true);
		}
		return "/forum/backstage/categories/jsp/SelectCategories.jsp";
	}

	//前台 全部查詢
	@GetMapping("/CategoriesAll")
	public String getAllCategories(Model m) {

		List<CategoriesBean> categoriesList = categoriesService.getAllCategories();

		if (categoriesList != null && !categoriesList.isEmpty()) {
			m.addAttribute("CategoriesM", categoriesList);
		} else {
			m.addAttribute("noData", true);
		}
		return "/forum/backstage/categories/jsp/SelectCategories.jsp";
	}
}
