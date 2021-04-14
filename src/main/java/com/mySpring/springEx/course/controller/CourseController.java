package com.mySpring.springEx.course.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.course.vo.CourseVO;

public interface CourseController {
	public ModelAndView courseList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView selectCourse(int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteCourse(@RequestParam("courseID") int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView insertCourse(@ModelAttribute("course") CourseVO courseVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modifyCourse(CourseVO courseVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView courseModifyForm(@RequestParam("courseID") int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
