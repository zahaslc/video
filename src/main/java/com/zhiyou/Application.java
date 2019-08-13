package com.zhiyou;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//用来标识SpringBoot的启动项
//是一个组合注解，出了包括java的4大注解以外，还包括以下
/**
 * @SpringBootConfiguration	修饰在类上，可以代替xml配置，用来标识这个类是一个xml配置类，一般与@bean	结合使用
 * @bean	用来修饰在方法上，该方法的返回值会被注册到SpringBoot容器中
 * @EnableAutoConfiguration	自动配置Spring上下文，可以猜测和配置我们想要的bean类型
 * @ComponentScan	会自动扫描指定包下的component，controller等注解，并自动注入到ioc容器中；如果不指定路径，默认扫描自己所在包路径及所有子包
*/
@SpringBootApplication	//默认扫描所有子包及本包
@MapperScan("com.zhiyou.mapper")//自动扫描该路径下的所有接口
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
