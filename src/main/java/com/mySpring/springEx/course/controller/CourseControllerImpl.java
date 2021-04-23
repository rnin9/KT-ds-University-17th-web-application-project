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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.course.service.CourseService;
import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.syllabus.service.SyllabusService;

@Controller("courseController")
public class CourseControllerImpl implements CourseController {
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private SyllabusService syllabusService;
	
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
	@RequestMapping(value="/course/deleteCourse.do" ,method = RequestMethod.POST)
	public ModelAndView deleteCourse(@RequestParam("courseID") int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		courseService.deleteCourse(courseID);
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

	 @Override
	 @RequestMapping(value="/course/syllabusList.do", method=RequestMethod.GET)
	 public ModelAndView syllabusList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    String viewName = (String)request.getAttribute("viewName");
	    List syllabusList = syllabusService.syllabusList();
	    ModelAndView mav = new ModelAndView(viewName);
	    mav.addObject("syllabusList", syllabusList);
	    return mav;
	 }
	 
	@Override
	@RequestMapping(value="/course/closeCheck.do", method=RequestMethod.POST)
		public ModelAndView closeCheck(@RequestParam List<Integer> valueArr) {
			for(int i=0; i<valueArr.size(); i++) {
				courseService.closeCourse(valueArr.get(i));
			}
			ModelAndView mav = new ModelAndView("redirect:/course/courseList.do");
			return mav;
	 }
	 
	@Override
	@RequestMapping(value="/course/openCheck.do", method=RequestMethod.POST)
		public ModelAndView openCheck(@RequestParam List<Integer> valueArr) {
			for(int i=0; i<valueArr.size(); i++) {
				courseService.openCourse(valueArr.get(i));
			}
			ModelAndView mav = new ModelAndView("redirect:/course/courseList.do");
			return mav;
	 }

	@Override
	@RequestMapping(value="/course/userCourseList.do", method=RequestMethod.GET)
	public ModelAndView courseUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List courseUserList = courseService.courseUserList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("courseUserList", courseUserList);
		System.out.println("======================================================"+courseUserList.size());
		return mav;
	}

	@Override
	@RequestMapping(value="/course/selectUserCourse.do", method=RequestMethod.GET)
	public ModelAndView selectUserCourse(int courseID, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		CourseVO courseVO= courseService.selectUserCourse(courseID);
		mav.addObject("courseVO",courseVO);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/course/updateCoursePeopleApplied.do", method=RequestMethod.POST)
	public ModelAndView updateCoursePeopleApplied(@RequestParam List<String> valueArr) throws Exception {
		int courseID = Integer.parseInt(valueArr.get(0));
		System.out.println(courseID);
		courseService.updateCourse(courseID);
		ModelAndView mav = new ModelAndView("redirect:/course/userCourseList.do");
		return mav;
	}
	
	
	
	
//	@Override
//	@RequestMapping(value="/course/updateCoursePeopleAppliedInsertCourseTable.do", method=RequestMethod.GET)
//	public ModelAndView updateCoursePeopleApplied(int courseID, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		String viewName = (String)request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		CourseVO courseVO= courseService.selectUserCourse(courseID);
//		mav.addObject("courseVO",courseVO);
//		return mav;
//	}
}
