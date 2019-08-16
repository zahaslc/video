package com.zhiyou.mapper;

import java.util.List;
import java.util.Map;

import com.zhiyou.model.Speaker;

public interface SpeakerDao {
	void add(Speaker speaker);
    void delete(int id);
	void update(Speaker speaker);
	
	Speaker selectOne(int id);
	List<Speaker> selectAll();
	

	List<Speaker> selectLimit(Map<String, Integer> map);
	
	int selectCount();
	void deleteAll(int[] ids);
}
