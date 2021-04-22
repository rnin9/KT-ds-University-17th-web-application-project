package com.mySpring.springEx.resume.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.resume.service.ResumeService;
import com.mySpring.springEx.resume.vo.ResumeVO;

@Controller("resumeController")
public class ResumeControllerImpl implements ResumeController{
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	ResumeVO resumeVO;
	
	@Override
	@RequestMapping(value = "/resume/resumeList.do", method = RequestMethod.GET)
	public ModelAndView listResumes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		List resumesList = resumeService.listResumes();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resumesList", resumesList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/resume/resumeReview.do", method = RequestMethod.GET)
	public ModelAndView resumeReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		List resumeReview = null; 
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resumesList", resumeReview);
		return mav;
		
	}
}

