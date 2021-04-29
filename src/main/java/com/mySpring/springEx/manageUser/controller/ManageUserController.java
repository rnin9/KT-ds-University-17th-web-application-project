package com.mySpring.springEx.manageUser.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ManageUserController {
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
