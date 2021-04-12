package com.mySpring.springEx.courseTake.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CourseTakeService {
	public List courseApplyList() throws DataAccessException;
	public List courseCompleteList() throws DataAccessException;
	

}