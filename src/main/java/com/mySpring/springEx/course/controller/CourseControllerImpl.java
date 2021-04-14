package com.mySpring.springEx.course.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.course.service.CourseService;
import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Controller("courseController")
public class CourseControllerImpl implements CourseController {
	@Autowired
	private CourseService courseService;
	
	@Autowired
	CourseVO courseVO;
	
	@Override
	@RequestMapping(value="/course/courseList.do", method=RequestMethod.GET)
	public ModelAndView courseList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List courseList = courseService.courseList();
		
		System.out.println("courseList");
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("courseList", courseList);
		return mav;
	}

	@Override
	@RequestMapping(value="/course/selectCourse.do", method=RequestMethod.GET)
	public ModelAndView selectCourse(int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		CourseVO courseVO= courseService.selectCourse(courseID);
		mav.addObject("courseVO",courseVO);
		return mav;
	}
	
	@RequestMapping(value="/course/courseRegister.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
							  @RequestParam(value= "action", required=false) String action,
							  HttpServletRequest request, 
							  HttpServletResponse response) throws Exception {
			
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/course/deleteCourse.do" ,method = RequestMethod.GET)
	public ModelAndView deleteCourse(@RequestParam("courseID") int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		courseService.deleteCourse(courseID);
		ModelAndView mav = new ModelAndView("redirect:/course/courseList.do");
		return mav;
	}
	
	@RequestMapping(value="/course/deleteCheck.do", method=RequestMethod.POST)
	public ModelAndView deleteCheck(@RequestParam List<Integer> valueArr) {
		for(int i=0; i<valueArr.size(); i++) {
			courseService.deleteCourse(valueArr.get(i));
		}
		ModelAndView mav = new ModelAndView("redirect:/course/courseList.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/course/insertCourse.do", method=RequestMethod.POST)
	public ModelAndView insertCourse(CourseVO courseVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = courseService.insertCourse(courseVO);
		ModelAndView mav = new ModelAndView("redirect:/course/courseList.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/course/modifyCourse.do", method = RequestMethod.POST)
	public ModelAndView modifyCourse(@ModelAttribute("course") CourseVO courseVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = courseService.modifyCourse(courseVO);
		ModelAndView mav = new ModelAndView("redirect:/course/courseList.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/course/courseModifyForm.do", method = RequestMethod.GET)
	public ModelAndView courseModifyForm(@RequestParam("courseID") int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		CourseVO courseVO = courseService.selectCourse(courseID);
		mav.addObject("courseVO", courseVO);
		return mav;
	}
}
