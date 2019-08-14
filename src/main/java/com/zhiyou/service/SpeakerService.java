package com.zhiyou.service;

import java.util.List;
import java.util.Map;

import com.zhiyou.model.Speaker;


public interface SpeakerService {

	void add(Speaker speaker);
    void delete(int id);
	void update(Speaker speaker);
	Speaker selectOne(int id);
	
	List<Speaker> selectAll();
	
	
	void deleteAll(int[] ids);
	List<Speaker> selectLimit(Map<String, Integer> map);
	
	int selectCount();
}
