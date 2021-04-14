package com.mySpring.springEx.course.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CourseService {
	public List courseList() throws DataAccessException;
}
