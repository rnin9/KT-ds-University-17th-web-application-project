package com.mySpring.springEx.partner.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerController {

	public ModelAndView partnerList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView addPartner(PartnerVO partner, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView modPartner(PartnerVO partner, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView detailInfoPartner(String partnerLicenseNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView removePartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	/* 기업관련 */
	public ModelAndView companyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView companyEmployee(@RequestParam("partnerLicenseNum") String partnerLicenseNum, @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView searchCompanyEmployee(@RequestParam("partnerLicenseNum") String partnerLicenseNum, @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			@RequestParam(value="userName")String userName, @RequestParam(value="syllabusName")String syllabusName,
			@RequestParam(value="courseStartDate")String courseStartDate, @RequestParam(value="completionDate")String completionDate,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	/* 기업관련 끝 */
	

}
