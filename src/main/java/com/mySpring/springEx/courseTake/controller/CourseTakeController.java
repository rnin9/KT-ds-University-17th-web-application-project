package com.mySpring.springEx.courseTake.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

public interface CourseTakeController {
	public ModelAndView courseApplyList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView courseCompleteList(HttpServletRequest request, HttpServletResponse response) throws Exception;

}