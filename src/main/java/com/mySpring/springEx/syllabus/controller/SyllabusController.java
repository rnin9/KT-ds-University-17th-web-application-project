package com.mySpring.springEx.syllabus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.springEx.syllabus.vo.SyllabusVO;

public interface SyllabusController {
	
	public ModelAndView syllabusList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView selectSyllabus(int syllabusID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView insertSyllabus(@ModelAttribute("sysllabus") SyllabusVO syllabusVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteSyllabus(@RequestParam("syllabusID") int syllabusID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modifySyllabus(SyllabusVO syllabusVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView syllabusModifyForm(@RequestParam("syllabusID") int syllabusID, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
