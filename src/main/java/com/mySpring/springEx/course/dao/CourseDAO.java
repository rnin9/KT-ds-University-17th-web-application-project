package com.mySpring.springEx.course.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CourseDAO {
	public List selectCourseList() throws DataAccessException;

}
