package com.zhiyou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.User;

@Controller
public class webController {

	@RequestMapping("index")
	public String index(User user,Model model){
		model.addAttribute("user", user);
		return "index";
	}
}
