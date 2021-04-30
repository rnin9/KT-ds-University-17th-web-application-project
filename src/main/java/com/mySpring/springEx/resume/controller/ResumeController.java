package com.mySpring.springEx.resume.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.resume.vo.ResumeVO;

public interface ResumeController {
	public ModelAndView resumeList(@RequestParam("resumeUser") String resumeUser, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView resumeCheck(@RequestParam("resumeID") String resumeID,@RequestParam("resumeUser") String resumeUser, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public ModelAndView allResumeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView resumeInfo(@RequestParam("resumeID") String resumeID, @RequestParam("resumeUser") String resumeUser, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//page1
	
	public ModelAndView resumeWrite(@RequestParam("userID") String userID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView page1Topage3(@RequestParam(value = "resume_eng_name") String resumeForeign,@RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception;

	public ModelAndView page1Topage4(@RequestParam(value = "resume_eng_name") String resumeForeign,@RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception;

	public ModelAndView page1Topage5(@RequestParam(value = "resume_eng_name") String resumeForeign,@RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception;
	
	
	public ModelAndView resumeWriteDetail(@RequestParam(value = "resume_eng_name") String resumeForeign, @RequestParam(value = "resumeID") String resumeID, @RequestParam(value = "resumeUser") String resumeUser,HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception;
	
	//page2
	
	
	public ModelAndView resumeBackPage1(@RequestParam("userID") String userID,@RequestParam("resumeID") String resumeID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//public ModelAndView resumeWritePage2(@RequestBody HashMap<String, Object> params,  HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public int page2InsertCertificate(@RequestBody HashMap<String, Object> params,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void page2DeleteCertificate(@RequestBody String certificateSEQ, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public int page2InsertForeign(@RequestBody HashMap<String, Object> params,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void page2DeleteForeign(@RequestBody String forNum,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void page2Update (@RequestBody HashMap<String, Object> params,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView moveToPage3 (@RequestParam("userID") String userID,@RequestParam("resumeID") String resumeID,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//page3
	
	
	public @ResponseBody int page3InsertCareer(@RequestBody HashMap<String, Object> params,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public @ResponseBody int page3InsertEducation(@RequestBody HashMap<String, Object> params,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void page3DeleteCareer(@RequestBody String cerNum,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void page3Update (@RequestBody HashMap<String, Object> params, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView resumeBackPage2(@RequestParam("userID") String userID,@RequestParam("resumeID") String resumeID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView moveToPage4(@RequestParam("userID") String userID,@RequestParam("resumeID") String resumeID, HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	//page4
	
	
	public @ResponseBody int page4InsertProject(@RequestBody HashMap<String, Object> params, HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public void page4DeleteProject(@RequestBody String cerNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void page4Update(@RequestBody HashMap<String, Object> params, HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public ModelAndView moveToPage5(@RequestParam("userID") String userID, @RequestParam("resumeID") String resumeID,HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public void page5Update(@RequestBody HashMap<String, String> params, HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	//public ModelAndView addResume(ResumeVO resume, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modResume(@RequestParam("userID") String userID, @RequestParam("resumeID") String resumeID, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView deleteResume(@RequestParam("resumeID") String resumeID, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public void deleteResume2(@RequestBody HashMap<String, String> params,HttpServletRequest request, HttpServletResponse response) throws Exception;
}