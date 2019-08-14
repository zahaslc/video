package com.zhiyou.mapper;

import java.util.List;
import java.util.Map;

import com.zhiyou.model.Subject;


public interface SubjectDao {
	
	void add(Subject Subject);
    void delete(int id);
	void update(Subject Subject);
	
	Subject selectOne(int id);
	List<Subject> selectAll();
	
	void deleteAll(int[] ids);
	List<Subject> selectLimit(Map<String, Integer> map);
	
	int selectCount();

}
