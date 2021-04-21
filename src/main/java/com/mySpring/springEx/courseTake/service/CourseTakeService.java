package com.mySpring.springEx.courseTake.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.member.vo.MemberVO;

public interface CourseTakeService {

	// 수강신청내역 페이지네이션
	public List SelectAllCourseApplyList() throws Exception;


	public int updateApplyConsent(CourseTakeVO courseTakeVO) throws Exception;

	public int updateApplyConsentCancel(CourseTakeVO courseTakeVO) throws Exception;

	public int updateCompletion(CourseTakeVO courseTakeVO) throws Exception;

	public int deleteCourseTake(CourseTakeVO courseTakeVO) throws Exception;
	
	// 수강신청한 사람 insert
	public int insertCourseTake(CourseTakeVO courseTakeVO) throws DataAccessException;
}