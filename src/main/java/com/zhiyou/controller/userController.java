package com.zhiyou.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.User;
import com.zhiyou.service.PictureService;
import com.zhiyou.service.UserService;
import com.zhiyou.utils.MD5Utils;
import com.zhiyou.utils.VideoResult;

@Controller
public class userController {

	@Autowired
	UserService us;


	@RequestMapping("updateUserShow")
	public String updateUserShow(String accounts,Model model){
		User user = us.selectByEmail(accounts);
		model.addAttribute("user", user);
		return "updateUser";
	}
	@RequestMapping("userShow")
	public String userShow(String accounts,Model model){
		User user = us.selectByEmail(accounts);
		model.addAttribute("user", user);
		return "userShow";
	}
	@RequestMapping("updatePicShow")
	public String updatePicShow(String accounts,Model model){
		User user = us.selectByEmail(accounts);
		model.addAttribute("user", user);
		return "updatePic";
	}
	@RequestMapping("updatePasswordShow")
	public String updatePasswordShow(String accounts,Model model){
		User user = us.selectByEmail(accounts);
		model.addAttribute("user", user);
		return "updatePassword";
	}
	//退出功能
	@RequestMapping("exit")
	public String exit(){
		
		return "index";
	}
	//返回首页
	@RequestMapping("home")
	public String home(String accounts,Model model){
		User user = us.selectByEmail(accounts);
		model.addAttribute("user", user);
		return "index";
	}

	//修改密码
	@RequestMapping("updatePassword")
	public String updatePassword(String password,String accounts){
		User user = us.selectByEmail(accounts);
		String md5 = MD5Utils.md5(password);
		user.setPassword(md5);
		us.update(user);
		return "index";
	}
	
	//检验原密码是否正确
	@RequestMapping("checkOldPassword")
	public void checkOldPassword(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String oldPassword = req.getParameter("oldPassword");
		String accounts = req.getParameter("accounts");
		System.out.println(accounts+oldPassword);
		User user = us.selectByEmail(accounts);
		String md5 = MD5Utils.md5(user.getPassword());
		if(oldPassword.equals(md5)){
			resp.getWriter().write("1");
		}else{
			resp.getWriter().write("0");
		}
	}

	//检验新密码是否一致
	@RequestMapping("checkRPassword")
	public void checkRPassword(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String newPassword = req.getParameter("newPassword");
		String newRPassword = req.getParameter("newRPassword");
		if(newPassword.equals(newRPassword)){
			resp.getWriter().write("0");
		}else{
			resp.getWriter().write("1");
		}
	}
	
	@Autowired
	PictureService ps;
	//修改頭像
	@RequestMapping("updatePic")
	public String updatePic(MultipartFile file,String accounts,Model model){
		User user = us.selectByEmail(accounts);
		Map map = ps.uploadPicture(file);
		String imgurl = (String) map.get("url");
		user.setImgurl(imgurl);
		us.update(user);
		model.addAttribute("user", user);

		return "updatePic";
	}

	//修改用戶信息
	@RequestMapping("updateUser")
	public String updateUser(String accounts,String nickname,String sex,String birthday,String prov,String city,Model model){
		User user = us.selectByEmail(accounts);
		String address = prov+"-"+city;
		user.setNickname(nickname);
		user.setSex(sex);
		user.setBirthday(birthday);
		user.setAddress(address);
		us.update(user);
		model.addAttribute("user", user);
		System.out.println(user);
		return "userShow";
	}
}
