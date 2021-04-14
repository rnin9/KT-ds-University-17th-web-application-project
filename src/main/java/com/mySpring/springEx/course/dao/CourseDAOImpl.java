package com.mySpring.springEx.course.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.course.dao.CourseDAO;
import com.mySpring.springEx.course.vo.CourseVO;

@Repository("courseDAO")
@Transactional(propagation=Propagation.REQUIRED)
public class CourseDAOImpl implements CourseDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectCourseList() throws DataAccessException{
		List<CourseVO> CourseList = null;
		CourseList = sqlSession.selectList("mapper.course.selectCourseList");
		return CourseList;
	}
}