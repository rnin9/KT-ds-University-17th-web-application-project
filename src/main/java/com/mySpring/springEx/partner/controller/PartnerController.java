package com.mySpring.springEx.partner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerController {
	
	public ModelAndView partnerList(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	
	public ModelAndView addPartner(PartnerVO partner, HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
	

}
