package com.mySpring.springEx.course.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CourseController {
	public ModelAndView courseList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
