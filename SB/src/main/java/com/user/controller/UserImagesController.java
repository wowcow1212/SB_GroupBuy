package com.user.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.apache.http.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.match.bean.TagsBean;
import com.user.bean.UserBean;
import com.user.bean.UserImageBean;
import com.user.dto.LinePayDto;
import com.user.service.UserImageService;
import com.user.service.UserService;
import com.user.util.UserUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserImagesController {
	
	@Autowired
	private UserImageService uImgService;

	@DeleteMapping("/deleteUserImage")
	public String processDeleteAction(@RequestParam("imgNo") Integer imgNo, Model m) {
		UserImageBean seleteUserImageBean = uImgService.seleteUserImageBean(imgNo);
		if(seleteUserImageBean != null) {
			uImgService.deleteUserImage(seleteUserImageBean);
		}

		return "redirect:/userPhotos";
	}
}
