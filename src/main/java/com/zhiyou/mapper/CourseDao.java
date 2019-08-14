package com.zhiyou.mapper;

import java.util.List;
import java.util.Map;

import com.zhiyou.model.Course;

public interface CourseDao {
	
	void add(Course course);
    void delete(int id);
	void update(Course course);
	
	Course selectOne(int id);
	List<Course> selectBySubject(int subject_id);
	List<Course> selectAll();
	
	void deleteAll(int[] ids);
	List<Course> selectLimit(Map<String, Integer> map);
	
	int selectCount();

}
