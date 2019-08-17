package com.zhiyou.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
 
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
 
	//@Autowired
	//LogInterceptor logInterceptor;
 
	@Autowired
	LoginInterceptor loginInterceptor;
 
	/**
	 * 不需要登录拦截的url:登录注册和验证码
	 */
	final String[] notLoginInterceptPaths = {"/video/login","/video/index","/video/findPassword","/video/updateFindPassword"
			,"/video/accountsAdminCheck","/video/adminLogin","/video/getVerifyCode","/video/userAccountsLogin"
			,"/video/user_accounts_reg","/video/checkPassword"};//"/", "/login/**", "/person/**", "/register/**", "/validcode", "/captchaCheck", "/file/**", "/contract/htmltopdf", "/questions/**", "/payLog/**", "/error/**" };
 
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 日志拦截器
		//registry.addInterceptor(logInterceptor).addPathPatterns("/**");
		// 登录拦截器
		registry.addInterceptor(loginInterceptor).addPathPatterns("/**").excludePathPatterns(notLoginInterceptPaths);
	}
 
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
 
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
 
	}
}
