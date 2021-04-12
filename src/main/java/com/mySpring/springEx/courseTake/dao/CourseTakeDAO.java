package com.mySpring.springEx.courseTake.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CourseTakeDAO {
	public List selectAllApplyList() throws DataAccessException;
	public List selectAllCompleteList() throws DataAccessException;

}