package com.zhiyou.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.ImageReturnType;
import com.zhiyou.service.PictureService;
import com.zhiyou.utils.FtpUtil;

@Service
public class PictureServiceImpl implements PictureService {
	
	//从配置文件中取出属性

	/*private String FTP_ADDRESS = "192.168.177.128";

	private String FTP_USERNAME = "zhangzhao";
	
	private String FTP_PASSWORD = "zhangzhao";
	
	private String FTP_BASE_PATH = "/home/zhangzhao/image";*/
	@Value("${FTP.ADDRESS}")    private String host;    // 端口
	@Value("${FTP.PORT}")    private int PORT;    // ftp用户名
    @Value("${FTP.USERNAME}")    private String USERNAME;    // ftp用户密码
    @Value("${FTP.PASSWORD}")    private String PASSWORD;    // 文件在服务器端保存的主目录
    @Value("${FTP.BASEPATH}")    private String BASEPATH;    // 访问图片时的基础url
    @Value("${IMAGE.BASE.URL}")    private String URL; 


	
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
		String oldName = uploadFile.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String filePath = sdf.format(new Date());
		String imageName = generateImageName()+oldName.substring(oldName.lastIndexOf("."));
		InputStream inputStream;
        
        ImageReturnType imageReturnType = new ImageReturnType();
        try {
        	
        	inputStream = uploadFile.getInputStream();
			new FtpUtil().uploadFile(host, PORT, USERNAME, PASSWORD, BASEPATH, filePath, imageName, inputStream);
			imageReturnType.setUrl(URL+filePath+"/"+imageName);
			
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
