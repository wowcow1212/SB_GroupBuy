package com.match.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.match.bean.GoalsBean;
import com.match.service.IGoalsService;

@Controller // 用於標記一個類別是一個控制器(Controller)組件 =>  // @RequestMapping或@GetMapping、@PostMapping等註解來映射特定的HTTP請求路徑
public class GoalsController {

	@Autowired
	private IGoalsService iGService; // 有寫介面一定要帶入IGoalsService

	
	// 查詢編號+姓名 for GoalsHP.jsp
	@GetMapping("/queryGoalNo")
	public String queryGoals(@RequestParam(required = false, name = "goalNo") Integer goalNo,
	                         @RequestParam(required = false, name = "goalName") String goalName,
	                         Model model) {
	    List<GoalsBean> goals;
	    if (goalNo != null) {
	        GoalsBean bean = iGService.getById(goalNo);
	        goals = bean != null ? Collections.singletonList(bean) : Collections.emptyList();
	    } else if (goalName != null && !goalName.isEmpty()) {
	        goals = iGService.findByGoalName(goalName);
	    } else {
	        goals = iGService.findAll();
	    }
	    model.addAttribute("goals", goals);
	    return "match/jsp/GoalsHP.jsp";
	}

	

	// 查詢全部 for GoalsHP.jsp
	@GetMapping("/goalsHP")
	public String showGoalsEditPage(Model model) {
		List<GoalsBean> goals = iGService.findAll();
		model.addAttribute("goals", goals);
		System.out.println("goalssize" + goals.size());
		return "match/jsp/GoalsHP.jsp";
	}
	

	// 刷新全部頁面
	@GetMapping("/refreshGoals")
	public String refreshGoalsPage() {
		return "redirect:goalsHP";
	}



	// 新增 ...?
	@PostMapping("/goals")
	@ResponseBody           // 直接返回 JSON 或 XML 格式的數據 //新增不用id
	public String processInsertAction(@RequestParam("goalNameParam") String goalNameParam) { // 必須精確匹配請求中對應的參數名稱 => // input type="text" // name="goalNameParam"																				
		GoalsBean insertBean = new GoalsBean(goalNameParam);                                 // 注意JavaBean的初始化，必須要有同樣數量的屬性 ...?
		iGService.insert(insertBean);                                                        // iGService，上面定義的
		return "redirect:goalsHP";   //..?
	}

	
	//刪除
	@DeleteMapping("/deleteGoal/{goalno}")

	public String processFindAllAction(@PathVariable("goalno") int goalno) {
		iGService.deleteById(goalno);
		return "redirect:/goalsHP";
	}
	
	//批量刪除
	@PostMapping("/deleteBatchGoals")
	public String deleteBatchGoals(@RequestParam("goalNos") List<Integer> goalNos) {
	    if (!goalNos.isEmpty()) {
	        for (Integer goalNo : goalNos) {
	            iGService.deleteById(goalNo);
	        }
	    }
	    return "redirect:/goalsHP";
	}
	
	
	//查詢欲修改的資料
	@GetMapping("/updateGoal/{goalno}")
	public String processQueryUpdateDataById(@PathVariable("goalno") int goalno, Model model) {
	    GoalsBean resultBean = iGService.getById(goalno);
	    model.addAttribute("goalBean", resultBean);
	    return "match/jsp/GoalsHP.jsp"; // 或其他適當的視圖名稱
	}

	// 修改
	@PutMapping("/updateGoal/{goalno}")
	public String processFindAllAction(@PathVariable("goalno") int goalno,
	                                   @RequestParam("goalName") String goalName) {
	    GoalsBean updateBean = new GoalsBean(goalno, goalName);
	    iGService.update(updateBean);
	    return "redirect:/goalsHP";
	}
	
	
	
	
	//-------Test
	
	
	
	// 查詢編號 for GoalsHP.jsp
//	@GetMapping("/queryGoalNo")   //...!
//	public String queryGoals(@RequestParam(required = false, name = "goalNo") Integer goalNo, Model model) {
//	    List<GoalsBean> goals;
//	    if (goalNo != null) {
//	        GoalsBean bean = iGService.getById(goalNo);
//	        goals = bean != null ? Collections.singletonList(bean) : Collections.emptyList();
//	    } else {
//	        goals = iGService.findAll();
//	    }
//	    model.addAttribute("goals", goals);
//	    return "match/jsp/GoalsHP.jsp"; // 替換為實際的JSP文件路径
//	}

	
	// 查詢名字 for GoalsHP.jsp
//	@GetMapping("/queryGoalName")
//	public String processQueryByGoalName(@RequestParam(name = "goalName", required = false) String goalName, Model model) {
//	    List<GoalsBean> goals;
//	    if (goalName != null && !goalName.isEmpty()) {
//	        goals = iGService.findByGoalName(goalName);
//	    } else {
//	        goals = iGService.findAll();
//	    }
//	    model.addAttribute("goals", goals);
//	    return "match/jsp/GoalsHP.jsp";
//	}
	
	
	// 查詢 (編號)
//	@GetMapping("/goals/{goalno}") // ..?
//	@ResponseBody
//	public String processQueryById(@PathVariable("goalno") int gno) { // 此注解將HTTP請求的URL模式中的{profilesid}變數映射到方法的參數pid上，Spring將自動解析URL中的{profilesid}並將其轉換為整數
//		GoalsBean resultBean = iGService.getById(gno); // (gno) ...?
//
//		if (resultBean != null) {
//			return "Result:" + resultBean.getGoalNo() + " " + resultBean.getGoalName();
//		}
//
//		return "no result";
//	}
	
	
}