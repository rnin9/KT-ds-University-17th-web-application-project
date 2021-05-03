package com.mySpring.springEx.question.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.mySpring.springEx.common.interceptor.Auth;
import com.mySpring.springEx.common.interceptor.Auth.Role;
import com.mySpring.springEx.question.controller.QuestionController;
import com.mySpring.springEx.question.service.QuestionService;
import com.mySpring.springEx.question.vo.QuestionVO;

@Controller("QuestionController")
public class QuestionControllerImpl implements QuestionController {
	@Autowired
	private QuestionService QuestionService;
	@Autowired
	QuestionVO QuestionVO;

	
	// 吏덈Ц 紐⑸줉 ADMIN
	@Auth(role=Role.ADMIN)
	@Override
	@RequestMapping(value = { "/question/listQuestion.do" }, method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listQuestion(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		//String viewName = (String) request.getAttribute("viewName");
		List QuestionList = QuestionService.listQuestion();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/question/listQuestion");
		mav.addObject("QuestionList",QuestionList);
		return mav;
	}
	
	//吏덈Ц 紐⑸줉 USER
	@Auth
	@Override
	@RequestMapping(value = {"/question/userListQuestion.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userListQuestion(@RequestParam("userId") String userId,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List QuestionList = QuestionService.userQuestionList(userId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("QuestionList",QuestionList);
		return mav;
	}

	// USER 吏덈Ц �엯�젰李�
	@Auth
	@Override
	@RequestMapping(value = {"/question/questionForm.do"}, method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	
	// USER 吏덈Ц �엯�젰�썑 由ъ뒪�듃 �씠�룞
	@Auth
	@Override	
	@RequestMapping(value = {"/question/insertQuestion.do"}, method = { RequestMethod.GET, RequestMethod.POST} )
	public String insertQuestion(QuestionVO QuestionVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		QuestionService.insertQuestion(QuestionVO);
		String userId = request.getParameter("userId");
		
		
		return "redirect:/question/userListQuestion.do?userId="+userId;
		
	}
	
	// ADMIN �떟蹂� �엯�젰
	@Override
	@RequestMapping(value = {"/question/addComment.do"}, method = { RequestMethod.POST, RequestMethod.POST})
	public String addComment(QuestionVO QuestionVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		QuestionService.addComment(QuestionVO);
		return "redirect:/question/listQuestion.do";
	}

	// 吏덈Ц �긽�꽭 USER
	@Auth
	@Override
	@RequestMapping(value = {"/question/readQuestion.do"}, method = {RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView readQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response)throws Exception {
		//String viewName = (String)request.getAttribute("viewName");
		QuestionVO =(QuestionVO) QuestionService.readQuestion(questionNum);
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
//		mav.setViewName("/question/readQuestion");
		mav.addObject("readQuestion", QuestionVO);
		System.out.println(QuestionVO.getUserId()+"=============="+QuestionVO.getQuestionContent());
		return mav;
	}
	
	// ADMIN 吏덈Ц �긽�꽭
	@Auth(role=Role.ADMIN)
	@Override
	@RequestMapping(value = {"/question/adminReadQuestion.do"})
	public ModelAndView adminReadQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception{
		QuestionVO = (QuestionVO) QuestionService.readQuestion(questionNum);
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("readQuestion", QuestionVO);
		return mav;
	}
	
	// USER 吏덈Ц �닔�젙 �럹�씠吏�
	@Auth
	@Override
	@RequestMapping(value = {"/question/modQuestionForm.do"}, method = {RequestMethod.GET})
	public ModelAndView questionModPage(@RequestParam("questionNum") int questionNum,HttpServletRequest request, HttpServletResponse response)throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		//mav.setViewName("/question/modQuestionForm");
		mav.addObject("modQuestion", QuestionService.readQuestion(questionNum));
		System.out.println("modQuestionForm");
		return mav;
	}
	
	// USER 吏덈Ц �닔�젙 �떎�뻾
	@Auth
	@Override
	@RequestMapping(value = {"/question/doModQuestion.do"}, method = {RequestMethod.POST, RequestMethod.GET})
	public String questionMod(@ModelAttribute QuestionVO modQuestion,@RequestParam("questionNum") int questionNum, HttpServletRequest request) throws Exception {
	QuestionService.questionMod(modQuestion);
	
	System.out.println("do mod question");
	return "redirect:/question/readQuestion.do?questionNum="+questionNum;
		
	}
	// USER 吏덈Ц �궘�젣
	@Override
	@RequestMapping(value = {"/question/userDeleteQuestion.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String userDeleteQuestion(@RequestParam("userId") String userId, @RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
	String userId1 = userId;
	QuestionService.userDeleteQuestion(questionNum);
	return "redirect:/question/userListQuestion.do?userId="+userId1;
	}
	
	// ADMIN 吏덈Ц 鍮꾧났媛�
		@Override
		@RequestMapping(value = {"/question/adminDeleteQuestion.do"}, method = {RequestMethod.GET, RequestMethod.POST})
		public String adminDeleteQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		QuestionService.userDeleteQuestion(questionNum);
		return "redirect:/question/adminReadQuestion.do?questionNum="+questionNum;
		}
	
		// ADMIN 吏덈Ц 怨듦컻泥�
				@Override
				@RequestMapping(value = {"/question/adminShowQuestion.do"}, method = {RequestMethod.GET, RequestMethod.POST})
				public String adminShowQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
				QuestionService.adminShowQuestion(questionNum);
				return "redirect:/question/adminReadQuestion.do?questionNum="+questionNum;
				}	
	// ADMIN 吏덈Ц �궘�젣
	@Override
	@RequestMapping(value = {"/question/deleteQuestion.do"}, method = {RequestMethod.GET, RequestMethod.POST} )
	public String deleteQuestion(@RequestParam("questionNum") int questionNum, HttpServletRequest request, HttpServletResponse response)throws Exception {
		QuestionService.deleteQuestion(questionNum);
		System.out.println("deleteQuestion");
		return "redirect:/question/listQuestion.do";
	}
}	
