package com.mySpring.springEx.resume.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.springEx.resume.vo.ResumeVO;

@Repository("resumeDAO")
public class ResumeDAOImpl implements ResumeDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public List selectAllResumeList() throws DataAccessException {
		List<ResumeVO> resumesList = null;
		resumesList = sqlSession.selectList("mapper.resume.selectAllResumeList");
		System.out.println(resumesList);
		return resumesList;
	}
}