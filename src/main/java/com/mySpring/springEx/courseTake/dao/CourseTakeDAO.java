package com.mySpring.springEx.courseTake.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

public interface CourseTakeDAO {
	public List selectAllApplyList() throws DataAccessException;

	// 신청승인
	public int updateApplyConsent(CourseTakeVO courseTakeVO) throws Exception;

	// 승인->승인대기로 다시 update
	public int updateApplyConsentCancel(CourseTakeVO courseTakeVO) throws Exception;

	// 수료대기->수료
	public int updateCompletion(CourseTakeVO courseTakeVO) throws Exception;

	// 삭제하기
	public int deleteCourseTake(CourseTakeVO courseTakeVO) throws Exception;

	public int insertCourseTake(CourseTakeVO courseTakeVO) throws DataAccessException;

	public int updatePosition1(CourseTakeVO courseTakeVO) throws DataAccessException;

	public int updatePosition2(CourseTakeVO courseTakeVO) throws DataAccessException;
}