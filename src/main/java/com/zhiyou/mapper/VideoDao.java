package com.zhiyou.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.model.Video;

public interface VideoDao {
	void add(Video Video);
    void delete(int id);
	void update(Video Video);
	
	//ǰ̨��ҳ
	List<Video> selectOneCourse(int id);
	Video selectOne(int id);
	List<Video> selectAll();
	List<Video> selectVideos(int[] courseList);
	
	//ģ����ѯ��ҳ
	List<Video> selectLikeVideo(@Param("title")String title,@Param("speaker_id")int speaker_id,@Param("course_id")int course_id,@Param("page")int page,@Param("pageSize")int pageSize);
	int selectLikeCount(@Param("title")String title,@Param("speaker_id")int speaker_id,@Param("course_id")int course_id);
	
	List<Video> selectSpeakerAll(int speaker_id);
	List<Video> selectVideo(String title,int speaker_id,int course_id);
	
	void deleteAll(int[] ids);
	List<Video> selectLimit(Map<String, Integer> map);
	
	int selectCount();
}
