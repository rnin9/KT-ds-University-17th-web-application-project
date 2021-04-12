package com.mySpring.springEx.courseTake.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.courseTake.service.CourseTakeService;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

@Controller("courseTakeController")
//@EnableAspectJAutoProxy
public class CourseTakeControllerImpl implements CourseTakeController {
	@Autowired
	private CourseTakeService courseTakeService;
	@Autowired
	CourseTakeVO courseTakeVO;

	@RequestMapping(value = "/courseTake/courseApplyList.do", method = RequestMethod.GET)
	public ModelAndView courseApplyList(HttpServletRequest request, HttpServletResponse response) {
		List courseApplyList = courseTakeService.courseApplyList();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("courseApplyList", courseApplyList);
		return mav;
	}

	@RequestMapping(value = "/courseTake/courseCompleteList.do", method = RequestMethod.GET)
	public ModelAndView courseCompleteList(HttpServletRequest request, HttpServletResponse response) {
		List courseCompleteList = courseTakeService.courseCompleteList();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("courseCompleteList", courseCompleteList);
		return mav;
	}

}
