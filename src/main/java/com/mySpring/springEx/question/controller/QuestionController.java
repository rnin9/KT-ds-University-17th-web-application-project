package com.mySpring.springEx.question.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.question.vo.QuestionVO;

public interface QuestionController {
	public ModelAndView listQuestion(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView userListQuestion(@RequestParam("id") String userId,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView questionForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView readQuestion(@RequestParam("Question_no") int Question_no, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView adminReadQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String insertQuestion(QuestionVO QuestionVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String addComment(QuestionVO QuestionVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView questionModPage(@RequestParam("questionNum") int questionNum,HttpServletRequest request, HttpServletResponse response)throws Exception;
	public String questionMod(@ModelAttribute QuestionVO modQuestion,@RequestParam("questionNum") int questionNum, HttpServletRequest request) throws Exception;
	public String userDeleteQuestion(@RequestParam("userId") String userId, @RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String adminDeleteQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public String adminShowQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String deleteQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	
}

