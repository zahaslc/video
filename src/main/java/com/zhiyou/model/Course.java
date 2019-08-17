package com.zhiyou.model;

import java.io.Serializable;

public class Course  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String course_title;
	private String course_desc;
	private Integer subject_id;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourse_title() {
		return course_title;
	}
	public void setCourse_title(String course_title) {
		this.course_title = course_title;
	}
	public String getCourse_desc() {
		return course_desc;
	}
	public void setCourse_desc(String course_desc) {
		this.course_desc = course_desc;
	}
	public Integer getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", course_title=" + course_title + ", course_desc=" + course_desc + ", subject_id="
				+ subject_id + "]";
	}
	public Course( String course_title, String course_desc, Integer subject_id) {
		super();
		
		this.course_title = course_title;
		this.course_desc = course_desc;
		this.subject_id = subject_id;
	}
	public Course() {
		super();
	}
	public Course(Integer id, String course_title, String course_desc, Integer subject_id) {
		super();
		this.id = id;
		this.course_title = course_title;
		this.course_desc = course_desc;
		this.subject_id = subject_id;
	}
	
}
