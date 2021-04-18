package com.mySpring.springEx.courseTake.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

public interface CourseTakeDAO {
	public List selectAllApplyList() throws DataAccessException;

	// 신청승인
	public int updateApplyConsent(CourseTakeVO courseTakeVO) throws Exception;

	// 수료대기->수료
	public int updateCompletion(CourseTakeVO courseTakeVO) throws Exception;

	// 테스트
	public List selectAllCompleteList() throws DataAccessException;

}