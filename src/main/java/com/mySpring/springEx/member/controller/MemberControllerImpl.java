<<<<<<< HEAD
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



@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;

	// ï¿½ï¿½ï¿½ï¿½È­ï¿½ï¿½
	@RequestMapping(value = { "/", "/main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = { "/faq.do"}, method = RequestMethod.GET)
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = { "/location.do"}, method = RequestMethod.GET)
	public ModelAndView location(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	@Override
	@RequestMapping(value = "/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}

	// ï¿½ï¿½ï¿½Ìµï¿½ ï¿½ßºï¿½ ï¿½Ë»ï¿½(AJAX)
	@RequestMapping(value = "/member/check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		memberService.check_id(id, response);
	}

	// ï¿½Ì¸ï¿½ï¿½ï¿½ ï¿½ßºï¿½ ï¿½Ë»ï¿½(AJAX)
	@RequestMapping(value = "/member/check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception {
		memberService.check_email(email, response);
	}

	// È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	 * public ModelAndView addMember(@ModelAttribute("member") MemberVO member, //
	 * modelAttritbuteï¿½ï¿½ È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ã¢ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ memberï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ // MemberVOÅ¬ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ memberï¿½ï¿½Ã¼ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); int result = 0; result =
	 * memberService.addMember(member); ModelAndView mav = new
	 * ModelAndView("redirect:/member/listMembers.do"); return mav; }
	 */
	
	//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½!!!
	@RequestMapping(value = "member/join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberVO member, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {

		rttr.addFlashAttribute("result", memberService.join_member(member, response));

		return "memberJoinForm.jsp";
	}
	
	

	// È¸ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	@RequestMapping(value = "member/approval_member.do", method = RequestMethod.POST)
	public String approval_member(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception {
		memberService.approval_member(member, response);
		
		return "main.jsp";
	}

	// È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	@Override
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	//ï¿½Î±ï¿½ï¿½ï¿½
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
	    session.setAttribute("isLogOn", true);
	    mav.addObject("result",true);
	    mav.setViewName("jsonView");
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

	// ï¿½Î±×¾Æ¿ï¿½
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

	// formï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Â°ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½È°Åµï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
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

	// formï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Â°ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½È°Åµï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
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
=======
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



@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;

	// ¸ÞÀÎÈ­¸é
	@RequestMapping(value = { "/", "/main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName"); // stringÇüÅÂ·Î request viewNameÀ» ÀúÀå
		ModelAndView mav = new ModelAndView(); // mav »ý¼º
		mav.setViewName(viewName); // mavÀÇ viewÀ§Ä¡¿¡ requestÇß¾ú´ø (/,main.do) viewNameÀ» ³Ö¾î ÇØ´çÀ§Ä¡·Î ÀÌµ¿ÇÑ´Ù
		return mav;
	}
	//faqÀÌµ¿
	@RequestMapping(value = { "/faq.do"}, method = RequestMethod.GET)
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	

	// ¸â¹ö¸ñ·Ï
	@Override
	@RequestMapping(value = "/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}

	// ¾ÆÀÌµð Áßº¹ °Ë»ç(AJAX)
	@RequestMapping(value = "/member/check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		memberService.check_id(id, response);
	}

	// ÀÌ¸ÞÀÏ Áßº¹ °Ë»ç(AJAX)
	@RequestMapping(value = "/member/check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception {
		memberService.check_email(email, response);
	}

	// È¸¿ø°¡ÀÔ
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	 * public ModelAndView addMember(@ModelAttribute("member") MemberVO member, //
	 * modelAttritbute·Î È¸¿ø°¡ÀÔÃ¢¿¡¼­ ¹ÞÀº memberÁ¤º¸¸¦ // MemberVOÅ¬·¡½ºÀÇ member°´Ã¼¿¡ ÀúÀå
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); int result = 0; result =
	 * memberService.addMember(member); ModelAndView mav = new
	 * ModelAndView("redirect:/member/listMembers.do"); return mav; }
	 */
	
	//»õ·ÎÁöÀ¸·Á´Â È¸¿ø°¡ÀÔ!!!
	@Override
	@RequestMapping(value = "member/join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberVO member, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {

		rttr.addFlashAttribute("result", memberService.join_member(member, response));

		return "memberJoinForm.jsp";
	}
	
	

	// È¸¿ø ÀÎÁõ
	@RequestMapping(value = "member/approval_member.do", method = RequestMethod.POST)
	public String approval_member(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception {
		memberService.approval_member(member, response);
		
		return "main.jsp";
	}

	// È¸¿ø»èÁ¦
	@Override
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	//·Î±×ÀÎ
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
	    session.setAttribute("isLogOn", true);
	    mav.addObject("result",true);
	    mav.setViewName("jsonView");
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

	// ·Î±×¾Æ¿ô
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

	// formÀ¸·Î ³¡³ª´Â°Å Àü¼Û ¾È°Åµå·Áµµ‰Î
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

	// formÀ¸·Î ³¡³ª´Â°Å Àü¼Û ¾È°Åµå·Áµµ‰Î
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
>>>>>>> c6667ce518f87af0b342a24ca89d7cc9838a9df4
