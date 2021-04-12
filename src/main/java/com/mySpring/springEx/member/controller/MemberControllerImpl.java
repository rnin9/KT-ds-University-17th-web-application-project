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

import com.mySpring.springEx.member.service.MemberService;
import com.mySpring.springEx.member.vo.MemberVO;



@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;


	// 硫붿씤�솕硫�
	@RequestMapping(value = { "/", "/main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName"); // string�삎�깭濡� request viewName�쓣 ���옣
		ModelAndView mav = new ModelAndView(); // mav �깮�꽦
		mav.setViewName(viewName); // // mav�쓽 view�쐞移섏뿉 request�뻽�뿀�뜕 (/,main.do) viewName�쓣 �꽔�뼱 �빐�떦�쐞移섎줈 �씠�룞�븳�떎
		return mav;
	}
	// faq
	@RequestMapping(value = { "/faq.do"}, method = RequestMethod.GET)
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// location
	@Override
	@RequestMapping(value = { "/location.do"}, method = RequestMethod.GET)
	public ModelAndView location(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}


	@Override
	@RequestMapping(value = { "/universityIntro.do"}, method = RequestMethod.GET)
	public ModelAndView universityIntro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = { "/universityConsortium.do"}, method = RequestMethod.GET)
	public ModelAndView universityConsortium(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = { "/member/myInfo.do"}, method = RequestMethod.GET)
	public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	//	list all recruitments
	@Override
	@RequestMapping(value = { "/member/apply.do"}, method = RequestMethod.GET)
	public ModelAndView apply(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		List recruitsList = memberService.listRecruitments();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("recruitsList", recruitsList);
		return mav;
	}

	//	insert into PARTNER_APPLY
	@Override
	@RequestMapping(value = {"/member/userApplyPartner.do"}, method = {RequestMethod.GET, RequestMethod.POST})
	public void userApplyPartner(@RequestBody Map<String, String> body,
								 HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> resultMap = new HashMap<String, String>();
		request.setCharacterEncoding("utf-8");
		System.out.println(body.get("partnerApplyUserID"));
		System.out.println(body.get("partnerApplyPartnerID"));
		memberService.userApplyPartner(body.get("partnerApplyUserID"), body.get("partnerApplyPartnerID"));
//		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
//		return resultMap;
	}

	@Override
	@RequestMapping(value = "/member/listMembers.do", method = RequestMethod.POST)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
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


	// �쉶�썝媛��엯
	/*
	 * @Override
	 *
	 * @RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	 * public ModelAndView addMember(@ModelAttribute("member") MemberVO member, //
	 * modelAttritbute濡� �쉶�썝媛��엯李쎌뿉�꽌 諛쏆� member�젙蹂대�� // MemberVO�겢�옒�뒪�쓽 member媛앹껜�뿉 ���옣
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); int result = 0; result =
	 * memberService.addMember(member); ModelAndView mav = new
	 * ModelAndView("redirect:/member/listMembers.do"); return mav; }
	 */


	//�깉濡쒖��쑝�젮�뒗 �쉶�썝媛��엯!!!
	@Override
	@RequestMapping(value = "member/join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberVO member, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {

		rttr.addFlashAttribute("result", memberService.join_member(member, response));

		return "memberJoinForm.jsp";
	}



	// �쉶�썝 �씤利�
	@RequestMapping(value = "member/approval_member.do", method = RequestMethod.POST)
	public String approval_member(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception {
		memberService.approval_member(member, response);
		
		return "main.jsp";
	}

	// �쉶�썝�궘�젣
	@Override
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}

	//濡쒓렇�씤
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("member", memberVO);
	    System.out.println(memberVO.getResume());
	    session.setAttribute("isLogOn", true);
	    mav.addObject("result",true);
	    mav.addObject("member",memberVO);
	    mav.setViewName("jsonView");
	    System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
	    System.out.println(member.getResume());
		/*
		 * //mav.setViewName("redirect:/member/listMembers.do"); String action =
		 * (String)session.getAttribute("action"); session.removeAttribute("action");
		 * if(action!= null) { mav.setViewName("redirect:"+action); }else {
		 * mav.setViewName("redirect:/member/listMembers.do"); }
		 */

	}else {
		rAttr.addAttribute("result", "loginFailed");/*
													 * mav.setViewName("redirect:/member/loginForm.do");
													 */
	   mav.addObject("result",false);
	   mav.setViewName("jsonView");
	}
	return mav;
	}

	// 濡쒓렇�븘�썐
	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/listMembers.do");
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
