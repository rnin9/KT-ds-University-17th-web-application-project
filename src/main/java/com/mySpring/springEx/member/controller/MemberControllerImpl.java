package com.mySpring.springEx.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.member.service.MemberService;
import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.partner.vo.PartnerVO;

@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	PartnerVO partnerVO;

	@RequestMapping(value = { "/", "/main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// faq
	@RequestMapping(value = { "/faq.do" }, method = RequestMethod.GET)
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// location
	@Override
	@RequestMapping(value = { "/location.do" }, method = RequestMethod.GET)
	public ModelAndView location(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = { "/universityIntro.do" }, method = RequestMethod.GET)
	public ModelAndView universityIntro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = { "/universityConsortium.do" }, method = RequestMethod.GET)
	public ModelAndView universityConsortium(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = { "/member/myInfo.do" }, method = RequestMethod.GET)
	public ModelAndView myInfo(@RequestParam("userID") String userID, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		memberVO = memberService.getMyInfo(userID);
		List myCourseList = memberService.listMyCourse(userID);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("myInfo", memberVO);
		mav.addObject("myCourseInfo", myCourseList);
		return mav;
	}

	// 쩌철쨌찼횁천 횈채�횑횁철
	@RequestMapping(value = "/member/myCertificate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewMyCertificate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println("============"+request.getParameter("userBirthday"));
		return mav;
	}

	// list all recruitments, suggestions
	@Override
	@RequestMapping(value = { "/member/apply.do" }, method = RequestMethod.GET)
	public ModelAndView apply(@SessionAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List recruitsList = memberService.listRecruitments();
		List<HashMap<String, String>> applicationList = memberService.listApplications(member.getUserId());
		List<HashMap<String, String>> suggestionList = memberService.listSuggestions(member.getUserId());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("applicationList", applicationList);
		mav.addObject("recruitsList", recruitsList);
		mav.addObject("suggestionList", suggestionList);
		return mav;
	}

	// insert into PARTNER_APPLY
	@Override
	@RequestMapping(value = { "/member/userApplyPartner.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public void userApplyPartner(@RequestBody Map<String, String> body, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.userApplyPartner(body.get("partnerApplyUserID"), body.get("partnerApplyPartnerID"));
	}

	// delete from PARTNER_APPLY
	@Override
	@RequestMapping(value = { "/member/deleteApplication.do" }, method = { RequestMethod.POST })
	public void deleteApplication(@RequestBody Map<String, String> body, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		memberService.deleteApplication(body.get("partnerApplyUserID"), body.get("partnerApplyPartnerID"));
	}

	// update userDeletion
	@Override
	@RequestMapping(value = {"/member/deleteSuggestion.do"}, method = RequestMethod.POST)
	public void deleteSuggestion(@RequestParam List<String> valueArr ,HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		String userID = valueArr.get(0);
		for (int i = 1; i < valueArr.size(); i++) {
			System.out.println(valueArr.get(i)+"----------"+ userID);
			memberService.deleteSuggestion(valueArr.get(i), userID);
		}
	}

	// update partner_suggestion acception accept
	@Override
	@RequestMapping(value = { "/member/acceptSuggestion.do" }, method = { RequestMethod.POST })
	public void acceptSuggestion(@RequestBody Map<String, String> body, HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(body.get("partnerID")+"************************"+ body.get("userId"));
		memberService.acceptSuggestion(body.get("partnerID"), body.get("userId"));
	}

	// update partner_suggestion acception reject
	@Override
	@RequestMapping(value = { "/member/rejectSuggestion.do" }, method = { RequestMethod.POST })
	public void rejectSuggestion(@RequestBody Map<String, String> body, HttpServletRequest request,
								 HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(body.get("partnerID")+"************************"+ body.get("userId"));
		memberService.rejectSuggestion(body.get("partnerID"), body.get("userId"));
	}

	@RequestMapping(value = { "/member/modMyInfo" }, method = RequestMethod.POST)
	public ModelAndView modMyInfo(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(member.getUserName());
		System.out.println(member.getUserPosition());
		int result = memberService.modMyInfo(member);
		memberVO = memberService.getMyInfo(member.getUserId());
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.setAttribute("member", memberVO);
		session.setAttribute("isLogOn", true);
		mav.addObject("myInfo", memberVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		System.out.println(membersList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/memberJoinForm.do", method = RequestMethod.GET)
	public ModelAndView joinMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List partnersName = memberService.listPartners();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("partnersName", partnersName);
		System.out.println(partnersName);
		System.out.println(partnersName.get(0));
		return mav;
	}

	@RequestMapping(value = "/member/check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		memberService.check_id(id, response);
	}

	@RequestMapping(value = "/member/check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception {
		memberService.check_email(email, response);
	}

	@Override
	@RequestMapping(value = "member/join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberVO member, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {

		rttr.addFlashAttribute("result", memberService.join_member(member, response));

		return "memberJoinForm.jsp";
	}

	@RequestMapping(value = "member/approval_member.do", method = RequestMethod.POST)
	public String approval_member(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception {
		memberService.approval_member(member, response);

		return "main.jsp";
	}

	@Override
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
			memberVO = memberService.login(member);
					
		if ( (memberVO != null && memberVO.getUserPosition().equals("PARTNER")) ||
				(memberVO != null && memberVO.getUserPosition().equals("ADMIN"))) {

			HttpSession session = request.getSession();
			partnerVO = memberService.partnerLogin(memberVO);
			session.setAttribute("member", memberVO);
			session.setAttribute("partner", partnerVO);
			session.setAttribute("isLogOn", true);
			mav.addObject("result", true);
			mav.addObject("member", memberVO);
			mav.addObject("partner", partnerVO);
			mav.addObject("url", request.getServletPath());
			mav.setViewName("jsonView");
			/*
			 * //mav.setViewName("redirect:/member/listMembers.do"); String action =
			 * (String)session.getAttribute("action"); session.removeAttribute("action");
			 * if(action!= null) { mav.setViewName("redirect:"+action); }else {
			 * mav.setViewName("redirect:/member/listMembers.do"); }
			 */

		} else if (memberVO != null) {
			HttpSession session = request.getSession();
			partnerVO = memberService.partnerLogin(memberVO);
			session.setAttribute("partner", partnerVO);
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			mav.addObject("result", true);
			mav.addObject("member", memberVO);
			mav.setViewName("jsonView");

		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.addObject("result", false);
			mav.setViewName("jsonView");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("partner");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@RequestMapping(value = "/member/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/survey/*Form.do", method = RequestMethod.GET)
	private ModelAndView form2(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	public ModelAndView addMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
