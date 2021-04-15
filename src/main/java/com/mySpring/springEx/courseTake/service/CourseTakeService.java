package com.mySpring.springEx.courseTake.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

public interface CourseTakeService {

	// 수강신청내역 페이지네이션
	public List<Map<String, Object>> SelectAllCourseApplyList() throws Exception;

	public List<Map<String, Object>> selectAllCourseApplyList(Pagination pagination) throws Exception;

	public int testTableCountCT() throws Exception;

	// 테스트페이지
	public List courseCompleteList() throws DataAccessException;

}