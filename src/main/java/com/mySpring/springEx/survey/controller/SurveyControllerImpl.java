
package com.mySpring.springEx.survey.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.common.pagination.Pagination;
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
	public ModelAndView listSurvey(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
            @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		
		int surveyList = surveyService.testTableCount();
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(surveyList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("pagination",pagination);
		mav.addObject("surveyList", surveyService.SelectAllList(pagination));
		/* mav.setViewName(viewName); */
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

	// 설문조사 삭제
	@Override
	@RequestMapping(value = "/survey/removeSurvey.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("survey_Id") String survey_Id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		surveyService.removeSurvey(survey_Id);
		ModelAndView mav = new ModelAndView("redirect:/survey/listSurvey.do");
		return mav;
	}

	/*
	 * @Override public ModelAndView listSurvey(HttpServletRequest request,
	 * HttpServletResponse response) throws Exception { // TODO Auto-generated
	 * method stub return null; }
	 */

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
