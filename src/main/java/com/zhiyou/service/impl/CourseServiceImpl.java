package com.zhiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.CourseDao;
import com.zhiyou.model.Course;
import com.zhiyou.service.CourseService;


@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	CourseDao dao;
	public void add(Course course) {
		dao.add(course);
		
	}

	public void delete(int id) {
		dao.delete(id);
		
	}

	public void update(Course course) {
		dao.update(course);
		
	}

	public Course selectOne(int id) {
		// TODO Auto-generated method stub
		return dao.selectOne(id);
	}

	public List<Course> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	public void deleteAll(int[] ids) {
		dao.deleteAll(ids);
		
	}

	public List<Course> selectLimit(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.selectLimit(map);
	}

	public int selectCount() {
		// TODO Auto-generated method stub
		return dao.selectCount();
	}

	public List<Course> selectBySubject(int subject_id) {
		// TODO Auto-generated method stub
		return dao.selectBySubject(subject_id);
	}

}
