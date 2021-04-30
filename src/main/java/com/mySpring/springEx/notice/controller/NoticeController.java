package com.mySpring.springEx.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.notice.vo.NoticeVO;

public interface NoticeController {
	public ModelAndView listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView readNotice(@RequestParam("notice_no") int notice_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public String insertNotice(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception;

	public ModelAndView updateView(@RequestParam("notice_no") int notice_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public String updateNotice(NoticeVO noticeVO,  RedirectAttributes rttr,
			 @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception;

	public String deleteNotice(NoticeVO noticeVO) throws Exception;

}
