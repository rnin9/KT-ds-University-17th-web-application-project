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
import com.mySpring.springEx.common.interceptor.Auth;
import com.mySpring.springEx.common.interceptor.Auth.Role;
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
	
	@Autowired
	ResumeVO resumeVO;
		
	
	// select companyList
	@Override
	@RequestMapping(value = "/partner/partnerList.do", method = RequestMethod.GET)
	public ModelAndView partnerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		List partnerList = partnerService.SelectAllListPartner();
		

		ModelAndView mav = new ModelAndView(viewName);
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
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/partner/detailInfoPartner.do", method = RequestMethod.GET)
	public ModelAndView detailInfoPartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception { 
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		PartnerVO partnerVO;
		partnerVO = partnerService.partnerDetailInfo(partnerLicenseNum);
		mav.addObject("partnerVO", partnerVO);
		mav.setViewName(viewName);
		return mav;
	}

	// Partner information modify
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

	// Partner Information delete
	@Override
	@RequestMapping(value = "/partner/deletePartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removePartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String partnerName = partnerService.removePartner(partnerLicenseNum);
		rttr.addFlashAttribute("msg", "removeSuccess");
		rttr.addFlashAttribute("partnerName", partnerName);
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do");
		return mav;
	}

	
	
	/* ===================================Partner Company Method Start==============================*/
	@Auth(role=Role.PA)
	@RequestMapping(value = "/partner/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView companyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/main");
		return mav;
	}
	
	@Auth(role=Role.PARTNER)
	@Override
	@RequestMapping(value = "/partner/company/companyEmployee.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView companyEmployee(
			@RequestParam("partnerLicenseNum") String partnerLicenseNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/company/companyEmployee");
		mav.addObject("companyEmployeeList",partnerService.SelectAllListCompanyEmployee(partnerLicenseNum)); // �뜝�럥�빢�뤆�룆踰▼ㅇ琉꾩삕占쎈데 �뜝�럩�뤂�뜝�럩�쐸 占쎈뎨占쎈봾裕욃뜝�럥諭쒎뜝�럥�몥�뜝�럩逾졾뜝�럡�댉
		return mav;
	}
	
	@Auth(role=Role.PARTNER)
	@Override
	@RequestMapping(value="/partner/company/companyApplyManage.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		return mav;
		}
		
/*
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
*/
	
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
	public ModelAndView getResumeByID(@RequestParam("partnerApplyResumeID") String resumeID, @RequestParam("partnerApplyUserID") String userID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		resumeVO = partnerService.getUserResume(resumeID);
		List cerList = partnerService.getUserCer(resumeID, userID);		//certificate
		List proList = partnerService.getUserPro(resumeID, userID);      //project
		List forList = partnerService.getUserFor(resumeID, userID);      //foreign
		List carrList = partnerService.getUserCarr(resumeID, userID);    //career
		
		mav.addObject("resume", resumeVO);
		mav.addObject("certificate", cerList); 
		mav.addObject("project", proList);
		mav.addObject("foreign", forList);
		mav.addObject("career", carrList);
		mav.setViewName("jsonView");
		return mav;
	}

	//	post job opening
	@Auth(role=Role.ADMIN)
	@Override
	@RequestMapping(value = "/partner/jobOpeningPost.do", method = RequestMethod.GET)
	public ModelAndView jobOpeningPost(
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("partnerApplyNList", partnerService.selectPartnerApplyN());

		return mav;
	}

	@Auth(role=Role.ADMIN)
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
