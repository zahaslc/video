package com.zhiyou.service;

import java.util.List;
import java.util.Map;

import com.zhiyou.model.Video;


public interface VideoService {

	void add(Video Video);
    void delete(int id);
	void update(Video Video);
	
	List<Video> selectOneCourse(int id);
	Video selectOne(int id);
	List<Video> selectAll();
	List<Video> selectVideos(int[] courseList);
	
	List<Video> selectLikeVideo(String title,int speaker_id,int course_id,int page,int pageSize);
	int selectLikeCount(String title,int speaker_id,int course_id);
	
	List<Video> selectSpeakerAll(int speaker_id);
	List<Video> selectVideo(String title,int speaker_id,int course_id);
	
	void deleteAll(int[] ids);
	List<Video> selectLimit(Map<String, Integer> map);
	
	int selectCount();
}
