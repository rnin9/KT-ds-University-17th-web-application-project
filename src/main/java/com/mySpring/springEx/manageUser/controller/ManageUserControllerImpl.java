package com.mySpring.springEx.manageUser.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.manageUser.service.ManageUserService;
import com.mySpring.springEx.member.vo.MemberVO;

@Controller("manageUserController")
public class ManageUserControllerImpl implements ManageUserController{
	
	@Autowired
	private ManageUserService manageUserService;
	
	@Autowired
	MemberVO memberVO;
	
	@Override
	   @RequestMapping(value="/manageUser/userList.do", method=RequestMethod.GET)
	   public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      String viewName = (String)request.getAttribute("viewName");
	      List userList = manageUserService.userList();
	      ModelAndView mav = new ModelAndView(viewName);
	      mav.addObject("userList", userList);
	      return mav;
	   }
}
