package com.zhiyou.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;
import com.zhiyou.utils.MD5Utils;

@Controller
public class adminController {

	@Autowired
	AdminService as;
	
	@RequestMapping("adminLogin")
	public String adminLogin(String accountsAdmin,String passwordAdmin,Model model,HttpSession session){
		Admin admin = as.selectByEmail(accountsAdmin);
		String md5 = MD5Utils.md5(passwordAdmin);
		if(admin.getPassword().equals(md5)){
			session.setAttribute("admin", admin);
			return "background_course";
		}else{
			model.addAttribute("msg", "密码错误");
		}
		return "index";
	}
	
	@RequestMapping("accountsAdminCheck")
	public void accountsAdminCheck(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String accountsAdmin = req.getParameter("accountsAdmin");
		Admin admin = as.selectByEmail(accountsAdmin);
		if(accountsAdmin==""){
			resp.getWriter().write("2");
		}else{
			if(admin==null){
				resp.getWriter().write("0");
			}else{
				resp.getWriter().write("1");
			}
		}
	}
}
