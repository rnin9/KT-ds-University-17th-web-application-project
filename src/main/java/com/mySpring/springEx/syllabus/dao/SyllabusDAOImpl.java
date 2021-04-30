package com.mySpring.springEx.syllabus.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Repository("syllabusDAO")
@Transactional(propagation=Propagation.REQUIRED)
public class SyllabusDAOImpl implements SyllabusDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectSyllabusList() throws DataAccessException{
		List<SyllabusVO> syllabusList = null;
		syllabusList = sqlSession.selectList("mapper.syllabus.selectSyllabusList");
		return syllabusList;
	}

	@Override
	public SyllabusVO selectSyllabus(int syllabusID) throws DataAccessException {
		SyllabusVO syllabusVO = sqlSession.selectOne("mapper.syllabus.selectSyllabus",syllabusID);
		return syllabusVO;
	}
	
	@Override
	public int insertSyllabus(SyllabusVO syllabusVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.syllabus.insertSyllabus", syllabusVO);
		return result;
	}
	
	@Override
	public int deleteSyllabus(int syllabusID) throws DataAccessException{
		int result = sqlSession.delete("mapper.syllabus.deleteSyllabus", syllabusID);
		return result;
	}

	@Override
	public int modifySyllabus(SyllabusVO syllabusVO) throws DataAccessException {
		int result = sqlSession.update("mapper.syllabus.modifySyllabus", syllabusVO);
		return result;
	}

}
