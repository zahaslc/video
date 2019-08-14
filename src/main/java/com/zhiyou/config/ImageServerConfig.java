package com.zhiyou.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix="ftp")
public class ImageServerConfig {
	
	//地址
	private String address;

	//端口号
    private Integer port;

    //账号
    private String username;

    //密码
    private String password;

    //基础路径
    private String bastPath;
    
    //图片路径
    private String imageBaseUrl;
}
