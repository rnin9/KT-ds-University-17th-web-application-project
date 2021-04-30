package com.mySpring.springEx.manageUser.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

public interface ManageUserController {
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void resetPW(@RequestBody Map<String, String> body, HttpServletRequest request,
						HttpServletResponse response) throws Exception;

	public void positionModify(@RequestBody Map<String, String> body, HttpServletRequest request,
							   HttpServletResponse response) throws Exception;
}
