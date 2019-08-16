package com.zhiyou.mapper;

import java.util.List;
import java.util.Map;

import com.zhiyou.model.User;

public interface UserDao {
	
	void add(User user);
	void delete(int id);
	void update(User user);
	
	List<User> selectAll();
	User selectByEmail(String accounts);
	User selectById(int id);

	User checkPassword(String email,String password);
	
	List<User> selectLike(User user);
	
	void deleteAll(int []ids);
	List<User> selectLimit(Map<String, Integer> map/*@Param("page")int page,@Param("pageSize")int pageSize*/);
	
}
