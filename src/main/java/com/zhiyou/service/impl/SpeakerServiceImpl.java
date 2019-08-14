package com.zhiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.SpeakerDao;
import com.zhiyou.model.Speaker;
import com.zhiyou.service.SpeakerService;


@Service
public class SpeakerServiceImpl implements SpeakerService {

	@Autowired
	SpeakerDao dao;
	public void add(Speaker speaker) {
		dao.add(speaker);
		
	}

	public void delete(int id) {
		dao.delete(id);
		
	}

	public void update(Speaker speaker) {
		dao.update(speaker);
		
	}

	public Speaker selectOne(int id) {
		// TODO Auto-generated method stub
		return dao.selectOne(id);
	}

	public List<Speaker> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	public void deleteAll(int[] ids) {
		dao.deleteAll(ids);
		
	}

	public List<Speaker> selectLimit(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.selectLimit(map);
	}

	public int selectCount() {
		// TODO Auto-generated method stub
		return dao.selectCount();
	}

	
}
