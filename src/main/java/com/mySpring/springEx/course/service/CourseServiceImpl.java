package com.mySpring.springEx.course.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.course.dao.CourseDAO;
import com.mySpring.springEx.course.vo.CourseVO;

@Service("courseService")
@Transactional(propagation = Propagation.REQUIRED)
public class CourseServiceImpl implements CourseService{
	@Autowired
	private CourseDAO courseDAO;
	
	@Override
	public List courseList() throws DataAccessException{
		List courseList = null;
		courseList = courseDAO.selectCourseList();
		return courseList;
	}

	@Override
	public CourseVO selectCourse(int courseID) throws DataAccessException {
		return courseDAO.selectCourse(courseID);
	}

	@Override
	public int deleteCourse(int courseID) throws DataAccessException {
		return courseDAO.deleteCourse(courseID);
	}

	@Override
	public int insertCourse(CourseVO courseVO) throws DataAccessException {
		return courseDAO.insertCourse(courseVO);
	}

	@Override
	public int modifyCourse(CourseVO courseVO) throws DataAccessException {
		return courseDAO.modifyCourse(courseVO);
	}
}
