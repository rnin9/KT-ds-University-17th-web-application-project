package com.mySpring.springEx.courseTake.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.courseTake.dao.CourseTakeDAO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.common.pagination.mapper.PageMapper;

@Service("courseTakeService")
@Transactional(propagation = Propagation.REQUIRED)
public class CourseTakeServiceImpl implements CourseTakeService {
	@Autowired
	private CourseTakeDAO courseTakeDAO;

	@Autowired
	public PageMapper pageMapper;

	@Override
	public List SelectAllCourseApplyList() throws Exception {
		return courseTakeDAO.selectAllApplyList();
	}

	// 승인대기->승인으로 update
	public int updateApplyConsent(CourseTakeVO courseTakeVO) throws Exception {
		return courseTakeDAO.updateApplyConsent(courseTakeVO);
	}

	// 승인->승인대기로 update
	public int updateApplyConsentCancel(CourseTakeVO courseTakeVO) throws Exception {
		return courseTakeDAO.updateApplyConsentCancel(courseTakeVO);
	}

	// 수료대기->수료로 update
	public int updateCompletion(CourseTakeVO courseTakeVO) throws Exception {
		return courseTakeDAO.updateCompletion(courseTakeVO);
	}
	
	
	@Override
	public int insertCourseTake(CourseTakeVO courseTakeVO) throws DataAccessException {
		return courseTakeDAO.insertCourseTake(courseTakeVO);
	}

	// 수료대기->수료로 update
	public int deleteCourseTake(CourseTakeVO courseTakeVO) throws Exception {
		return courseTakeDAO.deleteCourseTake(courseTakeVO);
	}

}