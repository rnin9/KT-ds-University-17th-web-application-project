
package com.mySpring.springEx.survey.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.survey.service.SurveyService;
import com.mySpring.springEx.survey.vo.DetailVO;
import com.mySpring.springEx.survey.vo.QuestionVO;
import com.mySpring.springEx.survey.vo.SurveyVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Controller("surveyController")
public class SurveyControllerImpl implements SurveyController {

	@Autowired
	private SurveyService surveyService;

	@Autowired
	SurveyVO surveyVO;

	@Autowired
	MemberVO memberVO;

	@Autowired
	CourseTakeVO courseTakeVO;

	@Autowired
	CourseVO courseVO;

	@Autowired
	DetailVO detailVO;

	@Autowired
	SyllabusVO syllabusVO;

	@Autowired
	QuestionVO questionVO;

	// 리스트
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/survey/listSurvey.do", method = RequestMethod.GET)
	 * public ModelAndView listSurvey(
	 * 
	 * @RequestParam(value = "currentPage", required = false, defaultValue = "1")
	 * int currentPage,
	 * 
	 * @RequestParam(value = "cntPerPage", required = false, defaultValue = "10")
	 * int cntPerPage,
	 * 
	 * @RequestParam(value = "pageSize", required = false, defaultValue = "10") int
	 * pageSize, Map<String, Object> map, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception { String viewName = (String)
	 * request.getAttribute("viewName"); // 데이터의 총 갯수를 받아옴 surveyServiceImpl
	 * testTableCount()-pagination.xml의 // testTableCount 쿼리를 담은 값을 surveyList에
	 * 담음(int형) int surveyList = surveyService.testTableCount(); // Pagination에
	 * request한 currentPage,cntPerPage,pageSize을 파라미터값으로 받는 객체를 생성 Pagination
	 * pagination = new Pagination(currentPage, cntPerPage, pageSize); // 총 레코드 수에
	 * 따른 페이지 처리 method에 데이터의 총 갯수를 전달 pagination.setTotalRecordCount(surveyList);
	 * ModelAndView mav = new ModelAndView(viewName); // 추가할 항목을 미리 세션에 저장시키기 위한
	 * surveyList= insertList mav.addObject("insertSurvey",
	 * surveyService.SelectInsertList()); // 처리된 부분을 화면에 전달
	 * mav.addObject("pagination", pagination); mav.addObject("surveyList",
	 * surveyService.SelectAllList(pagination)); mav.setViewName(viewName); return
	 * mav; }
	 */
	@Override
	@RequestMapping(value = "/survey/listSurvey.do", method = RequestMethod.GET)
	public ModelAndView listSurvey( HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		// 데이터의 총 갯수를 받아옴 surveyServiceImpl testTableCount()-pagination.xml의
		// testTableCount 쿼리를 담은 값을 surveyList에 담음(int형)
		int surveyList = surveyService.testTableCount();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("surveyList", surveyService.SelectAllList());
		/* mav.setViewName(viewName); */
		return mav;
	}

	// 추가
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

	// 설문지 작성
	@RequestMapping(value = "/survey/surveyWriteForm.do", method = RequestMethod.GET)
	public ModelAndView surveyWriteForm(@SessionAttribute("member") MemberVO member,
			@RequestParam("userID") String userID, @RequestParam("courseID") String courseID,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		SurveyVO surveyVO = surveyService.getQuestion(courseID);
		CourseTakeVO courseTakeVO = surveyService.selectAllSurveylist(userID, courseID);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("myInfo", member);
		mav.addObject("allSurveyList", courseTakeVO);
		mav.addObject("getQuestion", surveyVO);
		HttpSession session = request.getSession();
		session.setAttribute("allSurveyList", courseTakeVO);
		return mav;
	}

	// 설문지작성완료
	@RequestMapping(value = "/survey/insertSurvey.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insertSurvey(@ModelAttribute DetailVO detailVO, @RequestParam("userId") String userId,
			RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		surveyService.insertSurvey(detailVO);
		ModelAndView mav = new ModelAndView("redirect:/member/myInfo.do?userID=" + userId);
		return mav;
	}

	// 설문지 생성
	@Override
	@RequestMapping(value = "/survey/writeSurveyForm.do", method = RequestMethod.GET)
	public ModelAndView writeSurvey(@RequestParam("courseID") String courseID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		courseVO = surveyService.writeSurvey(courseID);
		List questionVO = surveyService.check_suerveyQuestion();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("courseVO", courseVO);
		mav.addObject("questionList", questionVO);
		return mav;
	}

	// 설문조사 생성 완료
	@RequestMapping(value = "/survey/surveyInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView surveyInsert(@ModelAttribute SurveyVO surveyVO, @RequestParam("courseID") String courseID,
			RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		surveyService.surveyInsert(surveyVO);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}

	// 설문조사 수정
	@RequestMapping(value = { "/survey/surveyInfo.do" }, method = RequestMethod.GET)
	public ModelAndView surveyInfoList(@RequestParam("courseID") String courseID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		SurveyVO surveyInfoList = surveyService.listSurveyInfo(courseID);
		ModelAndView mav = new ModelAndView(viewName);
		List questionVO = surveyService.check_suerveyQuestion();
		mav.addObject("surveyInfoList", surveyInfoList);
		mav.addObject("questionList", questionVO);
		System.out.println(questionVO.size());
		return mav;
	}

	// 설문조사 수정 완료
	@RequestMapping(value = "/survey/surveyModify.do", method = RequestMethod.POST)
	public ModelAndView modifySurvey(@ModelAttribute SurveyVO surveyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = surveyService.modifySurvey(surveyVO);
		System.out.println(result);
		ModelAndView mav = new ModelAndView("redirect:/survey/surveyInfo.do?courseID=" + surveyVO.getCourseID());
		return mav;
	}

	// 설문조사 항목 결과 폼
	@RequestMapping(value = "/survey/surveyDetailForm.do", method = RequestMethod.GET)
	public ModelAndView listMembers(@RequestParam("courseID") String courseID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List detailList = surveyService.detailList(courseID);
		SurveyVO surveyVO = surveyService.surveyVO(courseID);
		DetailVO detailVO = surveyService.countParticipate(courseID);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("detailList", detailList);
		mav.addObject("surveyVO", surveyVO);
		mav.addObject("detailVO", detailVO);
		System.out.println(detailList.size());
		return mav;
	}

	// 그래프 ajax 무지성코딩
	@Override
	@RequestMapping(value = "/survey/infoGraph.do", method = RequestMethod.GET)
	public ModelAndView surveyInfoGraph(@RequestParam("courseID") String courseID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		List list = surveyService.infoGraph(courseID);
		mav.addObject("datas", list);
		List list2 = surveyService.infoGraph2(courseID);
		mav.addObject("datas2", list2);
		List list3 = surveyService.infoGraph3(courseID);
		mav.addObject("datas3", list3);
		List list4 = surveyService.infoGraph4(courseID);
		mav.addObject("datas4", list4);
		List list5 = surveyService.infoGraph5(courseID);
		mav.addObject("datas5", list5);
		List list6 = surveyService.infoGraph6(courseID);
		mav.addObject("datas6", list6);
		List list7 = surveyService.infoGraph7(courseID);
		mav.addObject("datas7", list7);
		List list8 = surveyService.infoGraph8(courseID);
		mav.addObject("datas8", list8);
		List list9 = surveyService.infoGraph9(courseID);
		mav.addObject("datas9", list9);
		List list10 = surveyService.infoGraph10(courseID);
		mav.addObject("datas10", list10);
		List list11 = surveyService.infoGraph11(courseID);
		mav.addObject("datas11", list11);
		List list12 = surveyService.infoGraph12(courseID);
		mav.addObject("datas12", list12);
		List list13 = surveyService.infoGraph13(courseID);
		mav.addObject("datas13", list13);
		List list14 = surveyService.infoGraph14(courseID);
		mav.addObject("datas14", list14);
		List list15 = surveyService.infoGraph15(courseID);
		mav.addObject("datas15", list15);
		List list16 = surveyService.infoGraph16(courseID);
		mav.addObject("datas16", list16);
		List list17 = surveyService.infoGraph17(courseID);
		mav.addObject("datas17", list17);
		
		mav.setViewName("jsonView");
		return mav;
	}

}
