package com.mySpring.springEx.partner.controller;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.application.vo.ApplicationVO;
import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.partner.service.PartnerService;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.resume.vo.ResumeVO;
import com.mySpring.springEx.suggestion.vo.SuggestionVO;

@Controller("partnerController")
public class PartnerControllerImpl implements PartnerController {

	@Autowired
	private PartnerService partnerService;

	@Autowired
	PartnerVO partnervo;
<<<<<<< HEAD:src/main/java/com/mySpring/springEx/partner/controller/PartnerControllerImpl.java

	
=======
	
	@Autowired
	ResumeVO resumeVO;
	
	
	// select companyList
>>>>>>> 79c1ac26c0c8d913397bc5a2c2468c5ffcf15a8a:src/main/java/com/mySpring/springEx/partner/controller/PartnerContorollerImpl.java
	@Override
	@RequestMapping(value = "/partner/partnerList.do", method = RequestMethod.GET)
	public ModelAndView partnerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		List partnerList = partnerService.SelectAllListPartner();
		

		ModelAndView mav = new ModelAndView(viewName);
<<<<<<< HEAD:src/main/java/com/mySpring/springEx/partner/controller/PartnerControllerImpl.java
		mav.addObject("partnerList",partnerList);
		List numPartner = partnerService.listNumPartner(); 
		mav.addObject("numCooperation", numPartner.get(0));
		mav.addObject("numConvention", numPartner.get(1)); 
		mav.addObject("numIng", numPartner.get(2)); 
		mav.addObject("numNot", numPartner.get(3)); 
		return mav;
	}

	
	@Override
	@RequestMapping(value = "/partner/addPartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addPartner(@ModelAttribute("partner") PartnerVO partner, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception { 
																							
		request.setCharacterEncoding("utf-8");
		partnerService.addPartner(partner); 
		rttr.addFlashAttribute("msg", "addSuccess");
		rttr.addFlashAttribute("partnerName", partner.getPartnerName());
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do"); 
																					
		return mav;
	}

	
	@Override
	@RequestMapping(value = "/partner/partnerForm.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception { 
																											
=======
		mav.addObject("pagination", pagination);
		mav.addObject("partnerList", partnerService.SelectAllListPartner(pagination));

		List numPartner = partnerService.listNumPartner(); // count cooperation, convention, partner ~ing, count method

		mav.addObject("numCooperation", numPartner.get(0)); // cooperation count(*)
		mav.addObject("numConvention", numPartner.get(1)); // convention count(*)
		mav.addObject("numIng", numPartner.get(2)); // partner ing count(*)
		mav.addObject("numNot", numPartner.get(3)); // partner not count(*)
		return mav;
	}

	// Add partner Start
	@Override
	@RequestMapping(value = "/partner/addPartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addPartner(@ModelAttribute("partner") PartnerVO partner, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception { // partnerVO瑜� 媛앹껜濡� 諛쏆븘�꽌 db�뿉 ���옣�븯�뒗
																							// 硫붿냼�뱶
		request.setCharacterEncoding("utf-8");
		partnerService.addPartner(partner); // addPartner calling
		rttr.addFlashAttribute("msg", "addSuccess");
		rttr.addFlashAttribute("partnerName", partner.getPartnerName());
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do"); // addpartner瑜� �븳 �썑 �떎�떆 partnerList濡� �룎�븘媛�寃�
																					// �꽕�젙
		return mav;
	}

	// Add partner End
	@Override
	@RequestMapping(value = "/partner/partnerForm.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception { // form�쑝濡� �씠�룞�븯�뒗
																											// 硫붿냼�뱶
>>>>>>> 79c1ac26c0c8d913397bc5a2c2468c5ffcf15a8a:src/main/java/com/mySpring/springEx/partner/controller/PartnerContorollerImpl.java
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

<<<<<<< HEAD:src/main/java/com/mySpring/springEx/partner/controller/PartnerControllerImpl.java
	
	@Override
	@RequestMapping(value = "/partner/detailInfoPartner.do", method = RequestMethod.GET)
	public ModelAndView detailInfoPartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception { 
=======
	// Partner Detail information
	@Override
	@RequestMapping(value = "/partner/detailInfoPartner.do", method = RequestMethod.GET)
	public ModelAndView detailInfoPartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception { // modform�쑝濡� �씠�룞�븯�뒗 硫붿냼�뱶
>>>>>>> 79c1ac26c0c8d913397bc5a2c2468c5ffcf15a8a:src/main/java/com/mySpring/springEx/partner/controller/PartnerContorollerImpl.java
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		PartnerVO partnerVO;
		partnerVO = partnerService.partnerDetailInfo(partnerLicenseNum);
		mav.addObject("partnerVO", partnerVO);
		mav.setViewName(viewName);
		return mav;
	}

<<<<<<< HEAD:src/main/java/com/mySpring/springEx/partner/controller/PartnerControllerImpl.java
	
=======
	// Partner information modify
>>>>>>> 79c1ac26c0c8d913397bc5a2c2468c5ffcf15a8a:src/main/java/com/mySpring/springEx/partner/controller/PartnerContorollerImpl.java
	@Override
	@RequestMapping(value = "/partner/modPartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modPartner(@ModelAttribute("partner") PartnerVO partner, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(partner.getPartnerAddress());
		System.out.println(partner.getPartnerEmail());
		partnerService.modPartner(partner);
		rttr.addFlashAttribute("msg", "modSuccess");
		rttr.addFlashAttribute("partnerName", partner.getPartnerName());
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do");

		return mav;
	}

<<<<<<< HEAD:src/main/java/com/mySpring/springEx/partner/controller/PartnerControllerImpl.java
	
=======
	// Partner Information delete
>>>>>>> 79c1ac26c0c8d913397bc5a2c2468c5ffcf15a8a:src/main/java/com/mySpring/springEx/partner/controller/PartnerContorollerImpl.java
	@Override
	@RequestMapping(value = "/partner/deletePartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removePartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String partnerName = partnerService.removePartner(partnerLicenseNum);
<<<<<<< HEAD:src/main/java/com/mySpring/springEx/partner/controller/PartnerControllerImpl.java
		System.out.println("�̸�" + partnerName);
=======
		System.out.println("�씠由�" + partnerName);
>>>>>>> 79c1ac26c0c8d913397bc5a2c2468c5ffcf15a8a:src/main/java/com/mySpring/springEx/partner/controller/PartnerContorollerImpl.java
		rttr.addFlashAttribute("msg", "removeSuccess");
		rttr.addFlashAttribute("partnerName", partnerName);
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do");
		return mav;
	}

	
	
	/* ===================================Partner Company Method Start==============================*/
	@RequestMapping(value = "/partner/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView companyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/main");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/partner/company/companyEmployee.do", method = RequestMethod.GET)
	public ModelAndView companyEmployee(
			@RequestParam("partnerLicenseNum") String partnerLicenseNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/company/companyEmployee");
		mav.addObject("companyEmployeeList",partnerService.SelectAllListCompanyEmployee(partnerLicenseNum)); // �닔媛뺤쨷�씤 �쉶�썝 由ъ뒪�듃�뜲�씠�꽣
		return mav;
	}

	@Override
	@RequestMapping(value="/partner/company/companyApplyManage.do", method = RequestMethod.GET)
	public ModelAndView companyApplyManage(String partnerLicenseNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/company/companyApplyManage");
		mav.addObject("applyList", partnerService.selectApplyList(partnerLicenseNum));
		mav.addObject("suggestionList", partnerService.selectRecruitList(partnerLicenseNum));
		List list = partnerService.selectApplyList(partnerLicenseNum);
		/*
		 * mav.addObject("suggestList",
		 * partnerService.selectSuggestList(partnerLicenseNum));
		 */
<<<<<<< HEAD:src/main/java/com/mySpring/springEx/partner/controller/PartnerControllerImpl.java
		 ModelAndView mav = new ModelAndView(viewName);
	  
	  return mav; }
	  
	  @RequestMapping(value="/partner/partnerCheck.do", method=RequestMethod.POST)
		public ModelAndView deleteCheck(@RequestParam List<String> valueArr) {
			for(int i=0; i<valueArr.size(); i++) {
				partnerService.removePartner(valueArr.get(i));
			}
			ModelAndView mav = new ModelAndView("redirect:/syllabus/syllabusList.do");
			return mav;
		}
=======
		return mav;
	}
	
	@Override
	@RequestMapping(value="/partner/company/manageSuggest.do", method = RequestMethod.POST)
	public ModelAndView companySuggestManage(@ModelAttribute("suggestion") SuggestionVO suggestion,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/company/manageSuggest");
		suggestion.setPartnerSuggestionDescription(suggestion.getPartnerSuggestionDescription().replace("\r\n", "<br>").replace("\n", "<br>").replace(" ","&nbsp;"));
		partnerService.insertSuggestion(suggestion);
		
		/*
		 * mav.addObject("suggestList",
		 * partnerService.selectSuggestList(partnerLicenseNum));
		 */
		mav.setViewName("jsonView");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/partner/company/infoGraph.do", method = RequestMethod.GET)
	
	public ModelAndView companyInfoGraph(@RequestParam("partnerLicenseNum") String partnerLicenseNum,HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		List list = partnerService.infoGraph(partnerLicenseNum);
		mav.addObject("datas",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/partner/getResumeByID.do", method = RequestMethod.GET)
	public ModelAndView getResumeByID(@RequestParam("partnerApplyResumeID") String resumeID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		resumeVO = partnerService.getUserResume(resumeID);
		mav.addObject("resume", resumeVO);
		mav.setViewName("jsonView");
		return mav;
	}

	//	post job opening
	@Override
	@RequestMapping(value = "/partner/jobOpeningPost.do", method = RequestMethod.GET)
	public ModelAndView jobOpeningPost(
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("partnerApplyNList", partnerService.selectPartnerApplyN());

		return mav;
	}

	@Override
	@RequestMapping(value = "/partner/jobOpeningList.do", method = RequestMethod.GET)
	public ModelAndView jobOpeningList (Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("jobOpeningList", partnerService.selectJobOpeningList());
		return mav;
	}

	@Override
	@RequestMapping(value = "/partner/postJobOpening.do", method = RequestMethod.POST)
	public ModelAndView postJobOpening(@RequestParam List<String> valueArr) {
		String date = valueArr.get(0);
		for (int i = 1; i < valueArr.size(); i++) {
			partnerService.postJobOpening(valueArr.get(i), date);
		}
		ModelAndView mav = new ModelAndView("redirect:/partner/jobOpeningPost.do");
		return mav;
	}
>>>>>>> 79c1ac26c0c8d913397bc5a2c2468c5ffcf15a8a:src/main/java/com/mySpring/springEx/partner/controller/PartnerContorollerImpl.java

	@Override
	@RequestMapping(value = "/partner/deleteJobOpening.do", method = RequestMethod.POST)
	public ModelAndView deleteJobOpening(@RequestParam List<String> valueArr) {
		for (int i = 0; i < valueArr.size(); i++) {
			partnerService.deleteJobOpening(valueArr.get(i));
		}
		ModelAndView mav = new ModelAndView("redirect:/partner/jobOpeningList.do");
		return mav;
	}
  
	@Override
	@RequestMapping(value = "/partner/company/manageApply.do", method = RequestMethod.POST)
	public ModelAndView companyManageApply(ApplicationVO application, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/company/manageApply");
		partnerService.manageUserApply(application);
		mav.addObject("resume", partnerService.getUserResume(application.getPartnerApplyUserID()));
		mav.setViewName("jsonView");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/partner/company/deleteSuggest.do", method = RequestMethod.POST)
	public ModelAndView companySuggestDelete(SuggestionVO suggestion, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/company/deleteSuggest");
		partnerService.deleteCompanySuggest(suggestion);
		mav.setViewName("jsonView");
		return mav;
		
	}
	/* ===================================Partner Company Method End==============================*/
}
