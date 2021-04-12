package com.mySpring.springEx.courseTake.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.courseTake.dao.CourseTakeDAO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

@Service("courseTakeService")
@Transactional(propagation = Propagation.REQUIRED)
public class CourseTakeServiceImpl implements CourseTakeService {
	@Autowired
	private CourseTakeDAO courseTakeDAO;

	@Override
	public List courseApplyList() throws DataAccessException {
		List applyList = null;
		applyList = courseTakeDAO.selectAllApplyList();
		return applyList;
	}

	public List courseCompleteList() throws DataAccessException {
		List completeList = null;
		completeList = courseTakeDAO.selectAllCompleteList();
		return completeList;
	}

}