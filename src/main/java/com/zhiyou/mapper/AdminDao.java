package com.zhiyou.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zhiyou.model.Admin;

@Repository
public interface AdminDao {

	void add(Admin user);
	void delete(int id);
	void update(Admin user);
	
	List<Admin> selectAll();
	Admin selectByEmail(String email);
	Admin checkEmail(String email);
}
