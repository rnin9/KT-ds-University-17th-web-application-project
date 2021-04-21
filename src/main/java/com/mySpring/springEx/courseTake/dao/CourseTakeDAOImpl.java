package com.mySpring.springEx.courseTake.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.springEx.courseTake.dao.CourseTakeDAO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

@Repository("courseTakeDAO")
public class CourseTakeDAOImpl implements CourseTakeDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllApplyList() throws DataAccessException {
		List<CourseTakeVO> applyList = null;
		applyList = sqlSession.selectList("mapper.courseTake.selectAllCourseApplyList");
		return applyList;
	}

	@Override
	public int updateApplyConsent(CourseTakeVO courseTakeVO) throws Exception {
		return sqlSession.update("mapper.courseTake.updateApplyConsent", courseTakeVO);
	}
	
	@Override
	   public int updateApplyConsentCancel(CourseTakeVO courseTakeVO) throws Exception {
	      return sqlSession.update("mapper.courseTake.updateApplyConsentCancel", courseTakeVO);
	   }

	
	@Override
	   public int updateCompletion(CourseTakeVO courseTakeVO) throws Exception {
	      return sqlSession.update("mapper.courseTake.updateCompletion", courseTakeVO);
	   }
	
	@Override
	   public int deleteCourseTake(CourseTakeVO courseTakeVO) throws Exception {
	      return sqlSession.delete("mapper.courseTake.deleteCourseTake", courseTakeVO);
	   }


}