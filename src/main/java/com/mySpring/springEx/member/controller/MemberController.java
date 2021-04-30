package com.mySpring.springEx.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.member.vo.MemberVO;

import java.util.List;
import java.util.Map;


public interface MemberController {
	public ModelAndView noAuth(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
                              RedirectAttributes rAttr,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String join_member(@ModelAttribute MemberVO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception;
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView location(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView apply(@SessionAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void userApplyPartner(@RequestBody Map<String, String> body,
								 HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void deleteApplication(@RequestBody Map<String, String> body,
								  HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void deleteSuggestion(@RequestParam List<String> valueArr, HttpServletRequest request,
								 HttpServletResponse response) throws Exception;
	public void acceptSuggestion(@RequestBody Map<String, String> body, HttpServletRequest request,
								 HttpServletResponse response) throws Exception;
	public void rejectSuggestion(@RequestBody Map<String, String> body, HttpServletRequest request,
								 HttpServletResponse response) throws Exception;
	public ModelAndView universityIntro(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView universityConsortium(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myInfo(@RequestParam("userID") String userID,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMyInfo(@ModelAttribute MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView joinMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
}