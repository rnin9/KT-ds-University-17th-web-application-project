package com.mySpring.springEx.course.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.course.service.CourseService;

@Controller("courseController")
public class CourseControllerImpl implements CourseController {
	@Autowired
	private CourseService courseService;

	@Override
	@RequestMapping(value="/course/courseList.do", method=RequestMethod.GET)
	public ModelAndView courseList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List courseList = courseService.courseList();
		
		System.out.println("courseList");
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("courseList", courseList);
		return mav;
	}
}
