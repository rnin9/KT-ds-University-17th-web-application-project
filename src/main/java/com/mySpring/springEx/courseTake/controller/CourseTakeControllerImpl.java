package com.mySpring.springEx.courseTake.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.courseTake.service.CourseTakeService;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Controller("courseTakeController")
//@EnableAspectJAutoProxy
public class CourseTakeControllerImpl implements CourseTakeController {
	@Autowired
	private CourseTakeService courseTakeService;
	@Autowired
	CourseTakeVO courseTakeVO;
	/*
	 * @RequestMapping(value = "/courseTake/courseApplyList.do", method =
	 * RequestMethod.GET) public ModelAndView courseApplyList(HttpServletRequest
	 * request, HttpServletResponse response) { List courseApplyList =
	 * courseTakeService.courseApplyList(); String viewName = (String)
	 * request.getAttribute("viewName"); ModelAndView mav = new ModelAndView();
	 * mav.setViewName(viewName); mav.addObject("courseApplyList", courseApplyList);
	 * return mav; }
	 */

	@Override
	@RequestMapping(value = "/courseTake/courseApplyList.do", method = RequestMethod.GET)
	
	public ModelAndView courseCApplyList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		List courseApplyList =  courseTakeService.SelectAllCourseApplyList();
		ModelAndView mav = new ModelAndView(viewName);
		// 처리된 부분을 화면에 전달
		mav.addObject("courseApplyList", courseApplyList);
		return mav;
	}

	// 승인대기->승인으로 update

	@RequestMapping(value = "/courseTake/updateConsentCheck.do", method = RequestMethod.POST)
	public ModelAndView updateApplyConsent(@ModelAttribute("courseTake") CourseTakeVO courseTakeVO,
			@RequestParam List<String> valueArr) throws Exception {
		for (int i = 0; i < valueArr.size(); i++) {
			String arr[] = valueArr.get(i).split(" ");
			courseTakeVO.setUserID(arr[0]);
			courseTakeVO.setCourseID(Integer.parseInt(arr[1]));
			System.out.println("_____________________________"+arr[0]);
			System.out.println("_____________________________"+arr[1]);
			courseTakeService.updateApplyConsent(courseTakeVO);
		}

		ModelAndView mav = new ModelAndView("redirect:/courseTake/courseApplyList.do");
		return mav;

	}
	
	// 승인->승인대기로 update

	@RequestMapping(value = "/courseTake/updateConsentCancelCheck.do", method = RequestMethod.POST)
	public ModelAndView updateApplyConsentCancel(@ModelAttribute("courseTake") CourseTakeVO courseTakeVO,
			@RequestParam List<String> valueArr) throws Exception {

		for (int i = 0; i < valueArr.size(); i++) {
			String arr[] = valueArr.get(i).split(" ");
			courseTakeVO.setUserID(arr[0]);
			courseTakeVO.setCourseID(Integer.parseInt(arr[1]));
			courseTakeService.updateApplyConsentCancel(courseTakeVO);
		}

		ModelAndView mav = new ModelAndView("redirect:/courseTake/courseApplyList.do");
		return mav;

	}

	// 수료대기->수료로 update
	@RequestMapping(value = "/courseTake/updateCompletionCheck.do", method = RequestMethod.POST)
	public ModelAndView updateCompletion(@ModelAttribute("courseTake") CourseTakeVO courseTakeVO,
			@RequestParam List<String> valueArr) throws Exception {

		for (int i = 0; i < valueArr.size(); i++) {
			String arr[] = valueArr.get(i).split(" ");
			courseTakeVO.setUserID(arr[0]);
			courseTakeVO.setCourseID(Integer.parseInt(arr[1]));
			courseTakeService.updateCompletion(courseTakeVO);
		}

		ModelAndView mav = new ModelAndView("redirect:/courseTake/courseApplyList.do");
		return mav;

	}

	// 행 삭제
	@RequestMapping(value = "/courseTake/deleteCourseTake.do", method = RequestMethod.POST)
	public ModelAndView deleteCourseTake(@ModelAttribute("courseTake") CourseTakeVO courseTakeVO,
			@RequestParam List<String> valueArr) throws Exception {

		for (int i = 0; i < valueArr.size(); i++) {
			String arr[] = valueArr.get(i).split(" ");
			courseTakeVO.setUserID(arr[0]);
			courseTakeVO.setCourseID(Integer.parseInt(arr[1]));
			courseTakeService.deleteCourseTake(courseTakeVO);
		}

		ModelAndView mav = new ModelAndView("redirect:/courseTake/courseApplyList.do");
		return mav;

	}
	//수료증 페이지
	@RequestMapping(value = "/courseTake/certificate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewCertificate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	// 테스트페이지
	@RequestMapping(value = "/courseTake/courseCompleteList.do", method = RequestMethod.GET)
	public ModelAndView courseCompleteList(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/course/insertCourseTable.do", method=RequestMethod.POST)
	public ModelAndView insertCourseTable(@RequestParam List<String> valueArr) throws Exception {
		courseTakeVO.setCourseID(Integer.parseInt(valueArr.get(0)));
		courseTakeVO.setUserID(valueArr.get(1));
		System.out.println(courseTakeVO.getCourseID());
		System.out.println(courseTakeVO.getUserID());
		courseTakeService.insertCourseTake(courseTakeVO);
		ModelAndView mav = new ModelAndView("redirect:/course/userCourseList.do");
		return mav;
	}

}
