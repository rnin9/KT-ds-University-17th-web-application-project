package com.mySpring.springEx.resume.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import org.apache.tomcat.util.json.JSONParser;*/
import org.apache.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.partner.service.PartnerService;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.resume.service.ResumeService;
import com.mySpring.springEx.resume.vo.ResumeVO;
import com.mySpring.springEx.common.interceptor.Auth;
import com.mySpring.springEx.common.interceptor.Auth.Role;
import com.mySpring.springEx.member.service.MemberService;
import com.mySpring.springEx.member.vo.MemberVO;

@Controller("resumeController")
public class ResumeControllerImpl implements ResumeController {

	@Autowired
	private ResumeService resumeService;
	@Autowired
	ResumeVO resumeVO;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	MemberVO memberVO;
	
	
	@Auth(role=Role.CREW)
	@Override
	@RequestMapping(value = "/resume/resumeList.do", method = RequestMethod.GET)
	public ModelAndView resumeList(@RequestParam("resumeUser") String resumeUser, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List resumeList = resumeService.resumeLists(resumeUser);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resumeList", resumeList);
		System.out.println(resumeList);
		return mav;
	}

	@Override
	@RequestMapping(value = "resume/resumeCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView resumeCheck(@RequestParam("resumeID") String resumeID,
			@RequestParam("resumeUser") String resumeUser, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ResumeVO resumeVO = new ResumeVO();
		resumeVO.setResumeID(resumeID);
		resumeVO.setResumeUser(resumeUser);

		resumeService.resumeCheck(resumeVO);

		ModelAndView mav = new ModelAndView("redirect:/resume/resumeList.do?resumeUser=" + resumeUser);
		return mav;
	}
	
	@Auth(role=Role.ADMIN)
	@Override
	@RequestMapping(value = "/resume/resumeAdmin.do", method = RequestMethod.GET)
	public ModelAndView allResumeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List allResumeList = resumeService.allResumeLists();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resumeAdmin", allResumeList);
		return mav;
	}
	
	@Override
	   @RequestMapping(value = "/resume/resumeInfo.do", method = RequestMethod.GET)
	   public ModelAndView resumeInfo(@RequestParam("resumeID") String resumeID, @RequestParam("resumeUser") String resumeUser,
	         HttpServletRequest request, HttpServletResponse response) throws Exception {
	      String viewName = (String) request.getAttribute("viewName");
	      ResumeVO resumeInfo = resumeService.resumeInfos(resumeID);

	      ModelAndView mav = new ModelAndView();
	      
	      resumeVO = partnerService.getUserResume(resumeID);
	      List cerList = partnerService.getUserCer(resumeID, resumeUser); // certificate
	      List proList = partnerService.getUserPro(resumeID, resumeUser); // project
	      List forList = partnerService.getUserFor(resumeID, resumeUser); // foreign
	      List carrList = partnerService.getUserCarr(resumeID, resumeUser); // career

	      mav.addObject("resume", resumeVO);
	      mav.addObject("certificate", cerList);
	      mav.addObject("project", proList);
	      mav.addObject("foreign", forList);
	      mav.addObject("career", carrList);
	      mav.setViewName("jsonView");
	      return mav;

	   }

	// �̷¼� �ۼ��� ����� ���� ���� resume�� insert�ǰ� ���ÿ� userID���� �������� �Ѱ��ش�.
	@Auth(role=Role.CREW)
	@Override
	@RequestMapping(value = { "/resume/resumeWrite.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView resumeWrite(@RequestParam("userID") String userID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		memberVO = memberService.getMyInfo(userID);
		ModelAndView mav = new ModelAndView(viewName);
		resumeVO.setResumeUser(userID);
		resumeVO.setCertificateUser(userID);
		resumeVO.setForeignUser(userID);
		resumeVO.setCareerUser(userID);
		resumeVO.setProjectUser(userID);
		resumeService.createResume(resumeVO);
		System.out.println(resumeVO.getResumeID());
		resumeVO.setCertificateResume(resumeVO.getResumeID());
		resumeVO.setForeignResume(resumeVO.getResumeID());
		resumeVO.setCareerResume(resumeVO.getResumeID());
		resumeVO.setProjectResume(resumeVO.getResumeID());
		resumeService.insertCertificate(resumeVO);
		resumeService.insertForeign(resumeVO);
		resumeService.insertCareer(resumeVO);
		resumeService.insertEducation(resumeVO);
		resumeService.insertProject(resumeVO);
		mav.addObject("resumeWrite", memberVO);
		mav.addObject("resumeVO", resumeVO);
		mav.addObject("userID", userID);
		return mav;
	}

	/* page1 */

	// local_filepath
	private static final String filePath = "C:\\Users\\rkdal\\Downloads\\projectTest\\KT-ds-University-17th-web-application-project\\src\\main\\webapp\\resources\\image\\resume";

	// page 1 ������ư�� ������ page1�� ������� ������Ʈ�ǰ� ������������ �������� ���� ����
	@Override
	@RequestMapping(value = { "/resume/resumeWriteDetail.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView resumeWriteDetail(@RequestParam(value = "resume_eng_name") String resumeForeign,
			@RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,
			HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String viewName = (String) request.getAttribute("viewName");
		ResumeVO resume = new ResumeVO();
		resume.setResumeForeign(resumeForeign);
		resume.setResumeID(resumeID);
		resume.setResumeUser(resumeUser);
		resumeService.addResume(resume);
		ModelAndView mav = new ModelAndView(viewName);

		System.out.println(file.getOriginalFilename());

		if (file.isEmpty()) {

		} else {
			File target = new File(filePath);

			String orgFileName = file.getOriginalFilename();
			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;

			target = new File(filePath, saveFileName);
			file.transferTo(target);
			resume.setResumePic(saveFileName);

			resumeService.resumePic(resume);
		}

		ResumeVO resumeVO = resumeService.resumeInfos(resumeID);
		mav.addObject("resumeVO", resumeVO);
		resume.setCertificateResume(resumeID);
		resume.setForeignResume(resumeID);
		resume.setCertificateUser(resumeUser);
		resume.setForeignUser(resumeUser);

		List certificateList = resumeService.selectCertificateList(resume);
		List foreignList = resumeService.selectForeignList(resume);

		mav.addObject("certificateList1", certificateList.get(0));
		if (certificateList.size() != 1) {
			mav.addObject("certificateList", certificateList.subList(1, certificateList.size()));
		}
		mav.addObject("foreignList1", foreignList.get(0));
		if (foreignList.size() != 1) {
			mav.addObject("foreignList", foreignList.subList(1, foreignList.size()));
		}
		return mav;
	}

	// page1 to page3
	@Override
	@RequestMapping(value = { "/resume/page1Topage3.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView page1Topage3(@RequestParam(value = "resume_eng_name") String resumeForeign,
			@RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,
			HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String viewName = (String) request.getAttribute("viewName");
		ResumeVO resume = new ResumeVO();
		resume.setResumeForeign(resumeForeign);
		resume.setResumeID(resumeID);
		resume.setResumeUser(resumeUser);
		resumeService.addResume(resume);
		ModelAndView mav = new ModelAndView(viewName);

		System.out.println(file.getOriginalFilename());

		if (file.isEmpty()) {

		} else {
			File target = new File(filePath);

			String orgFileName = file.getOriginalFilename();
			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;

			target = new File(filePath, saveFileName);
			file.transferTo(target);
			resume.setResumePic(saveFileName);

			resumeService.resumePic(resume);
		}

		resume.setCareerUser(resumeUser);
		resume.setCareerResume(resumeID);
		List careerList = resumeService.selectCareerList(resume);
		mav.addObject("careerList1", careerList.get(0));
		if (careerList.size() != 1) {
			mav.addObject("careerList", careerList.subList(1, careerList.size()));
		}
		List educationList = resumeService.selectEducationList(resume);
		mav.addObject("educationList1", educationList.get(0));
		if (educationList.size() != 1) {
			mav.addObject("educationList", educationList.subList(1, educationList.size()));
		}

		return mav;
	}

	// page1 to page4
	@Override
	@RequestMapping(value = { "/resume/page1Topage4.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView page1Topage4(@RequestParam(value = "resume_eng_name") String resumeForeign,
			@RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,
			HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String viewName = (String) request.getAttribute("viewName");
		ResumeVO resume = new ResumeVO();
		resume.setResumeForeign(resumeForeign);
		resume.setResumeID(resumeID);
		resume.setResumeUser(resumeUser);
		resumeService.addResume(resume);
		ModelAndView mav = new ModelAndView(viewName);

		System.out.println(file.getOriginalFilename());

		if (file.isEmpty()) {

		} else {
			File target = new File(filePath);

			String orgFileName = file.getOriginalFilename();
			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;

			target = new File(filePath, saveFileName);
			file.transferTo(target);
			resume.setResumePic(saveFileName);

			resumeService.resumePic(resume);
		}
		resume.setProjectUser(resumeUser);
		resume.setProjectResume(resumeID);

		List projectList = resumeService.selectProjectList(resume);
		for (int i=0; i < projectList.size(); i++) {
			ResumeVO resumeVO1 = (ResumeVO) projectList.get(i);
			if (resumeVO1.getProjectContent() != null) {
			resumeVO1.setProjectContent((resumeVO1.getProjectContent()).replace("<br>", "\r\n"));
			resumeVO1.setProjectRole((resumeVO1.getProjectRole()).replace("<br>", "\r\n"));
			projectList.set(i, resumeVO1);
			}
		}
		mav.addObject("projectList1", projectList.get(0));
		if (projectList.size() != 1) {
			mav.addObject("projectList", projectList.subList(1, projectList.size()));
		}

		return mav;
	}

	// page1 to page5
	@Override
	@RequestMapping(value = { "/resume/page1Topage5.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView page1Topage5(@RequestParam(value = "resume_eng_name") String resumeForeign,
			@RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,
			HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String viewName = (String) request.getAttribute("viewName");
		ResumeVO resume = new ResumeVO();
		resume.setResumeForeign(resumeForeign);
		resume.setResumeID(resumeID);
		resume.setResumeUser(resumeUser);
		resumeService.addResume(resume);
		ModelAndView mav = new ModelAndView(viewName);

		System.out.println(file.getOriginalFilename());

		if (file.isEmpty()) {

		} else {
			File target = new File(filePath);

			String orgFileName = file.getOriginalFilename();
			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;

			target = new File(filePath, saveFileName);
			file.transferTo(target);
			resume.setResumePic(saveFileName);

			resumeService.resumePic(resume);
		}

		ResumeVO resumeVO = resumeService.resumeInfos(resumeID);
		if (resumeVO.getResumeContext1() != null && resumeVO.getResumeContext2() != null && resumeVO.getResumeContext3() != null && resumeVO.getResumeContext4() != null && resumeVO.getResumeContext5() != null) {
		resumeVO.setResumeContext1((resumeVO.getResumeContext1()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext2((resumeVO.getResumeContext2()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext3((resumeVO.getResumeContext3()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext4((resumeVO.getResumeContext4()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext5((resumeVO.getResumeContext5()).replace("<br>", "\r\n"));
		}
		mav.addObject("resumeVO", resumeVO);
		return mav;
	}

	/* page2 */

	// page2 ������ư ������ page1�� ������� selecet�ؼ� �Ѿ��
	@Override
	@RequestMapping(value = { "/resume/resumeBackPage1.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView resumeBackPage1(@RequestParam("userID") String userID,
			@RequestParam("resumeID") String resumeID, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		memberVO = memberService.getMyInfo(userID);

		ResumeVO resumeVO = resumeService.resumeInfos(resumeID);

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("resumeWrite", memberVO);
		mav.addObject("resumeVO", resumeVO);
		mav.addObject("userID", userID);
		return mav;
	}

	/* �ڰ��� */

	// page2 �ڰ��� �߰� ��ư ���� �� insert
	@Override
	@RequestMapping(value = "resume/page2InsertCertificate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int page2InsertCertificate(@RequestBody HashMap<String, Object> params,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ResumeVO resume = new ResumeVO();
		String ID = String.valueOf(params.get("ID"));
		String resumeID = String.valueOf(params.get("resumeID"));
		System.out.println(ID);
		System.out.println(resumeID);
		resume.setCertificateUser(ID);
		resume.setCertificateResume(resumeID);
		resumeService.insertCertificate(resume);
		return resume.getCertificateSEQ();
	}

	// page2 �ڰ��� ���� ��ư ���� �� delete
	@Override
	@RequestMapping(value = "resume/page2DeleteCertificate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page2DeleteCertificate(@RequestBody String cerNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		int certificateSEQ = Integer.parseInt(cerNum.substring(1, cerNum.length() - 1));
		resumeService.deleteCertificate(certificateSEQ);
	}

	/* �ܱ����ڰ��� */

	// page2 �ܱ����ڰ��� �߰� ��ư ���� �� insert
	@Override
	@RequestMapping(value = "resume/page2InsertForeign.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int page2InsertForeign(@RequestBody HashMap<String, Object> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ResumeVO resume = new ResumeVO();
		String ID = String.valueOf(params.get("ID"));
		String resumeID = String.valueOf(params.get("resumeID"));
		System.out.println(ID);
		System.out.println(resumeID);
		resume.setForeignUser(ID);
		resume.setForeignResume(resumeID);
		resumeService.insertForeign(resume);
		return resume.getForeignSEQ();
	}

	// page2 �ܱ����ڰ��� ���� ��ư ���� �� delete
	@Override
	@RequestMapping(value = "resume/page2DeleteForeign.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page2DeleteForeign(@RequestBody String forNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		int foreignSEQ = Integer.parseInt(forNum.substring(1, forNum.length() - 1));
		resumeService.deleteForeign(foreignSEQ);
	}

	// page2 ���� ��ư ���� �� �������� ����� ������Ʈ
	@Override
	@RequestMapping(value = "resume/page2Update.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page2Update(@RequestBody HashMap<String, Object> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResumeVO resume1 = new ResumeVO();
		resume1.setResumeID(String.valueOf(params.get("resumeID")));
		resume1.setResumeSchool(String.valueOf(params.get("resumeSchool")));
		resume1.setResumeGrade(String.valueOf(params.get("resumeGrade")));
		resume1.setResumeLastEdu(String.valueOf(params.get("resumeLastEdu")));
		resumeService.updatePage2Education(resume1); // �з����� update

		// �ڰ��� update
		ArrayList<String> certificateName = (ArrayList<String>) params.get("certificateName");
		ArrayList<String> certificateEnforcement = (ArrayList<String>) params.get("certificateEnforcement");
		ArrayList<String> certificateDate = (ArrayList<String>) params.get("certificateDate");
		ArrayList<String> certificateSEQ = (ArrayList<String>) params.get("certificateSEQ");
		for (int i = 0; i < certificateName.size(); i++) { // 0���ιٲ�ߵ�
			ResumeVO resume = new ResumeVO();
			resume.setCertificateResume(String.valueOf(params.get("resumeID")));
			resume.setCertificateUser(String.valueOf(params.get("userID")));
			resume.setCertificateName(certificateName.get(i));
			resume.setCertificateEnforcement(certificateEnforcement.get(i));
			resume.setCertificateDate(certificateDate.get(i));
			resume.setCertificateSEQ(Integer.parseInt(certificateSEQ.get(i)));
			resumeService.updatePage2Certificate(resume);

		}

		// �ܱ��� �ڰ��� update
		ArrayList<String> foreignCriteria = (ArrayList<String>) params.get("foreignCriteria");
		ArrayList<String> foreignName = (ArrayList<String>) params.get("foreignName");
		ArrayList<String> foreignScore = (ArrayList<String>) params.get("foreignScore");
		ArrayList<String> foreignDate = (ArrayList<String>) params.get("foreignDate");
		ArrayList<String> foreignSEQ = (ArrayList<String>) params.get("foreignSEQ");

		for (int i = 0; i < foreignCriteria.size(); i++) { // 0���ιٲ�ߵ�
			ResumeVO resume = new ResumeVO();
			resume.setForeignUser(String.valueOf(params.get("userID")));
			resume.setForeignCriteria(foreignCriteria.get(i));
			resume.setForeignName(foreignName.get(i));
			resume.setForeignScore(foreignScore.get(i));
			resume.setForeignDate(foreignDate.get(i));
			resume.setForeignSEQ(Integer.parseInt(foreignSEQ.get(i)));
			resumeService.updatePage2Foreign(resume);
		}

	}

	// moveTopage3
	@Override
	@RequestMapping(value = "resume/moveToPage3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView moveToPage3(@RequestParam("userID") String userID, @RequestParam("resumeID") String resumeID,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ResumeVO resume = new ResumeVO();
		resume.setCareerUser(userID);
		resume.setCareerResume(resumeID);
		List careerList = resumeService.selectCareerList(resume);
		mav.addObject("careerList1", careerList.get(0));
		if (careerList.size() != 1) {
			mav.addObject("careerList", careerList.subList(1, careerList.size()));
		}
		List educationList = resumeService.selectEducationList(resume);
		mav.addObject("educationList1", educationList.get(0));
		if (educationList.size() != 1) {
			mav.addObject("educationList", educationList.subList(1, educationList.size()));
		}
		return mav;
	}
	/* page2 end */

	/* page3 */

	// insert Career
	@Override
	@RequestMapping(value = "resume/page3InsertCareer.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int page3InsertCareer(@RequestBody HashMap<String, Object> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String ID = String.valueOf(params.get("ID"));
		String resumeID = String.valueOf(params.get("resumeID"));
		ResumeVO resume = new ResumeVO();
		resume.setCareerUser(ID);
		resume.setCareerResume(resumeID);
		resumeService.insertCareer(resume);
		return resume.getCareerSEQ();
	}

	// insert education
	@Override
	@RequestMapping(value = "resume/page3InsertEducation.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int page3InsertEducation(@RequestBody HashMap<String, Object> params,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String ID = String.valueOf(params.get("ID"));
		String resumeID = String.valueOf(params.get("resumeID"));
		ResumeVO resume = new ResumeVO();
		resume.setCareerUser(ID);
		resume.setCareerResume(resumeID);
		resumeService.insertEducation(resume);
		return resume.getCareerSEQ();
	}

	// page3 delete
	@Override
	@RequestMapping(value = "resume/page3DeleteCareer.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page3DeleteCareer(@RequestBody String cerNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		int careerSEQ = Integer.parseInt(cerNum.substring(1, cerNum.length() - 1));
		resumeService.deleteCareer(careerSEQ);
	}

	// page3 update
	@Override
	@RequestMapping(value = "resume/page3Update.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page3Update(@RequestBody HashMap<String, Object> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ArrayList<String> careerCenter = (ArrayList<String>) params.get("careerCenter");
		ArrayList<String> careerStartdate = (ArrayList<String>) params.get("careerStartdate");
		ArrayList<String> careerEnddate = (ArrayList<String>) params.get("careerEnddate");
		ArrayList<String> careerType = (ArrayList<String>) params.get("careerType");
		ArrayList<String> careerPosition = (ArrayList<String>) params.get("careerPosition");
		ArrayList<String> careerSEQ = (ArrayList<String>) params.get("careerSEQ");

		for (int i = 0; i < careerCenter.size(); i++) { // 0���ιٲ�ߵ�
			ResumeVO resume = new ResumeVO();
			resume.setCareerUser(String.valueOf(params.get("userID")));
			resume.setCareerCenter(careerCenter.get(i));
			resume.setCareerStartdate(careerStartdate.get(i));
			resume.setCareerEnddate(careerEnddate.get(i));
			resume.setCareerType(careerType.get(i));
			resume.setCareerPosition(careerPosition.get(i));
			resume.setCareerSEQ(Integer.parseInt(careerSEQ.get(i)));
			resumeService.updatePage3Career(resume);
		}
		ArrayList<String> educationCenter = (ArrayList<String>) params.get("educationCenter");
		ArrayList<String> educationStartdate = (ArrayList<String>) params.get("educationStartdate");
		ArrayList<String> educationEnddate = (ArrayList<String>) params.get("educationEnddate");
		ArrayList<String> educationHour = (ArrayList<String>) params.get("educationHour");
		ArrayList<String> educationOther = (ArrayList<String>) params.get("educationOther");
		ArrayList<String> educationSEQ = (ArrayList<String>) params.get("educationSEQ");

		for (int i = 0; i < educationCenter.size(); i++) { // 0���ιٲ�ߵ�
			ResumeVO resume = new ResumeVO();
			resume.setCareerUser(String.valueOf(params.get("userID")));
			resume.setCareerCenter(educationCenter.get(i));
			resume.setCareerStartdate(educationStartdate.get(i));
			resume.setCareerEnddate(educationEnddate.get(i));
			resume.setCareerHour(educationHour.get(i));
			resume.setCareerOther(educationOther.get(i));
			resume.setCareerSEQ(Integer.parseInt(educationSEQ.get(i)));
			resumeService.updatePage3Career(resume);
		}
	}

	@Override
	@RequestMapping(value = { "/resume/resumeBackPage2.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView resumeBackPage2(@RequestParam("userID") String userID,
			@RequestParam("resumeID") String resumeID, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ResumeVO resumeVO = resumeService.resumeInfos(resumeID);

		mav.addObject("resumeVO", resumeVO);

		resumeVO.setCertificateResume(resumeID);
		resumeVO.setForeignResume(resumeID);
		resumeVO.setCertificateUser(userID);
		resumeVO.setForeignUser(userID);

		List certificateList = resumeService.selectCertificateList(resumeVO);
		List foreignList = resumeService.selectForeignList(resumeVO);

		mav.addObject("certificateList1", certificateList.get(0));
		if (certificateList.size() != 1) {
			mav.addObject("certificateList", certificateList.subList(1, certificateList.size()));
		}
		mav.addObject("foreignList1", foreignList.get(0));
		if (foreignList.size() != 1) {
			mav.addObject("foreignList", foreignList.subList(1, foreignList.size()));
		}
		return mav;
	}

	// moveTopage4
	@Override
	@RequestMapping(value = "resume/moveToPage4.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView moveToPage4(@RequestParam("userID") String userID, @RequestParam("resumeID") String resumeID,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ResumeVO resumeVO = new ResumeVO();
		resumeVO.setProjectUser(userID);
		resumeVO.setProjectResume(resumeID);

		List projectList = resumeService.selectProjectList(resumeVO);
		
		for (int i=0; i < projectList.size(); i++) {
			ResumeVO resumeVO1 = (ResumeVO) projectList.get(i);
			if (resumeVO1.getProjectContent() != null) {
			resumeVO1.setProjectContent((resumeVO1.getProjectContent()).replace("<br>", "\r\n"));
			resumeVO1.setProjectRole((resumeVO1.getProjectRole()).replace("<br>", "\r\n"));
			projectList.set(i, resumeVO1);
			}
		}
		mav.addObject("projectList1", projectList.get(0));
		if (projectList.size() != 1) {
			mav.addObject("projectList", projectList.subList(1, projectList.size()));
		}

		return mav;
	}

	/* page3 end */

	/* page4 */

	// insert project
	@Override
	@RequestMapping(value = "resume/page4InsertProject.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int page4InsertProject(@RequestBody HashMap<String, Object> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String ID = String.valueOf(params.get("ID"));
		String resumeID = String.valueOf(params.get("resumeID"));
		ResumeVO resume = new ResumeVO();
		resume.setProjectUser(ID);
		resume.setProjectResume(resumeID);
		resumeService.insertProject(resume);
		return resume.getProjectSEQ();
	}

	// page4 delete
	@Override
	@RequestMapping(value = "resume/page4DeleteProject.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page4DeleteProject(@RequestBody String cerNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		int projectSEQ = Integer.parseInt(cerNum.substring(1, cerNum.length() - 1));
		resumeService.deleteProject(projectSEQ);
	}

	// page4 update
	@Override
	@RequestMapping(value = "resume/page4Update.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page4Update(@RequestBody HashMap<String, Object> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ArrayList<String> projectEnforcement = (ArrayList<String>) params.get("projectEnforcement");
		ArrayList<String> projectName = (ArrayList<String>) params.get("projectName");
		ArrayList<String> projectDev = (ArrayList<String>) params.get("projectDev");
		ArrayList<String> projectContent = (ArrayList<String>) params.get("projectContent");
		ArrayList<String> projectRole = (ArrayList<String>) params.get("projectRole");
		ArrayList<String> projectURL = (ArrayList<String>) params.get("projectURL");
		ArrayList<String> projectSEQ = (ArrayList<String>) params.get("projectSEQ");

		for (int i = 0; i < projectSEQ.size(); i++) {
			ResumeVO resume = new ResumeVO();
			resume.setProjectUser(String.valueOf(params.get("userID")));
			resume.setProjectEnforcement(projectEnforcement.get(i));
			resume.setProjectName(projectName.get(i));
			resume.setProjectDev(projectDev.get(i));
			resume.setProjectContent(projectContent.get(i).replace("\r\n", "<br>").replace(" ", "&nbsp;").replace("\r", "<br>").replace("\n", "<br>"));
			resume.setProjectRole(projectRole.get(i).replace("\r\n", "<br>").replace(" ", "&nbsp;").replace("\r", "<br>").replace("\n", "<br>"));
			resume.setProjectURL(projectURL.get(i));
			resume.setProjectSEQ(Integer.parseInt(projectSEQ.get(i)));
			resumeService.updatePage4Project(resume);
		}

	}

	// moveTopage5
	@Override
	@RequestMapping(value = "resume/moveToPage5.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView moveToPage5(@RequestParam("userID") String userID, @RequestParam("resumeID") String resumeID,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(resumeID);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ResumeVO resumeVO = resumeService.resumeInfos(resumeID);
		if (resumeVO.getResumeContext1() != null && resumeVO.getResumeContext2() != null && resumeVO.getResumeContext3() != null && resumeVO.getResumeContext4() != null && resumeVO.getResumeContext5() != null) {
		resumeVO.setResumeContext1((resumeVO.getResumeContext1()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext2((resumeVO.getResumeContext2()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext3((resumeVO.getResumeContext3()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext4((resumeVO.getResumeContext4()).replace("<br>", "\r\n"));
		resumeVO.setResumeContext5((resumeVO.getResumeContext5()).replace("<br>", "\r\n"));
		}
		mav.addObject("resumeVO", resumeVO);
		return mav;
	}

	/* page4 end */

	/* page5 */

	// update self
	@Override
	@RequestMapping(value = "resume/page5Update.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void page5Update(@RequestBody HashMap<String, String> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String resumeContext1 = (String.valueOf(params.get("resumeContext1")));
		String resumeContext2 = (String.valueOf(params.get("resumeContext2")));
		String resumeContext3 = (String.valueOf(params.get("resumeContext3")));
		String resumeContext4 = (String.valueOf(params.get("resumeContext4")));
		String resumeContext5 = (String.valueOf(params.get("resumeContext5")));
		String resumeID = (String) params.get("resumeID");

		ResumeVO resume = new ResumeVO();
		resume.setResumeID(resumeID);
		resume.setResumeContext1(resumeContext1.replace("\r\n", "<br>").replace(" ", "&nbsp;").replace("\r", "<br>").replace("\n", "<br>"));
		resume.setResumeContext2(resumeContext2.replace("\r\n", "<br>").replace(" ", "&nbsp;").replace("\r", "<br>").replace("\n", "<br>"));
		resume.setResumeContext3(resumeContext3.replace("\r\n", "<br>").replace(" ", "&nbsp;").replace("\r", "<br>").replace("\n", "<br>"));
		resume.setResumeContext4(resumeContext4.replace("\r\n", "<br>").replace(" ", "&nbsp;").replace("\r", "<br>").replace("\n", "<br>"));
		resume.setResumeContext5(resumeContext5.replace("\r\n", "<br>").replace(" ", "&nbsp;").replace("\r", "<br>").replace("\n", "<br>"));
		resumeService.updatePage5Self(resume);

	}

	/* page5 end */

	/* page3 */
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/resume/addResume.do", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public ModelAndView
	 * addResume(@ModelAttribute("resume")ResumeVO resume, HttpServletRequest
	 * request, HttpServletResponse response)throws Exception{
	 * request.setCharacterEncoding("UTF-8"); resumeService.addResume(resume);
	 * ModelAndView mav = new ModelAndView("redirect:/resume/ResumeList.do"); return
	 * mav; }
	 */

	@Override
	@RequestMapping(value = "/resume/deleteResume.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteResume(@RequestParam("resumeID") String resumeID, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(resumeID);
		String getUser = String.valueOf(resumeService.deleteResume(resumeID));
		rttr.addFlashAttribute("msg", "removeSuccess");
		rttr.addFlashAttribute("resumeName", getUser);
		ModelAndView mav = new ModelAndView("redirect:/resume/resumeList.do?resumeUser=" + getUser + "");
		return mav;
	}

	@Override
	@RequestMapping(value = "/resume/deleteResume2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteResume2(@RequestBody HashMap<String, String> params, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String resumeID = (String) params.get("resumeID");
		System.out.println(resumeID);
		resumeService.deleteResume(resumeID);
	}

	@Override
	@RequestMapping(value = "/resume/modResume.do", method = RequestMethod.GET)
	public ModelAndView modResume(@RequestParam("userID") String userID, @RequestParam("resumeID") String resumeID,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(resumeID);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ResumeVO resumeVO = resumeService.resumeInfos(resumeID);
		memberVO = memberService.getMyInfo(userID);
		mav.addObject("resumeVO", resumeVO);
		mav.addObject("resumeWrite", memberVO);
		mav.addObject("userID", userID);
		return mav;
	}

}