package com.mySpring.springEx.survey.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyController {
	public ModelAndView listSurvey(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView addSurvey(@ModelAttribute("survey") SurveyVO surveyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	/*
	 * ModelAndView surveyDetail (@RequestParam("surveyId") String surveyId String
	 * surveyId, HttpServletRequest request, HttpServletResponse response) throws
	 * Exception;
	 */
}
