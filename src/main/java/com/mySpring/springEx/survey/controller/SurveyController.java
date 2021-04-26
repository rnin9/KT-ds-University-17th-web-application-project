package com.mySpring.springEx.survey.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyController {
	/*
	 * public ModelAndView listSurvey(HttpServletRequest request,
	 * HttpServletResponse response) throws Exception;
	 */

	public ModelAndView addSurvey(@ModelAttribute("survey") SurveyVO surveyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	ModelAndView removeMember(String survey_Id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView listSurvey(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView surveyWriteForm(@SessionAttribute("member") MemberVO member,@RequestParam("userID") String userID,@RequestParam("courseID") String courseID ,HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	

	//관리자 단에서 survey 작성
	public ModelAndView writeSurvey(@RequestParam("syllabusID")String syllabusID, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}
