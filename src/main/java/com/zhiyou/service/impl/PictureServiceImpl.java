package com.zhiyou.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zhiyou.config.ImageServerConfig;
import com.zhiyou.service.PictureService;
import com.zhiyou.utils.FtpUtil;
import com.zhiyou.utils.IDUtils;

@Service
public class PictureServiceImpl implements PictureService {

	@Autowired
	private ImageServerConfig isc;
	
	@Override
    public Map uploadPicture(MultipartFile uploadFile) {
        Map resultMap = new HashMap<>();
        try {
            //生成一个新的文件名
            //取原始文件名
            String oldName = uploadFile.getOriginalFilename();
            //生成新文件名
            //UUID.randomUUID();
            String newName = IDUtils.genImageName();
            newName = newName + oldName.substring(oldName.lastIndexOf("."));
            //图片上传
            SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
            Date date = new Date();
            String imagePath = sdf.format(date);
            boolean result = FtpUtil.uploadFile(isc.getAddress(), isc.getPort(), isc.getUsername(), isc.getPassword(),
            		isc.getBastPath(), imagePath, newName, uploadFile.getInputStream());
            //返回结果
            if(!result) {
                resultMap.put("error", 1);
                resultMap.put("message", "文件上传失败");
                return resultMap;
            }
            resultMap.put("error", 0);
            //上传成功后图片的存储路径
            resultMap.put("url", isc.getImageBaseUrl() + imagePath + "/" + newName);
            return resultMap;

        } catch (Exception e) {
            resultMap.put("error", 1);
            resultMap.put("message", "文件上传发生异常");
            return resultMap;
        }
    }
}
