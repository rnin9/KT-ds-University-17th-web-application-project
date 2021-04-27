package com.mySpring.springEx.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.notice.service.NoticeService;
import com.mySpring.springEx.notice.vo.NoticeVO;


@Controller("noticeController")
public class NoticeControllerImpl implements NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	NoticeVO noticeVO;

	// 공지사항 리스트
		@Override
		@RequestMapping(value = { "/notice/listNotice.do" }, method = RequestMethod.GET)
		public ModelAndView listNotice(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
	            @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
	            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
	            Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			request.setCharacterEncoding("utf-8");
			//총 레코드 수에 따른 페이지 처리 method에 데이터의 총 갯수를 전달
		ModelAndView mav = new ModelAndView(viewName);
			//처리된 부분을 화면에 전달
			return mav;
			
			
		}
	

	// 공지사항 작성 창
	@RequestMapping(value = { "/notice/noticeForm.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	// 공지사항 입력
	@Override
	@RequestMapping(value = { "/notice/insertNotice.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String insertNotice(NoticeVO noticeVO) throws Exception {
		noticeService.insertNotice(noticeVO);
		return "redirect:/notice/listNotice.do";

	}

	// 공지사항 조회 창
	@Override
	@RequestMapping(value = { "/notice/readNotice.do" }, method = RequestMethod.GET)
	public ModelAndView readNotice(@RequestParam("notice_no") int notice_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeVO = (NoticeVO) noticeService.readNotice(notice_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("readNotice", noticeVO);
		System.out.println("readNotice");
		return mav;
	}

	// 공지사항 수정 창
	@Override
	@RequestMapping(value = { "/notice/updateView.do" }, method = RequestMethod.GET)
	public ModelAndView updateView(@RequestParam("notice_no") int notice_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeVO = (NoticeVO) noticeService.readNotice(notice_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("updateNotice", noticeVO);
		System.out.println("updateNotice");
		return mav;
	}

	// 공지사항 수정
	@Override
	@RequestMapping(value = { "/notice/updateNotice.do" }, method = RequestMethod.POST)
	public String updateNotice(NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		noticeService.updateNotice(noticeVO);
		return "redirect:/notice/listNotice.do";
	}

	// 공지사항 삭제
	@Override
	@RequestMapping(value = { "/notice/deleteNotice.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteNotice(NoticeVO noticeVO) throws Exception {
		noticeService.deleteNotice(noticeVO.getNotice_no());
		return "redirect:/notice/listNotice.do";
	}
}
