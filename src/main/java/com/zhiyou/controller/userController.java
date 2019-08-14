package com.zhiyou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.User;

@Controller
public class userController {

	@RequestMapping("updateUserShow")
	public String updateUserShow(User user,Model model){
		model.addAttribute("user", user);
		return "updateUser";
	}
	@RequestMapping("userShow")
	public String userShow(User user,Model model){
		model.addAttribute("user", user);
		return "userShow";
	}
	@RequestMapping("updatePicShow")
	public String updatePicShow(User user,Model model){
		model.addAttribute("user", user);
		return "updatePic";
	}
	@RequestMapping("updatePasswordShow")
	public String updatePasswordShow(User user,Model model){
		model.addAttribute("user", user);
		return "updatePassword";
	}
	@RequestMapping("exit")
	public String exit(User user,Model model){
		model.addAttribute("user", user);
		return "index";
	}
	
}
