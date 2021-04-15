package com.mySpring.springEx.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 筌롫뗄�뵥占쎌넅筌롳옙
	@RequestMapping(value = { "/", "/main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName"); // string占쎌굨占쎄묶嚥∽옙 request viewName占쎌뱽 占쏙옙占쎌삢
		ModelAndView mav = new ModelAndView(); // mav 占쎄문占쎄쉐
		mav.setViewName(viewName); // // mav占쎌벥 view占쎌맄燁살꼷肉� request占쎈뻥占쎈�占쎈쐲 (/,main.do) viewName占쎌뱽 占쎄퐫占쎈선 占쎈퉸占쎈뼣占쎌맄燁살꼶以�
									// 占쎌뵠占쎈짗占쎈립占쎈뼄
		return mav;
	}

	// faq 占쎌뵠占쎈짗
	@RequestMapping(value = { "/faq.do" }, method = RequestMethod.GET)
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

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
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("myInfo", memberVO);
		return mav;
	}

	@RequestMapping(value = { "/member/modMyInfo" }, method = RequestMethod.POST)
	public ModelAndView modMyInfo(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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

	// 占쎌돳占쎌뜚揶쏉옙占쎌뿯
	/*
	 * @Override
	 *
	 * @RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	 * public ModelAndView addMember(@ModelAttribute("member") MemberVO member, //
	 * modelAttritbute嚥∽옙 占쎌돳占쎌뜚揶쏉옙占쎌뿯筌≪럩肉됵옙苑� 獄쏆룇占� member占쎌젟癰귣�占쏙옙 // MemberVO占쎄깻占쎌삋占쎈뮞占쎌벥
	 * member揶쏆빘猿쒙옙肉� 占쏙옙占쎌삢 HttpServletRequest request, HttpServletResponse response)
	 * throws Exception { request.setCharacterEncoding("utf-8"); int result = 0;
	 * result = memberService.addMember(member); ModelAndView mav = new
	 * ModelAndView("redirect:/member/listMembers.do"); return mav; }
	 */

	// 占쎄퉱嚥≪뮇占쏙옙�몵占쎌젻占쎈뮉 占쎌돳占쎌뜚揶쏉옙占쎌뿯!!!
	@Override
	@RequestMapping(value = "member/join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberVO member, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {

		rttr.addFlashAttribute("result", memberService.join_member(member, response));
	
		return "memberJoinForm.jsp";
	}

	// 占쎌돳占쎌뜚 占쎌뵥筌앾옙
	@RequestMapping(value = "member/approval_member.do", method = RequestMethod.POST)
	public String approval_member(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception {
		memberService.approval_member(member, response);

		return "main.jsp";
	}

	// 占쎌돳占쎌뜚占쎄텣占쎌젫
	@Override
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}

	// 嚥≪뮄�젃占쎌뵥
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
			memberVO = memberService.login(member);
			System.out.println(memberVO.getUserJob());
		
		
		if (memberVO != null && memberVO.getUserPosition().equals("PARTNER")) {
			HttpSession session = request.getSession();
			partnerVO = memberService.partnerLogin(memberVO);
			session.setAttribute("member", memberVO);
			session.setAttribute("partner", partnerVO);
			session.setAttribute("isLogOn", true);
			mav.addObject("result", true);
			mav.addObject("member", memberVO);
			mav.addObject("partner", partnerVO);
			mav.setViewName("jsonView");
			/*
			 * //mav.setViewName("redirect:/member/listMembers.do"); String action =
			 * (String)session.getAttribute("action"); session.removeAttribute("action");
			 * if(action!= null) { mav.setViewName("redirect:"+action); }else {
			 * mav.setViewName("redirect:/member/listMembers.do"); }
			 */

		} else if(memberVO != null) {
			HttpSession session = request.getSession();
			partnerVO = memberService.partnerLogin(memberVO);
			session.setAttribute("partner", partnerVO);
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			System.out.println(partnerVO.getPartnerLicenseNum());
			mav.addObject("result", true);
			mav.addObject("member", memberVO);
			mav.setViewName("jsonView");
			
		}
		else {
			rAttr.addAttribute("result", "loginFailed");/*
														 * mav.setViewName("redirect:/member/loginForm.do");
														 */
			mav.addObject("result", false);
			mav.setViewName("jsonView");
		}
		return mav;
	}

	// 嚥≪뮄�젃占쎈툡占쎌뜍
	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("partner");
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
