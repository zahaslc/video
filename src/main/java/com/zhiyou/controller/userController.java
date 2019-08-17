package com.zhiyou.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.ImageReturnType;
import com.zhiyou.model.User;
import com.zhiyou.service.PictureService;
import com.zhiyou.service.UserService;
import com.zhiyou.utils.MD5Utils;
import com.zhiyou.utils.MainUtil;
import com.zhiyou.utils.verifyCodeUtils;

@Controller
public class userController implements Serializable{

	private static final long serialVersionUID = 1L;

	@Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private RedisTemplate redisTemplate;
	
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
	//退出，则清除user在session中的信息
	@RequestMapping("exit")
	public String exit(HttpServletRequest req){
		req.getSession().invalidate();
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

		User user = us.selectByEmail(accounts);
		String md5 = MD5Utils.md5(oldPassword);
		if(md5.equals(user.getPassword())){
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
		ImageReturnType returnType = ps.upload(file);
		
		String imgurl = returnType.getUrl();
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
	
	//登录用户的账号是否存在(找回密码邮箱验证)
	@RequestMapping("userAccountsLogin")
	public void userAccountsLogin(HttpServletRequest req,HttpServletResponse resp) throws IOException{

		String accountsCheckLogin = req.getParameter("accountsCheckLogin");
		System.out.println(accountsCheckLogin);
		User user = us.selectByEmail(accountsCheckLogin);
		if(accountsCheckLogin != ""){
			if(null == user){
				resp.getWriter().write("1");
			}else{
				resp.getWriter().write("0");
			}
		}else{
			resp.getWriter().write("2");
		}
	}

	//登录用户(将用户信息存入cookie，10天后自动销毁，或者手动销毁)
	@RequestMapping("login")
	public String login(String accounts,String password,Model model,HttpSession session){
		User user = us.selectByEmail(accounts);
		String md5 = MD5Utils.md5(password);
		if(md5.equals(user.getPassword())){
			//model.addAttribute("msg", "密码正确");
			//登陆成功，则将user信息存入session中
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(10*24*60*60*1000);//设置session存在时间10天
			model.addAttribute("user", user);
			return "index";
		}else{
			model.addAttribute("msg", "密码错误");
		}
		return "index";
	}
	
	@RequestMapping("findPassword")
	public String findPassword(){
		return "findPassword";
	}

	@RequestMapping("updateFindPassword")
	public String updateFindPassword(String accounts,String psw){
		User user = us.selectByEmail(accounts);
		String md5 = MD5Utils.md5(psw);
		user.setPassword(md5);
		us.update(user);
		return "index";
	}
	
	//用户注册
	@RequestMapping("insertUser")
	public String insertUser(String accounts,String psw){
		User user = new User();
		String md5 = MD5Utils.md5(psw);
		user.setAccounts(accounts);
		user.setPassword(md5);
		user.setCreatetime(new Date());
		us.add(user);
		return "index";
	}

	//用户注册验证(邮箱)
	@RequestMapping("user_accounts_reg")
	public void user_accounts_reg(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String accountsCheck = req.getParameter("accountsCheck");
		User user = us.selectByEmail(accountsCheck);
		if(accountsCheck == ""){
			resp.getWriter().write("1");
		}else{
			if(user == null){
				resp.getWriter().write("0");
			}else{
				resp.getWriter().write("2");
			}
		}
	}

	//用户注册验证(密码)
	//检验新密码是否一致
	@RequestMapping("checkPassword")
	public void checkPassword(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String psw = req.getParameter("psw");
		String psw_again = req.getParameter("psw_again");
		if(psw == ""){
			resp.getWriter().write("1");
		}else{
			if(psw_again.equals(psw)){
				resp.getWriter().write("0");
			}else{
				resp.getWriter().write("2");
			}
		}
	}


	//用户注册(获取并发送验证码)
	@RequestMapping("getVerifyCode")
	public void getVerifyCode(Model model,HttpServletRequest req,HttpSession session){
		String accounts = req.getParameter("email");

		StringBuilder verifyCode = verifyCodeUtils.getVerifyCode();
		session.setAttribute("verifyCode", verifyCode);
		MainUtil.setMain(accounts,new String(verifyCode));
	}

	//用户注册(清除session中的验证码)
	@RequestMapping("removeSession")
	public void removeSession(HttpServletRequest req,HttpSession session){
		session.removeAttribute("verifyCode");

	}
}
