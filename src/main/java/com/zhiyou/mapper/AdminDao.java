package com.zhiyou.mapper;

import java.util.List;

import com.zhiyou.model.Admin;

public interface AdminDao {

	void add(Admin user);
	void delete(int id);
	void update(Admin user);
	
	List<Admin> selectAll();
	Admin selectByEmail(String email);
	Admin checkEmail(String email);
}
