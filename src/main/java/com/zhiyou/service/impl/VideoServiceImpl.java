package com.zhiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.zhiyou.mapper.VideoDao;
import com.zhiyou.model.Video;
import com.zhiyou.service.VideoService;


@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	VideoDao dao;
	
	public void add(Video Video) {
		dao.add(Video);

	}

	public void delete(int id) {
		dao.delete(id);
	}

	public void update(Video Video) {
		dao.update(Video);

	}

	@Cacheable("selectOne")
	public Video selectOne(int id) {
		
		return dao.selectOne(id);
	}

	@Cacheable("selectOne")
	public List<Video> selectAll() {
		
		return dao.selectAll();
	}

	public void deleteAll(int[] ids) {
		dao.deleteAll(ids);

	}

	@Cacheable("selectLimit")
	public List<Video> selectLimit(Map<String, Integer> map) {
		
		return dao.selectLimit(map);
	}

	@Cacheable("selectCount")
	public int selectCount() {
		
		return dao.selectCount();
	}

	@Cacheable("selectVideo")
	public List<Video> selectVideo(String title, int speaker_id, int course_id) {
		
		return dao.selectVideo(title, speaker_id, course_id);
	}

	@Cacheable("selectVideos")
	public List<Video> selectVideos(int[] courseList) {
		
		return dao.selectVideos(courseList);
	}

	@Cacheable("selectLikeVideo")
	public List<Video> selectLikeVideo(String title,int speaker_id,int course_id,int page,int pageSize) {
		
		return dao.selectLikeVideo(title, speaker_id, course_id, page, pageSize);
	}

	@Cacheable("selectLikeCount")
	public int selectLikeCount(String title,int speaker_id,int course_id) {
		
		return dao.selectLikeCount(title, speaker_id, course_id);
	}

	@Cacheable("selectSpeakerAll")
	public List<Video> selectSpeakerAll(int speaker_id) {
		
		return dao.selectSpeakerAll(speaker_id);
	}

	@Cacheable("selectOneCourse")
	public List<Video> selectOneCourse(int id) {
		
		return dao.selectOneCourse(id);
	}

}
