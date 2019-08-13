package com.zhiyou.model;

public class Video {

	private Integer video_id;
	private String title;
	private String detall;
	private Integer time;
	private Integer speaker_id;
	private Integer course_id;
	private String video_url;
	private String image_url;
	private Integer paly_num;
	
	public Integer getVideo_id() {
		return video_id;
	}
	public void setVideo_id(Integer video_id) {
		this.video_id = video_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetall() {
		return detall;
	}
	public void setDetall(String detall) {
		this.detall = detall;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public Integer getSpeaker_id() {
		return speaker_id;
	}
	public void setSpeaker_id(Integer speaker_id) {
		this.speaker_id = speaker_id;
	}
	public Integer getCourse_id() {
		return course_id;
	}
	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}
	public String getVideo_url() {
		return video_url;
	}
	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public Integer getPaly_num() {
		return paly_num;
	}
	public void setPaly_num(Integer paly_num) {
		this.paly_num = paly_num;
	}
	@Override
	public String toString() {
		return "Video [video_id=" + video_id + ", title=" + title + ", detall=" + detall + ", time=" + time
				+ ", speaker_id=" + speaker_id + ", course_id=" + course_id + ", video_url=" + video_url
				+ ", image_url=" + image_url + ", paly_num=" + paly_num + "]";
	}
	public Video(Integer video_id, String title, String detall, Integer time, Integer speaker_id, Integer course_id, String video_url,
			String image_url) {
		super();
		this.video_id = video_id;
		this.title = title;
		this.detall = detall;
		this.time = time;
		this.speaker_id = speaker_id;
		this.course_id = course_id;
		this.video_url = video_url;
		this.image_url = image_url;

	}
	public Video() {
		super();
	}
	public Video(Integer video_id, String title, String detall, Integer time, Integer speaker_id, Integer course_id,
			String video_url, String image_url, Integer paly_num) {
		super();
		this.video_id = video_id;
		this.title = title;
		this.detall = detall;
		this.time = time;
		this.speaker_id = speaker_id;
		this.course_id = course_id;
		this.video_url = video_url;
		this.image_url = image_url;
		this.paly_num = paly_num;
	}
	
	
}
