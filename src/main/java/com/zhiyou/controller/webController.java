package com.zhiyou.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Subject;
import com.zhiyou.model.User;
import com.zhiyou.model.Video;
import com.zhiyou.service.CourseService;
import com.zhiyou.service.SpeakerService;
import com.zhiyou.service.SubjectService;
import com.zhiyou.service.VideoService;

@Controller
public class webController {

	@Autowired
	SubjectService sub;
	@Autowired
	CourseService cs;
	@Autowired
	VideoService vs;
	@Autowired
	SpeakerService ss;
	
	@RequestMapping("index")
	public String index(Model model,HttpSession session){
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "index";
	}
	
	@RequestMapping("webShow")
	public String webShow(HttpServletRequest req, HttpServletResponse resp,Model model) throws IOException{

		//公开课显示
		int subject_id = Integer.valueOf(req.getParameter("subject_id"));
		Subject subject = sub.selectOne(subject_id);
		model.addAttribute("subject", subject);
		
		List<Course> courses = cs.selectBySubject(subject_id);
		model.addAttribute("courses", courses);
		model.addAttribute("count", courses.size()-1);
		System.out.println(courses);

		//存放课程id
		int [] courseList = new int[courses.size()] ;
		int i = 0;
		for (Course c : courses) {
			courseList[i] = c.getId();
			i++;
		}

		Map<Integer, List<Video>> videoMap = new LinkedHashMap<Integer, List<Video>>();
		for(int j = 0;j<courses.size();j++){
			videoMap.put(courseList[j], vs.selectOneCourse(courseList[j]));
		}
		
		model.addAttribute("list", courseList);
		model.addAttribute("videos", videoMap);
		/*List<Video> videos = vs.selectVideos(courseList);
		System.out.println(videos);*/

		return "web_show";

	}
	
	@RequestMapping("video")
	public String video(int video_id,Model model){
		//修改浏览次数
		Video video = vs.selectOne(video_id);
		video.setPaly_num(video.getPaly_num()+1);
		vs.update(video);
		
		//公开课信息
		Subject subject = sub.selectOne(cs.selectOne(video.getCourse_id()).getSubject_id());
		model.addAttribute("subject", subject);
		
		Speaker speaker = ss.selectOne(video.getSpeaker_id());
		List<Video> videos = vs.selectSpeakerAll(speaker.getId());
		Course course = cs.selectOne(video.getCourse_id());

		model.addAttribute("course", course);
		model.addAttribute("speaker", speaker);
		model.addAttribute("videos", videos);
		model.addAttribute("video", video);
		return "web_video";

	}
}
