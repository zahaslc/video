package com.zhiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.SubjectDao;
import com.zhiyou.model.Subject;
import com.zhiyou.service.SubjectService;


@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	SubjectDao dao;
	public void add(Subject Subject) {
		dao.add(Subject);

	}

	public void delete(int id) {
		dao.delete(id);

	}

	public void update(Subject Subject) {
		dao.update(Subject);

	}

	public Subject selectOne(int id) {
		// TODO Auto-generated method stub
		return dao.selectOne(id);
	}

	public List<Subject> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	public void deleteAll(int[] ids) {
		dao.deleteAll(ids);

	}

	public List<Subject> selectLimit(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.selectLimit(map);
	}

	public int selectCount() {
		// TODO Auto-generated method stub
		return dao.selectCount();
	}

}
