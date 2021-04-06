
package com.mySpring.springEx.survey.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.survey.service.SurveyService;
import com.mySpring.springEx.survey.vo.SurveyVO;

@Controller("surveyController")
public class SurveyControllerImpl implements SurveyController {

	@Autowired
	private SurveyService surveyService;

	@Autowired
	SurveyVO surveyVO;

	@Override

	@RequestMapping(value = "/survey/listSurvey.do", method = RequestMethod.GET)
	public ModelAndView listSurvey(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List surveyList = surveyService.listSurvey();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("surveyList", surveyList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/survey/addSurvey.do", method = RequestMethod.POST)
	public ModelAndView addSurvey(@ModelAttribute("survey") SurveyVO survey, // modelAttritbute로 회원가입창에서 받은 member정보를 //
																				// MemberVO클래스의 member객체에 저장
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = surveyService.addSurvey(survey);
		ModelAndView mav = new ModelAndView("redirect:/survey/listSurvey.do");
		return mav;
	}

	// surveyDetail -> 설문조사항목을 누르면 해당 suveyId의 값을 가진 데이터를 전부다 db에서 뽑아온 다음에 화면에 출력
	// 해준다 경로는 surveyDtail.do라는 페이지
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/survey/surveyDetail.do", method =
	 * RequestMethod.POST) public ModelAndView
	 * surveyDetail(@RequestParam("surveyId") String surveyId, HttpServletRequest
	 * request, HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); List surveyList =
	 * surveyService.searchSurvey(surveyId); ModelAndView mav = new
	 * ModelAndView("redirect:/survey/surveyDetail.do"); mav.addObject("detailList",
	 * surveyList); return mav; }
	 */
}
