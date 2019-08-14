package com.zhiyou.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice	//修饰在类上，说明这个类是用于增强controller的
public class MyExceptionHandler {
	
	@ExceptionHandler({NullPointerException.class})
	@ResponseBody
	public String exceptionHandler1(HttpServletRequest request,Exception e){
		System.out.println(e.getLocalizedMessage());
		return "你空指针了";
	}
	
	@ExceptionHandler({ArithmeticException.class})
	@ResponseBody
	public String exceptionHandler2(HttpServletRequest request,Exception e){
		System.out.println(e.getLocalizedMessage());
		return "你算术出问题啦";
	}
	
	@ExceptionHandler({ArrayIndexOutOfBoundsException.class})
	@ResponseBody
	public String exceptionHandler3(HttpServletRequest request,Exception e){
		System.out.println(e.getLocalizedMessage());
		return "你下标越界了";
	}
	
	@ExceptionHandler({ClassCastException.class})
	@ResponseBody
	public String exceptionHandler4(HttpServletRequest request,Exception e){
		System.out.println(e.getLocalizedMessage());
		return "你类型转换错了";
	}

}
