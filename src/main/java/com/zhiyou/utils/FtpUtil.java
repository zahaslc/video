package com.zhiyou.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.net.ftp.FTPClient;

public class FtpUtil {

	public void upload(String serverUrl,String username,String password,String workingDirectory,String fileName,InputStream inputStream) {
		FTPClient ftpClient = new FTPClient();
		
		try {
			ftpClient.connect(serverUrl);
			ftpClient.login(username, password);
			ftpClient.changeWorkingDirectory(workingDirectory);
			ftpClient.enterLocalPassiveMode();
			ftpClient.setFileType(ftpClient.BINARY_FILE_TYPE);
			ftpClient.storeFile(fileName, inputStream);
			ftpClient.logout();
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
