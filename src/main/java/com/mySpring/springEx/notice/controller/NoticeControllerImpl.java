package com.mySpring.springEx.notice.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
	public ModelAndView listNotice(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		request.setCharacterEncoding("utf-8");
		int noticeList = noticeService.testTableCount();
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		// 총 레코드 수에 따른 페이지 처리 method에 데이터의 총 갯수를 전달
		pagination.setTotalRecordCount(noticeList);
		ModelAndView mav = new ModelAndView(viewName);
		// 처리된 부분을 화면에 전달
		mav.addObject("pagination", pagination);
		mav.addObject("noticeList", noticeService.SelectAllList(pagination));
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
		for(int i = 0; i < fileList.size(); i++) {
			Iterator<String> keys = fileList.get(i).keySet().iterator();
	        while( keys.hasNext() ){
	            String key = keys.next();
	            System.out.println( String.format("키 : %s, 값 : %s", key, fileList.get(i).get(key)) );
	        }
		}
		System.out.println(fileList.get(0));
		mav.addObject("fileList", fileList);
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
		List<Map<String, String>> fileList = noticeService.selectFileList(noticeVO.getNotice_no());
		mav.addObject("file", fileList);
		System.out.println("updateNotice");
		return mav;
	}

	// 공지사항 수정
	@Override
	@RequestMapping(value = { "/notice/updateNotice.do" }, method = RequestMethod.POST)
	public String updateNotice(NoticeVO noticeVO,  RedirectAttributes rttr,
			 @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception {
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
	@RequestMapping(value="/notice/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Iterator<String> keys = map.keySet().iterator();
        while( keys.hasNext() ){
            String key = keys.next();
            System.out.println( String.format("키 : %s, 값 : %s", key, map.get(key)) );
        }
		Map<String, Object> resultMap = noticeService.selectFileInfo(map);
		  String str_nt_file_name = (String) resultMap.get("str_nt_file_name");
		  String org_nt_file_name = (String) resultMap.get("org_nt_file_name");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\Users\\Suchan\\Desktop\\KT-ds-University-17th-web-application-project\\file\\"+str_nt_file_name));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(org_nt_file_name, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}

}
