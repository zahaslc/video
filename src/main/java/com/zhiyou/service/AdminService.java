package com.zhiyou.service;

import java.util.List;

import com.zhiyou.model.Admin;


public interface AdminService {
	
	void add(Admin user);
	void delete(int id);
	void update(Admin user);
	
	List<Admin> selectAll();
	Admin selectByEmail(String email);
	Admin checkEmail(String email);

}
