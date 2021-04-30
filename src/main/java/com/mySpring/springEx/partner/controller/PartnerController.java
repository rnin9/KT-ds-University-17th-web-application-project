package com.mySpring.springEx.partner.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.application.vo.ApplicationVO;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.suggestion.vo.SuggestionVO;

public interface PartnerController {


	public ModelAndView partnerList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView jobOpeningPost(
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView jobOpeningList (Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView postJobOpening(@RequestParam List<String> valueArr);

	public ModelAndView deleteJobOpening(@RequestParam List<String> valueArr);

	public ModelAndView addPartner(PartnerVO partner, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView modPartner(PartnerVO partner, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView detailInfoPartner(String partnerLicenseNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView removePartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	/* partner-company method start*/
	public ModelAndView companyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView companyEmployee(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView companyApplyManage(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView companyInfoGraph(@RequestParam("partnerLicenseNum") String partnerLicenseNum,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView getResumeByID(@RequestParam("partnerApplyResumeID") String resumeID, @RequestParam("partnerApplyUserID") String userID, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView companyManageApply(@ModelAttribute("application") ApplicationVO application, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView companySuggestManage(@ModelAttribute("suggestion") SuggestionVO suggestion,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView companySuggestDelete(@ModelAttribute("suggestion")SuggestionVO suggestion, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	/* partner-company method end */

}
