package com.mySpring.springEx.partner.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.partner.service.PartnerService;
import com.mySpring.springEx.partner.vo.PartnerVO;


@Controller("partnerController")
public class PartnerContorollerImpl implements PartnerController{
	
	
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	PartnerVO partnervo;
	
	
	@Override
	@RequestMapping(value = "/partner/partnerList.do", method = RequestMethod.GET)
	public ModelAndView partnerList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		List partnerList = partnerService.listPartner();
		List numPartner = partnerService.listNumPartner();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("partnerList",partnerList);
		mav.addObject("numCooperation",numPartner.get(0));
		mav.addObject("numConvention",numPartner.get(1));
		mav.addObject("numNot",numPartner.get(2));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/partner/addPartner.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addPartner(@ModelAttribute("partner")PartnerVO partner, HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		partnerService.addPartner(partner);
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/partner/partnerForm.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	

}
