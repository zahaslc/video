package com.zhiyou.service;


import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.model.ImageReturnType;


public interface PictureService {

	//Map uploadFile(MultipartFile uploadFile);
	
	ImageReturnType upload(MultipartFile uploadFile);
	//FastDFSClient uploadFile(MultipartFile uploadFile) throws Exception;

	//String generateImageName();
	
}
