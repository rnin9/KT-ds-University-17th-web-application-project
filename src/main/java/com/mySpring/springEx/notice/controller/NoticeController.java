package com.mySpring.springEx.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.notice.vo.NoticeVO;

public interface NoticeController {
	public ModelAndView listNotice(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage, 
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10")int cntPerPage,
			 @RequestParam(value = "pageSize", required = false, defaultValue = "10")int pageSize, 
			 Map<String, Object> map,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView readNotice(@RequestParam("notice_no") int notice_no, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public String insertNotice(NoticeVO noticeVO) throws Exception;
	public ModelAndView updateView(@RequestParam("notice_no") int notice_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public String updateNotice(NoticeVO noticeVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public String deleteNotice(NoticeVO noticeVO) throws Exception;
	
	
}
	
	
