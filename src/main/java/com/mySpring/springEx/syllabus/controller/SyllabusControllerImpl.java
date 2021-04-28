package com.mySpring.springEx.syllabus.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.syllabus.service.SyllabusService;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Controller("syllabusController")
public class SyllabusControllerImpl implements SyllabusController {
	@Autowired
	private SyllabusService syllabusService;

	@Autowired
	SyllabusVO syllabusVO;

	// ���ǰ�ȹ�� ����Ʈ�� ������
	@Override
	@RequestMapping(value = "/syllabus/syllabusList.do", method = RequestMethod.GET)
	public ModelAndView syllabusList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List syllabusList = syllabusService.syllabusList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("syllabusList", syllabusList);
		return mav;
	}

	// ������ ���ǰ�ȹ�� ������ ������
	@Override
	@RequestMapping(value = "/syllabus/selectSyllabus.do", method = RequestMethod.GET)
	public ModelAndView selectSyllabus(@RequestParam("syllabusID") int syllabusID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		SyllabusVO syllabusVO = syllabusService.selectSyllabus(syllabusID);
		mav.addObject("syllabusVO", syllabusVO);
		return mav;
	}

	// ���ǰ�ȹ�� ����ϴ� ��
	@RequestMapping(value = "/syllabus/syllabusForm.do", method = RequestMethod.GET)
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	// ���ǰ�ȹ�� ���
	@Override
	@RequestMapping(value = "/syllabus/insertSyllabus.do", method = RequestMethod.POST)
	public ModelAndView insertSyllabus(@ModelAttribute("syllabus") SyllabusVO syllabusVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
//      List courseList = courseInformationService.courseList();
		syllabusVO.setSyllabusCategory2(syllabusVO.getSyllabusCategory2().replace("chr(38)", "&"));
		syllabusVO.setSyllabusOutline(syllabusVO.getSyllabusOutline().replace("\r\n", "<br>").replace(" ", "&nbsp;"));
		syllabusVO.setSyllabusPurpose(syllabusVO.getSyllabusPurpose().replace("\r\n", "<br>").replace(" ", "&nbsp;"));
		syllabusVO.setSyllabusTarget(syllabusVO.getSyllabusTarget().replace("\r\n", "<br>").replace(" ", "&nbsp;"));
		syllabusVO.setSyllabusContent(syllabusVO.getSyllabusContent().replace("\r\n", "<br>").replace(" ", "&nbsp;"));
		int result = 0;
		result = syllabusService.insertSyllabus(syllabusVO);
		ModelAndView mav = new ModelAndView("redirect:/syllabus/syllabusList.do");
//      mav.addObject("courseList", courseList);

      return mav;
   }
   
   @Override
   @RequestMapping(value="/syllabus/deleteSyllabus.do" ,method = RequestMethod.POST)
   public ModelAndView deleteSyllabus(@RequestParam("syllabusID") int syllabusID, HttpServletRequest request, HttpServletResponse response) throws Exception{
      request.setCharacterEncoding("utf-8");
      System.out.println("-----------------------------------------"+syllabusID);
      syllabusService.deleteSyllabus(syllabusID);
      ModelAndView mav = new ModelAndView("redirect:/syllabus/syllabusList.do");
      return mav;
   }
   
   @Override
   @RequestMapping(value="/syllabus/syllabusModifyForm.do", method = RequestMethod.GET)
   public ModelAndView syllabusModifyForm(@RequestParam("syllabusID") int syllabusID, HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      String viewName = (String)request.getAttribute("viewName");
      ModelAndView mav = new ModelAndView();
      mav.setViewName(viewName);
      SyllabusVO syllabusVO = syllabusService.selectSyllabus(syllabusID);
      syllabusVO.setSyllabusOutline(syllabusVO.getSyllabusOutline().replace("<br>", "\r\n"));
      syllabusVO.setSyllabusPurpose(syllabusVO.getSyllabusPurpose().replace("<br>", "\r\n"));
      syllabusVO.setSyllabusTarget(syllabusVO.getSyllabusTarget().replace("<br>", "\r\n"));
      syllabusVO.setSyllabusContent(syllabusVO.getSyllabusContent().replace("<br>", "\r\n"));
      mav.addObject("syllabusVO", syllabusVO);
      return mav;
   }
   
   @Override
   @RequestMapping(value="/syllabus/modifySyllabus.do", method = RequestMethod.POST)
   public ModelAndView modifySyllabus(@ModelAttribute("syllabus") SyllabusVO syllabusVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      syllabusVO.setSyllabusCategory2(syllabusVO.getSyllabusCategory2().replace("chr(38)", "&"));
      syllabusVO.setSyllabusOutline(syllabusVO.getSyllabusOutline().replace("\r\n", "<br>").replace(" ","&nbsp;"));
      syllabusVO.setSyllabusPurpose(syllabusVO.getSyllabusPurpose().replace("\r\n", "<br>").replace(" ","&nbsp;"));
      syllabusVO.setSyllabusTarget(syllabusVO.getSyllabusTarget().replace("\r\n", "<br>").replace(" ","&nbsp;"));
      syllabusVO.setSyllabusContent(syllabusVO.getSyllabusContent().replace("\r\n", "<br>").replace(" ","&nbsp;"));
      
      int result = syllabusService.modifySyllabus(syllabusVO);
      ModelAndView mav = new ModelAndView("redirect:/syllabus/syllabusList.do");
      return mav;
   }
   
   @RequestMapping(value="/syllabus/deleteCheck.do", method=RequestMethod.POST)
   public ModelAndView deleteCheck(@RequestParam List<Integer> valueArr) {
      for(int i=0; i<valueArr.size(); i++) {
         syllabusService.deleteSyllabus(valueArr.get(i));
      }
      ModelAndView mav = new ModelAndView("redirect:/syllabus/syllabusList.do");
      return mav;
   }
  
	@RequestMapping(value = "/syllabus/deleteCheck.do", method = RequestMethod.POST)
	public ModelAndView deleteCheck(@RequestParam List<Integer> valueArr) {
		for (int i = 0; i < valueArr.size(); i++) {
			syllabusService.deleteSyllabus(valueArr.get(i));
		}
		ModelAndView mav = new ModelAndView("redirect:/syllabus/syllabusList.do");
		return mav;
	}

}