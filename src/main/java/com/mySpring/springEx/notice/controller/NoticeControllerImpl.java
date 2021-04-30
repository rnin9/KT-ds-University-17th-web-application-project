package com.mySpring.springEx.notice.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.notice.dao.NoticeDAO;
import com.mySpring.springEx.notice.service.NoticeService;
import com.mySpring.springEx.notice.vo.NoticeVO;

@Controller("noticeController")
public class NoticeControllerImpl implements NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	NoticeVO noticeVO;
	@Autowired
	private NoticeDAO noticeDAO;

	// 공지사항 리스트
	@Override
	@RequestMapping(value = { "/notice/listNotice.do" }, method = RequestMethod.GET)
	public ModelAndView listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List noticeList = noticeService.listNotice();
		List noticeFixList = noticeService.listFixNotice();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("noticeList", noticeList);
		mav.addObject("noticeFixList", noticeFixList);
		return mav;
	}

	// 유저 공지사항
	@RequestMapping(value = { "/notice/listNoticeUser.do" }, method = RequestMethod.GET)
	public ModelAndView listNoticeUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List noticeList = noticeService.listNotice();
		List noticeFixList = noticeService.listFixNotice();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("noticeListUser", noticeList);
		mav.addObject("noticeFixList", noticeFixList);
		// new 보여주기

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -3); // 3일간 보이도록 하기위해서.
		String nowday = format.format(cal.getTime());

		mav.addObject("nowday", nowday);
		System.out.println(nowday);
		System.out.println();
		return mav;
	}

	// 유저 공지사항 고정 글
	@RequestMapping(value = { "/notice/listFixNotice.do" }, method = RequestMethod.GET)
	public ModelAndView listFixNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List noticeList = noticeService.listFixNotice();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("noticeFixList", noticeList);
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
	public String insertNotice(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception {
		noticeVO.setNotice_contents(noticeVO.getNotice_contents().replace("\r\n", "<br>").replace(" ", "&nbsp;"));
		noticeService.insertNotice(noticeVO, mpRequest);
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
		List<Map<String, String>> fileList = noticeService.selectFileList(noticeVO.getNotice_no());
		if (fileList.size() != 0) {
			for (int i = 0; i < fileList.size(); i++) {
				Iterator<String> keys = fileList.get(i).keySet().iterator();
				while (keys.hasNext()) {
					String key = keys.next();
					System.out.println(String.format("키 : %s, 값 : %s", key, fileList.get(i).get(key)));
				}
			}

			System.out.println(fileList.get(0));
			mav.addObject("fileList", fileList);
		}
		return mav;

	}

	// 유저 공지사항 조회창
	@RequestMapping(value = { "/notice/readNoticeUser.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView readNoticeUser(@RequestParam("notice_no") int notice_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		

		List<Map<String, String>> fileList = noticeService.selectFileList(notice_no);
		if (fileList.size() != 0) {
			for (int i = 0; i < fileList.size(); i++) {
				Iterator<String> keys = fileList.get(i).keySet().iterator();
				while (keys.hasNext()) {
					String key = keys.next();
					System.out.println(String.format("키 : %s, 값 : %s", key, fileList.get(i).get(key)));
				}
			}

			System.out.println(fileList.get(0));
			mav.addObject("fileListUser", fileList);
		}

		Cookie[] cookies = request.getCookies();

		// 비교하기 위해 새로운 쿠키
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + notice_no)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}
		noticeVO = (NoticeVO) noticeService.readNotice(notice_no);
		if (noticeVO != null) {
			System.out.println("System - 해당 상세 리뷰페이지로 넘어감");

			mav.addObject("noticeVO", noticeVO);

			// 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
			if (viewCookie == null) {
				System.out.println("cookie 없음");

				// 쿠키 생성(이름, 값)
				Cookie newCookie = new Cookie("cookie" + notice_no, "|" + notice_no + "|");

				// 쿠키 추가
				response.addCookie(newCookie);

				// 쿠키를 추가 시키고 조회수 증가시킴
				int result = noticeDAO.noticeHit(notice_no);

				if (result > 0) {
					System.out.println("조회수 증가");
				} else {
					System.out.println("조회수 증가 에러");
				}
			}
			// viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
			else {
				System.out.println("cookie 있음");

				// 쿠키 값 받아옴.
				String value = viewCookie.getValue();

				System.out.println("cookie 값 : " + value);
			}
		}
		noticeVO = (NoticeVO) noticeService.readNotice(notice_no);
		mav.addObject("readNoticeUser", noticeVO);
		return mav;

		// 에러 페이지 설정

	}

	// 공지사항 수정 창
	@Override
	@RequestMapping(value = { "/notice/updateView.do" }, method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView updateView(@RequestParam("notice_no") int notice_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeVO = (NoticeVO) noticeService.readNotice(notice_no);
		noticeVO.setNotice_contents(noticeVO.getNotice_contents().replace("<br>", "\r\n").replace("&nbsp;", " "));
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("updateNotice", noticeVO);
		List<Map<String, String>> fileList = noticeService.selectFileList(noticeVO.getNotice_no());
		mav.addObject("file", fileList);
		System.out.println("updateNotice");
		return mav;
	}

	// 공지사항 수정
	@Override
	@RequestMapping(value = { "/notice/updateNotice.do" }, method = RequestMethod.POST)
	public String updateNotice(NoticeVO noticeVO, RedirectAttributes rttr,
			@RequestParam(value = "fileNoDel[]") String[] files,
			@RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {
		noticeVO.setNotice_contents(noticeVO.getNotice_contents().replace("\r\n", "<br>").replace(" ", "&nbsp;"));
		noticeService.updateNotice(noticeVO, files, fileNames, mpRequest);
		return "redirect:/notice/listNotice.do";
	}

	// 공지사항 삭제
	@Override
	@RequestMapping(value = { "/notice/deleteNotice.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteNotice(NoticeVO noticeVO) throws Exception {
		noticeService.deleteNotice(noticeVO.getNotice_no());
		return "redirect:/notice/listNotice.do";
	}

	// 공지사항 일괄삭제
	@RequestMapping(value = "/notice/deleteCheck.do", method = RequestMethod.POST)
	public ModelAndView deleteCheck(@RequestParam List<Integer> valueArr) {
		for (int i = 0; i < valueArr.size(); i++) {
			noticeService.deleteNotice(valueArr.get(i));
			System.out.println(valueArr);
		}
		ModelAndView mav = new ModelAndView("redirect:/notice/listNotice.do");
		return mav;
	}

	// 공지사항 첨부파일 다운로드
	@RequestMapping(value = "/notice/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
//		Iterator<String> keys = map.keySet().iterator();
//		while (keys.hasNext()) {
//			String key = keys.next();
//			System.out.println(String.format("키 : %s, 값 : %s", key, map.get(key)));
//		}
		Map<String, Object> resultMap = noticeService.selectFileInfo(map);
		String str_nt_file_name = (String) resultMap.get("STR_NT_FILE_NAME");
		String org_nt_file_name = (String) resultMap.get("ORG_NT_FILE_NAME");

		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(

				new File("C:\\Users\\eunjin\\OneDrive\\바탕 화면\\KT-ds-University-17th-web-application-project\\"

						+ str_nt_file_name));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(org_nt_file_name, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

}
