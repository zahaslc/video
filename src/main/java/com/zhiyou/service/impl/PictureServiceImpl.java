package com.zhiyou.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.ImageReturnType;
import com.zhiyou.service.PictureService;
import com.zhiyou.utils.FtpUtil;

@Service
public class PictureServiceImpl implements PictureService {
	
	//从配置文件中取出属性

	private String FTP_ADDRESS = "192.168.177.128";


	private String FTP_USERNAME = "zhangzhao";
	
	private String FTP_PASSWORD = "zhangzhao";
	
	
	private String FTP_BASE_PATH = "/home/zhangzhao/image";

	
	/**
	 * 生成图片名
	 * @return
	 */

	public static String  generateImageName() {
		//获取当前时间的长整型值
		long currentTimeMillis = System.currentTimeMillis();

		//末尾生成3位随机数
		Random random = new Random();	
		int endInt = random.nextInt(999);
		//实现如果一个数字不到3位，则会在其前面补零以到达规定的位数，
		//其中0是被填充到缺省位的数字，3代表规定数字的总位数  d代表是整型。
		String imageName = currentTimeMillis+String.format("%03d", endInt);
		return imageName;
	}

	
	
	@Override
	public ImageReturnType upload(MultipartFile uploadFile) {
		String imageName = generateImageName()+uploadFile.getOriginalFilename();
        InputStream inputStream;
        
        ImageReturnType imageReturnType = new ImageReturnType();
        try {
        	
        	inputStream = uploadFile.getInputStream();
			new FtpUtil().upload(FTP_ADDRESS, FTP_USERNAME, FTP_PASSWORD, FTP_BASE_PATH, imageName, inputStream);
			imageReturnType.setUrl("http://"+FTP_ADDRESS+"/"+imageName);
			
			imageReturnType.setError(0);
			return imageReturnType;
        } catch (IOException e) {
			e.printStackTrace();
		}
        imageReturnType.setError(1);
        imageReturnType.setMessage("错误信息");
        return imageReturnType;
	}
}
