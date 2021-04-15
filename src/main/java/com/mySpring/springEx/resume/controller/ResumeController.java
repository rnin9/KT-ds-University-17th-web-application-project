package com.mySpring.springEx.resume.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.resume.vo.ResumeVO;

public interface ResumeController {
	public ModelAndView listResumes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView resumeReview(HttpServletRequest request, HttpServletResponse response) throws Exception;


}
