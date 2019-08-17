package com.zhiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.UserDao;
import com.zhiyou.model.User;
import com.zhiyou.service.UserService;


@Service
public class UserServiceImpl implements UserService {

	public String userKey(Long id) {
		String ke = "REDIS_ITEM_KEY:"+String.valueOf(id)+"User";
		return ke;
	}
	
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
		
		return userDao.selectLimit(map);
	}
	
	@Override
	@Cacheable("selectByEmail")
	public User selectByEmail(String accounts) {
		User user = userDao.selectByEmail(accounts);
		return user;
	}

	@Override
	public User checkPassword(String email,String password) {
		
		return userDao.checkPassword(email,password);
	}
	
	@Override
	public User selectById(int id) {
	
		return userDao.selectById(id);
	}

}
