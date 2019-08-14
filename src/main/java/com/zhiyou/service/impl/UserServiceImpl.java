package com.zhiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.UserDao;
import com.zhiyou.model.User;
import com.zhiyou.service.UserService;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	public void add(User user) {
		userDao.add(user);

	}

	public void delete(int id) {
		userDao.delete(id);

	}

	public void update(User user) {
		userDao.update(user);
	}

	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return userDao.selectAll();
	}

	public List<User> selectLike(User user) {
		// TODO Auto-generated method stub
		return userDao.selectLike(user);
	}

	public void deleteAll(int[] ids) {
		userDao.deleteAll(ids);

	}

	public List<User> selectLimit(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return userDao.selectLimit(map);
	}

	public User selectByEmail(String accounts) {
		
		return userDao.selectByEmail(accounts);
	}


	public User checkPassword(String email,String password) {
		// TODO Auto-generated method stub
		return userDao.checkPassword(email,password);
	}

	public User selectById(int id) {
		// TODO Auto-generated method stub
		return userDao.selectById(id);
	}

}
