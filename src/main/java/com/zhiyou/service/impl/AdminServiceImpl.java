package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.AdminDao;
import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;


@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao dao;
	public void add(Admin user) {
		dao.add(user);

	}

	public void delete(int id) {
		dao.delete(id);

	}

	public void update(Admin user) {
		dao.update(user);		
	}

	public List<Admin> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	public Admin selectByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.selectByEmail(email);
	}

	public Admin checkEmail(String email) {
		// TODO Auto-generated method stub
		return dao.checkEmail(email);
	}

}
