package com.mySpring.springEx.courseTake.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.member.vo.MemberVO;

public interface CourseTakeController {

   public ModelAndView courseApplyList(@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage, 
         @RequestParam(value = "cntPerPage", required = false, defaultValue = "10")int cntPerPage,
          @RequestParam(value = "pageSize", required = false, defaultValue = "10")int pageSize, 
          Map<String, Object> map,
         HttpServletRequest request, HttpServletResponse response) throws Exception;
   
   
   
   //테스트 페이지
   public ModelAndView courseCompleteList(HttpServletRequest request, HttpServletResponse response) throws Exception;

}