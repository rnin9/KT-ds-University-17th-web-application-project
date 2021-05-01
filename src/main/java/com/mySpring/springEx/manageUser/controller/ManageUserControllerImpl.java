package com.mySpring.springEx.manageUser.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mySpring.springEx.common.interceptor.Auth;
import com.mySpring.springEx.common.interceptor.Auth.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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

	@Auth(role=Role.ADMIN)
	@Override
	   @RequestMapping(value="/manageUser/userList.do", method=RequestMethod.GET)
	   public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      String viewName = (String)request.getAttribute("viewName");
	      List userList = manageUserService.userList();
	      ModelAndView mav = new ModelAndView(viewName);
	      mav.addObject("userList", userList);
	      return mav;
	   }

	@Override
	@RequestMapping(value = { "/manageUser/resetPW.do" }, method = { RequestMethod.POST })
	public void resetPW(@RequestBody Map<String, String> body, HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
//		System.out.println("************************"+ body.get("userID"));
		manageUserService.resetPW(body.get("userID"));
	}

	@Override
	@RequestMapping(value = { "/manageUser/positionModify.do" }, method = { RequestMethod.POST })
	public void positionModify(@RequestBody Map<String, String> body, HttpServletRequest request,
						HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(body.get("newPosition")+"************************"+ body.get("userID"));
		manageUserService.positionModify(body.get("newPosition"), body.get("userID"));
	}
}
