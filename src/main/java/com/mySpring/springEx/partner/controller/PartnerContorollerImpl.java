package com.mySpring.springEx.partner.controller;


import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.partner.service.PartnerService;
import com.mySpring.springEx.partner.vo.PartnerVO;

@Controller("partnerController")
public class PartnerContorollerImpl implements PartnerController {

	@Autowired
	private PartnerService partnerService;

	@Autowired
	PartnerVO partnervo;

	// 회사 리스트 출력
	@Override
	@RequestMapping(value = "/partner/partnerList.do", method = RequestMethod.GET)
	public ModelAndView partnerList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		int partnerList = partnerService.testTableCountPartner();

		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);

		pagination.setTotalRecordCount(partnerList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("pagination", pagination);
		mav.addObject("partnerList", partnerService.SelectAllListPartner(pagination));

		List numPartner = partnerService.listNumPartner(); // 협력사, 협약사, 미협약, 협약 진행중 별로 count하는 메소드를 파트너 서비스에서 호출하여 리스트
															// 형태로 저장

		mav.addObject("numCooperation", numPartner.get(0)); // 협력사 count를 바인드
		mav.addObject("numConvention", numPartner.get(1)); // 협약사 count를 바인드
		mav.addObject("numIng", numPartner.get(2)); // 협약 진행중 count를 바인드
		mav.addObject("numNot", numPartner.get(3)); // 미협약 count를 바인드
		return mav;
	}

	// 회사 정보 입력
	@Override
	@RequestMapping(value = "/partner/addPartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addPartner(@ModelAttribute("partner") PartnerVO partner, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception { // partnerVO를 객체로 받아서 db에 저장하는
																							// 메소드
		request.setCharacterEncoding("utf-8");
		partnerService.addPartner(partner); // 파트너서비스의 addPartner를 호출
		rttr.addFlashAttribute("msg", "addSuccess");
		rttr.addFlashAttribute("partnerName", partner.getPartnerName());
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do"); // addpartner를 한 후 다시 partnerList로 돌아가게
																					// 설정
		return mav;
	}

	// 회사 정보 입력 폼
	@Override
	@RequestMapping(value = "/partner/partnerForm.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception { // form으로 이동하는
																											// 메소드
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 기업 상세 정보
	@Override
	@RequestMapping(value = "/partner/detailInfoPartner.do", method = RequestMethod.GET)
	public ModelAndView detailInfoPartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception { // modform으로 이동하는 메소드
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		PartnerVO partnerVO;
		partnerVO = partnerService.partnerDetailInfo(partnerLicenseNum);
		mav.addObject("partnerVO", partnerVO);
		mav.setViewName(viewName);
		return mav;
	}

	// 회사 정보 수정
	@Override
	@RequestMapping(value = "/partner/modPartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modPartner(@ModelAttribute("partner") PartnerVO partner, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		partnerService.modPartner(partner);
		rttr.addFlashAttribute("msg", "modSuccess");
		rttr.addFlashAttribute("partnerName", partner.getPartnerName());
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do");

		return mav;
	}

	// 기업 삭제
	@Override
	@RequestMapping(value = "/partner/deletePartner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removePartner(@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String partnerName = partnerService.removePartner(partnerLicenseNum);
		System.out.println("이름" + partnerName);
		rttr.addFlashAttribute("msg", "removeSuccess");
		rttr.addFlashAttribute("partnerName", partnerName);
		ModelAndView mav = new ModelAndView("redirect:/partner/partnerList.do");
		return mav;
	}

	
	
	/* ===================================협력사 관련 시작==============================*/
	@RequestMapping(value = "/partner/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView companyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/main");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/partner/company/companyEmployee.do", method = RequestMethod.GET)
	public ModelAndView companyEmployee(
			@RequestParam("partnerLicenseNum") String partnerLicenseNum,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int employeeList = partnerService.companyEmployeeTableCount(partnerLicenseNum); // 전체 수강중인 직원
		int companyUser = partnerService.companyUserNum(partnerLicenseNum);	// 우리 협력사 회원 수
		int companyCourseUser = partnerService.companyCourseUserNum(); // 수강중인 우리회사 회원 수
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(employeeList);
		ModelAndView mav = new ModelAndView("/partner/company/companyEmployee");
		mav.addObject("pagination", pagination);
		mav.addObject("userNum", companyUser);
		mav.addObject("courseUserNum", companyCourseUser);
		mav.addObject("pagination", pagination);
		mav.addObject("companyEmployeeList",partnerService.SelectAllListCompanyEmployee(pagination, partnerLicenseNum)); // 수강중인 회원 리스트데이터
		return mav;
	}

	@Override
	@RequestMapping(value="/partner/company/searchEmployee.do", method = RequestMethod.GET)
	public ModelAndView searchCompanyEmployee(String partnerLicenseNum, int currentPage, int cntPerPage, int pageSize,
			String userName, String syllabusName, String courseStartDate, String completionDate,
			Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int searchList = partnerService.searchEmployeeTableCount(partnerLicenseNum, userName, syllabusName, courseStartDate, completionDate);
		int companyUser = partnerService.companyUserNum(partnerLicenseNum);
		int companyCourseUser = partnerService.companyCourseUserNum();
		
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(searchList);
		
		ModelAndView mav = new ModelAndView("/partner/company/searchEmployee");
		mav.addObject("pagination", pagination);
		mav.addObject("userNum", companyUser);
		mav.addObject("courseUserNum", companyCourseUser);
		mav.addObject("companyEmployeeList", partnerService.SearchListCompanyEmployee(pagination, partnerLicenseNum,userName, syllabusName, courseStartDate, completionDate)); //찾은 직원 리스트
		mav.addObject("userName",userName);
		mav.addObject("syllName",syllabusName);
		mav.addObject("startDate",courseStartDate);
		mav.addObject("p_num",partnerLicenseNum);
		mav.addObject("completionDate",completionDate);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/partner/company/companyApplyManage.do", method = RequestMethod.GET)
	public ModelAndView companyApplyManage(String partnerLicenseNum,
			/*
			 * int currentPage, int cntPerPage, int pageSize, Map<String, Object> map,
			 */ HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/partner/company/companyApplyManage");
		
		return mav;
	}

	@Override
	@RequestMapping(value="/partner/company/infoGraph.do", method = RequestMethod.GET)
	
	public ModelAndView companyInfoGraph(@RequestParam("partnerLicenseNum") String partnerLicenseNum,HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		List list = partnerService.infoGraph(partnerLicenseNum);
		mav.addObject("datas",list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/* ===================================협력사 관련 끝==============================*/
	
	
}
